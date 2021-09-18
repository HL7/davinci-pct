Profile: PCTAdvancedEOB
Parent: ExplanationOfBenefit
Id: davinci-pct-aeob
Title: "PCT Advanced EOB"
Description: "PCT Advanced EOB is a profile ..."

* provider only Reference(PCTOrganization)

* extension contains ProviderContractingStatus named providerContractingStatus 1..1 MS
* extension contains ProviderContractingRate named providerContractingRate 0..1 MS
* extension contains OutOfNetworkProviderInfo named outOfNetworkProviderInfo 0..1 MS

* extension contains GFEReference named gfeReference 1..* MS

* item 1..* MS
* item.extension contains PCTProposedDateOfService named proposedDateOfService 1..1 MS

* extension contains SubjectToMedicalMgmtCondition named subjectToMedicalMgmtCondition 0..1 MS
* extension contains EstimateOnlyDisclaimer named estimateOnlyDisclaimer 0..1 MS
* extension contains ExpirationDate named expirationDate 1..1 MS

* benefitBalance 1..* MS


//// Standalone Extension Definitions ////
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
Description: "PCT Disclaimer is an extentsion ..."
* value[x] ^short = "The estimate may change subject to medical management"
* value[x] only Coding
//* extension[subjectToMedicalMgmt].valueCoding from PCTSubjectToMedicalMgmtDisclaimerVS (extensible)

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
