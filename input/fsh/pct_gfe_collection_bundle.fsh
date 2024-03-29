// TODO JIRA Make sure all tickets and profile requirements align
// TODO The collection Bundle is to be used in the submission. Make sure that is explicit everywhere including the submit operation. 
// TODO deal with the situation that the coordination request only deals with Pract/org on CP, but in the submission we need to have the submitting prov. Need way to indicate  Perhaps guidance?
// Guidance that the initiating provider may need to be changed from the CP version to the Submitting Provider version

Profile: PCTGFECollectionBundle
Parent: Bundle
Id: davinci-pct-gfe-collection-bundle
Title: "PCT GFE Collection Bundle"
Description: "PCT GFE Collection Bundle that contains GFE Bundles from GFE contributors. This collection of GFE Bundles from GFE contributors that can then be made available to the patient or sent to a payer for insurance estimation. The scope of this guide does not include coordination of benefits or more than one coverage. This does not serve as a replacement for eligibility, prior authorization or other financial and administrative use cases."
* insert TrialUseArtifact
* obeys pct-gfe-collection-bundle-2 and pct-gfe-collection-bundle-3

* identifier 1..1
* type = #collection (exactly)
* timestamp 1..1
//TODO: create a FHIRPath invariant to enforce that at least one entry.resource must be either PCTGFEInstitutional or PCTGFEProfessional
* entry 1..*
* entry.fullUrl 1..1
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
//* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains
    patient 1..2 and
    coverage 0..1 MS and
    organization ..2 MS and
    practitioner 0..1 MS and
    gfe-bundle 0..* MS and
    attachment 0..* MS

* entry[patient] ^short = "SHALL have the patient subject of care and may have a separate subscriber"
* entry[patient].resource 1..1
* entry[patient].resource only HRexPatientDemographics

* entry[coverage] ^short = "MAY have one Coverage"
* entry[coverage].resource 1..1
* entry[coverage].resource only PCTCoverage

* entry[organization] ^short = "SHALL have an initiating provider or initiating organization, but not both. May also have a payer organization."
* entry[organization].resource 1..1 
* entry[organization].resource only PCTOrganization

* entry[practitioner] ^short = "SHALL have a initiating provider or initiating organization, but not both."
* entry[practitioner].resource 1..1 
* entry[practitioner].resource only PCTPractitioner

* entry[gfe-bundle] ^short = "MAY include GFE contributor specific GFE bundle and MAY include bundle(s) with information about a unfulfilled GFE request"
* entry[gfe-bundle].resource 1..1
* entry[gfe-bundle].resource only PCTGFEBundle or PCTGFEMissingBundle


* entry[attachment] ^short = "MAY have attachments as DocumentReference resource(s)"
* entry[attachment].resource 1..1 
* entry[attachment].resource only DocumentReference

/*
// TODO MEETING, is the GFE Submitter necessary on each and every GFE and do they have to be the same? If so, this requires the GFE contributor to make a copy of the requesting provider, but to what end?)
Invariant: pct-gfe-collection-bundle-1
Description: "All GFEs must have the same GFE submitter"
Expression: "(Bundle.entry.resource.ofType(Claim).extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeSubmitter').value.ofType(Reference).reference.distinct().count() = 1)"
Severity: #error
*/

// TODO the expression needs fixing: Invariant requiring (entry[organization] where type is not 'pay' or 'ins') xor entry[practitioner]
Invariant: pct-gfe-collection-bundle-2
Description: "SHALL have a initiating provider or initiating organization, but not both."
Expression: "Bundle.entry.resource.ofType(Practitioner).exists() or Bundle.entry.resource.ofType(Organization).exists()"
Severity: #error

// TODO Invariant requiring at least a GFE Bundle or a GFEMissingBundle

Invariant: pct-gfe-collection-bundle-3
Description: "All references resources SHALL be contained within the Bundle"
// Expression: "Bundle.entry.descendants().reference.distinct().all(resolve().exists())"
Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error

// Invariant: pct-gfe-bundle-4
// Description: "SHALL contain at least one gfeInstitutional slice or gfeProfessional slice"
// Expression: "entry.resource.ofType(Claim).type.where(coding.code='institutional').exists() or entry.resource.ofType(Claim).type.where(coding.code='professional').exists()"
// Severity: #error