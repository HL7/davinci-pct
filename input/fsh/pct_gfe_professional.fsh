Profile: PCTGFEProfessional
Parent: Claim
Id: davinci-pct-gfe-professional
Title: "PCT Good Faith Estimate Professional"
Description: "PCT Good Faith Estimate Professional is a profile for an professional provider to capture estimation for  items and services for the patient or, optionally, to submit to a payer (for patients using insurance). If submitting to a payer, this includes the data needed to be processed by a payer for the creation of an Advanced EOB. This profile is used for a professional GFE submission."
* insert TrialUseArtifact
* insert IdentifierSlicing
* identifier contains
   PLAC 1..1 //and
//   INTER 0..*
* identifier[PLAC].type = $V2-0203#PLAC "Placer Identifier"
* identifier[PLAC].system MS
* identifier[PLAC].value 1..1
* identifier[PLAC] ^short = "Provider Assigned Identifier for GFE Claim"
//* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
//* identifier[INTER] ^short = "Intermediary System Identifier"

//// Profile entension elements ////
/* Remove GFE Submitter
* extension contains GFESubmitter named gfeSubmitter 1..1
* extension[gfeSubmitter] ^short = "The scheduling entity that submits the GFE to provide a collection of services to a payer for the creation of an Advanced EOB"
*/
//* extension contains PlannedPeriodOfService named plannedPeriodOfService 0..* MS
//* extension[plannedPeriodOfService] ^short = "This could be the scheduled date(s) of a particular admission/service or a series of admissions/services."
* extension contains GFEServiceLinkingInfo named gfeServiceLinkingInfo 0..1 MS
* extension[gfeServiceLinkingInfo] ^short = "GFE Service Linking Information"
// * extension contains ReferralNumber named referralNumber 0..2 MS
// * extension[referralNumber] ^short = "Referral Number"
* extension contains ProviderEventMethodology named providerEventMethodology 0..1 MS
* extension[providerEventMethodology] ^short = "Provider event collection methodology"
* extension[providerEventMethodology] ^definition = "How the provider determined the number of claims and the number and type of billing providers to include in the GFE. Examples include provider episodes of care experience, PACES, order set based on clinical guidelines, payor suggested grouping, or some other method of determination. The extension definition contains additional detail."
* extension contains GFEDisclaimer named gfeDisclaimer 0..* MS
* extension[gfeDisclaimer].value[x] only string
* extension[gfeDisclaimer] ^short = "Disclaimers the patient should be made aware of regarding the providers estimate, e.g. application of sliding scale for self-pay/uninsured patients"
* extension[gfeDisclaimer] ^definition = "Disclaimers the patient should be made aware of regarding the providers estimate including any additional assumptions and requirements.  Noting that that the information provided is only an estimate based on the items and services reasonably expected, at the time of scheduling (or requesting) the item or service, to be furnished and is subject to change."
* extension[gfeDisclaimer] ^comment = "These disclaimers may include, but are not limited to things such as: provider discounts (e.g. application of sliding fee scale), limitations, preconditions, requirements, assumptions (e.g. diagnostic vs. preventative), information known to be missing in the estimate, conditions that may affect the estimate, or anything that may affect the interpretation of the estimate."

* type = $ClaimTypeCS#professional
* use = $CLAIMUSECS#predetermination "predetermination"

* patient only Reference(USCorePatientProfile|7.0.0)

// Billing provider--get Taxonomy Code and Organization from PractitionerRole
* provider only Reference(PCTOrganization or PCTPractitioner)
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
//TODO: create vS for payee.type like https://build.fhir.org/ig/HL7/carin-bb/ValueSet-C4BBPayeeType.html
//TODO: for now put in a placeholder statement about formal VS to be created...

* referral.extension contains ReferralNumber named referralNumber 1..1
* referral.extension[referralNumber] ^short = "Referral Number"

* accident.location[x] only Address
* accident.location[x].country from $ISO3166-P1-ALPHA2-VS (required)

//* supportingInfo.category from $C4BBSupportingInfoType (extensible)


* insurance.coverage only Reference(PCTCoverage)
* insurance.coverage.extension contains $DARExtensionUrl named dataAbsentReason 0..1 MS
* insurance.coverage.extension[dataAbsentReason] ^short = "Coverage may be not applicable if estimate is for self-pay or uninsured"

* insurance.preAuthRef 0..2

* insert DiagnosisSlicing
* diagnosis 0..* MS
//* diagnosis.diagnosis[x] MS
//* diagnosis.diagnosis[x] only CodeableConcept
//* diagnosis.diagnosis[x] from http://hl7.org/fhir/ValueSet/icd-10 (required)
* diagnosis.type MS
* diagnosis.type from DiagnosisTypeCodes
* diagnosis contains
   principal 0..1 MS and
   other 0..11 MS
* diagnosis[principal].type 1..1
* diagnosis[principal].type = DiagnosisTypeCodes#principal
* diagnosis[principal].sequence = 1
* diagnosis[principal].diagnosis[x]
* diagnosis[principal].diagnosis[x] only CodeableConcept
* diagnosis[principal].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[principal] ^short = "Principal Diagnosis - Must Support means the information source SHALL be capable of populating and SHALL populate if available and permitted."
* diagnosis[principal] ^comment = "If the Principal Diagnosis code is known, it is important that it be shared in the GFE, particularly when the GFE is being sent to a payer for an insured patient. Payers very often need the diagnosis to be able to provide an estimate. Without the diagnosis, payers may assume the service is diagnostic and thus the patient responsibility may be higher or not covered at all than the diagnosis, such as for preventative services, would otherwise indicate. It is understood that in certain situations, such as scheduled services or GFE requests prior to orders, diagnosis is not needed or may not yet be known. However, when it is known, it is important that this information be shared to ensure the best possible estimate is provided to the patient."

* diagnosis[other].type 1..1
* diagnosis[other].type = DiagnosisTypeCodes#secondary
* diagnosis[other].diagnosis[x]
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
   anesthesiaRelated 0..2 MS and
   other 0..24 MS


* procedure[anesthesiaRelated].type 1..1
* procedure[anesthesiaRelated].type = PCTProcedureType#procedureRequiringAnesthesia
* procedure[anesthesiaRelated].procedure[x] only CodeableConcept
* procedure[anesthesiaRelated].procedure[x] from PCTProcedureSurgicalCodes
* procedure[anesthesiaRelated].extension 1..*
//* procedure[anesthesiaRelated].extension contains ServiceDescription named serviceDescription 1..1

* procedure[other].type 1..1
* procedure[other].type = PCTProcedureType#other
* procedure[other].procedure[x]
* procedure[other].procedure[x] only CodeableConcept
* procedure[other].procedure[x] from PCTProcedureSurgicalCodes
* procedure[other].extension 1..*
//* procedure[other].extension contains ServiceDescription named serviceDescription 1..1

* insert CareTeamSlicing
//* careTeam 0..*
* careTeam.provider 1..1
// ISSUE: does the qualification code give the taxonomy code? If so, no need to have PractitionerRole??
* careTeam.provider only Reference(PCTPractitioner or PCTOrganization)
//* careTeam.provider ^short = ""
* careTeam.role 1..1
* careTeam.role from PCTCareTeamRoleVS
* careTeam.qualification
* careTeam.qualification from $USCPROCROLE (required)
* careTeam contains
   rendering 0..* MS and
   referring 0..1 MS
* careTeam[rendering].role = $CARETEAMROLECS#rendering
//* careTeam[rendering] ^short = "May be used for the Institutional/Professional case"
* careTeam[rendering].qualification 1..1
* careTeam[rendering].qualification ^short = "Practitioner credential or specialization - must provide a taxonomy code for the Professional case"
* careTeam[referring].role = $CARETEAMROLECS#referring
// * careTeam[referring] ^short = "May be used for the Institutional/Professional case"

* insert SupportingInfoSlicing
* supportingInfo.category from PCTSupportingInfoTypeVS (extensible)
* supportingInfo contains
   serviceFacility 0..1 MS

* supportingInfo[serviceFacility] ^short = "Service Facility"
* supportingInfo[serviceFacility] ^comment = "Service Facility Location information conveys the name, full address and identifier of the facility where services were rendered when that is different from the Billing/Performing Provider."
* supportingInfo[serviceFacility].category = PCTSupportingInfoType#servicefacility
* supportingInfo[serviceFacility].category
* supportingInfo[serviceFacility].valueReference 1..1
* supportingInfo[serviceFacility].valueReference only Reference(PCTOrganization)

* supportingInfo contains claimFrequency 0..1 MS
* supportingInfo[claimFrequency] ^short = "Claim Frequency component of the UB-04 Type of Bill Code (4th digit of the UB-04 Type of Bill code)."
* supportingInfo[claimFrequency] ^comment = "For the purposes of Patient Cost Transparency Estimates, this field may be used to modify or replace a GFE claim estimate within the same GFE Packet submission. This specification does not support the modification of Claim resources outside of the GFE Packet and client systems SHALL NOT expect the inclusion of the frequency code to affect the use or interpretation of any Claim outside of the GFE Packet."
* supportingInfo[claimFrequency].category = PCTSupportingInfoType#claimFrequency
* supportingInfo[claimFrequency].code 1..1
* supportingInfo[claimFrequency].code from PCTGFETypeOfBillVS (required)

* item 1..50
* item.extension contains ReferralNumber named referralNumber 0..11 MS
* item.extension[referralNumber] ^short = "Referral Number"
* item.extension contains GFEBillingProviderLineItemCtrlNum named gfeBillingProviderLineItemCtrlNum 0..1 MS
* item.extension contains ServiceDescription named serviceDescription 1..1
* item.extension contains ProviderEventMethodology named ProviderEventMethodology 0..1 MS
* item.extension[ProviderEventMethodology] ^short = "Provider Event Methodology"
* item.extension[ProviderEventMethodology] ^comment = "The method a provider used to group services. The extension definition contains additional detail."

* item.careTeamSequence MS

// * item.revenue MS
// * item.revenue from PCTGFEItemRevenueVS (example)
// * item.revenue ^short = "Revenue or cost center code - must provide a value for the Institutional case"

* item.modifier 0..4 MS
* item.modifier from PCTGFEItemCptHcpcsVS (required)
* item.modifier.coding obeys pct-cpt-display

* item.productOrService from USClaimMedicalProductOrServiceCodes (required)
* item.productOrService.coding obeys pct-cpt-display
// * item.productOrService ^comment = "Must be provided with an actual CPT/HCPCS value. Can’t be null or N/A or data absent reason."

* item.serviced[x] 1..1
* item.serviced[x] ^short = "This is the planned or estimated date(s)s of service"
* item.serviced[x] ^definition = "This is the planned or estimated dates of service. Use Revenue code to determine inpatient stays if needed for adjudication"

* item.unitPrice 1..1
* item.net 1..1 
* item.net ^short = "Total charge amount for the service line"
* item.quantity 1..1

* item.location[x] only CodeableConcept
* item.locationCodeableConcept 1..1
* item.locationCodeableConcept from PCTGFECMSPOS (required)

* item.detail MS
* item.detail ^short = "Drug Identification Information"
//ISSUE: use FDANDCOrCompound or FDANationalDrugCode from CARIN BB??
* item.detail.productOrService from USClaimMedicalProductOrServiceCodes (required)

* item.detail.quantity MS

* item.serviced[x] MS

* total 1..1
* total ^short = "Total GFE Charges Submitted"
