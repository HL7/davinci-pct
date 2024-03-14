Profile: PCTProposedMedicationRequest
Parent: MedicationRequest
Id: davinci-pct-proposed-medicationrequest
Title: "PCT GFE Proposed MedicationRequest"
Description: "The PCT Proposed MedicationRequest including details about a medication for which a GFE is being requested."

* status = #active
* intent = #proposal
* doNotPerform 0..0

* medication[x] 1..1 MS

* subject only Reference(HRexPatientDemographics)
