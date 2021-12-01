Profile: PCTAEOBBundle
Parent: Bundle
Id: davinci-pct-aeob-bundle
Title: "PCT AEOB Bundle"
Description: "PCT AEOB Bundle that contains necessary resources for an AEOBs. Organizations for both the payer and provider SHALL be included."
* identifier 1..1 MS
* type = #collection (exactly)
* timestamp 1..1 MS
* entry 1..* MS
* entry.fullUrl 1..1 MS
//* entry.resource 1..1 MS
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains ExplanationOfBenefit 1..* MS
* entry[ExplanationOfBenefit] ^short = "Entry in the bundle - will have a PCTAdvancedEOB resource"
* entry[ExplanationOfBenefit].resource 1..1 MS
* entry[ExplanationOfBenefit].resource only PCTAdvancedEOB
