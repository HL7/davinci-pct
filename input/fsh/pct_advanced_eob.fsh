Profile: PCTAdvancedEOB
Parent: ExplanationOfBenefit
Id: davinci-pct-aeob
Title: "PCT Advanced EOB"
Description: "The No Surprises Act requires that group health plans and insurers provide advance cost estimates, called advanced explanations of benefits (advanced EOBs), for scheduled services. This profile is used for exchanging the Advanced EOB data."
* insert TrialUseArtifact
* obeys pct-aeob-1 and pct-aeob-2 and pct-aeob-3

* extension contains GFEReference named gfeReference 1..*
* extension[gfeReference] ^short = "The GFE Bundle submitted by an entity that started the process for obtaining an Advanced EOB."
* extension contains ServiceDescription named serviceDescription 0..1 MS
* extension[serviceDescription] ^condition = "pct-aeob-1"
* extension contains OutOfNetworkProviderInfo named outOfNetworkProviderInfo 0..1 MS

* insert IdentifierSlicing
* identifier contains 
	INTER 0..* and 
	uniqueclaimid 1..1 
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"
* identifier[uniqueclaimid] ^short = "Unique Claim Identifier"
* identifier[uniqueclaimid].type = PCTIdentifierType#uc "Unique Claim ID"
* identifier[uniqueclaimid] ^short = "Unique Claim ID"

* type from PCTAEOBTypeVS (required)
* use = $CLAIMUSECS#predetermination "predetermination"


* patient only Reference(HRexPatientDemographics)

* insurer only Reference(PCTOrganization)

// need provider's TAX ID
* provider only Reference(PCTPractitioner or PCTOrganization)
// * provider.extension contains ProviderContractingStatus named contractingStatus 1..1 MS
// * provider.extension contains ProviderContractingRate named contractingRate 0..1 MS
//* provider.extension contains OutOfNetworkProviderInfo named outOfNetworkProviderInfo 0..1 MS

* priority MS
* priority from $PROCPRIORITYVS (required)


* claim 1..1
* claim.identifier 1..1
* claim.identifier ^short = "GFE identifier of the originally submitted claim"
* claim.identifier ^definition = "Matches the provider submitted GFE claim.identifier this Advance ExplanationOfBenefit is addressing where identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203|PLAC (with the identifier.value and identifier.system matching the original GFE identifier values)."
* claim.identifier.system MS
* claim.identifier.value 1..1


* insurance.coverage only Reference(PCTCoverage)

* benefitPeriod 1..1

* created ^short = "The date and time this estimate was calculated."
* created ^comment = "The date and time this estimate was calculated based on what was known at that point in time."

* item 1..*
* item.extension contains ServiceDescription named serviceDescription 0..1 MS
//* item.extension[serviceDescription] obeys pct-aeob-1
* item.extension[serviceDescription] ^condition = "pct-aeob-1"
//* item.revenue MS
* item.revenue from PCTGFEItemRevenueVS (required)
* item.modifier 0..4 MS
* item.modifier from PCTGFEItemCptHcpcsVS (required)
* item.productOrService from USClaimMedicalProductOrServiceCodes (required)
// Need to make item.productOrService required when item.revenue is provided ??
//* item.productOrService obeys EOB-out-inst-item-productorservice
//* item.productOrService ^comment = "Put the comment here for item.productOrService here"

* item.serviced[x] 1..1
* item.serviced[x] ^short = "This is the planned or estimated date(s)s of service"
* item.serviced[x] ^definition = "This is the planned or estimated dates of service. Use Revenue code to determine inpatient stays if needed for adjudication"

* item.quantity MS

//* item.net 1..1 MS
//* item.adjudication 1..* MS
//* item.adjudication.category from PCTGFEItemAdjudicationVS (required)
//* item.adjudication.extension contains SubjectToMedicalMgmt named subjectToMedicalMgmt 0..* MS

* insert ItemAdjudicationSlicing
* item.adjudication contains 
	medicalmanagement 0..* MS and
    benefitpaymentstatus 0..1 MS and
    adjustmentreason 0..* MS and
	submitted 0..1 MS and
	memberliability 0..1 MS and
	eligible 0..1 MS and
	benefit 0..1 MS
	
* item.adjudication.category from PCTAdjudicationCategoryVS (extensible)
* item.adjudication[medicalmanagement].extension contains SubjectToMedicalMgmt named subjectToMedicalMgmt 1..1
* item.adjudication[medicalmanagement].category = PCTAdjudicationCategoryCS#medicalmanagement
* item.adjudication[medicalmanagement].amount 0..0 
* item.adjudication[medicalmanagement].value 0..0
* item.adjudication[benefitpaymentstatus] ^short = "Benefit Payment Status: Line level benefit payment status associated with professional claim estimates only."
* item.adjudication[benefitpaymentstatus].category = PCTAdjudicationCategoryCS#benefitpaymentstatus
* item.adjudication[benefitpaymentstatus].reason from PCTPayerBenefitPaymentStatusVS (required)
* item.adjudication[adjustmentreason] ^short = "Adjustment Reason"
* item.adjudication[adjustmentreason].category = PCTAdjudicationCategoryCS#adjustmentreason
* item.adjudication[adjustmentreason].reason from PCTAdjustmentReasonVS (required)
* item.adjudication[submitted].category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* item.adjudication[submitted] ^short = "Provider submitted amount"
* item.adjudication[memberliability] ^short = "Member liability"
* item.adjudication[memberliability].category = PCTAdjudicationCategoryCS#memberliability
* item.adjudication[memberliability] ^comment = "$0 is an acceptable value"
* item.adjudication[eligible] ^short = "Eligible amount"
* item.adjudication[eligible].category = http://terminology.hl7.org/CodeSystem/adjudication#eligible
* item.adjudication[eligible] ^comment = "Eligible is similar to allowed amount. Eligible amount and Benefit amount may be different or the same, but if they are different the payer can supply both for the full picture of the estimate."
* item.adjudication[benefit] ^short = "Benefit amount"
* item.adjudication[benefit].category = http://terminology.hl7.org/CodeSystem/adjudication#benefit
* item.adjudication[benefit] ^comment = "Benefit is similar to allowed amount. Eligible amount and Benefit amount may be different or the same, but if they are different the payer can supply both for the full picture of the estimate."


* insert AdjudicationSlicing
* adjudication contains medicalmanagement 0..* MS and
    billingnetworkstatus 0..1 MS and
    renderingnetworkstatus 0..1 MS and
    benefitpaymentstatus 0..1 MS and
    adjustmentreason 0..* MS and 
	submitted 0..1 MS and
	memberliability 0..1 MS and
	eligible 0..1 MS and
	benefit 0..1 MS
* adjudication.category 1..1
* adjudication.category from PCTAdjudicationCategoryVS (extensible)
* adjudication[medicalmanagement].extension contains SubjectToMedicalMgmt named subjectToMedicalMgmt 1..1
* adjudication[medicalmanagement].category = PCTAdjudicationCategoryCS#medicalmanagement
* adjudication[medicalmanagement].amount 0..0
* adjudication[medicalmanagement].value 0..0
* adjudication[billingnetworkstatus] ^short = "Billing Provider Network Status"
* adjudication[billingnetworkstatus].category = PCTAdjudicationCategoryCS#billingnetworkstatus
* adjudication[billingnetworkstatus].reason from PCTPayerBenefitPaymentStatusVS (required)
* adjudication[renderingnetworkstatus] ^short = "Rendering Provider Network Status"
* adjudication[renderingnetworkstatus].category = PCTAdjudicationCategoryCS#renderingnetworkstatus
* adjudication[renderingnetworkstatus].reason from PCTPayerBenefitPaymentStatusVS (required)
* adjudication[benefitpaymentstatus] ^short = "Benefit Payment Status"
* adjudication[benefitpaymentstatus].category = PCTAdjudicationCategoryCS#benefitpaymentstatus
* adjudication[benefitpaymentstatus].reason from PCTPayerBenefitPaymentStatusVS (required)
* adjudication[adjustmentreason] ^short = "Adjustment Reason"
* adjudication[adjustmentreason].category = PCTAdjudicationCategoryCS#adjustmentreason
* adjudication[adjustmentreason].reason from PCTAdjustmentReasonVS (required)
* adjudication[submitted].category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* adjudication[submitted] ^short = "Provider submitted amount"
* adjudication[memberliability].category = PCTAdjudicationCategoryCS#memberliability
* adjudication[memberliability] ^short = "Member liability"
* adjudication[memberliability] ^comment = "$0 is an acceptable value"
* adjudication[eligible].category = http://terminology.hl7.org/CodeSystem/adjudication#eligible
* adjudication[eligible] ^short = "Eligible amount"
* adjudication[eligible] ^comment = "Eligible is similar to allowed amount. Eligible amount and Benefit amount may be different or the same, but if they are different the payer can supply both for the full picture of the estimate."
* adjudication[benefit].category = http://terminology.hl7.org/CodeSystem/adjudication#benefit
* adjudication[benefit] ^short = "Benefit amount"
* adjudication[benefit] ^comment = "Benefit is similar to allowed amount. Eligible amount and Benefit amount may be different or the same, but if they are different the payer can supply both for the full picture of the estimate."


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



// * extension contains Disclaimer named disclaimer 1..* MS
// * extension[disclaimer] ^short = "One or more disclaimers made by the payer concerning the estimated costs provided in the AEOB"
// * extension contains SubjectToMedicalMgmtDisclaimer named subjectToMedicalMgmtDisclaimer 0..1 MS
// * extension contains EstimateOnlyDisclaimer named estimateOnlyDisclaimer 0..1 MS

// * extension contains ExpirationDate named expirationDate 1..1 MS
// * extension[expirationDate] ^short = "Once the AEOB is complete and formally issued it is good until this date."


* total 1..*
* insert TotalSlicing
* total.category from PCTTotal (extensible)
* total contains
	submitted 1..1 MS and
	memberliability 0..1 MS and
	innetwork 0..1 MS and
	outofnetwork 0..1 MS and
	noncovered 0..1 MS and
	negotiated 0..1 MS and
	eligible 0..1 MS and
	benefit 0..1 MS



* total[submitted].category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* total[submitted] ^short = "Total provider submitted amount"

* total[memberliability] ^short = "Total member liability - Must include in non-zero total across all AEoBs"
* total[memberliability].category = PCTAdjudicationCategoryCS#memberliability

* total[innetwork] ^short = "Total in network amount - Must include in non-zero total across all AEoBs"
* total[innetwork].category = PCTNetworkStatusCS#innetwork

* total[outofnetwork] ^short = "Total out of network amount - Must include in non-zero total across all AEoBs"
* total[outofnetwork].category = PCTNetworkStatusCS#outofnetwork

* total[negotiated] ^short = "Total negotiated amount - Must include in non-zero total across all AEoBs"
* total[negotiated].category = PCTNetworkStatusCS#negotiated


* total[noncovered] ^short = "Total noncovered amount - Must include in non-zero total across all AEoBs"
* total[noncovered].category = PCTAdjudication#noncovered



* total[eligible] ^short = "Total eligible amount - Must include in non-zero total across all AEoBs"
* total[eligible].category = http://terminology.hl7.org/CodeSystem/adjudication#eligible
* total[eligible] ^comment = "Eligible is similar to allowed amount. Eligible amount and Benefit amount may be different or the same, but if they are different the payer can supply both for the full picture of the estimate."

* total[benefit] ^short = "Total benefit amount - Must include in non-zero total across all AEoBs"
* total[benefit].category = http://terminology.hl7.org/CodeSystem/adjudication#benefit
* total[benefit] ^comment = "Benefit is similar to allowed amount. Eligible amount and Benefit amount may be different or the same, but if they are different the payer can supply both for the full picture of the estimate."



* processNote 1..*
* processNote ^short = "Disclaimers go here. Notes should be clear and as specific to the situation at hand as possible"
* processNote.extension contains ProcessNoteClass named processNoteClass 0..1


* benefitBalance 1..*
* benefitBalance.category 1..1 
* benefitBalance.category from PCTBenefitBalanceCategoryVS 
* benefitBalance.unit 1..1 
* benefitBalance.unit from http://hl7.org/fhir/ValueSet/benefit-unit (required)
* benefitBalance.term 1..1
* benefitBalance.term from 	http://hl7.org/fhir/ValueSet/benefit-term (required)
* benefitBalance.financial 1..*
* benefitBalance.financial.type 1..1
* benefitBalance.financial.type from PCTFinancialTypeVS
* benefitBalance.financial.allowed[x] 1..1 MS
* benefitBalance.financial.allowed[x] only unsignedInt or Money
* benefitBalance.financial.allowed[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* benefitBalance.financial.allowed[x] ^type[=].extension.valueBoolean = true
* benefitBalance.financial.allowed[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* benefitBalance.financial.allowed[x] ^type[=].extension.valueBoolean = true
//* benefitBalance.financial.allowedUnsignedInt MS
//* benefitBalance.financial.allowedMoney MS
* benefitBalance.financial.used[x] 1..1 MS
* benefitBalance.financial.used[x] only unsignedInt or Money
* benefitBalance.financial.used[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* benefitBalance.financial.used[x] ^type[=].extension.valueBoolean = true
* benefitBalance.financial.used[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* benefitBalance.financial.used[x] ^type[=].extension.valueBoolean = true
//* benefitBalance.financial.usedUnsignedInt MS
//* benefitBalance.financial.usedMoney MS
* benefitBalance.financial.extension contains RemainingBenefit named remaining  0..1 MS



Invariant: pct-aeob-1
Description: "Institutional EOB:  SHALL have serviceDescription at the item or header level (can be at both locations)"
Expression: "extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription').exists() or item.extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription').exists()"
Severity: #error


Invariant: pct-aeob-2
Description: "Institutional EOB:  SHALL have adjudication[submitted] at the item or header level (can be at both locations)"
//Expression: "adjudication.where(category.coding.code='submitted').exists() or item.adjudication.where(category.coding.code='submitted').exists()"
Expression: "adjudication.where(category.coding.where(code='submitted').exists()).exists() or item.adjudication.where(category.coding.where(code='submitted').exists()).exists()"
Severity: #error

Invariant: pct-aeob-3
Description: "Institutional EOB:  SHALL have adjudication[memberliability] at the item or header level (can be at both locations)"
Expression: "adjudication.where(category.coding.where(code='memberliability').exists()).exists() or item.adjudication.where(category.coding.where(code='memberliability').exists()).exists()"
//Expression: "adjudication.where(category.coding.code='memberliability').exists() or item.adjudication.where(category.coding.code='memberliability').exists()"
//Expression: "adjudication.where(category.where(coding.code='memberliability')).exists() or item.adjudication.where(category.where(coding.code='memberliability')).exists()"
Severity: #error