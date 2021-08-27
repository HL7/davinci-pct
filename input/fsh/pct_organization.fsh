Profile: PCTOrganization
Parent: $USCoreOrganization
Id: davinci-pct-organization
Title: "DaVinci PCT Orgaization"
Description: "PCT Organization"

* identifier contains 
   ETIN 0..1 MS and
   NIIP 0..1 MS and
   tax 0..* MS
   
* identifier[ETIN] ^patternIdentifier.type  = PCTIdentifierType#etin
* identifier[NIIP] ^patternIdentifier.type  = $IdentifierType#niip

* identifier[tax] ^short = "Tax ID Number"
* identifier[tax] ^patternIdentifier.type  = $IdentifierType#TAX
* identifier[tax] ^patternIdentifier.system = $TAXCodeCS 