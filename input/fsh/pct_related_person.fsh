Profile: PCTRelatedPerson
Parent: RelatedPerson
Id: davinci-pct-related-person
Title: "PCT RelatedPerson"
Description: "PCT RelatedPerson is a profile ..."

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
* identifier contains employeeID 0..1 MS
* identifier[employeeID].type  = $V2-0203#EI "Employee number"

* name 1..* MS
* gender 1..1 MS
* birthDate 1..1 MS

* address.district MS
