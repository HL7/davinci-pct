Profile: PCTGFEBundle
Parent: Bundle
Id: davinci-pct-gfe-bundle
Title: "PCT GFE Bundle"
Description: "PCT GFE Bundle that contains necessary resources as a GFE Submission for obtaining an AEOB. Organizations for both the provider and payer SHALL be included."
* identifier 1..1 MS
* type = #collection (exactly)
* timestamp 1..1 MS
//TODO: create a FHIRPath invariant to enforce that at least one entry.resource must be either PCTGFEInstitutional or PCTGFEProfessional
* entry 1..* MS
* entry.fullUrl 1..1 MS
//* entry.resource 1..1 MS
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains
    gfeInstitutional 0..* MS and
    gfeProfessional 0..* MS
* entry[gfeInstitutional] ^short = "Entry in the bundle - will have a PCTGFEInstitutional resource"
* entry[gfeInstitutional].resource 1..1 MS
* entry[gfeInstitutional].resource only PCTGFEInstitutional
* entry[gfeInstitutional].resource ^short = "Institutional Claim Resource for Predetermination"
* entry[gfeProfessional] ^short = "Entry in the bundle - will have a PCTGFEProfessional resource"
* entry[gfeProfessional].resource 1..1 MS
* entry[gfeProfessional].resource only PCTGFEProfessional
* entry[gfeProfessional].resource ^short = "Professional Claim Resource for Predetermination"