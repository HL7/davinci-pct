/* Replaced with AEOB Packet 
FHIR-49761 - Change the AEOB Bundle to be a document Bundle and add a Document reference to adequately address search and subscriptions


Profile: PCTAEOBBundle
Parent: Bundle
Id: davinci-pct-aeob-bundle
Title: "PCT AEOB Bundle"
Description: "DO NOT USE - (Temporarily archived during transition to a document bundle) - PCT AEOB Bundle that contains necessary resources for an AEOBs. Organizations for both the payer and provider SHALL be included."
* insert TrialUseArtifact
* obeys pct-aeob-bundle-1 and pct-aeob-bundle-2

* identifier 1..1
* type = #collection (exactly)
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
	aeob 2..* and
    patient 1..2 and
    coverage 1..1 and
    organization 1..* and
    practitioner 0..* MS and
    gfeBundle 0..* MS

*
* entry[aeob-summary] ^short = "SHALL have a PCTAdvancedEOBSummary resource"
* entry[aeob-summary].resource 1..1
* entry[aeob-summary].resource only PCTAdvancedEOBSummary
*

* entry[aeob] ^short = "SHALL have a PCTAdvancedEOB resource"
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



*/