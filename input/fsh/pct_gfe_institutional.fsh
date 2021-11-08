Profile: PCTGFEInstitutional
Parent: Claim
Id: pct-gfe-Institutional
Title: "PCT Good Faith Estimate Institutional"
Description: "PCT Good Faith Estimate Institutional is a profile for capturing submission data needed to be processed by a payer for the creation of an Advanced EOB. This profile is used for an institutional GFE submission."

//// Profile entension elements ////
* extension contains GFESubmitter named gfeSubmitter 1..1 MS
* extension[gfeSubmitter].value[x] only Reference(PCTOrganization)
* extension[gfeSubmitter] ^short = "The scheduling entity that submits the GFE to provide a collection of services to a payer for the creation of an Advanced EOB"
* extension contains GFEProviderAssignedIdentifier named gfeProviderAssignedIdentifier 1..1 MS
* extension[gfeProviderAssignedIdentifier] ^short = "GFE Provider Assigned Identifier"
* extension contains GFEServiceLinkingInfo named gfeServiceLinkingInfo 0..1 MS
* extension[gfeServiceLinkingInfo] ^short = "GFE Service Linking Information"
* extension contains ReferralNumber named referralNumber 0..1 MS
* extension[referralNumber] ^short = "Referral Number"
* extension contains ProviderEventMethodology named providerEventMethodology 0..1 MS
* extension[providerEventMethodology] ^short = "Provider event collection methodology"
* extension[providerEventMethodology] ^definition = "How the provider determined the number of claims and the number and type of billing providers to include in the GFE. Examples include provider episodes of care experience, PACES, order set based on clinical guidelines, payor suggested grouping, or some other method of determination."
* extension contains InterTransIdentifier named interTransIdentifier 0..1 MS
* extension[interTransIdentifier] ^short = "Intermediary Transmission Identifier"
* extension[interTransIdentifier] ^definition = "Transmission identifier for Intermediaries. Allows a third party transmission intermediary to assign a unique identifer for the services in this claim resource to be used in back-end processes."

* type = $ClaimTypeCS#institutional "Institutional"

* patient MS
* patient only Reference(PCTPatient)

// Billing provider--get Taxonomy Code and Organization from PractitionerRole
* provider only Reference(PCTOrganization)
* provider ^short = "Billing provider - party responsible for the GFE"

* insurer 1..1
* insurer only Reference(PCTOrganization)

* payee MS
* payee.party only Reference(PCTPractitioner or PCTOrganization)
//TODO: create VS for payee.type like https://build.fhir.org/ig/HL7/carin-bb/ValueSet-C4BBPayeeType.html ???

* facility MS
* facility only Reference(PCTLocation)

* insurance.coverage MS
* insurance.coverage only Reference(PCTCoverage)
* insurance.preAuthRef MS

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
   other 0..24 MS
* diagnosis[principal].type = $DIAGTYPECS#principal
* diagnosis[principal].sequence = 1
* diagnosis[principal].diagnosis[x] MS
* diagnosis[principal].diagnosis[x] only CodeableConcept
* diagnosis[principal].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[principal].packageCode MS
* diagnosis[principal].packageCode ^short = "For the Institutional case this is the Provider GFE DRG"
* diagnosis[principal].packageCode ^comment = "The Diagnosis Related Grouper (DRG) submitted by the provider."
* diagnosis[admitting].type = $DIAGTYPECS#admitting
* diagnosis[admitting].diagnosis[x] MS
* diagnosis[admitting].diagnosis[x] only CodeableConcept
* diagnosis[admitting].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[admitting].packageCode MS
* diagnosis[admitting].packageCode ^short = "For the Institutional case this is the Provider GFE DRG"
* diagnosis[admitting].packageCode ^comment = "The Diagnosis Related Grouper (DRG) submitted by the provider."
* diagnosis[patientReasonForVisit].type = PCTDiagnosisType#patientReasonForVisit
* diagnosis[patientReasonForVisit].diagnosis[x] MS
* diagnosis[patientReasonForVisit].diagnosis[x] only CodeableConcept
* diagnosis[patientReasonForVisit].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[patientReasonForVisit].packageCode MS
* diagnosis[patientReasonForVisit].packageCode ^short = "For the Institutional case this is the Provider GFE DRG"
* diagnosis[patientReasonForVisit].packageCode ^comment = "The Diagnosis Related Grouper (DRG) submitted by the provider."
* diagnosis[other].type = PCTDiagnosisType#other
* diagnosis[other].diagnosis[x] MS
* diagnosis[other].diagnosis[x] only CodeableConcept
* diagnosis[other].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[other].packageCode MS
* diagnosis[other].packageCode ^short = "For the Institutional case this is the Provider GFE DRG"
* diagnosis[other].packageCode ^comment = "The Diagnosis Related Grouper (DRG) submitted by the provider."

* insert ProcedureSlicing
//* procedure.procedure[x] MS
//* procedure.procedure[x] only CodeableConcept
* procedure.type MS
* procedure.type from PCTProcedureTypeVS
* procedure contains
   primary 0..1 MS and
   other 0..24 MS
* procedure[primary].type = $PROCTYPECS#primary
* procedure[primary].sequence = 1
* procedure[primary].procedure[x] MS
* procedure[primary].procedure[x] only CodeableConcept
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
* careTeam.qualification MS
* careTeam.qualification from $USCPROCROLE (required)
* careTeam contains
   attending 0..1 MS and
   operating 0..2 MS and
   rendering 0..1 MS
   // referring 0..1 MS
* careTeam[attending].role = PCTCareTeamRole#attending
//* careTeam[attending] ^short = "May be used for the Institutional case only"
* careTeam[attending].qualification 1..1
* careTeam[operating].role = PCTCareTeamRole#operating
//* careTeam[operating] ^short = "May be used for the Institutional case only"
* careTeam[rendering].role = PCTCareTeamRole#rendering
//* careTeam[rendering] ^short = "May be used for the Institutional/Professional case"
// * careTeam[referring].role = PCTCareTeamRole#referring
// * careTeam[referring] ^short = "May be used for the Institutional/Professional case"

* insert SupportingInfoSlicing
* supportingInfo.category from PCTSupportingInfoTypeVS (extensible)
* supportingInfo contains
   typeOfBill 0..1 MS
* supportingInfo[typeOfBill].category MS
* supportingInfo[typeOfBill].category = PCTSupportingInfoType#typeofbill "Type of Bill"
* supportingInfo[typeOfBill].code 1..1 MS
* supportingInfo[typeOfBill].code from PCTGFETypeOfBillVS (required)

* item 1..999 MS
* item.extension contains EstimatedDateOfService named estimatedDateOfService 0..1 MS
* item.extension[estimatedDateOfService] ^comment = "This could be the scheduled date of admission or service."
* item.extension contains GFEBillingProviderLineItemCtrlNum named gfeBillingProviderLineItemCtrlNum 0..1 MS

* item.revenue 1..1 MS
* item.revenue from PCTGFEItemRevenueVS (example)
* item.revenue ^short = "Revenue or cost center code - must provide a value for the Institutional case"

* item.modifier 0..4 MS
* item.modifier from PCTGFEItemCptHcpcsVS (required)

* item.productOrService from PCTGFEItemCptHcpcsVS (required)
//* item.productOrService obeys GFE-inst-item-productorservice
* item.productOrService ^comment = "Can include null or N/A or data absent reason for the In-Patient Institutional case."

* item.net 1..1 MS
* item.quantity 1..1 MS

* item.locationCodeableConcept MS
* item.locationCodeableConcept from $CMSPOSVS (required)

* item.detail MS
* item.detail ^short = "Drug Pricing Information"
//ISSUE: use FDANDCOrCompound or FDANationalDrugCode from CARIN BB??
* item.detail.productOrService from PCTGFEItemNDCVS (required)

* item.detail.quantity MS

* item.detail.extension contains CompoundDrugLinkingNumber named compoundDrugLinkingNumber 0..1 MS
* item.detail.extension[compoundDrugLinkingNumber] ^short = "Compound Drug Linking Number"
* item.detail.extension[compoundDrugLinkingNumber] ^definition = "Way of linking multiple components of a drug. Could be a prescription number or a identifier created by the  provider if no prescription number is available."
* item.detail.extension[compoundDrugLinkingNumber] ^comment = "Allows the sender to link multiple drug components together for billing purposes."

* total 1..1
* total ^short = "Total GFE Charges Submitted"
