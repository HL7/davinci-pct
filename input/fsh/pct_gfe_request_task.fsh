Profile: PCTGFEPrimaryRequestTask
Parent: Task
Id: davinci-pct-gfe-primary-request-task
Title: "PCT GFE Primary Request Task"
Description: "The PCT Good Faith Estimate (GFE) Primary Request Task is used by a convening provider to define a primary service Good Faith Estimate (GFE) request that will include composite co-provider tasks for each participating co-provider to complete."

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

// TODO !!! Do we want a Coordinating platform identifier?

// TODO !!! Need some sort of original request reference. Perhaps an extension? (Look at DocumentReference approach to superseding)

* partOf 0..0
* partOf ^short = "The Primary request is not part of a greater request"


// TODO !!! Status should be either draft, requested, cancelled, on-hold, failed, completed, or entered-in-error.  Need to verify
* status from PCTPrimaryTaskStatusCodes (required)
* intent = http://hl7.org/fhir/task-intent#order

// TODO !!! need a code for an estimate request

* focus only Reference(PCTGFERequestServiceRequest)

* for only Reference(HRexPatientDemographics)
* for ^short = "The patient for whom the GFE request is for"

* requester only Reference(PCTPractitioner or PCTOrganization)
* requester ^short = "The convening provider making the request"

* performerType 0..0 
* performerType ^short = "Primary task does not have a specific performer types"
// TODO !!! do we want to limit or provide the ability to specify all roles?

* owner 0..0
* owner ^short = "Primary task does not have a specific performer"
// TODO !!! A better description as to why there is not task executor.

// TODO reasonCode could be requested or scheduled event. could need to define codes

* insurance MS
* insurance only Reference(PCTCoverage)

* restriction 0..0

* input MS
* input ^short = "Information and references to any supporting information, such as Conditions, Observations, and notes"

* output MS
* output ^short = "Any outputs for the primary task which might include notes on why the primary task was unable to be completed"





Profile: PCTGFEProviderRequestTask
Parent: Task
Id: davinci-pct-gfe-provider-request-task
Title: "PCT GFE Primary Request Task"
Description: "The PCT Good Faith Estimate (GFE) Provider Request Task is used by a convening provider to assign a GFE request task to a specific provider and may include information specific to that request."

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

// TODO !!! Do we want a Coordinating platform identifier?

// TODO !!! Need some sort of original request reference. Perhaps an extension? (Look at DocumentReference approach to superseding)

* partOf 0..1
* partOf ^short = "Reference to the initial primary non provider-specific GFE request task"


// TODO !!! Status should be either draft, requested, cancelled, on-hold, failed, completed, or entered-in-error.  Need to verify
* status from PCTProviderTaskStatusCodes (required)
* intent = http://hl7.org/fhir/task-intent#order

// TODO !!! need a code for an estimate request

* focus only Reference(PCTGFERequestServiceRequest)

* for only Reference(HRexPatientDemographics)
* for ^short = "The patient for whom the GFE request is for"

* requester only Reference(PCTPractitioner or PCTOrganization)
* requester ^short = "The convening provider making the request"

* performerType MS
* performerType ^short = "Specific performer types for the"


* owner 1..1
* owner ^short = "Co-provider assigned to complete the GFE request"
// TODO !!! A better description as to why there is not task executor.

// TODO reasonCode could be requested or scheduled event. could need to define codes

* insurance MS
* insurance only Reference(PCTCoverage)

* restriction 0..0

* input MS
* input ^short = "Information and references to any supporting information, such as Conditions, Observations, and notes"

* output MS
* output ^short = "Any outputs for the co-provider task which might include a GFE bundle or notes on why the specific task was unable to be completed"