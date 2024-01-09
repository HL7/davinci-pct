Profile: PCTGFERequestServiceRequest
Parent: ServiceRequest
Id: davinci-pct-gfe-request-servicerequest
Title: "PCT GFE Request ServiceRequest"
Description: "The PCT Good Faith Estimate (GFE) ServiceRequest including details about the service for which a GFE is being requested."

* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.description = "Slice based on $this pattern"
* identifier contains
   PLAC 1..1 
* identifier[PLAC].type = $V2-0203#PLAC "Placer Identifier"
* identifier[PLAC].system MS
* identifier[PLAC].value 1..1
* identifier[PLAC] ^short = "Convening Provider Assigned Identifier for GFE ServiceRequest"

* status = #active
* intent = #proposal
* doNotPerform 0..0

* code 1..1 MS

* quantity[x] MS

* subject only Reference(HRexPatientDemographics)
* occurrence[x] MS
* occurrence[x] ^short = "When the proposed service is scheduled or might take place"

* requester only Reference(PCTPractitioner or PCTOrganization)

* bodySite MS