
//////////////////////////////////////////
//// Standalone Extension Definitions ////
//////////////////////////////////////////

//// For PCTGoodFaithEstimate Profile ////

Extension: GFESubmitter
Id: gfeSubmitter
Description: "Submitter of the GFE request ..."
* value[x] only Reference(PCTOrganization or PCTPractitioner)
* value[x] ^short = "The organization submitting the GFE"

Extension: GFEAssignedServiceIdentifier
Id: gfeAssignedServiceIdentifier
Description: "This is the Provider's Assigned GFE Service Identifier"
* value[x] only Identifier

Extension: GFEServiceLinkingInfo
Id: gfeServiceLinkingInfo
Description: "GFE Service Linking Information"
* extension contains
    plannedPeriodOfService 0..* MS and
    linkingIdentifier 0..* MS
* extension[plannedPeriodOfService] ^short = "This could be the scheduled date(s) of a particular admission/service or a series of admissions/services."
* extension[plannedPeriodOfService].value[x] only date or Period
* extension[linkingIdentifier] ^short = "An identifier assigned to a particular service or series of services, generally by a scheduling facility, to be used by all providers and practictioners who will be submitting a GFE for a patient's care."
* extension[linkingIdentifier].value[x] only string

Extension: ReferralNumber
Id: referralNumber
Description: "Referral Number"
* value[x] only string

Extension: ProviderEventMethodology
Id: providerEventMethodology
Description: "This is how the provider determined the number of providers involved, internal experience/analysis - an external methodology"
* value[x] only string

Extension: EstimatedDateOfService
Id: estimatedDateOfService
Description: "Estimated Date or dates of service or product delivery"
* value[x] only date or Period

Extension: InterTransIdentifier
Id: interTransIdentifier
Description: "GFE Service Identifier for Transmission Intermediaries"
* value[x] only Identifier

Extension: GFECoordinatingProviderLineItemCtrlNum
Id: gfeCoordinatingProviderLineItemCtrlNum
Description: "GFE Coordinating Provider Line Item Control Number"
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
Description: "Compound Drug Linking Number"
* value[x] only string


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
Id: outOfNetworkProviderInfo
Title: "Out Of Network Provider Info"
Description: "Out Of Network Provider Info is an extentsion ..."
* value[x] only url

Extension: GFEReference
Id: gfeReference
Title: "GFE Reference"
Description: "GFE Reference is an extentsion ..."
* value[x] only Reference(PCTGoodFaithEstimate)

// Extension: PCTProposedDateOfService
// Id: proposed-date-of-service
// Title: "Proposed Date of Service"
// Description: "Proposed Date of Service is an extentsion ..."
// * value[x] only date or Period

//TODO: make sure date is full date

Extension: SubjectToMedicalMgmt
Id: subjectToMedicalMgmt
Title: "Subject To Medical Management"
Description: "Subject To Medical Management is an extentsion ..."
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
Description: "Disclaimer is an extentsion ..."
* value[x] ^short = "Estimate-Only or other type of disclaimer"
* value[x] only string or CodeableConcept or url
//* value[x] from PCTEstimateOnlyDisclaimerVS (extensible)

Extension: ExpirationDate
Id: expirationDate
Title: "Expiration Date"
Description: "Expiration Date is an extentsion ..."
* value[x] ^short = "The AEOB is considered obsolete after this date"
* value[x] only date


/// For PCTOrganization Profile ////
Extension: CountrySubdivisionCode
Id: countrySubdivisionCode
Description: "Country Subdivision Code - from Part 2 of ISO 3166"
* value[x] only string
* value[x] from $ISO3166-P2-CSC-VS (required)