Profile: PCTGFEComposition
Parent: Composition
Id: davinci-pct-gfe-composition
Title: "PCT GFE Composition"
Description: "PCT GFE Composition that assembles the contents of a GFE (represented by one or more individual GFE Bundles) into a single logical package. This version fo the Bundle is a document type that will enable versioning, signing and being referenced by a DocumentReference for searching and subscription notifications."
* insert TrialUseArtifact1

* obeys pct-gfe-packet-composition-1

* extension contains
    RequestInitiationTime named requestInitiationTime 1..1 MS and
    GFEServiceLinkingInfo named gfeServiceLinkingInfo 0..1 MS and  // FHIR-45759 set this to be 1..1, but was later changes by FHIR-34959 to 0..1
    RequestOriginationType named requestOriginationType 1..1 MS



* extension[requestInitiationTime] ^short = "Estimate Request instant (instance service was scheduled or estimate requested)"
* extension[requestInitiationTime] ^comment = "Instant from which the request is being initiated. For patient initiated requests, this is the date and time the patient or their representative made the request. For a newly scheduled service, this represents the time of the scheduling activity (as opposed to the planned time of service). For all other requests, the time of the event that triggered the need for an estimate."
* extension[requestInitiationTime].valueInstant 1..1

* extension[gfeServiceLinkingInfo] ^short = "GFE Service Linking Information including planned period of service and a GFE linking identifier. Scheduled services SHALL have a plannedPeriodOfService valueDate or ValuePeriod"    

* extension[requestOriginationType] ^short = "Indicator as to whether the request for estimate originated from a scheduled or unscheduled service."    



* identifier 1..
  * system 1..1
  * value 1..1
* type = PCTDocumentTypeTemporaryTrialUse#gfe-packet


* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice defining composition as an estimate"

* category contains
  estimate 1..1 MS

* category[estimate].coding ^slicing.discriminator.type = #value
* category[estimate].coding ^slicing.discriminator.path = "$this"
* category[estimate].coding ^slicing.rules = #open
* category[estimate].coding ^slicing.description = "Slice defining composition as an estimate - category coding"

* category[estimate].coding contains
  estimate-coding 1..1 MS

* category[estimate].coding[estimate-coding] = PCTDocumentTypeTemporaryTrialUse#estimate


* subject 1..1 MS
* subject only Reference(USCorePatientProfile|7.0.0)


* date obeys pct-datetime-to-seconds

* author 1..*
* author only Reference(PCTOrganization or PCTPractitioner)
* author ^short = "All involved authoring parties, including all Good Faith Estimate (GFE) providers"


* title MS

// DISCUSS, do we want an attester requirement? - A participant who has attested to the accuracy of the composition/document.
// DISCUSS, do we want a custodian requirement? - Identifies the organization or group who is responsible for ongoing maintenance of and access to the composition/document information.

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
    coverage 1..1 MS and
    gfeBundle 1..* MS


* section[coverage] ^short = "SHALL have a reference to a PCTCoverage resource, contained within the document bundle"
* section[coverage].code = PCTDocumentSection#coverage-section
* section[coverage].entry 1..1 MS
* section[coverage].entry only Reference(PCTCoverage)
* section[coverage].entry ^type.aggregation = #bundled

* section[gfeBundle] ^short = "SHALL reference one PCTGFEBundle or PCTGFEMissingBundle resource, which SHALL be contained in the document bundle, and the associated author (GFE Contributor) or proposed author (in the case of a missing GFE Bundle) contained in the document bundle."
* section[gfeBundle].code = PCTDocumentSection#gfe-section
* section[gfeBundle].author 1..1 MS
* section[gfeBundle].author ^short = "Associated GFE author (GFE Contributor) or proposed author (in the case of a missing GFE Bundle) contained in the document bundle"
* section[gfeBundle].author only Reference(PCTPractitioner or PCTOrganization)
* section[gfeBundle].author ^type.aggregation = #bundled
* section[gfeBundle].entry 1..1 MS
* section[gfeBundle].entry only Reference(PCTGFEBundle or PCTGFEMissingBundle)
* section[gfeBundle].entry ^type.aggregation = #bundled



Invariant: pct-gfe-packet-composition-1
Description: "Scheduled service requests require a planned period of service"
Expression: "extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/requestOriginationType' and 
value.ofType(CodeableConcept).coding.where(code='scheduled-request').exists()).exists() implies
extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo' and extension.where(url = 'plannedPeriodOfService').exists()).exists()"
Severity: #error


