
//////////////////////////////////////////
//// Standalone Extension Definitions ////
//////////////////////////////////////////

//// For PCTGFEProfessional/PCTGFEProfessional Profile ////

Extension: GFESubmitter
Id: gfeSubmitter
Description: "This extension is used to indicate the scheduling entity that submits the GFE to provide a collection of services to a payer for the creation of an Advanced EOB."
* value[x] only Reference(PCTOrganization or PCTPractitioner)
* value[x] ^short = "The scheduling entity submitting the GFE"
* valueReference 1..1

Extension: GFEProviderAssignedIdentifier
Id: gfeProviderAssignedIdentifier
Description: "This extension is used to indicate the GFE Provider Assigned Identifier."
* value[x] only Identifier

// Extension: PlannedPeriodOfService
// Id: plannedPeriodOfService
// Description: "This extension is used to provide the planned date or dates of service."
// * value[x] only date or Period

Extension: GFEServiceLinkingInfo
Id: gfeServiceLinkingInfo
Description: "This extension is used to provide the GFE Service Linking Information."
* extension contains
    plannedPeriodOfService 0..* MS and
    linkingIdentifier 0..* MS
* extension[plannedPeriodOfService] ^short = "This could be the scheduled date(s) of a particular admission/service or a series of admissions/services."
* extension[plannedPeriodOfService] ^definition = "This could be the scheduled date(s) of a particular admission/service or a series of admissions/services."
* extension[plannedPeriodOfService].value[x] only date or Period
* extension[linkingIdentifier] ^short = "An identifier assigned to a particular service or series of services, generally by a scheduling facility, to be used by all providers and practictioners who will be submitting a GFE for a patient's care."
* extension[linkingIdentifier] ^definition = "An identifier assigned to a particular service or series of services, generally by a scheduling facility, to be used by all providers and practictioners who will be submitting a GFE for a patient's care."
* extension[linkingIdentifier].value[x] only string

Extension: ReferralNumber
Id: referralNumber
Description: "This extension is used to provide the Referral Number."
* value[x] only string

Extension: ProviderEventMethodology
Id: providerEventMethodology
Description: "This extension is used for indicating the method a provider used to group services, and those providing such services, beyond what may be indicated through DRGs that the payer or patient may find helpful (e.g. grouping services by a standardized episode of care definition)."
* value[x] only string

Extension: EstimatedDateOfService
Id: estimatedDateOfService
Description: "This extension is used to provide the estimated date or dates of service or product delivery"
* value[x] only date or Period

Extension: InterTransIdentifier
Id: interTransIdentifier
Description: "This extension is used to provide the GFE Service Identifier for Transmission Intermediaries."
* value[x] only Identifier

Extension: GFEBillingProviderLineItemCtrlNum
Id: gfeBillingProviderLineItemCtrlNum
Description: "This extension is used by the provider to assign a unique identifier to this item. The intent of this element is to allow the provider to assign something other than 'line number' for their purposes (e.g. tracking and troubleshooting)."
* value[x] only Identifier

// Extension: ProductOrServiceBillingCode
// Description: "ProductOrService Billing Code"
// * value[x] only Coding
// * value[x] from PCTGFEBillingCodeVS (extensible)

// Extension: ProductOrServiceOtherCharge
// Description: "ProductOrService Other Charge"
// ////WORKAROUND for this error: org.apache.commons.lang3.NotImplementedException: type org.hl7.fhir.r5.model.Money not handled - should not be here
// //* value[x] only Money
// * value[x] only decimal

Extension: CompoundDrugLinkingNumber
Id: compoundDrugLinkingNum
Description: "This extension is used to provide the Compound Drug Linking Number."
* value[x] only id or integer


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
* value[x] only url

Extension: GFEReference
Id: gfeReference
Title: "GFE Reference"
Description: "This extension is used to reference the GFE submitted by an entity that started the process for obtaining an Advanced EOB."
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
* value[x] only Coding
* value[x] from PCTSubjectToMedicalMgmtReasonVS (extensible)
* value[x] ^short = "The estimate may change subject to medical management with this reason"

// Extension: SubjectToMedicalMgmtDisclaimer
// Id: subject-to-medical-mgmt-disclaimer
// Title: "Subject To Medical Management Disclaimer"
// Description: "Subject To Medical Management is an extentsion ..."
// * value[x] only Coding
// //* extension[subjectToMedicalMgmt].valueCoding from PCTSubjectToMedicalMgmtDisclaimerVS (extensible)
// * value[x] ^short = "The estimate may change subject to medical management"

Extension: Disclaimer
Id: disclaimer
Title: "Disclaimer"
Description: "This extension allows the payer to declare a disclaimer concerning the estimated costs provided in the AEOB."
* value[x] ^short = "A disclaimer declared by the payer concerning the estimated costs provided in the AEOB"
* value[x] only string or CodeableConcept or url or markdown
//* value[x] from PCTEstimateOnlyDisclaimerVS (extensible)

Extension: ExpirationDate
Id: expirationDate
Title: "Expiration Date"
Description: "This extension is used to indicate a specific date after which the issued AEOB is considered obsolete."
* value[x] ^short = "The AEOB is considered obsolete after this date"
* value[x] only date


/// For PCTOrganization Profile ////

Extension: ProviderTaxonomy
Id: providerTaxonomy
Description: "This extension is used to indicate the taxonomy code of the provider."
* value[x] only CodeableConcept
* value[x] from $USCPROCROLE (extensible)

Extension: CountrySubdivisionCode
Id: countrySubdivisionCode
Description: "This extension is used to provide the Country Subdivision Code - from Part 2 of ISO 3166."
* value[x] only Coding
* value[x] from $ISO3166-P2-CSC-VS (example)


//// For PCTPractitioner Profile ////

Extension: PCTEndpoint
Id: endpoint
Description: "This extension is used to provide an endpoint."
* value[x] only Reference(Endpoint)

Extension: ServiceDescription
Id: serviceDescription
Title: "Service Description"
Description: "This extension is used to communicate a plain language description of the procedure, product, or service."
* value[x] ^short = "The description of a procedure, product, or service"
* value[x] only string