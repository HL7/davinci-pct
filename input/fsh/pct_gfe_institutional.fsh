Profile: PCTGFEInstitutional
Parent: Claim
Id: davinci-pct-gfe-Institutional
Title: "PCT Good Faith Estimate Institutional"
Description: "PCT Good Faith Estimate Institutional is a profile for capturing submission data needed to be processed by a payer for the creation of an Advanced EOB. This profile is used for an institutional GFE submission."

* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.description = "Slice based on $this pattern"
* identifier contains
   PLAC 1..1 and
   INTER 0..*
* identifier[PLAC].type = $V2-0203#PLAC "Placer Identifier"
* identifier[PLAC].system MS
* identifier[PLAC].value 1..1 MS
* identifier[PLAC] ^short = "Provider Assigned Identifier for GFE Claim"
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"

//// Profile entension elements ////
* extension contains GFESubmitter named gfeSubmitter 1..1 MS
* extension[gfeSubmitter].value[x] only Reference(PCTOrganization)
* extension[gfeSubmitter] ^short = "The scheduling entity that submits the GFE to provide a collection of services to a payer for the creation of an Advanced EOB"
//* extension contains PlannedPeriodOfService named plannedPeriodOfService 0..* MS
//* extension[plannedPeriodOfService] ^short = "This could be the scheduled date(s) of a particular admission/service or a series of admissions/services."
* extension contains GFEServiceLinkingInfo named gfeServiceLinkingInfo 0..1 MS
* extension[gfeServiceLinkingInfo] ^short = "GFE Service Linking Information"
//* extension contains ReferralNumber named referralNumber 0..1 MS
//* extension[referralNumber] ^short = "Referral Number"
* extension contains ProviderEventMethodology named providerEventMethodology 0..1
* extension[providerEventMethodology] ^short = "Provider event collection methodology"
* extension[providerEventMethodology] ^definition = "How the provider determined the number of claims and the number and type of billing providers to include in the GFE. Examples include provider episodes of care experience, PACES, order set based on clinical guidelines, payor suggested grouping, or some other method of determination."
* extension contains GFEDisclaimer named gfeDisclaimer 0..* MS
* extension[gfeDisclaimer].value[x] only string
* extension[gfeDisclaimer] ^short = "Disclaimers the patient should be made aware of regarding the providers estimate"




* billablePeriod MS

* type = $ClaimTypeCS#institutional
* status MS
* use MS
* use = $CLAIMUSECS#predetermination "predetermination"

* patient MS
* patient only Reference(HRexPatientDemographics)

// Billing provider--get Taxonomy Code and Organization from PractitionerRole
* provider only Reference(PCTOrganization)
* provider ^short = "Billing provider - party responsible for the GFE"

* provider.extension contains ProviderTaxonomy named providerTaxonomy 1..1 MS
* provider.extension[providerTaxonomy] ^short = "Provider taxonomy codes consisting of NUCC Health Care Provider Taxonomy Code Set for providers"

* priority MS
* priority from $PROCPRIORITYVS (required)

* insurer 1..1
* insurer only Reference(PCTOrganization)

* payee MS
* payee.party only Reference(PCTPractitioner or PCTOrganization)
//TODO: create VS for payee.type like https://build.fhir.org/ig/HL7/carin-bb/ValueSet-C4BBPayeeType.html ???

* referral.extension contains ReferralNumber named referralNumber 1..1 MS
* referral.extension[referralNumber] ^short = "Referral Number"

* insurance.coverage MS
* insurance.coverage only Reference(PCTCoverage)
* insurance.preAuthRef 0..1

* accident.location[x] only Address
* accident.location[x].country from $ISO3166-P1-ALPHA2-VS (required)

* insert DiagnosisSlicing
* diagnosis 1..*
//* diagnosis.diagnosis[x] MS
//* diagnosis.diagnosis[x] only CodeableConcept
//* diagnosis.diagnosis[x] from http://hl7.org/fhir/ValueSet/icd-10 (required)
* diagnosis.type MS
* diagnosis.type from PCTDiagnosisTypeVS
* diagnosis contains
   principal 1..1 MS and
   admitting 0..1 MS and
   patientReasonForVisit 0..3 MS and
   externalcauseofinjury 0..12 MS and
   other 0..24 MS
* diagnosis[principal].type = $DIAGTYPECS#principal
* diagnosis[principal].sequence = 1
* diagnosis[principal].diagnosis[x] MS
* diagnosis[principal].diagnosis[x] only CodeableConcept
* diagnosis[principal].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[admitting].type = $DIAGTYPECS#admitting
* diagnosis[admitting].diagnosis[x] MS
* diagnosis[admitting].diagnosis[x] only CodeableConcept
* diagnosis[admitting].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[patientReasonForVisit].type = PCTDiagnosisType#patientReasonForVisit
* diagnosis[patientReasonForVisit].diagnosis[x] MS
* diagnosis[patientReasonForVisit].diagnosis[x] only CodeableConcept
* diagnosis[patientReasonForVisit].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[externalcauseofinjury].type = PCTDiagnosisType#externalCauseOfInjury
* diagnosis[externalcauseofinjury].diagnosis[x] MS
* diagnosis[externalcauseofinjury].diagnosis[x] only CodeableConcept
* diagnosis[externalcauseofinjury].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[other].type = PCTDiagnosisType#other
* diagnosis[other].diagnosis[x] MS
* diagnosis[other].diagnosis[x] only CodeableConcept
* diagnosis[other].diagnosis[x] from PCTDiagnosticCodes (required)

* insert ProcedureSlicing
//* procedure.procedure[x] MS
//* procedure.procedure[x] only CodeableConcept
* procedure.type MS
* procedure.type from PCTProcedureTypeVS
* procedure.extension contains ServiceDescription named serviceDescription 1..1
* procedure contains
   principal 0..1 MS and
   other 0..24 MS
* procedure[principal].type = PCTProcedureType#principal
* procedure[principal].sequence = 1
* procedure[principal].procedure[x] MS
* procedure[principal].procedure[x] only CodeableConcept
* procedure[principal] ^short = "Principal clinical procedure performed"
* procedure[other].type = PCTProcedureType#other
* procedure[other].procedure[x] MS
* procedure[other].procedure[x] only CodeableConcept
* procedure[other].procedure[x] from PCTProcedureSurgicalCodes

* insert CareTeamSlicing
//* careTeam 0..* MS
* careTeam.provider 1..1 MS
// ISSUE: does the qualification code give the taxonomy code? If so, no need to have PractitionerRole??
* careTeam.provider only Reference(PCTPractitioner or PCTOrganization)
//* careTeam.provider ^short = ""
* careTeam.role 1..1 MS
* careTeam.role from PCTCareTeamRoleVS
* careTeam.qualification
* careTeam.qualification from $USCPROCROLE (required)
* careTeam contains
   attending 0..1 MS and
   operating 0..2 MS and
   rendering 0..1 MS and
   referring 0..1 MS
* careTeam[attending].role = PCTCareTeamRole#attending
//* careTeam[attending] ^short = "May be used for the Institutional case only"
* careTeam[attending].provider only Reference(PCTPractitioner)
* careTeam[attending].qualification 1..1 MS
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
   typeOfBill 1..1 MS and
   serviceFacility 0..1 MS and
   drg 0..1 and
   pointoforigin 0..1 and
   admtype 0..1
   

* supportingInfo[typeOfBill].category MS
* supportingInfo[typeOfBill].category = PCTSupportingInfoType#typeofbill 
* supportingInfo[typeOfBill].code 1..1 MS
* supportingInfo[typeOfBill].code from PCTGFETypeOfBillVS (required)

* supportingInfo[serviceFacility] ^short = "Service Facility"
* supportingInfo[serviceFacility] ^comment = "Service Facility Location information conveys the name, full address and identifier of the facility where services were rendered when that is different from the Billing/Performing Provider."
* supportingInfo[serviceFacility].category = PCTSupportingInfoType#servicefacility
* supportingInfo[serviceFacility].category MS
* supportingInfo[serviceFacility].valueReference 1..1 MS
* supportingInfo[serviceFacility].valueReference only Reference(PCTOrganization)

* supportingInfo[drg].category = PCTSupportingInfoType#drg
* supportingInfo[drg].code from USClaimDRGCodes (required)

* supportingInfo[pointoforigin].category = PCTSupportingInfoType#pointoforigin
* supportingInfo[pointoforigin].code from AHANUBCPointOfOriginVS  (required)

* supportingInfo[admtype].category = PCTSupportingInfoType#admtype
* supportingInfo[admtype].code from AHANUBCPriorityTypeOfAdmissionOrVisitVS   (required)

* item 1..999 MS
* item.extension contains GFEBillingProviderLineItemCtrlNum named gfeBillingProviderLineItemCtrlNum 0..1 MS
* item.extension contains ServiceDescription named serviceDescription 1..1

* item.revenue 1..1 MS
* item.revenue from PCTGFEItemRevenueVS (required)
* item.revenue ^short = "Revenue or cost center code - must provide a value for the Institutional case"

* item.modifier 0..4 MS
* item.modifier from PCTGFEItemCptHcpcsVS (required)

//TODO: need to include HIPPS for institutional
* item.productOrService from USClaimMedicalProductOrServiceCodes (required)
//* item.productOrService obeys GFE-inst-item-productorservice
* item.productOrService ^comment = "Can include null or N/A or data absent reason for the In-Patient Institutional case."

* item.unitPrice MS
* item.net 1..1 MS
* item.quantity 1..1 MS

* item.locationCodeableConcept MS
* item.locationCodeableConcept from PCTGFECMSPOS (required)

* item.detail MS
* item.detail ^short = "Drug Identification Information"
//ISSUE: use FDANDCOrCompound or FDANationalDrugCode from CARIN BB??
* item.detail.productOrService from PCTGFEItemNDCVS (required)

* item.detail.quantity MS

* item.serviced[x] MS

* total 1..1 MS
* total ^short = "Total GFE Charges Submitted"
