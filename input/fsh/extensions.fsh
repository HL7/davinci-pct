
//////////////////////////////////////////
//// Standalone Extension Definitions ////
//////////////////////////////////////////

//// For PCTGoodFaithEstimate Profile ////

Extension: GFESubmitter
Description: "Submitter of the GFE request ..."
* value[x] only Reference(PCTOrganization)

// Extension: SubscriberEmployeeIdentifier
// Description: "Insurance Coverage Subscriber Employee Identifier"
// * value[x] only Identifier

// Extension: EmployeeID
// Description: "Insurance Coverage Subscriber Employee Identifier"
// * value[x] only Identifier

Extension: InterTransIdentifier
Description: "GFE Service Identifier for Transmission Intermediaries"
* value[x] only Identifier

Extension: GFECoordinatingProviderLineItemControlNumber
Description: "GFE Coordinating Provider Line Item Control Number"
* value[x] only Identifier

Extension: CompoundDrugLinkingNumber
Description: "Compound Drug Linking Number"
* value[x] only string


//// For PCTAdvancedEOB Profile ////

Extension: ProviderContractingStatus
Id: provider-contracting-status
Title: "Provider Contracting Status"
Description: "Provider Contracting Status is an extentsion ..."
* value[x] only Coding
* value[x] from NetworkTypeCodes (required)

Extension: ProviderContractingRate
Id: provider-contracting-rate
Title: "Provider Contracting Rate"
Description: "Provider Contracting Rate is an extentsion ..."
* value[x] only Money

Extension: OutOfNetworkProviderInfo
Id: out-of-network-provider-info
Title: "Out Of Network Provider Info"
Description: "Out Of Network Provider Info is an extentsion ..."
* value[x] only url

Extension: GFEReference
Id: gfe-reference
Title: "GFE Reference"
Description: "GFE Reference is an extentsion ..."
* value[x] only Reference(PCTGoodFaithEstimate)

Extension: PCTProposedDateOfService
Id: proposed-date-of-service
Title: "Proposed Date of Service"
Description: "Proposed Date of Service is an extentsion ..."
* value[x] only date

Extension: SubjectToMedicalMgmtCondition
Id: subject-to-medical-mgmt-condition
Title: "Subject To Medical Management Condition"
Description: "Subject To Medical Management Condition is an extentsion ..."
* value[x] only Coding
* value[x] from PCTSubjectToMedicalMgmtConditionVS (extensible)
* value[x] ^short = "The estimate may change subject to medical management with this type of condition"

Extension: SubjectToMedicalMgmtDisclaimer
Id: subject-to-medical-mgmt-disclaimer
Title: "Subject To Medical Management Disclaimer"
Description: "Subject To Medical Management is an extentsion ..."
* value[x] only Coding
//* extension[subjectToMedicalMgmt].valueCoding from PCTSubjectToMedicalMgmtDisclaimerVS (extensible)
* value[x] ^short = "The estimate may change subject to medical management"

Extension: EstimateOnlyDisclaimer
Id: estimate-only-disclaimer
Title: "Estimate Only Disclaimer"
Description: "Estimate Only Disclaimer is an extentsion ..."
* value[x] ^short = "Estimate Only Disclaimer"
* value[x] only string
//* value[x] from PCTEstimateOnlyDisclaimerVS (extensible)

Extension: ExpirationDate
Id: expiration-date
Title: "Expiration Date"
Description: "Expiration Date is an extentsion ..."
* value[x] ^short = "The AEOB is considered obsolete after this date"
* value[x] only date
