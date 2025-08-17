Profile: PCTMedicationRequest
Parent: USCoreMedicationRequestProfile|7.0.0
Id: davinci-pct-medicationrequest
Title: "PCT GFE MedicationRequest"
Description: "The PCT MedicationRequest including details about a medication for which a GFE is being requested."
* insert DraftArtifact
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest|7.0.0"

* status = #active
* intent = #proposal
* doNotPerform 0..0

* medication[x] 1..1 MS

* subject only Reference(USCorePatientProfile|7.0.0)
