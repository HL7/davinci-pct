Profile: PCTGFEInformationBundle
Parent: Bundle
Id: davinci-pct-gfe-information-bundle
Title: "PCT GFE Information Bundle"
Description: "PCT GFE Information Bundle that contains the information necessary for GFE contributors to create their estimates. This bundle may for all GFE Contributors or  specific to a single contributor and may include, but is not limited to, the Patient Resource, request resources (such as ServiceRequest, MedicationRequest, and DeviceRequest), Service location information, Coverage and Payer Organization resources (if applicable)."
* insert DraftArtifact
* obeys pct-gfe-information-bundle-1 


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
    service-location 0..* MS and
    practitioner 0..* MS and
    practitioner-role 0..* MS and
    requested-items-service 0..* MS and
    requested-items-medication 0..* MS and
    requested-items-device 0..* MS and
    requested-items-nutrition 0..* MS and
    requested-items-vision 0..* MS and
    attachment 0..* MS


    
* entry[patient] ^short = "SHALL have the patient subject of care and may have a separate subscriber"
* entry[patient].resource 1..1
* entry[patient].resource only USCorePatientProfile|7.0.0

* entry[coverage] ^short = "MAY have one Coverage"
* entry[coverage].resource 1..1
* entry[coverage].resource only PCTCoverage

* entry[organization] ^short = "MAY have the payer organization and may have provider organization(s)"
* entry[organization].resource 1..1 
* entry[organization].resource only PCTOrganization

* entry[practitioner] ^short = "MAY have the provider Practitioner(s)"
* entry[practitioner].resource 1..1 
* entry[practitioner].resource only  PCTPractitioner

* entry[practitioner-role] ^short = "MAY have the provider PractitionerRole(s)"
* entry[practitioner-role].resource 1..1 
* entry[practitioner-role].resource only  USCorePractitionerRoleProfile|7.0.0

* entry[service-location] ^short = "MAY have Service Location(s)"
* entry[service-location].resource 1..1 
* entry[service-location].resource only  PCTServiceLocation 

* entry[requested-items-service] ^short = "Items the request is about - PCTServiceRequest"
* entry[requested-items-service].resource 1..1
* entry[requested-items-service].resource only PCTServiceRequest

* entry[requested-items-medication] ^short = "Items the request is about - PCTMedicationRequest"
* entry[requested-items-medication].resource 1..1
* entry[requested-items-medication].resource only PCTMedicationRequest

* entry[requested-items-device] ^short = "Items the request is about - PCTDeviceRequest"
* entry[requested-items-device].resource 1..1
* entry[requested-items-device].resource only PCTDeviceRequest

* entry[requested-items-nutrition] ^short = "Items the request is about - NutritionOrder"
* entry[requested-items-nutrition].resource 1..1
* entry[requested-items-nutrition].resource only NutritionOrder

* entry[requested-items-vision] ^short = "Items the request is about - VisionPrescription"
* entry[requested-items-vision].resource 1..1
* entry[requested-items-vision].resource only VisionPrescription

* entry[attachment] ^short = "MAY have attachments as DocumentReference resource(s)"
* entry[attachment].resource 1..1 
* entry[attachment].resource only DocumentReference


Invariant: pct-gfe-information-bundle-1
Description: "All references resources SHALL be contained within the Bundle"
// Expression: "Bundle.entry.descendants().reference.distinct().all(resolve().exists())"
Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error

// Invariant: pct-gfe-bundle-4
// Description: "SHALL contain at least one gfeInstitutional slice or gfeProfessional slice"
// Expression: "entry.resource.ofType(Claim).type.where(coding.code='institutional').exists() or entry.resource.ofType(Claim).type.where(coding.code='professional').exists()"
// Severity: #error