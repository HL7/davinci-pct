Profile: PCTGFEProfessional
Parent: Claim
Id: davinci-pct-gfe-professional
Title: "PCT Good Faith Estimate Professional"
Description: "PCT Good Faith Estimate Professional is a profile for capturing submission data needed to be processed by a payer for the creation of an Advanced EOB. This profile is used for a professional GFE submission."

//// Profile entension elements ////
* extension contains GFESubmitter named gfeSubmitter 1..1 MS
* extension[gfeSubmitter] ^short = "The scheduling entity that submits the GFE to provide a collection of services to a payer for the creation of an Advanced EOB"
* extension contains GFEProviderAssignedIdentifier named gfeProviderAssignedIdentifier 1..1 MS
* extension[gfeProviderAssignedIdentifier] ^short = "GFE Provider Assigned Identifier"
//* extension contains PlannedPeriodOfService named plannedPeriodOfService 0..* MS
//* extension[plannedPeriodOfService] ^short = "This could be the scheduled date(s) of a particular admission/service or a series of admissions/services."
* extension contains GFEServiceLinkingInfo named gfeServiceLinkingInfo 0..1 MS
* extension[gfeServiceLinkingInfo] ^short = "GFE Service Linking Information"
// * extension contains ReferralNumber named referralNumber 0..2 MS
// * extension[referralNumber] ^short = "Referral Number"
* extension contains ProviderEventMethodology named providerEventMethodology 0..1 MS
* extension[providerEventMethodology] ^short = "Provider event collection methodology"
* extension[providerEventMethodology] ^definition = "How the provider determined the number of claims and the number and type of billing providers to include in the GFE. Examples include provider episodes of care experience, PACES, order set based on clinical guidelines, payor suggested grouping, or some other method of determination."
* extension contains InterTransIdentifier named interTransIdentifier 0..1 MS
* extension[interTransIdentifier] ^short = "Intermediary Transmission Identifier"
* extension[interTransIdentifier] ^definition = "Transmission identifier for Intermediaries. Allows a third party transmission intermediary to assign a unique identifer for the services in this claim resource to be used in back-end processes."

* type = $ClaimTypeCS#professional "Professional"
* status MS
* use MS
* use = $CLAIMUSECS#predetermination "predetermination"

* patient MS
* patient only Reference(PCTPatient)

// Billing provider--get Taxonomy Code and Organization from PractitionerRole
* provider only Reference(PCTOrganization or PCTPractitionerRole)
* provider ^short = "Billing provider - party responsible for the GFE"

* priority MS
* priority from $PROCPRIORITYVS (required)

* insurer 1..1
* insurer only Reference(PCTOrganization)

* payee MS
* payee.party only Reference(PCTPractitioner or PCTOrganization)
//TODO: create vS for payee.type like https://build.fhir.org/ig/HL7/carin-bb/ValueSet-C4BBPayeeType.html
//TODO: for now put in a placeholder statement about formal VS to be created...

* referral.extension contains ReferralNumber named referralNumber 1..1 MS
* referral.extension[referralNumber] ^short = "Referral Number"

* accident.location[x] only Address
* accident.location[x].country from $ISO3166-P1-ALPHA2-VS (required)

//* supportingInfo.category from $C4BBSupportingInfoType (extensible)

* insurance.coverage MS
* insurance.coverage only Reference(PCTCoverage)
* insurance.preAuthRef 0..2 MS

* insert DiagnosisSlicing
* diagnosis 1..*
//* diagnosis.diagnosis[x] MS
//* diagnosis.diagnosis[x] only CodeableConcept
//* diagnosis.diagnosis[x] from http://hl7.org/fhir/ValueSet/icd-10 (required)
* diagnosis.type MS
* diagnosis.type from PCTDiagnosisTypeVS
* diagnosis contains
   principal 1..1 MS and
   other 0..11 MS
* diagnosis[principal].type = $DIAGTYPECS#principal
* diagnosis[principal].sequence = 1
* diagnosis[principal].diagnosis[x] MS
* diagnosis[principal].diagnosis[x] only CodeableConcept
* diagnosis[principal].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[principal].packageCode MS
* diagnosis[principal].packageCode ^short = "For the Professional case this is the Provider GFE Grouper Methodology"
* diagnosis[principal].packageCode ^comment = "The GFE Grouper Methodology submitted by the provider."
* diagnosis[other].type = PCTDiagnosisType#other
* diagnosis[other].diagnosis[x] MS
* diagnosis[other].diagnosis[x] only CodeableConcept
* diagnosis[other].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[other].packageCode MS
* diagnosis[other].packageCode ^short = "For the Professional case this is the Provider GFE Grouper Methodology"
* diagnosis[other].packageCode ^comment = "The GFE Grouper Methodology submitted by the provider."

* insert ProcedureSlicing
//* procedure.procedure[x] MS
//* procedure.procedure[x] only CodeableConcept
* procedure.type MS
* procedure.type from PCTProcedureTypeVS
* procedure contains
   anesthesiaRelated 0..2 MS and
   other 0..24 MS
* procedure[anesthesiaRelated].type = PCTProcedureType#procedureRequiringAnesthesia
* procedure[anesthesiaRelated].procedure[x] MS
* procedure[anesthesiaRelated].procedure[x] only CodeableConcept
* procedure[anesthesiaRelated].procedure[x] from PCTProcedureSurgicalCodes

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
   rendering 0..2 MS and
   referring 0..1 MS
* careTeam[rendering].role = PCTCareTeamRole#rendering
//* careTeam[rendering] ^short = "May be used for the Institutional/Professional case"
* careTeam[rendering].qualification 1..1
* careTeam[rendering].qualification ^short = "Practitioner credential or specialization - must provide a taxonomy code for the Professional case"
* careTeam[referring].role = PCTCareTeamRole#referring
// * careTeam[referring] ^short = "May be used for the Institutional/Professional case"

* insert SupportingInfoSlicing
* supportingInfo.category from PCTSupportingInfoTypeVS (extensible)
* supportingInfo contains
   placeOfService 0..1 MS and
   serviceFacility 0..1 MS

* supportingInfo[placeOfService].category MS
* supportingInfo[placeOfService].category = PCTSupportingInfoType#cmspos "CMS Place of Service"
* supportingInfo[placeOfService].code 1..1 MS
* supportingInfo[placeOfService].code from PCTGFECMSPOS (required)

* supportingInfo[serviceFacility] ^short = "Service facility"
* supportingInfo[serviceFacility].category = PCTSupportingInfoType#servicefacility "Service Facility"
* supportingInfo[serviceFacility].category MS
* supportingInfo[serviceFacility].valueReference 1..1 MS
* supportingInfo[serviceFacility].valueReference only Reference(PCTOrganization)


* item 1..50 MS
* item.extension contains ReferralNumber named referralNumber 0..11 MS
* item.extension[referralNumber] ^short = "Referral Number"
* item.extension contains EstimatedDateOfService named estimatedDateOfService 0..1 MS
* item.extension[estimatedDateOfService] ^comment = "This could be the scheduled date of admission or service."
* item.extension contains GFEBillingProviderLineItemCtrlNum named gfeBillingProviderLineItemCtrlNum 0..1 MS

// * item.revenue MS
// * item.revenue from PCTGFEItemRevenueVS (example)
// * item.revenue ^short = "Revenue or cost center code - must provide a value for the Institutional case"

* item.modifier 0..4 MS
* item.modifier from PCTGFEItemCptHcpcsVS (required)

* item.productOrService from PCTGFEItemCptHcpcsVS (required)
* item.productOrService ^comment = "Must be provided with an actual CPT/HCPCS value. Can’t be null or N/A or data absent reason."

* item.unitPrice 1..1 MS
* item.net 0..1
* item.quantity 1..1 MS

* item.locationCodeableConcept 1..1 MS
* item.locationCodeableConcept from PCTGFECMSPOS (required)

* item.detail MS
* item.detail ^short = "Drug Identification Information"
//ISSUE: use FDANDCOrCompound or FDANationalDrugCode from CARIN BB??
* item.detail.productOrService from PCTGFEItemNDCVS (required)

* item.detail.quantity MS

* item.detail.extension contains CompoundDrugLinkingNumber named compoundDrugLinkingNumber 0..1 MS
* item.detail.extension[compoundDrugLinkingNumber] ^short = "Compound Drug Linking Number"
* item.detail.extension[compoundDrugLinkingNumber] ^definition = "Way of linking multiple components of a drug. Could be a prescription number or a identifier created by the  provider if no prescription number is available."
* item.detail.extension[compoundDrugLinkingNumber] ^comment = "Allows the sender to link multiple drug components together for billing purposes."

* total 1..1 MS
* total ^short = "Total GFE Charges Submitted"
