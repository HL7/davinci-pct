Profile: PCTServiceRequest
Parent: ServiceRequest
Id: davinci-pct-servicerequest
Title: "PCT GFE ServiceRequest"
Description: "The PCT ServiceRequest including details about a service for which a GFE is being requested."
* insert TrialUseArtifact

* status = #active
* intent = #proposal
* doNotPerform 0..0

* code 1..1 MS
* code from USClaimMedicalProductOrServiceCodes (extensible)

* quantity[x] MS

* subject only Reference(HRexPatientDemographics)
