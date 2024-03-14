Profile: PCTProposedServiceRequest
Parent: ServiceRequest
Id: davinci-pct-proposed-servicerequest
Title: "PCT GFE Proposed ServiceRequest"
Description: "The PCT Proposed ServiceRequest including details about a service for which a GFE is being requested."

* status = #active
* intent = #proposal
* doNotPerform 0..0

* code 1..1 MS
* code from USClaimMedicalProductOrServiceCodes (extensible)

* quantity[x] MS

* subject only Reference(HRexPatientDemographics)
