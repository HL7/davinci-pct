Profile: PCTOrganization
Parent: HRexOrganization
Id: davinci-pct-organization
Title: "PCT Organization"
Description: "The PCT Organization profile builds upon the US Core Organization profile. It is used to convey a payer, provider, payee, or service facility organization."
* insert TrialUseArtifact

* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.ordered = false   // can be omitted, since false is the default
* identifier ^slicing.description = "Slice based on $this pattern"
* identifier contains
   ETIN 0..1 MS and
   payerid 0..1 MS //and
   //naiccode 0..1 MS
* identifier[ETIN] ^patternIdentifier.type = PCTOrgIdentifierTypeCS#ETIN 
//* identifier[ETIN].type = PCTOrgIdentifierTypeCS#ETIN "Electronic Transmitter Identification Number" <<<<<WOULD CAUSE slicing errors
//* identifier[ETIN].value 1..1 <<<<<<<<< DOES NOT WORK
* identifier[ETIN] ^short = "Electronic Transmitter Identification Number."

* identifier[payerid] ^patternIdentifier.type = PCTOrgIdentifierTypeCS#payerid
* identifier[payerid].value 1..1

//* identifier[naiccode] ^patternIdentifier.type = PCTOrgIdentifierTypeCS#naiccode
//* identifier[naiccode].system = "urn:oid:2.16.840.1.113883.6.300"
//* identifier[naiccode].value 1..1

* identifier[tin] ^patternIdentifier.type = $V2-0203#TAX 
* identifier[tin] ^short = "Tax ID Number"

//* identifier[NPI] ^patternIdentifier.type = $V2-0203#NPI
//* identifier[NPI].value 1..1
//* identifier[NPI] ^short = "The National Provider Identifier assigned to the provider."

* identifier[ccn] ^short = "Medicare Certification Number - Should only be included in Medicare related transactions"
* identifier[ccn] ^definition = "Medicare Certification Number - Only relevant for Medicare related transactions. Must Support is only applicable for Medicare-based transactions."

* type 1..*
* type from PCTOrganizationTypeVS (extensible)

//TODO: add extension for countrySubdivisionCode
* address.extension contains CountrySubdivisionCode named countrySubdivisionCode 0..1 MS
* address.extension[countrySubdivisionCode] ^short = "Country Subdivision Code - from Part 2 of ISO 3166"

* address.country MS
* address.country from $ISO3166-P1-ALPHA2-VS (required)

//need these for Professional GFE Submitter??
* insert OrgContactSlicing
//* contact 0..* MS

* contact.purpose from PCTOrgContactPurposeTypeVS (extensible)
* contact contains
   gfeServiceHotline 0..1 MS
* contact[gfeServiceHotline].name 1..1
* contact[gfeServiceHotline].telecom 1..*
* contact[gfeServiceHotline].purpose
* contact[gfeServiceHotline].purpose = PCTOrgContactPurposeType#GFERELATED

//TODO: slice contact for defining PAY-TO
//* contact[payToAddress]

//TODO: slice telcom to require phone and email
//* contact.telecom MS
