Profile: PCTServiceRequest
Parent: USCoreServiceRequestProfile|7.0.0
Id: davinci-pct-servicerequest
Title: "PCT GFE ServiceRequest"
Description: "The PCT ServiceRequest including details about a service for which a GFE is being requested."
* insert TrialUseArtifact
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest|7.0.0"

* status = #active
* intent = #proposal
* doNotPerform 0..0

* code 1..1 MS
* code from USClaimMedicalProductOrServiceCodes (extensible)

* quantity[x] MS

* subject only Reference(USCorePatientProfile|7.0.0)
