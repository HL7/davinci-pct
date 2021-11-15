Profile: PCTAdvancedEOB
Parent: ExplanationOfBenefit
Id: davinci-pct-aeob
Title: "PCT Advanced EOB"
Description: "The No Surprises Act requires that group health plans and insurers provide advance cost estimates, called advanced explanations of benefits (advanced EOBs), for scheduled services. This profile is used for exchanging the Advanced EOB data."

* extension contains GFEReference named gfeReference 1..* MS
* extension[gfeReference] ^short = "The GFE submitted by an entity that started the process for obtaining an Advanced EOB."
// * extension contains ProviderContractingStatus named providerContractingStatus 1..1 MS
// * extension contains ProviderContractingRate named providerContractingRate 0..1 MS
//* extension contains OutOfNetworkProviderInfo named outOfNetworkProviderInfo 0..1 MS

* patient MS
* patient only Reference(PCTPatient)

* insurer MS
* insurer only Reference(PCTOrganization)

// need provider's TAX ID
* provider only Reference(PCTOrganization)
// * provider.extension contains ProviderContractingStatus named contractingStatus 1..1 MS
// * provider.extension contains ProviderContractingRate named contractingRate 0..1 MS
* provider.extension contains OutOfNetworkProviderInfo named outOfNetworkProviderInfo 0..1 MS

* priority MS
* priority from $PROCPRIORITYVS (required)

* insurance.coverage only Reference(PCTCoverage)

* item 1..* MS
* item.extension contains EstimatedDateOfService named estimatedDateOfService 1..1 MS
* item.revenue MS
* item.revenue from PCTGFEItemRevenueVS (required)
* item.modifier 0..4 MS
* item.modifier from PCTGFEItemCptHcpcsVS (required)
* item.productOrService from PCTGFEItemCptHcpcsVS (required)
// Need to make item.productOrService required when item.revenue is provided ??
//* item.productOrService obeys EOB-out-inst-item-productorservice
//* item.productOrService ^comment = "Put the comment here for item.productOrService here"
* item.net 1..1 MS
* item.quantity MS
* item.adjudication 1..* MS
* item.adjudication.category from PCTGFEItemAdjudicationVS (required)
// * insert EOBHeaderItemAdjudicationInvariant
// * insert ItemAdjudicationInvariant
// * insert ItemAdjudicationSlicing
// * item.adjudication contains
//    adjudicationamounttype 0..* MS and   /* restricted to 1..* by invariant */
//    denialreason 0..* MS and
//    allowedunits 0..1 MS
// * item.adjudication[allowedunits].category = C4BBAdjudicationDiscriminator#allowedunits
// * item.adjudication[allowedunits].value only decimal
// // FHIR-30807 - Change cardinality in EOB Inpatient and Outpatient Institutional Profiles
// * item.adjudication[allowedunits].value 1..1 MS
// * item.adjudication[denialreason].category = C4BBAdjudicationDiscriminator#denialreason
// * item.adjudication[denialreason].reason from X12ClaimAdjustmentReasonCodesCMSRemittanceAdviceRemarkCodes
// * item.adjudication[denialreason].reason 1..1 MS
// * item.adjudication[adjudicationamounttype].category from C4BBAdjudication
// * item.adjudication[adjudicationamounttype].amount MS
// * item.adjudication[adjudicationamounttype].amount 1..1

* item.adjudication.extension contains SubjectToMedicalMgmt named subjectToMedicalMgmt 0..* MS


* extension contains Disclaimer named disclaimer 1..* MS
* extension[disclaimer] ^short = "One or more disclaimers made by the payer concerning the estimated costs provided in the AEOB"
// * extension contains SubjectToMedicalMgmtDisclaimer named subjectToMedicalMgmtDisclaimer 0..1 MS
// * extension contains EstimateOnlyDisclaimer named estimateOnlyDisclaimer 0..1 MS

* extension contains ExpirationDate named expirationDate 1..1 MS
* extension[expirationDate] ^short = "Once the AEOB is complete and formally issued it is good until this date."

* total 1..* MS
// * insert TotalSlicing
// * total.category from C4BBTotalCategoryDiscriminator (extensible)
// * total contains
//    adjudicationamounttype 1..* MS and
//    benefitpaymentstatus 1..1 MS
// * total[benefitpaymentstatus].category from C4BBPayerBenefitPaymentStatus (required)
// * total[adjudicationamounttype].category from C4BBAdjudication  (required)
// * total[adjudicationamounttype].amount MS
// //* total[adjudicationamounttype].amount 1..1
