Profile: PCTGFERequestInformationBundle
Parent: Bundle
Id: davinci-pct-gfe-request-information-bundle
Title: "PCT GFE Request Information Bundle"
Description: "PCT GFE Request Information Bundle that contains the information necessary for potential GFE contributing providers to create their estimates. This bundle may be used for a request encompassing the entire request or that is specific to a contributing provider and may include, but is not limited to, the Patient Resource, request resources (such as ServiceRequest, MedicationRequest, and DeviceRequest), Service location information, Coverage and Payer Organization resources (if applicable)."
* obeys pct-gfe-request-information-bundle-1 

// TODO, Create ticket that includes this bundle and the service request profiles

//* identifier 1..1
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
    patient 1..2 and
    coverage 0..1 MS and
    organization ..* MS and
    practitioner 0..* MS and
    requested-items 1..* MS and
    attachment 0..* MS

// TODO MEETING, Should we require patient in all including provider specific bundles? If not, do we need to have 2 different bundle resources? Or perhaps a special definition of MS

    
* entry[patient] ^short = "SHALL have the patient subject of care and may have a separate subscriber"
* entry[patient].resource 1..1
* entry[patient].resource only HRexPatientDemographics

* entry[coverage] ^short = "MAY have one Coverage"
* entry[coverage].resource 1..1
* entry[coverage].resource only PCTCoverage

* entry[organization] ^short = "MAY have the payer organization and may have provider organization(s)"
* entry[organization].resource 1..1 
* entry[organization].resource only PCTOrganization

* entry[practitioner] ^short = "MAY have the provider Practitioner(s)"
* entry[practitioner].resource 1..1 
* entry[practitioner].resource only PCTPractitioner

* entry[requested-items] ^short = "Items the request is about"
* entry[requested-items].resource 1..1
* entry[requested-items].resource only PCTProposedServiceRequest or PCTProposedMedicationRequest or PCTProposedDeviceRequest or NutritionOrder or VisionPrescription

* entry[attachment] ^short = "MAY have attachments as DocumentReference resource(s)"
* entry[attachment].resource 1..1 
* entry[attachment].resource only DocumentReference


Invariant: pct-gfe-request-information-bundle-1
Description: "All references resources SHALL be contained within the Bundle"
// Expression: "Bundle.entry.descendants().reference.distinct().all(resolve().exists())"
Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error

// Invariant: pct-gfe-bundle-4
// Description: "SHALL contain at least one gfeInstitutional slice or gfeProfessional slice"
// Expression: "entry.resource.ofType(Claim).type.where(coding.code='institutional').exists() or entry.resource.ofType(Claim).type.where(coding.code='professional').exists()"
// Severity: #error