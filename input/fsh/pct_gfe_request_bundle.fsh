Profile: PCTGFERequestBundle
Parent: Bundle
Id: davinci-pct-gfe-request-bundle
Title: "PCT GFE Request Bundle"
Description: "PCT GFE Request Bundle that contains necessary resources for a convening provider to request GFEs from one or multiple GFE contributing providers."

//* obeys pct-gfe-request-bundle-1


//* identifier 1..1
* type = #transaction (exactly)
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
    gfe-coordinating-task 1..1 and
	gfe-provider-task 1..* and
    gfe-request-information 0..* and
    organization 0..* MS and
    practitioner 0..* MS

* entry[gfe-coordinating-task] ^short = "SHALL have a PCTCoordinatingGFERequestTask resource"
* entry[gfe-coordinating-task].resource 1..1
* entry[gfe-coordinating-task].resource only PCTCoordinatingGFERequestTask

* entry[gfe-provider-task] ^short = "SHALL have a PCTGFEContibutingProviderRequestTask resource"
* entry[gfe-provider-task].resource 1..1
* entry[gfe-provider-task].resource only PCTGFEContibutingProviderRequestTask

* entry[gfe-request-information] ^short = "SHALL have the patient subject of care and may be a separate subscriber"
* entry[gfe-request-information].resource 1..1
* entry[gfe-request-information].resource only PCTGFERequestInformationBundle

* entry[organization] ^short = "May have payer or contributing organization(s)"
* entry[organization].resource 0..1
* entry[organization].resource only PCTOrganization

* entry[practitioner] ^short = "MAY have contributing practitioner(s)"
* entry[practitioner].resource 1..1
* entry[practitioner].resource only PCTPractitioner

/* THis does not apply
Invariant: pct-gfe-request-bundle-1
Description: "All references resources SHALL be contained within the Bundle"
Expression: "Bundle.entry.descendants().reference.distinct().all(resolve().exists())"
// Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not() and $this.startsWith('Bundle').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error
*/
/*
TODO  - need to have a participating provider
Invariant: pct-gfe-request-bundle-2
Description: "Request Bundle SHALL contain at least one participating provider (Practitioner or Organization)"
Expression: "Bundle.entry.descendants().reference.distinct().all(resolve().exists())"
// Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not() and $this.startsWith('Bundle').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error

*/