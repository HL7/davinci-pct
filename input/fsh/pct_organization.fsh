Profile: PCTOrganization
Parent: $USCoreOrganization
Id: davinci-pct-organization
Title: "PCT Orgaization"
Description: "PCT Organization"

* identifier contains ETIN 0..1 MS

//* identifier[ETIN] ^patternIdentifier.type  = PCTOrgIdentifierTypeCS#ETIN
//* identifier[ETIN] ^patternIdentifier.system = PCTOrgIdentifierTypeCS

//need these for Professional GFE Submitter??
// * contact 1..* MS
// * contact.name 1..1
