Profile: PCTGFEInstitutional
Parent: Claim
Id: davinci-pct-gfe-institutional
Title: "PCT Good Faith Estimate Institutional"
Description: "PCT Good Faith Estimate Institutional is a profile for an institutional provider to capture estimation for  items and services for the patient or, optionally, to submit to a payer (for patients using insurance). If submitting to a payer, this includes the data needed for a payer to process and create an Advanced EOB. This profile is used for an institutional GFE submission."
* insert TrialUseArtifact
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.description = "Slice based on $this value"
* identifier contains
   PLAC 1..1 and
   INTER 0..*
* identifier[PLAC].type = $V2-0203#PLAC "Placer Identifier"
* identifier[PLAC].system MS
* identifier[PLAC].value 1..1
* identifier[PLAC] ^short = "Provider Assigned Identifier for GFE Claim"
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"

//// Profile entension elements ////
/* Remove GFE Submitter
* extension contains GFESubmitter named gfeSubmitter 1..1
//* extension[gfeSubmitter].value[x] only Reference(PCTPractitioner or PCTOrganization)
//* extension[gfeSubmitter].valueReference only Reference(PCTPractitioner or PCTOrganization)
* extension[gfeSubmitter] ^short = "The scheduling entity that submits the GFE to provide a collection of services to a payer for the creation of an Advanced EOB"
*/
//* extension contains PlannedPeriodOfService named plannedPeriodOfService 0..* MS
//* extension[plannedPeriodOfService] ^short = "This could be the scheduled date(s) of a particular admission/service or a series of admissions/services. This may span multiple claims, whereas billablePeriod is per claim."
* extension contains GFEServiceLinkingInfo named gfeServiceLinkingInfo 0..1 MS
* extension[gfeServiceLinkingInfo] ^short = "GFE Service Linking Information."
//* extension contains ReferralNumber named referralNumber 0..1 MS
//* extension[referralNumber] ^short = "Referral Number"
* extension contains ProviderEventMethodology named providerEventMethodology 0..1 MS
* extension[providerEventMethodology] ^short = "Provider event collection methodology"
* extension[providerEventMethodology] ^definition = "How the provider determined the number of claims and the number and type of billing providers to include in the GFE. Examples include provider episodes of care experience, PACES, order set based on clinical guidelines, payor suggested grouping, or some other method of determination. The extension definition contains additional detail. "
* extension contains GFEDisclaimer named gfeDisclaimer 0..* MS
* extension[gfeDisclaimer].value[x] only string
* extension[gfeDisclaimer] ^short = "Disclaimers the patient should be made aware of regarding the providers estimate"
* extension[gfeDisclaimer] ^definition = "Disclaimers the patient should be made aware of regarding the providers estimate including any additional assumptions and requirements.  Noting that that the information provided is only an estimate based on the items and services reasonably expected, at the time of scheduling (or requesting) the item or service, to be furnished and is subject to change."
* extension[gfeDisclaimer] ^comment = "These disclaimers may include, but are not limited to things such as: provider discounts, limitations, preconditions, requirements, assumptions (e.g. diagnostic vs. preventative), information known to be missing in the estimate, conditions that may affect the estimate, or anything that may affect the interpretation of the estimate."



* billablePeriod MS
* billablePeriod ^short = "Relevant time frame for the claim. This is per claim, whereas a planned period of service can span multiple claims."

* type = $ClaimTypeCS#institutional
* use = $CLAIMUSECS#predetermination "predetermination"

* patient only Reference(HRexPatientDemographics)

// Billing provider--get Taxonomy Code and Organization from PractitionerRole
* provider only Reference(PCTOrganization)
* provider ^short = "Billing provider - party responsible for the GFE"

* provider.extension contains ProviderTaxonomy named providerTaxonomy 1..1
* provider.extension[providerTaxonomy] ^short = "Provider taxonomy codes consisting of NUCC Health Care Provider Taxonomy Code Set for providers"

* provider.extension contains GFEConsentForBalanceBilling named consentForBalanceBilling 0..1 MS

* priority from $PROCPRIORITYVS (required)

* insurer 0..1 MS
* insurer ^short = "Required if insured estimate"
* insurer only Reference(PCTOrganization)

* payee MS
* payee.party only Reference(PCTPractitioner or PCTOrganization)
//TODO: create VS for payee.type like https://build.fhir.org/ig/HL7/carin-bb/ValueSet-C4BBPayeeType.html ???

* referral.extension contains ReferralNumber named referralNumber 1..1
* referral.extension[referralNumber] ^short = "Referral Number"


* insurance.coverage only Reference(PCTCoverage)
* insurance.coverage.extension contains $DARExtensionUrl named dataAbsentReason 0..1 MS
* insurance.coverage.extension[dataAbsentReason] ^short = "Coverage may be not applicable if estimate is for self-pay or uninsured"

* insurance.preAuthRef 0..1

* accident.location[x] only Address
* accident.location[x].country from $ISO3166-P1-ALPHA2-VS (required)

* insert DiagnosisSlicing
* diagnosis 0..* MS
//* diagnosis.diagnosis[x] MS
//* diagnosis.diagnosis[x] only CodeableConcept
//* diagnosis.diagnosis[x] from http://hl7.org/fhir/ValueSet/icd-10 (required)
* diagnosis.type MS
* diagnosis.type from PCTDiagnosisTypeVS
* diagnosis contains
   principal 0..1 MS and
   admitting 0..1 MS and
   patientReasonForVisit 0..3 MS and
   externalcauseofinjury 0..12 MS and
   other 0..24 MS

* diagnosis[principal].type 1..1
* diagnosis[principal].type = $DIAGTYPECS#principal
* diagnosis[principal].sequence = 1
* diagnosis[principal].diagnosis[x]
* diagnosis[principal].diagnosis[x] only CodeableConcept
* diagnosis[principal].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[principal] ^short = "Principal Diagnosis - Must Support means the information source SHALL be capable of populating and SHALL populate if available and permitted."
* diagnosis[principal] ^comment = "If the Principal Diagnosis code is known, it is important that it be shared in the GFE, particularly when the GFE is being sent to a payer for an insured patient. Payers very often need the diagnosis to be able to provide an estimate. Without the diagnosis, payers may assume the service is diagnostic and thus the patient responsibility may be higher than the diagnosis, such as for preventative services, would otherwise indicate. It is understood that in certain situations, such as scheduled services or GFE requests prior to orders, diagnosis is not needed or may not yet be known. However, when it is known, it is important that this information be shared to ensure the best possible estimate is provided to the patient."

* diagnosis[admitting].type 1..1
* diagnosis[admitting].type = $DIAGTYPECS#admitting
* diagnosis[admitting].diagnosis[x]
* diagnosis[admitting].diagnosis[x] only CodeableConcept
* diagnosis[admitting].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[patientReasonForVisit].type 1..1
* diagnosis[patientReasonForVisit].type = PCTDiagnosisType#patientReasonForVisit
* diagnosis[patientReasonForVisit].diagnosis[x]
* diagnosis[patientReasonForVisit].diagnosis[x] only CodeableConcept
* diagnosis[patientReasonForVisit].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[externalcauseofinjury].type 1..1
* diagnosis[externalcauseofinjury].type = PCTDiagnosisType#externalCauseOfInjury
* diagnosis[externalcauseofinjury].diagnosis[x]
* diagnosis[externalcauseofinjury].diagnosis[x] only CodeableConcept
* diagnosis[externalcauseofinjury].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[other].type 1..1
* diagnosis[other].type = PCTDiagnosisType#other
* diagnosis[other].diagnosis[x] MS
* diagnosis[other].diagnosis[x] only CodeableConcept
* diagnosis[other].diagnosis[x] from PCTDiagnosticCodes (required)

* insert ProcedureSlicing
//* procedure.procedure[x] MS
//* procedure.procedure[x] only CodeableConcept
* procedure.type MS
* procedure.type from PCTProcedureTypeVS
* procedure.extension 1..*
* procedure.extension contains ServiceDescription named serviceDescription 1..1
* procedure contains
   principal 0..1 MS and
   other 0..24 MS

* procedure[principal].type 1..1
* procedure[principal].type = PCTProcedureType#principal
* procedure[principal].sequence = 1
* procedure[principal].procedure[x]
* procedure[principal].procedure[x] only CodeableConcept
* procedure[principal].procedure[x] from ICD10ProcedureCodes (required)
* procedure[principal] ^short = "Principal clinical procedure performed"
* procedure[principal].extension 1..*
* procedure[principal].extension contains ServiceDescription named serviceDescription 1..1

* procedure[other].type 1..1
* procedure[other].type = PCTProcedureType#other
* procedure[other].procedure[x]
* procedure[other].procedure[x] only CodeableConcept
* procedure[other].procedure[x] from PCTProcedureSurgicalCodes
* procedure[other].extension 1..*
* procedure[other].extension contains ServiceDescription named serviceDescription 1..1

* insert CareTeamSlicing
//* careTeam 0..* MS
* careTeam.provider 1..1
// ISSUE: does the qualification code give the taxonomy code? If so, no need to have PractitionerRole??
* careTeam.provider only Reference(PCTPractitioner or PCTOrganization)
//* careTeam.provider ^short = ""
* careTeam.role 1..1
* careTeam.role from PCTCareTeamRoleVS
* careTeam.qualification from $USCPROCROLE (required)
* careTeam contains
   attending 0..1 MS and
   operating 0..2 MS and
   rendering 0..1 MS and
   referring 0..1 MS
* careTeam[attending].role = PCTCareTeamRole#attending
//* careTeam[attending] ^short = "May be used for the Institutional case only"
* careTeam[attending].provider only Reference(PCTPractitioner)
* careTeam[attending].qualification 1..1 
* careTeam[operating].role = PCTCareTeamRole#operating
* careTeam[operating].provider only Reference(PCTPractitioner)
//* careTeam[operating] ^short = "May be used for the Institutional case only"
* careTeam[rendering].role = PCTCareTeamRole#rendering
* careTeam[rendering].provider only Reference(PCTPractitioner)
//* careTeam[rendering] ^short = "May be used for the Institutional/Professional case"
* careTeam[referring].role = PCTCareTeamRole#referring
// * careTeam[referring] ^short = "May be used for the Institutional/Professional case"

* insert SupportingInfoSlicing
* supportingInfo.category from PCTSupportingInfoTypeVS (extensible)
* supportingInfo contains
   typeOfBill 1..1 and
   serviceFacility 0..1 MS and
   drg 0..1 and
   pointoforigin 0..1 and
   admtype 0..1
   

* supportingInfo[typeOfBill].category
* supportingInfo[typeOfBill].category = PCTSupportingInfoType#typeofbill 
* supportingInfo[typeOfBill].code 1..1
* supportingInfo[typeOfBill].code from PCTGFETypeOfBillVS (required)

* supportingInfo[serviceFacility] ^short = "Service Facility"
* supportingInfo[serviceFacility] ^comment = "Service Facility Location information conveys the name, full address and identifier of the facility where services were rendered when that is different from the Billing/Performing Provider."
* supportingInfo[serviceFacility].category = PCTSupportingInfoType#servicefacility
* supportingInfo[serviceFacility].category
* supportingInfo[serviceFacility].valueReference 1..1
* supportingInfo[serviceFacility].valueReference only Reference(PCTOrganization)

* supportingInfo[drg].category = PCTSupportingInfoType#drg
* supportingInfo[drg].code from USClaimDRGCodes (required)

* supportingInfo[pointoforigin].category = PCTSupportingInfoType#pointoforigin
* supportingInfo[pointoforigin].code from AHANUBCPointOfOriginVS  (required)

* supportingInfo[admtype].category = PCTSupportingInfoType#admtype
* supportingInfo[admtype].code from AHANUBCPriorityTypeOfAdmissionOrVisitVS   (required)

* item 1..999
* item.extension contains GFEBillingProviderLineItemCtrlNum named gfeBillingProviderLineItemCtrlNum 0..1 MS
* item.extension contains ServiceDescription named serviceDescription 1..1
* item.extension contains ProviderEventMethodology named ProviderEventMethodology 0..1 MS
* item.extension[ProviderEventMethodology] ^short = "Provider Event Methodology"
* item.extension[ProviderEventMethodology] ^comment = "The method a provider used to group services. The extension definition contains additional detail"

* item.revenue 1..1
* item.revenue from PCTGFEItemRevenueVS (required)
* item.revenue ^short = "Revenue or cost center code - must provide a value for the Institutional case"

* item.modifier 0..4 MS
* item.modifier from PCTGFEItemCptHcpcsVS (required)
* item.modifier.coding obeys pct-cpt-display

* item.productOrService from USClaimMedicalProductOrServiceCodes (required)
* item.productOrService.coding obeys pct-cpt-display
//* item.productOrService obeys GFE-inst-item-productorservice
* item.productOrService ^comment = "Can include null or N/A or data absent reason for the In-Patient Institutional case."

* item.serviced[x] 1..1
* item.serviced[x] ^short = "This is the planned or estimated date(s)s of service"
* item.serviced[x] ^definition = "This is the planned or estimated dates of service. Use Revenue code to determine inpatient stays if needed for adjudication"

* item.unitPrice
* item.net 1..1 
* item.net ^short = "Total charge amount for the service line"
* item.quantity 1..1

* item.locationCodeableConcept MS
* item.locationCodeableConcept from PCTGFECMSPOS (required)

* item.detail MS
* item.detail ^short = "Drug Identification Information"
//ISSUE: use FDANDCOrCompound or FDANationalDrugCode from CARIN BB??
* item.detail.productOrService from PCTGFEItemNDCVS (required)

* item.detail.quantity MS

* item.serviced[x] MS

* total 1..1
* total ^short = "Total GFE Charges Submitted"
