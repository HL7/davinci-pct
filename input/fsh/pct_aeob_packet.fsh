Profile: PCTAEOBPacket
Parent: Bundle
Id: davinci-pct-aeob-packet
Title: "PCT AEOB Packet"
Description: "PCT AEOB Packet that contains necessary resources for AEOBs. A document type Bundle that enables versioning, signing and being referenced by a DocumentReference for searching and subscription notifications."
* insert TrialUseArtifact1
* obeys pct-aeob-bundle-1 and pct-aeob-bundle-2

* identifier 1..1
* type = #document (exactly)
* timestamp 1..1
* entry 1..*
* entry.fullUrl 1..1
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"

* entry contains
    composition 1..1 MS and
	aeob 2..* MS and
    patient 1..2 MS and
    coverage 1..1 MS and
    organization 1..* MS and
    practitioner 0..* MS and
    gfeBundle 0..* MS

/*
* entry[aeob-summary] ^short = "SHALL have a PCTAdvancedEOBSummary resource"
* entry[aeob-summary].resource 1..1
* entry[aeob-summary].resource only PCTAdvancedEOBSummary
*/

* entry[composition] ^short = "SHALL have a PCTAdvancedEOBComposition resource"
* entry[composition].resource 1..1
* entry[composition].resource only PCTAdvancedEOBComposition


* entry[aeob] ^short = "SHALL have a PCTAdvancedEOBSummary or PCTAdvancedEOB resource"
* entry[aeob].resource 1..1
* entry[aeob].resource only PCTAdvancedEOBSummary or PCTAdvancedEOB

* entry[patient] ^short = "SHALL have the patient subject of care and may be a separate subscriber"
* entry[patient].resource 1..1
* entry[patient].resource only HRexPatientDemographics

* entry[coverage] ^short = "SHALL have one Coverage"
* entry[coverage].resource 1..1
* entry[coverage].resource only PCTCoverage

* entry[organization] ^short = "SHALL have the payer organization and may have provider organization(s)"
* entry[organization].resource 1..1 
* entry[organization].resource only PCTOrganization

* entry[practitioner] ^short = "MAY have the provider Practitioner(s)"
* entry[practitioner].resource 1..1 
* entry[practitioner].resource only PCTPractitioner

* entry[gfeBundle] ^short = "MAY have PCTGFEBundle or PCTGFEMissingBundle resource"
* entry[gfeBundle].resource 1..1 
* entry[gfeBundle].resource only PCTGFEBundle or PCTGFEMissingBundle


// TODO Add invariant requirement where at least a gfe summay exists



/* TODO
    aggregation needs to have resources in bundle

    Task Subscriptions

*/



Invariant: pct-datetime-to-seconds
Description: "Datetime must be at least to seconds."
Expression: "$this is dateTime implies $this.toString().length() >= 19"
Severity: #error






Invariant: pct-aeob-bundle-1
Description: "All references resources SHALL be contained within the Bundle with the exception of the PCT GFE Bundle (referenced from the gfeReference extension in the AEOB), which MAY be present"
Expression: "Bundle.entry.descendants().reference.distinct().all(resolve().exists())"
// Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not() and $this.startsWith('Bundle').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error

Invariant: pct-aeob-bundle-2
Description: "SHALL have at least one entry for a payer organization."
//Expression: "entry.resource.ofType(Organization).exists(type.coding.code='pay')"
Expression: "entry.resource.ofType(Organization).where(type.coding.where(code='pay').exists()).exists()"
Severity: #error