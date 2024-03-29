Profile: PCTMedicationRequest
Parent: MedicationRequest
Id: davinci-pct-medicationrequest
Title: "PCT GFE MedicationRequest"
Description: "The PCT MedicationRequest including details about a medication for which a GFE is being requested."
* insert DraftArtifact

* status = #active
* intent = #proposal
* doNotPerform 0..0

* medication[x] 1..1 MS

* subject only Reference(HRexPatientDemographics)
