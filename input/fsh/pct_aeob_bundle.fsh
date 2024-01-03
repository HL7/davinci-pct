Profile: PCTAEOBBundle
Parent: Bundle
Id: davinci-pct-aeob-bundle
Title: "PCT AEOB Bundle"
Description: "PCT AEOB Bundle that contains necessary resources for an AEOBs. Organizations for both the payer and provider SHALL be included."

* obeys pct-aeob-bundle-1 and pct-aeob-bundle-2

* identifier 1..1
* type = #collection (exactly)
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
    aeob-summary 1..1 and
	aeob 1..* and
    patient 1..2 and
    coverage 1..1 and
    organization 1..* and
    practitioner 0..* MS and
    gfeBundle 0..* MS

* entry[aeob] ^short = "SHALL have a PCTAdvancedEOB resource"
* entry[aeob].resource 1..1
* entry[aeob].resource only PCTAdvancedEOB

* entry[aeob-summary] ^short = "SHALL have a PCTAdvancedEOBSummary resource"
* entry[aeob-summary].resource 1..1
* entry[aeob-summary].resource only PCTAdvancedEOBSummary

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

* entry[gfeBundle] ^short = "MAY have PCTGFEBundle resource"
* entry[gfeBundle].resource 1..1 
* entry[gfeBundle].resource only PCTGFEBundle


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