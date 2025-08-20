Profile: PCTGFEMissingBundle
Parent: Bundle
Id: davinci-pct-gfe-missing-bundle
Title: "PCT GFE Missing Bundle"
Description: "PCT GFE Missing Bundle is used to indicate when a GFE Contributor task request was made, but no GFE Bundle was submitted (attached to the ContributorTask)."
* insert DraftArtifact
* obeys pct-gfe-missing-bundle-1

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
    patient 1..1 and
    coverage 0..1 MS and
    organization 0..2 MS and
    practitioner 0..1 MS and
    requested-items-service 0..* MS and
    requested-items-medication 0..* MS and
    requested-items-device 0..* MS and
    requested-items-nutrition 0..* MS and
    requested-items-vision 0..* MS 

* entry[patient] ^short = "SHALL have the patient subject of care and may have a separate subscriber"
* entry[patient].resource 1..1
* entry[patient].resource only USCorePatientProfile|7.0.0

* entry[coverage] ^short = "MAY have one Coverage"
* entry[coverage].resource 1..1
* entry[coverage].resource only PCTCoverage

* entry[organization] ^short = "MAY have the payer organization and may have provider organization"
* entry[organization].resource 1..1 
* entry[organization].resource only PCTOrganization

* entry[practitioner] ^short = "MAY have the provider Practitioner"
* entry[practitioner].resource 1..1 
* entry[practitioner].resource only PCTPractitioner

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



Invariant: pct-gfe-missing-bundle-1
Description: "SHALL NOT contain a GFE."
Expression: "Bundle.entry.resource.ofType(Claim).exists()=false"
Severity: #error

