Profile: PCTOrganization
Parent: $USCoreOrganization
Id: davinci-pct-organization
Title: "PCT Organization"
Description: "PCT Organization is a profile ..."

* identifier contains ETIN 0..1 MS
* identifier[ETIN] ^patternIdentifier.type  = PCTOrgIdentifierTypeCS#ETIN

* type 1..* MS
* type from PCTOrganizationTypeVS (extensible)

//need these for Professional GFE Submitter??
* contact 0..* MS
* contact.name 1..1 MS

//TODO: slice telcom to require phone and email
* contact.telecom MS
