Profile: PCTGFECoordinationTask
Parent: Task
Id: davinci-pct-gfe-coordination-task
Title: "PCT GFE Coordination Task"
Description: "The Good Faith Estimate (GFE) Coordination Task is used to organize a GFE across providers  for a single period of care for which all GFE Contributor Task resources will be linked. The task includes the general inputs that are shared across all of the GFE contributor tasks. These inputs may include a ‘primary’ service and relevant conditions."
* insert DraftArtifact
/*
Consider other extensions 
https://hl7.org/fhir/extensions/5.1.0-ballot/StructureDefinition-request-replaces.html
https://hl7.org/fhir/extensions/StructureDefinition-request-replaces.html
or
https://hl7.org/fhir/extensions/5.1.0-ballot/StructureDefinition-task-replaces.html
https://hl7.org/fhir/extensions/StructureDefinition-task-replaces.html


*/
* obeys pct-coord-task-1

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
* extension[task-replaces] ^comment = "If a previous request was completed or cancelled that largely represents this current task it may be useful for GFE contributors to be able to refer to the previous request. This may happen when something about a GFE collection request changes so much that it requires re-issuing the request by cancelling the first one and creating a new one. GFE contributors may want to refer back to the previous request in order to help them populate a response to the new one."


* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.description = "Slice based on $this value"
* identifier contains
   PLAC 0..1 and
   INTER 0..*
* identifier[PLAC].type = $V2-0203#PLAC "Placer Identifier"
* identifier[PLAC].system MS
* identifier[PLAC].value 1..1
* identifier[PLAC] ^short = "GFE Coordination Requester Assigned Identifier for GFE Request"
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"


* partOf 0..0
* partOf ^short = "The GFE Coordination Task is not part of a greater request"

* status from PCTCoordinationTaskStatusCodes (required)
* statusReason MS 
* statusReason from PCTCoordinationTaskStatusReasonCodes (extensible)
* statusReason.text 1..1 MS

* businessStatus MS
* businessStatus from PCTTaskBusinessStatusCodes (extensible)

* intent = http://hl7.org/fhir/task-intent#order
* intent ^short = "Order for a Good Faith Estimate (not for services to be rendered)"

* code = PCTGFERequestTaskCSTemporaryTrialUse#gfe-coordination-task

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

How about the output GFE Packet? 
Need an operationDefiniton for retrieving the GFE Collection. Could be attached as an output to the task.

Add guidance that this may be contained or it may be externals.


*/
* requester only Reference(PCTPractitioner or HRexPractitionerRole or PCTOrganization)
* requester ^short = "GFE Coordination Requester making the request"
* requester ^comment = "Generally this will be a reference to a Practitioner or Organization resource residing on the Coordination Platform. If there is a need to express contact information that is specific to the request, and therefore is not included in the information on the Coordination Platform, the reference should point to a server and resource that does not have additional authentication or or authorization requirements."

* performerType 0..0 
* performerType ^short = "Coordination Task does not have a specific performer types"


* owner 0..0
* owner ^short = "Coordination Task does not have a specific performer. GFE Contributor Tasks have specific performers"

* reasonCode 1..1 
* reasonCode ^short = "scheduled-request | nonscheduled-request"
* reasonCode from PCTGFERequestTaskTypeVS (required)

// TODO Supporting Information contained within the bundle. Perhaps guidance on use of reference identifiers?
//* insurance MS
//* insurance only Reference(PCTCoverage)

* restriction 0..0

* input 1..* MS
* input ^short = "Information and references to service and supporting information, such as Conditions, Observations, and notes"
* input ^comment = "Contained or referenced request information bundle made available to all GFE contributors that includes information about the products and or services requested and other supporting information, such as Conditions, Observations, and notes"

* output MS
* output ^short = "Any outputs for the GFE Coordination Task which might include notes on why the GFE Coordination Task was unable to be completed."




Invariant: pct-coord-task-1
Description: "statusReason required when status is `completed`, `cancelled`, or `failed`"
Expression: "(status = 'completed' or status = 'cancelled' or status = 'failed') implies statusReason.exists()"
Severity: #error
