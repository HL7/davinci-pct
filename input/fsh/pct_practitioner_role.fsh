Profile: PCTPractitionerRole
Parent: $USCorePractitionerRole
Id: davinci-pct-practitionerrole
Title: "PCT PractitionerRole"
Description: "PCT PractitionerRole is a profile ..."

* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.ordered = false   // can be omitted, since false is the default
* identifier ^slicing.description = "Slice based on $this pattern"
// * identifier contains
//    memberid 1..* MS and
//    uniquememberid 0..* MS
// * identifier[memberid].type = $IdentifierType#MB
// * identifier[uniquememberid].type = C4BBIdentifierType#um
* identifier contains NPI 0..1 MS
* identifier[NPI].type  = $V2-0203#NPI "National provider identifier"
* identifier[NPI].system = $USNPI
* identifier[NPI].value 1..1 MS
* identifier[NPI] ^short = "The National Provider Identifier assigned to the provider."

//* practitioner MS
//* practitioner only Reference(PCTPractitioner)

* organization MS
* organization only Reference(PCTOrganization)