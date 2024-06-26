// TODO JIRA Add ticket for this profile

Profile: PCTGFECoordinationBundle
Parent: Bundle
Id: davinci-pct-gfe-coordination-bundle
Title: "PCT GFE Coordination Bundle"
Description: "PCT GFE Request Bundle that contains necessary resources for GFE  to request GFEs from one or multiple GFE contributing providers."
* insert DraftArtifact
//* obeys pct-gfe-request-bundle-1


//* identifier 1..1
* type = #transaction (exactly)
* timestamp 1..1
* entry 1..*
* entry.fullUrl 1..1
* entry.search 0..0
* entry.request 1..1
* entry.request.method = #POST
* entry.request.url 1..1
* entry.response 0..0
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"

* entry contains
    gfe-task 2..* and
    gfe-request-information 0..*

* entry[gfe-task] ^short = "SHALL have one PCTGFECoordinationTask resource and one or more PCTGFEContributorTask resource"
* entry[gfe-task].resource 1..1
* entry[gfe-task].resource only PCTGFECoordinationTask or PCTGFEContributorTask

* entry[gfe-request-information] ^short = "MAY have a PCTGFEInformationBundle (Preferably these bundles are attached in the Tasks)"
* entry[gfe-request-information].resource 1..1
* entry[gfe-request-information].resource only PCTGFEInformationBundle


// TODO INvariant requiring at least one coordination task and one contributor task
/* This does not apply
Invariant: pct-gfe-request-bundle-1
Description: "All references resources SHALL be contained within the Bundle"
Expression: "Bundle.entry.descendants().reference.distinct().all(resolve().exists())"
// Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not() and $this.startsWith('Bundle').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error
*/
/*
TODO invariant - need to have a participating provider
Invariant: pct-gfe-request-bundle-2
Description: "Request Bundle SHALL contain at least one participating provider (Practitioner or Organization)"
Expression: "Bundle.entry.descendants().reference.distinct().all(resolve().exists())"
// Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not() and $this.startsWith('Bundle').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error

*/