Profile: PCTPractitioner
Parent: HRexPractitioner
Id: davinci-pct-practitioner
Title: "PCT Practitioner"
Description: "The PCT Practitioner profile builds upon the US Core Practitioner profile. It is used to convey information about the practitioner who will be providing services to the patient as described on the GFE."

* extension contains PCTEndpoint named endpoint 0..* MS
* extension[endpoint] ^short = "Technical endpoints providing access to services operated for the practitioner."

// * identifier ^slicing.discriminator.path = "type"
// * identifier ^slicing.rules = #open
// * identifier ^slicing.discriminator.type = #pattern
// * identifier ^slicing.ordered = false   // can be omitted, since false is the default
// * identifier ^slicing.description = "Slice based on $this pattern"

* identifier contains ETIN 0..1 MS and tin 0..1 MS
* identifier[ETIN] ^patternIdentifier.type = PCTOrgIdentifierTypeCS#ETIN 
* identifier[ETIN].value 1..1 MS
* identifier[ETIN] ^short = "The submitter's Electronic Transmitter Identification Number."

//* identifier contains NPI 0..1 MS
* identifier[NPI] 0..1 MS
* identifier[NPI] ^patternIdentifier.type  = $V2-0203#NPI 
* identifier[NPI].value 1..1 MS
* identifier[NPI] ^short = "The National Provider Identifier assigned to the provider."

* identifier[tin] ^patternIdentifier.type = $V2-0203#TAX 
* identifier[tin] ^short = "Tax ID Number"
* identifier[tin].value 1..1

* name.given 1..1 MS

//TODO: add slices for phone and email
* telecom MS

* qualification.code from NUCC (required)