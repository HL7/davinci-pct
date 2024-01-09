Profile: PCTGFERequestBundle
Parent: Bundle
Id: davinci-pct-gfe-request-bundle
Title: "PCT GFE Request Bundle"
Description: "PCT GFE Request Bundle that contains necessary resources for a convening provider to request GFEs from one or multiple co-providers."

* obeys pct-gfe-request-bundle-1

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
    gfe-primary-task 1..1 and
	gfe-provider-task 1..* and
    gfe-servicerequest 1..* and
    patient 1..2 and
    coverage 0..1 and
    organization 0..* and
    practitioner 0..* MS

* entry[gfe-primary-task] ^short = "SHALL have a PCTGFEPrimaryRequestTask resource"
* entry[gfe-primary-task].resource 1..1
* entry[gfe-primary-task].resource only PCTGFEPrimaryRequestTask

* entry[gfe-provider-task] ^short = "SHALL have a PCTGFEProviderRequestTask resource"
* entry[gfe-provider-task].resource 1..1
* entry[gfe-provider-task].resource only PCTGFEProviderRequestTask

* entry[patient] ^short = "SHALL have the patient subject of care and may be a separate subscriber"
* entry[patient].resource 1..1
* entry[patient].resource only HRexPatientDemographics

* entry[coverage] ^short = "MAY have one Coverage"
* entry[coverage].resource 0..1
* entry[coverage].resource only PCTCoverage

* entry[organization] ^short = "May have co-provider organization(s) and the payer organization"
* entry[organization].resource 0..1
* entry[organization].resource only PCTOrganization

* entry[practitioner] ^short = "MAY have co-provider Practitioner(s)"
* entry[practitioner].resource 1..1
* entry[practitioner].resource only PCTPractitioner


Invariant: pct-gfe-request-bundle-1
Description: "All references resources SHALL be contained within the Bundle"
Expression: "Bundle.entry.descendants().reference.distinct().all(resolve().exists())"
// Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not() and $this.startsWith('Bundle').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error