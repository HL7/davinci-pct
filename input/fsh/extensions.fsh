//////////////////////////////////////////
//// Standalone Extension Definitions ////
//////////////////////////////////////////

//// For PCTGFEProfessional/PCTGFEProfessional Profile ////
/* Remove GFE Submitter
Extension: GFESubmitter
Id: gfeSubmitter
Description: "This extension is used to indicate the scheduling entity that submits the GFE to provide a collection of services to a payer for the creation of an Advanced EOB. All submitters (Practitioners and Organizations) must have an ETIN."
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* value[x] only Reference(PCTOrganization or PCTPractitioner)
* value[x] ^short = "The scheduling entity submitting the GFE"
* valueReference 1..1
*/

Extension: GFEDisclaimer
Id: gfeDisclaimer
Description: "Disclaimers the patient should be made aware of regarding the providers estimate including any additional assumptions and requirements.  Noting that that the information provided is only an estimate based on the items and services reasonably expected, at the time of scheduling (or requesting) the item or service, to be furnished and is subject to change."
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* value[x] only string
* valueString 1..1

/*
The use of this extension went away before publication, leaving it orphaned, but was not removed.
Extension: PlannedPeriodOfService
Id: plannedPeriodOfService
Description: "This extension is used to provide the planned date or dates of service."
* value[x] only date or Period

Extension: RequestInitiationDateTime
Id: requestInitiationDateTime
Description: "This extension expresses the date and time from which the request is being initiated. For scheduled services, this is the date and time of scheduling. For unscheduled services, this is the date and time the request is being made (possibly by the patient)."
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* value[x] only dateTime
*/
Extension: GFEServiceLinkingInfo
Id: gfeServiceLinkingInfo
Description: "This extension is used to provide the GFE Service Linking Information. This allows implementers to have the same identifier on multiple GFEs that are part of one period of care's services. This would be needed for some of the workflow options that businesses may decide to use."
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* ^context[+].type = #element
* ^context[=].expression = "Composition"
* extension contains
    plannedPeriodOfService 0..* MS and
    linkingIdentifier 0..1 MS and
    anticipatedSubmittingProviderCount 0..1
* extension[plannedPeriodOfService] ^short = "A timeframe during which a patient is expected to receive healthcare services and/or items as outlined in a Good Faith Estimate (GFE)."
* extension[plannedPeriodOfService] ^definition = "A timeframe (scheduled or requested) during which a patient is expected to receive healthcare services generally related to a specific treatment goal, episode of care, or clinical objective as outlined in a Good Faith Estimate (GFE). This period typically begins with the initial scheduled service and includes all reasonably expected items and services that are associated with that primary service, even if rendered by different providers or facilities."
* extension[plannedPeriodOfService].value[x] 1..1
* extension[plannedPeriodOfService].value[x] only date or Period
* extension[linkingIdentifier] ^short = "An identifier assigned to a particular service or series of services, generally by a scheduling facility, to be used by all providers and practitioners who will be submitting a GFE for a patient's care."
* extension[linkingIdentifier] ^definition = "An identifier assigned to a particular service or series of services, generally by a scheduling facility, to be used by all providers and practitioners who will be submitting a GFE for a patient's care."
* extension[linkingIdentifier].value[x] 1..1
* extension[linkingIdentifier].value[x] only string
* extension[anticipatedSubmittingProviderCount] ^short = "Total number of providers that are expected to submit GFEs."
* extension[anticipatedSubmittingProviderCount] ^definition = "The total number of providers that are expected to submit a GFE as part of a planned period of service or estimate request. This number includes all co-provider and the convening provider (if the convening provider is submitting a GFE). If this value is provided in more than one resource and there is a conflict in the number, the extension as part of the GFE Composition as part of the GFE Packet will be the definitive number."
* extension[anticipatedSubmittingProviderCount] ^comment = "The count of GFE submitting providers is useful for an intermediary or a payer that is collating multiple GFE submissions from multiple providers. This element is highly recommended if there are GFEs that will be submitted from multiple providers and is not needed if there is only a single submitting provider (e.g. only a single provider GFE or is the GFE Coordination process was done before submitting the GFE Packet)."
* extension[anticipatedSubmittingProviderCount].value[x] 1..1
* extension[anticipatedSubmittingProviderCount].value[x] only unsignedInt

Extension: ReferralNumber
Id: referralNumber
Description: "This extension is used to provide the Referral Number."
* ^context[+].type = #element
* ^context[=].expression = "Claim.referral"
* value[x] 1..1
* value[x] only string



Extension: RequestOriginationType
Id: requestOriginationType
Description: "Indicator as to whether the request for estimate originated from a scheduled or unscheduled service."
* ^context[+].type = #element
* ^context[=].expression = "Composition"
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from PCTGFERequestTypeVS (required)

Extension: ProviderEventMethodology
Id: providerEventMethodology
Description: "This extension is used for indicating the method a provider used to group services, and those providing such services, beyond what may be indicated through DRGs that the payer or patient may find helpful (e.g. grouping services by a standardized episode of care definition). This is provider generated text and should not be modified by the payer."
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* value[x] 1..1
* value[x] only string

Extension: GFEBillingProviderLineItemCtrlNum
Id: gfeBillingProviderLineItemCtrlNum
Description: "This extension is used by the provider to assign a unique identifier to this item. The intent of this element is to allow the provider to assign something other than 'line number' for their purposes (e.g. tracking and troubleshooting)."
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* value[x] 1..1
* value[x] only Identifier

Extension: GFEConsentForBalanceBilling
Id: gfeConsentForBalanceBilling
Description: "If the provider has received a written consent form indicating a patient has agreed to waive their protections and pay up to the full cost for the out-of-network item or service, this will be “true”. If the provider has not received written consent, this will be “false”. This is an attestation only. The billing provider is legally required to maintain the written notice and consent form."
* ^context[+].type = #element
* ^context[=].expression = "Claim.provider"
* value[x] 1..1
* value[x] only boolean



// Extension: ProductOrServiceBillingCode
// Description: "ProductOrService Billing Code"
// * value[x] only Coding
// * value[x] from PCTGFEBillingCodeVS (extensible)

// Extension: ProductOrServiceOtherCharge
// Description: "ProductOrService Other Charge"
// ////WORKAROUND for this error: org.apache.commons.lang3.NotImplementedException: type org.hl7.fhir.r5.model.Money not handled - should not be here
// //* value[x] only Money
// * value[x] only decimal

// Extension: CompoundDrugLinkingNumber
// Id: compoundDrugLinkingNum
// Description: "This extension is used to provide the Compound Drug Linking Number."
// * value[x] only id or integer


//// For PCTAdvancedEOB Profile ////

// Extension: ProviderContractingStatus
// Id: contracting-status
// Title: "Provider Contracting Status"
// Description: "Provider Contracting Status is an extentsion ..."
// * value[x] only Coding
// * value[x] from NetworkTypeCodes (required)

// Extension: ProviderContractingRate
// Id: contracting-rate
// Title: "Provider Contracting Rate"
// Description: "Provider Contracting Rate is an extentsion ..."
// ////WORKAROUND for this error: org.apache.commons.lang3.NotImplementedException: type org.hl7.fhir.r5.model.Money not handled - should not be here
// //* value[x] only Money
// * value[x] only decimal

Extension: OutOfNetworkProviderInfo
Id: inNetworkProviderOptionsLink
Title: "In Network Provider Options Link"
Description: "This extension provides a payer link to information enabling the patient to find providers that are in network for the requested services."
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* value[x] 1..1
* value[x] only url

Extension: GFEReference
Id: gfeReference
Title: "GFE Reference"
Description: "This extension is used to reference the GFE submitted by an entity that started the process for obtaining an Advanced EOB."
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* value[x] 1..1
* value[x] only Reference(PCTGFEBundle)

// Extension: PCTProposedDateOfService
// Id: proposed-date-of-service
// Title: "Proposed Date of Service"
// Description: "Proposed Date of Service is an extentsion ..."
// * value[x] only date or Period

//TODO: make sure date is full date

Extension: SubjectToMedicalMgmt
Id: subjectToMedicalMgmt
Title: "Subject To Medical Management"
Description: "This extension is used to provide a reason to explain how the estimate may change subject to medical management."
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.adjudication"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item.adjudication"
* value[x] 1..1
* value[x] only CodeableConcept or string
* value[x] ^short = "The estimate may change subject to medical management with this reason"
* valueCodeableConcept from MedicalManagementType (extensible)

// Extension: SubjectToMedicalMgmtDisclaimer
// Id: subject-to-medical-mgmt-disclaimer
// Title: "Subject To Medical Management Disclaimer"
// Description: "Subject To Medical Management is an extentsion ..."
// * value[x] only Coding
// //* extension[subjectToMedicalMgmt].valueCoding from PCTSubjectToMedicalMgmtDisclaimerVS (extensible)
// * value[x] ^short = "The estimate may change subject to medical management"

// Extension: Disclaimer
// Id: disclaimer
// Title: "Disclaimer"
// Description: "This extension allows the payer to declare a disclaimer concerning the estimated costs provided in the AEOB."
// * value[x] 1..1
// * value[x] only string or CodeableConcept or url or markdown
// * value[x] ^short = "A disclaimer declared by the payer concerning the estimated costs provided in the AEOB"

//* value[x] from PCTEstimateOnlyDisclaimerVS (extensible)

// Extension: ExpirationDate
// Id: expirationDate
// Title: "Expiration Date"
// Description: "This extension is used to indicate a specific date after which the issued AEOB is considered obsolete."
// * value[x] 1..1
// * value[x] only date
// * value[x] ^short = "The AEOB is considered obsolete after this date"

Extension: ProcessNoteClass
Id: processNoteClass
Title: "ProcessNote Class"
Description: "This extension is used to indicate a the class of AEOB Claim process notes"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.processNote"
* value[x] 1..1
* value[x] only CodeableConcept
* value[x] from PCTAEOBProcessNoteVS (required)
* value[x] ^short = "The class of AEOB process note"


Extension: RemainingBenefit
Id: remaining-benefit
Title: "Benefit Remaining"
Description: "The quantity of the benefit remaining to date."
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.benefitBalance.financial"
* value[x] 1..1 MS 
* value[x] only unsignedInt or Money //or boolean or integer or Range or Ratio or SampledData or time or dateTime or Period
//* value[x] ^slicing.discriminator.type = #type
//* value[x] ^slicing.discriminator.path = "$this"
//* value[x] ^slicing.ordered = false
//* value[x] ^slicing.rules = #open

//* value[x] ^definition = "The information determined as a result of making the observation, if the information has a simple value."
//* value[x] ^comment = "An observation may have; 1)  a single value here, 2)  both a value and a set of related or component values,  or 3)  only a set of related or component values. If a value is present, the datatype for this element should be determined by Observation.code.  A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](http://hl7.org/fhir/R4/observation.html#notes) below."
//* value[x] ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations."
//* value[x] ^base.path = "Observation.value[x]"
//* value[x] ^base.min = 0
//* value[x] ^base.max = "1"
* value[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* value[x] ^type[=].extension.valueBoolean = true
* value[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* value[x] ^type[=].extension.valueBoolean = true

/** value[x].valueCodeableConcept only CodeableConcept

* value[x].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* value[x].valueCodeableConcept ^base.path = "Observation.value[x]"
* value[x].valueCodeableConcept ^base.min = 0
* value[x].valueCodeableConcept ^base.max = "1"
* value[x].valueCodeableConcept ^mustSupport = true
* value[x].valueCodeableConcept ^isModifier = false
* value[x].valueCodeableConcept ^binding.description = "SNOMED CT for coded results"
*/
//* value[x] 1..1
//* value[x] only unsignedInt or Money
//* valueUnsignedInt and valueMoney MS
//* valueMoney MS


/*
* value[x] ^slicing.discriminator.type = #type
* value[x] ^slicing.discriminator.path = "$this.resolve()"
* value[x] ^slicing.rules = #open
* value[x] contains 
    valueMoney named valueMoney 0..* MS and
    valueUnsignedInt named valueUnsignedInt 0..* MS
//* value[x] contains money MS
//* author[valueMoney] MS
//* author[valueUnsignedInt] MS
*/

//* value[x] ^slicing.discriminator.type = #type
//* value[x] ^slicing.discriminator.path = "$this"
//* value[x] ^slicing.ordered = false
//* value[x] ^slicing.rules = #open
//* valueMoney ^mustSupport = true
//* valueUnsignedInt ^mustSupport = true


/*
* value[x] ^slicing.discriminator.type = #type
* value[x] ^slicing.discriminator.path = "$this"
* value[x] ^slicing.ordered = false
* value[x] ^slicing.rules = #open
//* value[x] ^short = "Actual result"
//* value[x] ^definition = "The information determined as a result of making the observation, if the information has a simple value."
//* value[x] ^comment = "An observation may have; 1)  a single value here, 2)  both a value and a set of related or component values,  or 3)  only a set of related or component values. If a value is present, the datatype for this element should be determined by Observation.code.  A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](http://hl7.org/fhir/R4/observation.html#notes) below."
//* value[x] ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations."
//* value[x] ^base.path = "Observation.value[x]"
//* value[x] ^base.min = 0
//* value[x] ^base.max = "1"
/*
* value[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* value[x] ^type[=].extension.valueBoolean = true
* value[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* value[x] ^type[=].extension.valueBoolean = true
*/
* value[x] ^short = "Benefit Remaining"
* ^context.type = #element
* ^context.expression = "ExplanationOfBenefit.benefitBalance.financial"


/// For PCTOrganization Profile ////

Extension: ProviderTaxonomy
Id: providerTaxonomy
Description: "This extension is used to indicate the taxonomy code of the provider."
* ^context[+].type = #element
* ^context[=].expression = "Claim.provider"
* value[x] 1..1
* value[x] only CodeableConcept
* value[x] from $USCPROCROLE (extensible)

Extension: CountrySubdivisionCode
Id: countrySubdivisionCode
Description: "This extension is used to provide the Country Subdivision Code - from Part 2 of ISO 3166."
* ^context[+].type = #element
* ^context[=].expression = "Address"
* value[x] 1..1
* value[x] only Coding
* value[x] from $ISO3166-P2-CSC-VS (extensible)


//// For PCTPractitioner Profile ////

Extension: PCTEndpoint
Id: endpoint
Description: "This extension is used to provide an endpoint."
* ^context[+].type = #element
* ^context[=].expression = "Practitioner"
* value[x] 1..1
* value[x] only Reference(Endpoint)

Extension: ServiceDescription
Id: serviceDescription
Title: "Service Description"
Description: "This extension is used to communicate a plain language description of the procedure, product, or service."
* ^context[+].type = #element
* ^context[=].expression = "Claim.procedure"
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"
* value[x] 1..1
* value[x] only string
* value[x] ^short = "The description of a procedure, product, or service"


Extension: PlannedServicePeriod
Id: plannedServicePeriod
Title: "Planned Service Period"
Description: "Planned period of service the request is about"
* ^context[+].type = #element
* ^context[=].expression = "Task"
* value[x] 1..1
* value[x] only Period
* valuePeriod.start 1..1
* valuePeriod.end MS
* value[x] ^short = "Planned period of service the request is about"


Extension: RequestInitiationTime
Id: requestInitiationTime
Title: "Request Initiation Time"
Description: "Instant from which the request is being initiated."
* ^context[+].type = #element
* ^context[=].expression = "Task"
* ^context[+].type = #element
* ^context[=].expression = "DocumentReference"
* value[x] 1..1
* value[x] only instant
* value[x] ^short = "Estimate Request instant"
* value[x] ^comment = "Instant from which the event that triggered the need for an estimate took place. For the GFE request made to a provider or set of providers to fulfill, this is the date and time the patient or their representative made the request or the time of the service scheduling activity (as opposed to the planned time of service). For an AEOB request made to a payer to fulfill, this is the time in which the GFE submission was made to the payer."


Extension: SelfPayDeclared
Id: selfPayDeclared
Title: "Self-Pay Declared"
Description: "Requester has explicitly declared self-pay."
* ^context[+].type = #element
* ^context[=].expression = "Coverage"
* value[x] 1..1
* value[x] only boolean
* value[x] ^short = "Indication if requester has declared self-pay coverage"
* value[x] ^comment = "Used to express that the request has declared that items are services rendered are to be self-pay and not covered by or submitted directly to an insurance plan."


Extension: EstimateProcedureOrService
Id: estimateProcedureOrService
Title: "Significant Procedures and/or products involved"
Description: "Significant Procedures and/or products involved in an estimate."
* ^context[+].type = #element
* ^context[=].expression = "Task"
* ^context[+].type = #element
* ^context[=].expression = "DocumentReference"
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from USClaimMedicalProductOrServiceCodes (required)
* value[x] ^short = "Significant Procedures and/or products involved"
* value[x] ^comment = "Significant Procedures and/or products involved in an estimate."


Extension: EstimateCondition
Id: estimateCondition
Title: "Significant condition involved"
Description: "Significant condition involved in an estimate."
* ^context[+].type = #element
* ^context[=].expression = "Task"
* ^context[+].type = #element
* ^context[=].expression = "DocumentReference"
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from PCTDiagnosticCodes (required)
* value[x] ^short = "Significant condition or condition involved"
* value[x] ^comment = "Significant condition involved in an estimate."



Extension: GFERelatedTask
Id: gfeRelatedTask
Description: "A relationship that the source Task has with the referenced GFE Task has with the source GFE Task. This may be used for cases when a new GFE is needed or a Task needs to be replaced for some reason and the requester and owner, where present, are the same between the referenced and source Task respectively."
* ^context[+].type = #element
* ^context[=].expression = "Task"
* extension 1..*
* extension contains
    relationship 1..1 and
    related 1..1 and
    description 0..1

* extension[relationship] ^short = "A code indicating the nature of the Task relationship."
* extension[relationship].value[x] 1..1
* extension[relationship].value[x] only CodeableConcept
* extension[relationship].valueCodeableConcept from PCTGFETaskRelationship (extensible)


* extension[related] ^short = "A code indicating the nature of the Task relationship."
* extension[related].value[x] 1..1
* extension[related].value[x] only Reference
* extension[related].valueReference only Reference(PCTGFECoordinationTask or PCTGFEContributorTask)

* extension[description] ^short = "A description of relevant changes or matters of import."
* extension[description].value[x] 1..1
* extension[description].value[x] only markdown