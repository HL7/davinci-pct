Profile: PCTGFEBundle
Parent: Bundle
Id: davinci-pct-gfe-bundle
Title: "PCT GFE Bundle"
Description: "PCT GFE Bundle that contains necessary resources as a GFE Submission for obtaining an AEOB. Organizations for both the provider and payer SHALL be included. The scope of this guide does not include coordination of benefits or more than one coverage. This does not serve as a replacement for eligibility, prior authorization or other financial and administrative use cases."

* obeys pct-gfe-bundle-1 and pct-gfe-bundle-2 and pct-gfe-bundle-3

* identifier 1..1 MS
* type = #collection (exactly)
* timestamp 1..1 MS
//TODO: create a FHIRPath invariant to enforce that at least one entry.resource must be either PCTGFEInstitutional or PCTGFEProfessional
* entry 1..* MS
* entry.fullUrl 1..1 MS
//* entry.resource 1..1 MS
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
// * entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains
	gfe 1..* MS and
    patient 1..2 MS and
    coverage 1..1 MS and
    organization 1..* MS and
    practitioner 0..* MS and
//    gfeInstitutional 0..* MS and
//    gfeProfessional 0..* MS and
    attachment 0..* MS
	


* entry[gfe] ^short = "SHALL have one or more PCTGFEProfessional or PCTGFEInstitutional resource(s)"
* entry[gfe].resource 1..1 
* entry[gfe].resource only PCTGFEProfessional or PCTGFEInstitutional

// * entry[gfeProfessional] ^short = "MAY have PCTGFEProfessional resource(s)"
// * entry[gfeProfessional].resource 1..1 
// * entry[gfeProfessional].resource only PCTGFEProfessional

// * entry[gfeInstitutional] ^short = "MAY have PCTGFEInstitutional resource(s)"
// * entry[gfeInstitutional].resource 1..1 
// * entry[gfeInstitutional].resource only PCTGFEInstitutional
    
* entry[patient] ^short = "SHALL have the patient subject of care and may have a separate subscriber"
* entry[patient].resource 1..1
* entry[patient].resource only HRexPatientDemographics

* entry[coverage] ^short = "SHALL have one Coverage"
* entry[coverage].resource 1..1
* entry[coverage].resource only PCTCoverage

* entry[organization] obeys pct-gfe-bundle-2
* entry[organization] ^short = "SHALL have the payer organization and may have provider organization(s)"
* entry[organization].resource 1..1 
* entry[organization].resource only PCTOrganization

* entry[practitioner] ^short = "MAY have the provider Practitioner(s)"
* entry[practitioner].resource 1..1 
* entry[practitioner].resource only PCTPractitioner

* entry[attachment] ^short = "MAY have attachments as DocumentReference resource(s)"
* entry[attachment].resource 1..1 
* entry[attachment].resource only DocumentReference

Invariant: pct-gfe-bundle-1
Description: "All GFEs must have the same GFE submitter"
Expression: "(Bundle.entry.resource.ofType(Claim).extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeSubmitter').valueReference.reference.distinct().count() = 1)"
Severity: #error

Invariant: pct-gfe-bundle-2
Description: "SHALL have at least one entry for a payer organization."
Expression: "entry.resource.ofType(Organization).type.where(coding.code='pay').exists()"
Severity: #error


Invariant: pct-gfe-bundle-3
Description: "All references resources SHALL be contained within the Bundle"
Severity: #error

// Invariant: pct-gfe-bundle-4
// Description: "SHALL contain at least one gfeInstitutional slice or gfeProfessional slice"
// Expression: "entry.resource.ofType(Claim).type.where(coding.code='institutional').exists() or entry.resource.ofType(Claim).type.where(coding.code='professional').exists()"
// Severity: #error