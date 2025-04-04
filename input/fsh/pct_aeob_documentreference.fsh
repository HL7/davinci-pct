// TODO, need to adopt most of the documentReference requirements, less the type and context requirements
// Need US Core Variant Request
Profile: PCTAdvancedEOBDocumentReference
Parent: DocumentReference
Id: davinci-pct-aeob-documentreference
Title: "PCT AEOB Packet Document Reference"
Description: "PCT AEOB Packet Document Reference that enables searching and subscriptions for AEOB Packets."
* insert TrialUseArtifact1

* extension contains
    RequestInitiationTime named requestInitiationTime 1..1 MS and
    GFEServiceLinkingInfo named gfeServiceLinkingInfo 0..1 MS and
    EstimateProcedureOrService named procedureOrService 0..* MS and
    EstimateCondition named condition 0..* MS
    
    
    
* extension[gfeServiceLinkingInfo] ^short = "GFE Service Linking Information including planned period of service and a GFE linking identifier"

* extension[requestInitiationTime] ^short = "Estimate Request instant"
* extension[requestInitiationTime] ^comment = "Instant from which the request is being initiated. For patient initiated requests, this is the date and time the patient or their representative made the request. For a newly scheduled service, this represents the time of the scheduling activity (as opposed to the planned time of service). For all other requests, the time of the event that triggered the need for an estimate."
* extension[requestInitiationTime].valueInstant 1..1

* extension[procedureOrService] ^short = "Primary Procedures and/or products involved in the estimates"
* extension[procedureOrService].value[x] only CodeableConcept
* extension[procedureOrService].valueCodeableConcept 1..1

* extension[condition] ^short = "Primary diagnoses involved in the estimates"
* extension[condition].value[x] only CodeableConcept
* extension[condition].valueCodeableConcept 1..1
* extension[condition].valueCodeableConcept from PCTDiagnosticCodes (required)

* identifier MS // US Core 6.1 DR Profile



* status MS
* docStatus 1..1 MS


* type 1.. MS
* type = PCTDocumentTypeTemporaryTrialUse#aeob-packet


* category 1.. MS
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^short = "(USCDI) Categorization of document"
* category contains estimate 0..*
* category[estimate] ^short = "Estimate category"
* category[estimate] = PCTDocumentTypeTemporaryTrialUse#estimate

* subject 1..1 MS
* subject only Reference(HRexPatientDemographics)


* date obeys pct-datetime-to-seconds

// TODO Discuss who the author is
* author 2..*
* author only Reference(PCTOrganization or PCTPractitioner)
* author ^short = "All involved authoring parties, including payer all Good Faith Estimate (GFE) providers"

// DISCUSS, do we want an authenticator requirement? - A participant who has attested to the accuracy of the composition/document.
// DISCUSS, do we want a custodian requirement? - Identifies the organization or group who is responsible for ongoing maintenance of and access to the composition/document information.

* relatesTo MS
* relatesTo ^short = "Relationship to other AEOB packets. Required if this estimate is replacing another." 


* relatesTo ^slicing.discriminator.type = #value
* relatesTo ^slicing.discriminator.path = "code"
* relatesTo ^slicing.rules = #open
* relatesTo ^slicing.description = "Slice different relationships"

* relatesTo contains
  replaces 0..1 MS


* relatesTo[replaces] ^short = "Relationship to other AEOB packets. Required if this estimate is replacing another."
  * code = #replaces


* content 1..1 MS
* content.attachment MS
* content.attachment obeys pct-dr-1
* content.attachment.contentType MS
* content.attachment.data MS
* content.attachment.url MS
* content.format = PCTDocumentTypeTemporaryTrialUse#pct-aeob-packet


// DISCUSS, use of context? for period of care?

/* TODO
    aggregation of searchable elements needs to be outside of DocumentReference

*/

//TODO Search parameters

Invariant: pct-dr-1
Description: "DocumentReference.content.attachment.url or DocumentReference.content.attachment.data or both SHALL be present."
Expression: "url.exists() or data.exists()"
Severity: #error

