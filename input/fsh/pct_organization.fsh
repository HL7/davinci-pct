Profile: PCTOrganization
Parent: $USCoreOrganization
Id: davinci-pct-organization
Title: "PCT Organization"
Description: "The PCT Organization profile builds upon the US Core Organization profile. It is used to convey a payer, provider, payee, or service facility organization."

* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.ordered = false   // can be omitted, since false is the default
* identifier ^slicing.description = "Slice based on $this pattern"
* identifier contains
   ETIN 0..1 MS and
   TAX 0..1 MS
* identifier[ETIN] ^patternIdentifier.type = PCTOrgIdentifierTypeCS#ETIN "Electronic Transmitter Identification Number"
//* identifier[ETIN].type = PCTOrgIdentifierTypeCS#ETIN "Electronic Transmitter Identification Number" <<<<<WOULD CAUSE slicing errors
//* identifier[ETIN].value 1..1 <<<<<<<<< DOES NOT WORK
* identifier[ETIN] ^short = "Electronic Transmitter Identification Number."

* identifier[TAX] ^patternIdentifier.type = V2-0203#TAX "Tax ID number"
* identifier[TAX] ^short = "Tax ID Number"

* identifier[NPI] ^patternIdentifier.type = $V2-0203#NPI "National provider identifier"
//* identifier[NPI].value 1..1
//* identifier[NPI] ^short = "The National Provider Identifier assigned to the provider."

* type 1..* MS
* type from PCTOrganizationTypeVS (extensible)

//TODO: add extension for countrySubdivisionCode
* address.extension contains CountrySubdivisionCode named countrySubdivisionCode 0..1 MS
* address.extension[countrySubdivisionCode] ^short = "Country Subdivision Code - from Part 2 of ISO 3166"

* address.country MS
* address.country from $ISO3166-P1-ALPHA2-VS (required)

//need these for Professional GFE Submitter??
* insert OrgContactSlicing
//* contact 0..* MS

//* contact.purpose from PCTOrgContactPurposeTypeVS (extensible)
* contact contains
   gfeServiceHotline 0..1 MS
* contact[gfeServiceHotline].name 1..1 MS
* contact[gfeServiceHotline].telecom 1..* MS
* contact[gfeServiceHotline].purpose MS
* contact[gfeServiceHotline].purpose = PCTOrgContactPurposeType#gferelated "GFE-related"

//TODO: slice contact for defining PAY-TO
//* contact[payToAddress]

//TODO: slice telcom to require phone and email
//* contact.telecom MS

* endpoint MS