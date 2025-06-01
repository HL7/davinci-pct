Profile: PCTGFEComposition
Parent: Composition
Id: davinci-pct-gfe-composition
Title: "PCT GFE Composition"
Description: "PCT GFE Composition that assembles the contents of a GFE (represented by one or more individual GFE Bundles) into a single logical package. This version fo the Bundle is a document type that will enable versioning, signing and being referenced by a DocumentReference for searching and subscription notifications."
* insert TrialUseArtifact1

* obeys pct-gfe-packet-composition-1

* extension contains
    GFEServiceLinkingInfo named gfeServiceLinkingInfo 1..1 MS and 
    RequestOriginationType named requestOriginationType 1..1 MS

* extension[gfeServiceLinkingInfo] ^short = "GFE Service Linking Information including planned period of service and a GFE linking identifier. Scheduled services SHALL have a plannedPeriodOfService valueDate or ValuePeriod"    

* extension[requestOriginationType] ^short = "Indicator as to whether the request for estimate originated from a scheduled or unscheduled service."    


* identifier 1..
  * system 1..1
  * value 1..1
* type = PCTDocumentTypeTemporaryTrialUse#gfe-packet
* category = PCTDocumentTypeTemporaryTrialUse#estimate
* subject 1..1 MS
* subject only Reference(HRexPatientDemographics)


* date obeys pct-datetime-to-seconds

* author 1..*
* author only Reference(PCTOrganization or PCTPractitioner)
* author ^short = "All involved authoring parties, including all Good Faith Estimate (GFE) providers"


* title MS

// DISCUSS, do we want an attester requirement? - A participant who has attested to the accuracy of the composition/document.
// DISCUSS, do we want a custodian requirement? - Identifies the organization or group who is responsible for ongoing maintenance of and access to the composition/document information.

* relatesTo MS
* relatesTo ^short = "Relationship to other GFE packets. Required if this estimate is replacing another." 

* relatesTo ^slicing.discriminator.type = #value
* relatesTo ^slicing.discriminator.path = "code"
* relatesTo ^slicing.rules = #open
* relatesTo ^slicing.description = "Slice different relationships"

* relatesTo contains
  replaces 0..1 MS


* relatesTo[replaces] ^short = "The identifier of the document (Composition.identifier) this estimate replaces"
  * code = #replaces
  * targetIdentifier 1..1 MS
    * system 1..1
    * value 1..1

* section ^short = "Sections Individual GFE Bundles"

* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.description = "Slice different resources included in the bundle"

* section contains
    gfeBundle 1..* MS 



* section[gfeBundle] ^short = "SHALL reference one PCTGFEBundle resource, which may be contained in the document bundle or may reference an external resource, and the associated author (GFE Contributor) contained in the document bundle."
* section[gfeBundle].code = PCTDocumentSection#gfe-section
* section[gfeBundle].author 1..1 MS
* section[gfeBundle].author ^short = "Associated GFE author (GFE Contributor) contained in the document bundle"
* section[gfeBundle].author only Reference(PCTPractitioner or PCTOrganization)
* section[gfeBundle].author ^type.aggregation = #bundled
* section[gfeBundle].entry 1..1 MS
* section[gfeBundle].entry only Reference(PCTGFEBundle)
* section[gfeBundle].entry ^type.aggregation = #bundled

Invariant: pct-gfe-packet-composition-1
Description: "Scheduled service requests require a planned period of service"
Expression: "extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/requestOriginationType' and 
valueCodeableConcept.coding.where(code='scheduled-request').exists()).exists() implies
extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo' and extension.where(url = 'plannedPeriodOfService').exists()).exists()"
Severity: #error


