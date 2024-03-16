Profile: PCTCoordinatingGFERequestTask
Parent: Task
Id: davinci-pct-coordinating-gfe-request-task
Title: "PCT Coordinating GFE Request Task"
Description: "The PCT Coordinating Good Faith Estimate (GFE) Request Task is used to organize a GFE Request for a single period of care for which all GFE contributing provider tasks will be linked. The task includes the general inputs that are shared across all of the GFE contributing provider tasks. These inputs may include a 'primary' service and relevant conditions."

/*
Consider other extensions 
https://hl7.org/fhir/extensions/5.1.0-ballot/StructureDefinition-request-replaces.html
https://hl7.org/fhir/extensions/StructureDefinition-request-replaces.html
or
https://hl7.org/fhir/extensions/5.1.0-ballot/StructureDefinition-task-replaces.html
https://hl7.org/fhir/extensions/StructureDefinition-task-replaces.html


*/

* extension contains
   $requestedPeriodExtensionUrl named requested-period 0..1 MS and
   RequestInitiationTime named request-initiation-time 1..1 MS and
   PlannedServicePeriod named planned-service-period 0..1 MS and
   $taskReplacesExtensionUrl named task-replaces 0..1 MS
//   PatientRequestDate named patient-request-date-time 0..1 MS and
   
   
//   SchedulingTime named scheduling-time 0..1 MS and
//   ScheduledServicePeriod named scheduled-service-period 0..1 MS 

* extension[requested-period] ^short = "Time period the requested GFE should be provided in"
* extension[requested-period] ^comment = "Indicates the start and/or end of the period of time when the GFE bundle should be provided."
* extension[requested-period].valuePeriod.start 0..0
* extension[requested-period].valuePeriod.end 1..1

* extension[request-initiation-time] ^short = "Estimate Request instant"
* extension[request-initiation-time] ^short = "Instant from which the request is being initiated. For patient initiated requests, this is the date and time the patient or their representative made the request. For a newly scheduled service, this represents the time of the scheduling activity (as opposed to the planned time of service). For all other requests, the time of the event that triggered the need for an estimate."
* extension[request-initiation-time].valueInstant 1..1

* extension[planned-service-period] ^short = "Overall planned period of service the request is about"
* extension[planned-service-period].valuePeriod.start 1..1
* extension[planned-service-period].valuePeriod.end MS

* extension[task-replaces] ^short = "Indicates a related previous task that had been completed to terminated."
* extension[task-replaces] ^comment = "If a previous request was completed or cancelled that largely represents this current task it may be useful for GFE contributing providers to be able to refer to the previous request. This may happen when something about a GFE collection request changes so much that it requires re-issuing the request by cancelling the first one and creating a new one. GFE contributing providers may want to refer back to the previous request in order to help them populate a response to the new one."


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
* identifier[PLAC] ^short = "Convening Provider Assigned Identifier for GFE Request"
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"


* partOf 0..0
* partOf ^short = "The coordinating request is not part of a greater request"

* status from PCTCoordinatingTaskStatusCodes (required)
* statusReason from PCTCoordinatingTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order
* intent ^short = "Order for a Good Faith Estimate (not for services to be rendered)"

* code = PCTGFERequestTaskCS#gfe-coordinating-request

// TODO !!!!!!!

//Requesting provider

/** 


TODO Meeting - What needs to happen with the GFE Linking identifier extension, which included [plannedPeriodOfService


INVARIANT - if scheduled-service-request require a planned service date


* focus on the bundle input (Play with that) Is there a way to reference something inside the bundle (How is the bundle being included in the input)
******Identifier references are an option.

* insurance (Is there a way to reference something inside the bundle?)
identifier

How to include the Bundle? Perhaps in contained. How should references be done to contained resources.
Create a profile for the GFE Request Information Bundle
Perhaps guidance on use of reference identifiers?

How about the output GFE Collection bundle? 
Need an operationDefiniton for retrieving the GFE Collection. Could be attached as an output to the task.

Add guidance that this may be contained or it may be externals.


*/
* requester only Reference($USCorePractitioner or $USCorePractitionerRole or $USCoreOrganization)
* requester ^short = "The convening provider making the request"
* requester ^comment = "Generally this will be a reference to a Practitioner, PractitionerRole, or Organization resource residing on the Coordination Platform. If there is a need to express contact information that is specific to the request, and therefore is not included in the information on the Coordination Platform, the reference should point to a server and resource that does not have additional authentication or or authorization requirements."

* performerType 0..0 
* performerType ^short = "Coordinating task does not have a specific performer types"


* owner 0..0
* owner ^short = "Coordinating task does not have a specific performer. GFE Contributing Provider Tasks have specific performers"

* reasonCode 1..1 
* reasonCode ^short = "scheduled-request | nonscheduled-request"
* reasonCode from PCTGFERequestTaskTypeVS (required)

// TODO Supporting Information contained within the bundle. Perhaps guidance on use of reference identifiers?
//* insurance MS
//* insurance only Reference(PCTCoverage)

* restriction 0..0

* input 1..* MS
* input ^short = "Information and references to service and supporting information, such as Conditions, Observations, and notes"
* input ^comment = "Contained or referenced request information bundle made available to all GFE contributing providers that includes information about the products and or services requested and other supporting information, such as Conditions, Observations, and notes"

* output MS
* output ^short = "Any outputs for the coordinating task which might include notes on why the coordinating task was unable to be completed."





Profile: PCTGFEContibutingProviderRequestTask
Parent: Task
Id: davinci-pct-gfe-provider-request-task
Title: "PCT GFE Contributing Provider Request Task"
Description: "The PCT Good Faith Estimate (GFE) Provider Request Task is used by a requesting provider to assign a GFE request task to a specific provider and may include information specific to that request."


* extension contains
   $requestedPeriodExtensionUrl named requested-period 0..1 MS and
   RequestInitiationTime named request-initiation-time 1..1 MS and
   PlannedServicePeriod named planned-service-period 0..1 MS
   
//   SchedulingTime named scheduling-time 0..1 MS and
//   ScheduledServicePeriod named scheduled-service-period 0..1 MS 

* extension[requested-period] ^short = "GFE Contributing Provider specific time period the requested GFE should be provided in"
* extension[requested-period] ^comment = "Indicates the start and/or end of the period of time when the GFE bundle should be provided. Usually this is the same as the coordinating task, and if so, should not be specified in the provider specific task. However, there may be circumstances in which a specific GFE contributing provider may have a different timeline that should be included in the provider specific task (e.g. the provider was added to original request afterwards, in the case of a provider replacement; or there is a potential dependency on the provider's response)."
* extension[requested-period].valuePeriod.start 0..0
* extension[requested-period].valuePeriod.end 1..1

* extension[request-initiation-time] ^short = "Estimate Request instant"
* extension[request-initiation-time] ^short = "Instant from which the request is being initiated. For patient initiated requests, this is the date and time the patient or their representative made the request. For a newly scheduled service, this represents the time of the scheduling activity (as opposed to the planned time of service). For all other requests, the time of the event that triggered the need for an estimate."
* extension[request-initiation-time].valueInstant 1..1

* extension[planned-service-period] ^short = "GFE contributing provider specific planned or scheduled period of service the request is about"
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
* identifier[PLAC] ^short = "Convening Provider Assigned Identifier for GFE Request"
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"

/* Removed because a coordinating task was deemed to be the approach to take, instead of individual tasks associated through an ID.
* groupIdentifier 1..1
* groupIdentifier.type = $V2-0203#PLAC "Placer Identifier"
* groupIdentifier.system MS
* groupIdentifier.value 1..1
* groupIdentifier ^short = "Convening Provider Task Identifier (DRAFT: used for grouping the sub-tasks together, may be the means to correlate tasks if the primary task goes away)"
*/


* partOf 1..1
* partOf only Reference(PCTCoordinatingGFERequestTask)
* partOf ^short = "Reference to the coordinating GFE request task"



* status from PCTContributingProviderTaskStatusCodes (required)
* statusReason MS
* statusReason from PCTContributingProviderTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTaskCS#gfe-request

// TODO Supporting Information contained within the bundle. Perhaps guidance on use of reference identifiers?
//* focus only Reference(PCTGFERequestServiceRequest)

// TODO Supporting Information contained within the bundle. Perhaps guidance on use of reference identifiers?
//* for only Reference(HRexPatientDemographics)
//* for ^short = "The patient for whom the GFE request is for"

* requester only Reference($USCorePractitioner or $USCorePractitionerRole or $USCoreOrganization)
* requester ^short = "The convening provider making the request"
* requester ^comment = "Generally this will be a reference to a Practitioner, PractitionerRole, or Organization resource residing on the Coordination Platform. If there is a need to express contact information that is specific to the request, and therefore is not included in the information on the Coordination Platform, the reference should point to a server and resource that does not have additional authentication or or authorization requirements."

* performerType MS
* performerType ^short = "Specific performer types for the"  //TODO


* owner 1..1
* owner only Reference($USCorePractitioner or $USCorePractitionerRole or $USCoreOrganization)
* owner ^short = "GFE Contributing Provider assigned to complete the GFE request"
// TODO !!! A better description as to why there is not task executor.

* reasonCode 0..0
* reasonCode ^short = "The reasonCode is inherited from the Coordinating GFE Request Task pointed to by Task.partOf"



* restriction 0..0

* input MS
* input ^short = "GFE Contributing Provider specific Information and references to service and supporting information, such as Conditions, Observations, and notes"
* input ^comment = "Contained or referenced request information bundle made available to a specific GFE contributing provider that includes information about the products and or services requested and other supporting information, such as Conditions, Observations, and notes"

* output MS
* output ^short = "Any outputs from the GFE Contributor including the GFE Bundle or notes on why the specific task was unable to be completed"
* output ^comment = "Any outputs for the coordinating task which might include notes on why the coordinating task was unable to be completed."
