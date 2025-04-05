Profile: PCTGFEBundle
Parent: Bundle
Id: davinci-pct-gfe-bundle
Title: "PCT GFE Bundle"
//Description: "PCT GFE Bundle that contains necessary resources as a GFE Submission for obtaining an AEOB. Organizations for both the provider and payer SHALL be included. The scope of this guide does not include coordination of benefits or more than one coverage. This does not serve as a replacement for eligibility, prior authorization or other financial and administrative use cases."
Description: "PCT GFE Bundle that contains all resources for a Good faith estimate submitted by a single GFE contributing provider. Organizations for both the provider and payer MAY be included. This single contributing provider GFE Bundle may be included in a set of GFE bundles from other providers in a GFE Packet that can then be made available to the patient or sent to a payer for insurance estimation. The scope of this guide does not include coordination of benefits for more than one coverage. This does not serve as a replacement for eligibility, prior authorization or other financial and administrative use cases."
* insert TrialUseArtifact
/* Remove GFE Submitter
* obeys pct-gfe-bundle-1 and pct-gfe-bundle-2 and pct-gfe-bundle-3
*/
* obeys pct-gfe-bundle-1 and pct-gfe-bundle-2

* identifier 1..1
* type = #collection (exactly)
* timestamp 1..1
//TODO: create a FHIRPath invariant to enforce that at least one entry.resource must be either PCTGFEInstitutional or PCTGFEProfessional
* entry 1..*
* entry.fullUrl 1..1
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
// * entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains
//	gfe-summary 1..1 and
    gfe 2..* and
    patient 1..2 and
    coverage 0..1 MS and
    organization ..* MS and
    practitioner 0..* MS and
    attachment 0..* MS


//* entry[gfe-summary] ^short = "SHALL have a PCTGFESummary resource"
//* entry[gfe-summary].resource 1..1
//* entry[gfe-summary].resource only PCTGFESummary

* entry[gfe] ^short = "SHALL have one or more PCTGFEProfessional or PCTGFEInstitutional resource(s)"
* entry[gfe].resource 1..1 
* entry[gfe].resource only PCTGFESummary or PCTGFEProfessional or PCTGFEInstitutional

// * entry[gfeProfessional] ^short = "MAY have PCTGFEProfessional resource(s)"
// * entry[gfeProfessional].resource 1..1 
// * entry[gfeProfessional].resource only PCTGFEProfessional

// * entry[gfeInstitutional] ^short = "MAY have PCTGFEInstitutional resource(s)"
// * entry[gfeInstitutional].resource 1..1 
// * entry[gfeInstitutional].resource only PCTGFEInstitutional
    
* entry[patient] ^short = "SHALL have the patient subject of care and may have a separate subscriber"
* entry[patient].resource 1..1
* entry[patient].resource only HRexPatientDemographics

* entry[coverage] ^short = "MAY have one Coverage"
* entry[coverage].resource 1..1
* entry[coverage].resource only PCTCoverage

* entry[organization] ^short = "SHALL have a submitting provider or submitting organization, but not both. May also have a payer organization."
* entry[organization].resource 1..1 
* entry[organization].resource only PCTOrganization

* entry[practitioner] ^short = "SHALL have a submitting provider or submitting organization, but not both."
* entry[practitioner].resource 1..1 
* entry[practitioner].resource only PCTPractitioner

* entry[attachment] ^short = "MAY have attachments as DocumentReference resource(s)"
* entry[attachment].resource 1..1 
* entry[attachment].resource only DocumentReference

/* Remove GFE Submitter TODO JIRA Need a ticket for removal of GFE Submitter
Invariant: pct-gfe-bundle-3
Description: "All GFEs must have the same GFE submitter"
Expression: "(Bundle.entry.resource.ofType(Claim).extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeSubmitter').value.ofType(Reference).reference.distinct().count() = 1)"
Severity: #error
*/
// TODO the expression needs fixing: Invariant requiring (entry[organization] where type is not 'pay' or 'ins') xor entry[practitioner]
Invariant: pct-gfe-bundle-1
Description: "SHALL have a submitting provider or submitting organization, but not both."
Expression: "Bundle.entry.resource.ofType(Practitioner).exists() or Bundle.entry.resource.ofType(Organization).exists()"
Severity: #error


Invariant: pct-gfe-bundle-2
Description: "All references resources SHALL be contained within the Bundle"
// Expression: "Bundle.entry.descendants().reference.distinct().all(resolve().exists())"
Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error

// Invariant: pct-gfe-bundle-4
// Description: "SHALL contain at least one gfeInstitutional slice or gfeProfessional slice"
// Expression: "entry.resource.ofType(Claim).type.where(coding.code='institutional').exists() or entry.resource.ofType(Claim).type.where(coding.code='professional').exists()"
// Severity: #error


// TODO Add invatiant requirement where at least a gfe summay exists