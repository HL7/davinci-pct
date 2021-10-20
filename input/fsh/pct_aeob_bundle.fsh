Profile: PCTAEOBBundle
Parent: Bundle
Id: davinci-pct-aeob-bundle
Title: "PCT AEOB Bundle"
Description: "PCT AEOB Bundle that contains necessary resources for an AEOB. Organizations for both the payer and provider SHALL be included."
* identifier 1..1 MS
* type = #collection (exactly)
* timestamp 1..1 MS
* entry 1..* MS
* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains ExplanationOfBenefit 1..1 MS
* entry[ExplanationOfBenefit].resource only PCTAdvancedEOB
* entry contains Claim 1..* MS
* entry[Claim].resource only PCTGoodFaithEstimate
* entry contains Patient 1..1 MS
* entry[Patient].resource only PCTPatient
* entry contains Organization 1..2 MS
* entry[Organization].resource only PCTOrganization
* entry contains Coverage 1..1 MS
* entry[Coverage].resource only PCTCoverage



