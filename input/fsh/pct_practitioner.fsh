Profile: PCTPractitioner
Parent: $USCorePractitioner
Id: davinci-pct-practitioner
Title: "PCT Practitioner"
Description: "PCT Practitioner is a profile ..."

// * identifier ^slicing.discriminator.path = "type"
// * identifier ^slicing.rules = #open
// * identifier ^slicing.discriminator.type = #pattern
// * identifier ^slicing.ordered = false   // can be omitted, since false is the default
// * identifier ^slicing.description = "Slice based on $this pattern"

//* identifier contains NPI 0..1 MS
* identifier[NPI] 1..1 MS
* identifier[NPI] ^patternIdentifier.type  = $V2-0203#NPI "National provider identifier"
* identifier[NPI].value 1..1 MS
* identifier[NPI] ^short = "The National Provider Identifier assigned to the provider."