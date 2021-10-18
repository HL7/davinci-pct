Profile: PCTSubscriber
Parent: RelatedPerson
Id: davinci-pct-subscriber
Title: "PCT Subscriber"
Description: "The PCT Subscriber profile builds upon the RelatedPerson resource. It is used to convey the party who is entitled to the benefits under the policy."

* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.ordered = false   // can be omitted, since false is the default
* identifier ^slicing.description = "Slice based on $this pattern"
* identifier contains
   memberID 0..* MS and
   employeeID 0..* MS
* identifier[memberID].type = $V2-0203#MB "Member Number"
* identifier[employeeID].type = $V2-0203#EI "Employee number"

* name 1..* MS
* gender 1..1 MS
* birthDate 1..1 MS

//* address.district MS
