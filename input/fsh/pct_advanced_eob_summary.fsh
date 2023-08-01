Profile: PCTAdvancedEOBSummary
Parent: ExplanationOfBenefit
Id: davinci-pct-aeob-summary
Title: "PCT Advanced EOB Summary"
Description: "This profile is used for exchanging a summary of Explanation of Benefit (EoB) information, including costs and benefits, of all of the Advanced EoB data contained within an Advance EoB Bundle."


/* 
TODO
	Need serviceDescription for primary procedure (what is the overal request about)
	totals
	benefits

Questions
	Do we need to have references to the AEOBs that the summary is referencing OR is it reasonably implied by the context of being in an AEOB Bundle? How about when it leaves the bundle, e.g. for processing)
	Do we keep an out of network provider extension (where to get more info on network providers)?
	EOB Resource requires one provider. This would have to be addressed for a summary. What is the preferred method. Data Absent reason extension?
	Should we disallow all elements that likely do not apply to a summary
	How should we handle the total period of service (Is billable Period appropriate? Question for FM?)
	Do we want to capture potential items of interest like one or more claims not covered under in network or one or more claims requiring medical management? Or perhaps instead say how much is covered in network, how much is out of network, etc.)
*/

* extension contains ServiceDescription named serviceDescription 1..1 MS
* extension contains OutOfNetworkProviderInfo named outOfNetworkProviderInfo 0..1 MS

* insert IdentfierSlicing
* identifier contains 
	INTER 0..* 
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"

* type = PCTAEOBTypeSummaryCS#aeob-summary
* use = $CLAIMUSECS#predetermination "predetermination"


* patient only Reference(HRexPatientDemographics)

* insurer only Reference(PCTOrganization)

// Multiple providers. 
* provider.reference 0..0
* provider.type 0..0
* provider.identifier 0..0
* provider.display 0..0
* provider.extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named dataAbsentReason 1..1
* provider.extension[dataAbsentReason].valueCode = #not-applicable

* priority
* priority from $PROCPRIORITYVS (required)

* facility 0..0
* claim 0..0

* insurance.coverage only Reference(PCTCoverage)

* benefitPeriod 1..1

* created ^short = "The date and time this summary was generated."
* created ^comment = "The date and time this summary was generated based on what was known at that point in time."

* item 0..0
/*
* item.revenue from PCTGFEItemRevenueVS (required)
* item.modifier 0..4 MS
* item.modifier from PCTGFEItemCptHcpcsVS (required)
* item.productOrService from USClaimMedicalProductOrServiceCodes (required)

* item.serviced[x] 1..1
* item.serviced[x] ^short = "This is the planned or estimated date(s)s of service"
* item.serviced[x] ^definition = "This is the planned or estimated dates of service. Use Revenue code to determine inpatient stays if needed for adjudication"

* item.quantity MS


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
* item.adjudication[adjustmentreason].reason from PCTPayerBenefitPaymentStatusVS (required)
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
*/
* adjudication 0..0
/*
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
* adjudication[billingnetworkstatus].reason from PCTAdjudicationCategoryVS (required)
* adjudication[renderingnetworkstatus] ^short = "Rendering Provider Network Status"
* adjudication[renderingnetworkstatus].category = PCTAdjudicationCategoryCS#renderingnetworkstatus
* adjudication[renderingnetworkstatus].reason from PCTAdjudicationCategoryVS (required)
* adjudication[benefitpaymentstatus] ^short = "Benefit Payment Status"
* adjudication[benefitpaymentstatus].category = PCTAdjudicationCategoryCS#benefitpaymentstatus
* adjudication[benefitpaymentstatus].reason from PCTAdjudicationCategoryVS (required)
* adjudication[adjustmentreason] ^short = "Adjustment Reason"
* adjudication[adjustmentreason].category = PCTAdjudicationCategoryCS#adjustmentreason
* adjudication[adjustmentreason].reason from PCTAdjudicationCategoryVS (required)
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

*/
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
* total.category from PCTAdjudication  (extensible)
* total contains
	submitted 0..1 MS and
	memberliability 0..1 MS and
	eligible 0..1 MS and
	benefit 0..1 MS



* total[submitted].category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* total[submitted] ^short = "Totel provider submitted amount"

* total[memberliability] ^short = "Total member liability"
* total[memberliability].category = PCTAdjudicationCategoryCS#memberliability
* total[memberliability] ^comment = "$0 is an acceptable value"

* total[eligible] ^short = "Total eligible amount"
* total[eligible].category = http://terminology.hl7.org/CodeSystem/adjudication#eligible
* total[eligible] ^comment = "Eligible is similar to allowed amount. Eligible amount and Benefit amount may be different or the same, but if they are different the payer can supply both for the full picture of the estimate."

* total[benefit] ^short = "Total benefit amount"
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
* benefitBalance.financial.allowed[x] 1..1
* benefitBalance.financial.allowedMoney 1..1
* benefitBalance.financial.used[x] 1..1
* benefitBalance.financial.usedMoney 1..1

/*

According to FM we can profile AEOB Summary using the ExplanationOfBenefit on 8/1/2023


Profile:        PCTAdvancedEOBSummaryBasic
Parent:         Basic
Id:             davinci-pct-aeob-summary-basic
Title: "PCT Advanced EOB Summary Basic"
Description: "This profile is used for exchanging a summary of Explanation of Benefit (EoB) information, including costs and benefits, of all of the Advanced EoB data contained within an Advance EoB Bundle."


* extension contains
	ServiceDescription named serviceDescription 1..1 MS and
	OutOfNetworkProviderInfo named outOfNetworkProviderInfo 0..1 MS and
	InsuranceInformation named InsuranceInformation 1..1 MS and
	ServicePeriod named ServicePeriod 1..1 MS and
	Created named Created 1..1 MS and
	Total named Total 1..* MS and
	BenefitBalance named BenefitBalance 1..*



* insert IdentfierSlicing
* identifier contains 
	INTER 0..* 
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"

* code 1..1
* code = PCTAEOBTypeSummaryCS#aeob-summary
* subject 1..1 MS
* subject only Reference(HRexPatientDemographics)
* subject ^short = "The recipient of the products and services"


Extension: InsuranceInformation
Id: InsuranceInformation
Title: "Insurance Information"
Description: "Insurance Information"

* extension contains
    insurer 1..1 MS and
    coverage 1..1 MS
* extension[insurer] ^short = "Party responsible for reimbursement"
* extension[insurer].value[x] only Reference
* extension[insurer].valueReference only Reference(PCTOrganization)
* extension[coverage] ^short = "Patient insurance coverage information"
* extension[coverage].value[x] only Reference
* extension[coverage].valueReference only Reference(PCTCoverage)

Extension: ServicePeriod
Id: ServicePeriod
Title: "Total Service Period"
Description: "The total period of services rendered (from the start of the first procedure or service to the end date of the last service or procedure)"

* value[x] 1..1
* value[x] only Period
* valuePeriod.start 1..1
* valuePeriod.end 1..1


Extension: Created
Id: Created
Title: "Created DateTime"
Description: "The date and time this summary was generated."

* value[x] 1..1
* value[x] only dateTime



Extension: Total
Id: Total
Title: "Adjudication totals"
Description: "Summary of categorized monetary totals for the adjudication"

* extension contains
    category 1..1 MS and
    amount 1..1 MS
* extension[category] ^short = "Type of adjudication information"
* extension[category].value[x] only CodeableConcept
* extension[category].valueCodeableConcept from PCTAdjudication (extensible)
* extension[amount] ^short = "Financial total for the category"
* extension[amount].value[x] only Money



// TODO Add lonbger descriptions and or comments to the extensions

Extension: BenefitBalance
Id: BenefitBalance
Title: "Balance by Benefit Category"
Description: "Summary of balance by benefit category"

* extension contains
    category 1..1 MS and
	excluded 0..1 MS and
    name 0..1 MS and
	description 0..1 MS and
	network 0..1 MS and
	unit 1..1 MS and
	term 1..1 MS and
	BenefitBalanceFinancial named BenefitBalanceFinancial 1..1 MS
	
* extension[category] ^short = "Benefit classification"
* extension[category].value[x] only CodeableConcept
* extension[category].valueCodeableConcept from PCTBenefitBalanceCategoryVS

* extension[excluded] ^short = "Excluded from the plan"
* extension[excluded].value[x] only boolean

* extension[name] ^short = "Short name for the benefit"
* extension[name].value[x] only string

* extension[description] ^short = "Description of the benefit or services covered"
* extension[description].value[x] only string

* extension[network] ^short = "In or out of network"
* extension[network].value[x] only CodeableConcept

* extension[unit] ^short = "Individual or family"
* extension[unit].value[x] only CodeableConcept
* extension[unit].valueCodeableConcept from http://hl7.org/fhir/ValueSet/benefit-unit (required)

* extension[term] ^short = "Annual or lifetime"
* extension[term].value[x] only CodeableConcept
* extension[term].valueCodeableConcept from http://hl7.org/fhir/ValueSet/benefit-term (required)



Extension: BenefitBalanceFinancial
Id: BenefitBalanceFinancial
Title: "Benefit Balance Fincancial"
Description: "Summary of benefit balance financial information"

* extension contains
    type 1..1 MS and
	allowedMoney 1..1 MS and
    usedMoney 0..1 MS
	
	/*and
	financial 0..* MS 
* extension[type] ^short = "Benefit classification"
* extension[type].value[x] only CodeableConcept
* extension[type].valueCodeableConcept from PCTFinancialTypeVS

* extension[allowedMoney] ^short = "Benefits allowed"
* extension[allowedMoney].value[x] only Money

* extension[usedMoney] ^short = "Benefits used"
* extension[usedMoney].value[x] only Money



* benefitBalance.category from PCTBenefitBalanceCategoryVS 
* benefitBalance.unit 1..1 
* benefitBalance.unit from http://hl7.org/fhir/ValueSet/benefit-unit (required)
* benefitBalance.term 1..1
* benefitBalance.term from 	http://hl7.org/fhir/ValueSet/benefit-term (required)
* benefitBalance.financial 1..*
* benefitBalance.financial.type 1..1
* benefitBalance.financial.type from PCTFinancialTypeVS
* benefitBalance.financial.allowed[x] 1..1
* benefitBalance.financial.allowedMoney 1..1
* benefitBalance.financial.used[x] 1..1
* benefitBalance.financial.usedMoney 1..1


* extension[service-period] ^short = "Total Service Period"
* extension[service-period].value[x] only Period

* extension[created] ^short = "The date and time this summary was generated."
* extension[created] ^comment = "The date and time this summary was generated based on what was known at that point in time."
* extension[created].value[x] only Period




* insurer only Reference(PCTOrganization)

* insurance.coverage only Reference(PCTCoverage)

* benefitPeriod 1..1

* created ^short = "The date and time this summary was generated."
* created ^comment = "The date and time this summary was generated based on what was known at that point in time."



* total 1..*
* insert TotalSlicing
* total.category from PCTAdjudication  (extensible)
* total contains
	submitted 0..1 MS and
	memberliability 0..1 MS and
	eligible 0..1 MS and
	benefit 0..1 MS



* total[submitted].category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* total[submitted] ^short = "Totel provider submitted amount"

* total[memberliability] ^short = "Total member liability"
* total[memberliability].category = PCTAdjudicationCategoryCS#memberliability
* total[memberliability] ^comment = "$0 is an acceptable value"

* total[eligible] ^short = "Total eligible amount"
* total[eligible].category = http://terminology.hl7.org/CodeSystem/adjudication#eligible
* total[eligible] ^comment = "Eligible is similar to allowed amount. Eligible amount and Benefit amount may be different or the same, but if they are different the payer can supply both for the full picture of the estimate."

* total[benefit] ^short = "Total benefit amount"
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
* benefitBalance.financial.allowed[x] 1..1
* benefitBalance.financial.allowedMoney 1..1
* benefitBalance.financial.used[x] 1..1
* benefitBalance.financial.usedMoney 1..1



*/




CodeSystem: PCTAEOBTypeSummaryCS
Title: "PCT AEOB Type Code System"
Description: "Defining the code for an AEoB type summary"
* ^caseSensitive = true
* #aeob-summary "Advanced Explanation of Benefit Summary "
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
