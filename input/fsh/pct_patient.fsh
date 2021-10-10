Profile: PCTPatient
Parent: $USCorePatient
Id: davinci-pct-patient
Title: "PCT Patient"
Description: "The PCT Patient profile builds upon the US Core Patient profile. It is used to convey information about the patient who will be receiving the services as described on the GFE."

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

* birthDate 1..1 MS

//* address.district MS
