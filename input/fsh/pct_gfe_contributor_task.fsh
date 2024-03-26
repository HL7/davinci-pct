Profile: PCTGFEContributorTask
Parent: Task
Id: davinci-pct-gfe-contributor-task
Title: "PCT GFE Contributor Task"
Description: "The PCT GFE Contributor Task is used by a GFE coordinator   to assign a GFE contributor task to a specific provider and may include information specific to that patient’s expected service"


* extension contains
   $requestedPeriodExtensionUrl named requested-period 0..1 MS and
   RequestInitiationTime named request-initiation-time 1..1 MS and
   PlannedServicePeriod named planned-service-period 0..1 MS
   
//   SchedulingTime named scheduling-time 0..1 MS and
//   ScheduledServicePeriod named scheduled-service-period 0..1 MS 

* extension[requested-period] ^short = "GFE Contributor specific time period the requested GFE should be provided in"
* extension[requested-period] ^comment = "Indicates the start and/or end of the period of time when the GFE bundle should be provided. Usually this is the same as the GFE Coordination Task, and if so, should not be specified in the provider specific task. However, there may be circumstances in which a specific GFE contributor may have a different timeline that should be included in the provider specific task (e.g. the provider was added to original request afterwards, in the case of a provider replacement; or there is a potential dependency on the provider's response)."
* extension[requested-period].valuePeriod.start 0..0
* extension[requested-period].valuePeriod.end 1..1

* extension[request-initiation-time] ^short = "Estimate Request instant"
* extension[request-initiation-time] ^short = "Instant from which the request is being initiated. For patient initiated requests, this is the date and time the patient or their representative made the request. For a newly scheduled service, this represents the time of the scheduling activity (as opposed to the planned time of service). For all other requests, the time of the event that triggered the need for an estimate."
* extension[request-initiation-time].valueInstant 1..1

* extension[planned-service-period] ^short = "GFE contributor specific planned or scheduled period of service the request is about"
* extension[planned-service-period].valuePeriod.start 1..1
* extension[planned-service-period].valuePeriod.end MS


* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.description = "Slice based on $this pattern"
* identifier contains
   PLAC 1..1 and
   INTER 0..*
* identifier[PLAC].type = $V2-0203#PLAC "Placer Identifier"
* identifier[PLAC].system MS
* identifier[PLAC].value 1..1
* identifier[PLAC] ^short = "GFE Coordination Requester Assigned Identifier for GFE Request"
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"

/* Removed because a GFE Coordination Task was deemed to be the approach to take, instead of individual tasks associated through an ID.
* groupIdentifier 1..1
* groupIdentifier.type = $V2-0203#PLAC "Placer Identifier"
* groupIdentifier.system MS
* groupIdentifier.value 1..1
* groupIdentifier ^short = "Requesting Provider Task Identifier (DRAFT: used for grouping the sub-tasks together, may be the means to correlate tasks if the primary task goes away)"
*/


* partOf 1..1
* partOf only Reference(PCTGFECoordinationTask)
* partOf ^short = "Reference to the GFE Coordination Task"



* status from PCTContributorTaskStatusCodes (required)
* statusReason MS
* statusReason from PCTContributorTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTaskCS#gfe-contributor-task

// TODO Supporting Information contained within the bundle. Perhaps guidance on use of reference identifiers?
//* focus only Reference(PCTGFERequestServiceRequest)

// TODO Supporting Information contained within the bundle. Perhaps guidance on use of reference identifiers?
//* for only Reference(HRexPatientDemographics)
//* for ^short = "The patient for whom the GFE request is for"

* requester only Reference(PCTPractitioner or HRexPractitionerRole or PCTOrganization)
* requester ^short = "The provider making the request"
* requester ^comment = "Generally this will be a reference to a Practitioner, PractitionerRole, or Organization resource residing on the Coordination Platform. If there is a need to express contact information that is specific to the request, and therefore is not included in the information on the Coordination Platform, the reference should point to a server and resource that does not have additional authentication or or authorization requirements."

* performerType MS
* performerType ^short = "Specific performer types for the"  //TODO


* owner 1..1
* owner only Reference(PCTPractitioner or HRexPractitionerRole or PCTOrganization)
* owner ^short = "GFE Contributor assigned to complete the task"
// TODO !!! A better description as to why there is not task executor.

* reasonCode 0..0
* reasonCode ^short = "The reasonCode is inherited from the GFE Coordination Task pointed to by Task.partOf"



* restriction 0..0

* input MS
* input ^short = "GFE Contributor specific Information and references to service and supporting information, such as Conditions, Observations, and notes"
* input ^comment = "Contained or referenced request information bundle made available to a specific GFE contributor that includes information about the products and or services requested and other supporting information, such as Conditions, Observations, and notes"

* output MS
* output ^short = "Any outputs from the GFE Contributor including the GFE Bundle or notes on why the specific task was unable to be completed"
* output ^comment = "Any outputs for the GFE Contributor Task which might include notes on why the GFE Contributor Task was unable to be completed."
