Profile: PCTOrganization
Parent: $USCoreOrganization
Id: davinci-pct-organization
Title: "PCT Organization"
Description: "PCT Organization is a profile ..."

* identifier contains ETIN 0..1 MS
* identifier[ETIN] ^patternIdentifier.type  = PCTOrgIdentifierTypeCS#ETIN "Electronic Transmitter Identification Number"

* type 1..* MS
* type from PCTOrganizationTypeVS (extensible)

//TODO: add extension for countrySubdivisionCode
* address.extension contains CountrySubdivisionCode named countrySubdivisionCode 0..1 MS

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
* contact[gfeServiceHotline].purpose = PCTOrgContactPurposeType#GFE-RELATED "Contact details for dealing with issues related to Good Faith Estimate (GFE)."

//TODO: slice contact for defining PAY-TO
//* contact[payToAddress]

//TODO: slice telcom to require phone and email
//* contact.telecom MS

* endpoint MS