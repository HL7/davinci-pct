Profile: PCTAEOBDocumentBundle
Parent: Bundle
Id: davinci-pct-aeob-document-bundle
Title: "PCT AEOB Document Bundle"
Description: "PCT AEOB Document Bundle that contains necessary resources for an AEOBs. This version fo the Bundle is a document type that will enable versioning, signing and being referenced by a DocumentReference for searching and subscription notifications."
* insert TrialUseArtifact1
* obeys pct-aeob-bundle-1 and pct-aeob-bundle-2

* identifier 1..1
* type = #document (exactly)
* timestamp 1..1
* entry 1..*
* entry.fullUrl 1..1
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"

* entry contains
    composition 1..1 MS and
	aeob 2..* MS and
    patient 1..2 MS and
    coverage 1..1 MS and
    organization 1..* MS and
    practitioner 0..* MS and
    gfeBundle 0..* MS

/*
* entry[aeob-summary] ^short = "SHALL have a PCTAdvancedEOBSummary resource"
* entry[aeob-summary].resource 1..1
* entry[aeob-summary].resource only PCTAdvancedEOBSummary
*/

* entry[composition] ^short = "SHALL have a PCTAdvancedEOBComposition resource"
* entry[composition].resource 1..1
* entry[composition].resource only PCTAdvancedEOBComposition


* entry[aeob] ^short = "SHALL have a PCTAdvancedEOBSummary or PCTAdvancedEOB resource"
* entry[aeob].resource 1..1
* entry[aeob].resource only PCTAdvancedEOBSummary or PCTAdvancedEOB

* entry[patient] ^short = "SHALL have the patient subject of care and may be a separate subscriber"
* entry[patient].resource 1..1
* entry[patient].resource only HRexPatientDemographics

* entry[coverage] ^short = "SHALL have one Coverage"
* entry[coverage].resource 1..1
* entry[coverage].resource only PCTCoverage

* entry[organization] ^short = "SHALL have the payer organization and may have provider organization(s)"
* entry[organization].resource 1..1 
* entry[organization].resource only PCTOrganization

* entry[practitioner] ^short = "MAY have the provider Practitioner(s)"
* entry[practitioner].resource 1..1 
* entry[practitioner].resource only PCTPractitioner

* entry[gfeBundle] ^short = "MAY have PCTGFEBundle or PCTGFEMissingBundle resource"
* entry[gfeBundle].resource 1..1 
* entry[gfeBundle].resource only PCTGFEBundle or PCTGFEMissingBundle


// TODO Add invariant requirement where at least a gfe summay exists



/* TODO
    aggregation needs to have resources in bundle

    Task Subscriptions

*/

Extension: EstimateProcedureOrService
Id: estimateProcedureOrService
Title: "Significant Procedures and/or products involved"
Description: "Significant Procedures and/or products involved in an estimate."
* ^context[+].type = #element
* ^context[=].expression = "Task"
* ^context[+].type = #element
* ^context[=].expression = "DocumentReference"
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from USClaimMedicalProductOrServiceCodes (required)
* value[x] ^short = "Significant Procedures and/or products involved"
* value[x] ^comment = "Significant Procedures and/or products involved in an estimate."


Extension: EstimateCondition
Id: estimateCondition
Title: "Significant condition involved"
Description: "Significant condition involved in an estimate."
* ^context[+].type = #element
* ^context[=].expression = "Task"
* ^context[+].type = #element
* ^context[=].expression = "DocumentReference"
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from PCTDiagnosticCodes (required)
* value[x] ^short = "Significant condition or condition involved"
* value[x] ^comment = "Significant condition involved in an estimate."



Invariant: pct-datetime-to-seconds
Description: "Datetime must be at least to seconds."
Expression: "$this is dateTime implies $this.toString().length() >= 19"
Severity: #error



CodeSystem: PCTDocumentType
Title: "PCT Document Types"
Description: "Defining codes for types of documents used for Patient Cost Transparency estimates. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as LOINC, which will result in a code system url change and possibly modified codes and definitions."
* ^caseSensitive = true
* #gfe-document "GFE Document" "A Good Faith Estimate (GFE) Document providing a notification of reasonably expected charges and billing codes for a scheduled or requested item or service. This document may contain one or more individual GFE (Claim) resources."
* #aeob-document "AEOB Document" "An Advanced Explanation of Benefit (AEOB) Document providing a notification of reasonably expected charges and billing codes provided by a payer according to the member benefits in relation a Good Faith Estimate (GFE) supplied by one or more providers for a given period of service.  AEOBs need to include which providers are expected to provide treatment, the network status of providers, good faith estimates of cost, cost-sharing and progress towards meeting deductibles and out-of-pocket maximums, as well as whether a service is subject to medical management and relevant disclaimers of estimates; for example, the disclaimer might state that the information provided in the notification is only an estimate based on the items and services reasonably expected, at the time of scheduling (or requesting) and is subject to change."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false


CodeSystem: PCTDocumentCategory
Title: "PCT Document Categories"
Description: "Defining codes for categories of documents used for Patient Cost Transparency estimates. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as LOINC, which will result in a code system url change and possibly modified codes and definitions."
* ^caseSensitive = true
* #estimate "Estimation Document" "An estimate of healthcare services, products, costs and/or benefits."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false


CodeSystem: PCTDocumentSection
Title: "PCT Document Section Codes"
Description: "Defining codes for the sections found in documents used for Patient Cost Transparency estimates."
* ^caseSensitive = true
* #aeob-summary-section "AEOB Summary" "The Advanced Explanation of Benefit (AEOB) Summary Document Section"
* #aeob-section "AEOB Section" "The Advanced Explanation of Benefit (AEOB) Document Section"
* #gfe-section "GFE Section" "A Good Faith Estimate (GFE) Document Section (one per provider)"
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false




Instance: PCT-AEOB-Document-Bundle-1
InstanceOf: PCTAEOBDocumentBundle
Description: "PCT AEOB Document Bundle Example 1"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-1234568"
* timestamp = "2025-01-10T11:01:00+05:00"



* entry[composition][+].fullUrl = "http://example.org/fhir/Composition/PCT-AEOB-Composition-1"
* entry[composition][=].resource = PCT-AEOB-Composition-1
* entry[composition][=].id = "PCT-AEOB-Composition-1"

* entry[aeob][+].fullUrl = "http://example.org/fhir/ExplanationOfBenefit/PCT-AEOB-Summary-1"
* entry[aeob][=].resource = PCT-AEOB-Summary-1
* entry[aeob][=].id = "PCT-AEOB-Summary-1"
* entry[aeob][+].fullUrl = "http://example.org/fhir/ExplanationOfBenefit/PCT-AEOB-1"
* entry[aeob][=].resource = PCT-AEOB-1
* entry[aeob][=].id = "PCT-AEOB-1"
* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient1001"
* entry[patient].resource = patient1001
* entry[patient].id = "patient1001"
* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].resource = coverage1001
* entry[coverage].id = "coverage1001"
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].resource = org1001
* entry[organization][=].id = "org1001"

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/Submitter-Org-1"
* entry[organization][=].resource = Submitter-Org-1
* entry[organization][=].id = "Submitter-Org-1"

* entry[gfeBundle].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Inst-1"
* entry[gfeBundle].resource = PCT-GFE-Bundle-Inst-1
* entry[gfeBundle].id = "PCT-GFE-Bundle-Inst-1"

