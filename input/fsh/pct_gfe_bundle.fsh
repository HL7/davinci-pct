Profile: PCTGFEBundle
Parent: Bundle
Id: davinci-pct-gfe-bundle
Title: "PCT GFE Bundle"
Description: "PCT GFE Bundle that contains necessary resources to submit a AEOB request. Organizations for both the provider and payer SHALL be included."
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
* entry contains Claim 1..* MS
* entry[Claim].resource 1..1 MS
* entry[Claim].resource only PCTGoodFaithEstimate




