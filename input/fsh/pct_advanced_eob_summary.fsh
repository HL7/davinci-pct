Profile: PCTAdvancedEOBSummary
Parent: ExplanationOfBenefit
Id: davinci-pct-aeob-summary
Title: "PCT Advanced EOB Summary"
Description: "This profile is used for exchanging a summary of Explanation of Benefit (EoB) information, including costs and benefits, of all of the Advanced EoB data contained within an Advance EoB Bundle."
* insert TrialUseArtifact1

/* 

Questions
	Do we need to have references to the AEOBs that the summary is referencing OR is it reasonably implied by the context of being in an AEOB Bundle? How about when it leaves the bundle, e.g. for processing)
	Do we keep an out of network provider extension (where to get more info on network providers)?
	EOB Resource requires one provider. This would have to be addressed for a summary. What is the preferred method. Data Absent reason extension?
	Should we disallow all elements that likely do not apply to a summary
	How should we handle the total period of service (Is billable Period appropriate? Question for FM?)
	Do we want to capture potential items of interest like one or more claims not covered under in network or one or more claims requiring medical management? Or perhaps instead say how much is covered in network, how much is out of network, etc.)
*/

* extension contains ServiceDescription named serviceDescription 0..1 MS
* extension contains OutOfNetworkProviderInfo named outOfNetworkProviderInfo 0..1 MS

* insert IdentifierSlicing
* identifier contains 
	INTER 0..* 
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"

* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary
* subType 0..0
* use = $CLAIMUSECS#predetermination "predetermination"


* patient only Reference(HRexPatientDemographics)
* billablePeriod 1..1
* billablePeriod ^short = "The full Period of Care for all services or products included in the estimate from the first event to the last event."

* enterer 0..0

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

* fundsReserveRequested 0..0
* fundsReserve 0..0

* prescription 0..0
* originalPrescription 0..0
* payee 0..0
* referral 0..0

* facility 0..0
* claim 0..0

* preAuthRef 0..0
* preAuthRefPeriod 0..0
* precedence 0..0

* insurance.coverage only Reference(PCTCoverage)

* benefitPeriod 1..1

* created ^short = "The date and time this summary was generated."
* created ^comment = "The date and time this summary was generated based on what was known at that point in time."

* supportingInfo 0..0

* item 0..0
* addItem 0..0
* adjudication 0..0


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

* payment 0..0


* processNote 1..*
* processNote ^short = "Disclaimers go here. Notes should be clear and as specific to the situation at hand as possible including any additional assumptions and requirements. This may include notes about prior authorization, out of network providers, benefit period,  and other legal or otherwise required disclaimers."
* processNote ^comment = "These disclaimers may include, but are not limited to things such as: notes on prior authorization or other medical management requirements, provider discounts, limitations, preconditions, assumptions, information known to be missing in the estimate, conditions that may affect the estimate, or anything that may affect the interpretation of the estimate."
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
* benefitBalance.financial.extension contains RemainingBenefit named remaining  0..1 MS


