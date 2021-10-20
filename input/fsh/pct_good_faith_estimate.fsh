Profile: PCTGoodFaithEstimate
Parent: Claim
Id: davinci-pct-gfe
Title: "PCT Good Faith Estimate"
Description: "PCT Good Faith Estimate is a profile for capturing submission data needed to be processed by a payer for the creation of an Advanced EOB."

//// Profile entension elements ////
* extension contains GFESubmitter named gfeSubmitter 1..1 MS
* extension[gfeSubmitter] ^short = "The scheduling entity that submits the GFE to provide a collection of services to a payer for the creation of an Advanced EOB"
* extension contains GFEAssignedServiceIdentifier named gfeAssignedServiceIdentifier 1..1 MS
* extension[gfeAssignedServiceIdentifier] ^short = "Provider's GFE Assigned Service Identifier"
* extension contains GFEServiceLinkingInfo named gfeServiceLinkingInfo 0..1 MS
* extension[gfeServiceLinkingInfo] ^short = "GFE Service Linking Information"
* extension contains ReferralNumber named referralNumber 0..1 MS
* extension[referralNumber] ^short = "Referral Number"
* extension contains ProviderEventMethodology named providerEventMethodology 0..1 MS
* extension[providerEventMethodology] ^short = "Provider Event Methodology - a way for determining the number of providers involved"
* extension contains InterTransIdentifier named interTransIdentifier 0..1 MS
* extension[interTransIdentifier] ^short = "GFE Service Identifier for Transmission Intermediaries"

* patient MS
* patient only Reference(PCTPatient)

// Billing provider--get Taxonomy Code and Organization from PractitionerRole
* provider only Reference(PCTPractitionerRole)
* provider ^short = "Billing provider - party responsible for the GFE"

* insurer 1..1
* insurer only Reference(PCTOrganization)

* payee MS
* payee.party only Reference(PCTPractitioner or PCTOrganization)
//TODO: create vS for payee.type like https://build.fhir.org/ig/HL7/carin-bb/ValueSet-C4BBPayeeType.html
//TODO: for now put in a placeholder statement about formal VS to be created...

* facility MS
* facility only Reference(PCTLocation)

//* supportingInfo.category from $C4BBSupportingInfoType (extensible)

* insurance.coverage MS
* insurance.coverage only Reference(PCTCoverage)
* insurance.preAuthRef MS

* insert Diagnosislicing
* diagnosis 1..*
//* diagnosis.diagnosis[x] MS
//* diagnosis.diagnosis[x] only CodeableConcept
//* diagnosis.diagnosis[x] from http://hl7.org/fhir/ValueSet/icd-10 (required)
* diagnosis.type MS
* diagnosis.type from PCTDiagnosisTypeVS
* diagnosis contains
   principal 1..1 MS
* diagnosis[principal].type = $DIAGTYPECS#principal
* diagnosis[principal].sequence = 1
* diagnosis[principal].diagnosis[x] MS
* diagnosis[principal].diagnosis[x] only CodeableConcept
* diagnosis[principal].diagnosis[x] from http://hl7.org/fhir/ValueSet/icd-10 (required)
* diagnosis[principal].packageCode MS
* diagnosis[principal].packageCode ^short = "For PCT it is a bundle code to specify the Provider Grouper Methodology."
* diagnosis[principal].packageCode ^comment = "For PCT it is a bundle code to specify the Provider Grouper Methodology."

* insert Procedurelicing
//* procedure.procedure[x] MS
//* procedure.procedure[x] only CodeableConcept
* procedure.type MS
* procedure.type from PCTProcedureTypeVS
* procedure contains
   primary 0..1 MS
* procedure[primary].type = $PROCTYPECS#primary
* procedure[primary].sequence = 1
* procedure[primary].procedure[x] MS
* procedure[primary].procedure[x] only CodeableConcept

* careTeam 0..* MS
* careTeam.provider 1..1 MS
// ISSUE: does the qualification code give the taxonomy code? If so, no need to have PractitionerRole??
* careTeam.provider only Reference(PCTPractitioner or PCTOrganization)
//* careTeam.provider ^short = ""
* careTeam.role 1..1 MS
* careTeam.role from PCTCareTeamRoleVS
* careTeam.qualification 1..1 MS
* careTeam.qualification from $USCSPECIALTY (required)

* insert SupportingInfoSlicing
* supportingInfo.category from PCTSupportingInfoTypeVS (extensible)
* supportingInfo contains
   placeOfService 0..1 MS and
   typeOfBill 0..1 MS
* supportingInfo[placeOfService].category MS
* supportingInfo[placeOfService].category = PCTSupportingInfoType#cmspos "CMS Place of Service"
* supportingInfo[placeOfService].code 1..1 MS
* supportingInfo[placeOfService].code from $CMSPOSVS (required)
* supportingInfo[typeOfBill].category MS
* supportingInfo[typeOfBill].category = PCTSupportingInfoType#typeofbill "Type of Bill"
* supportingInfo[typeOfBill].code 1..1 MS
* supportingInfo[typeOfBill].code from PCTGFETypeOfBillVS (required)

* item 1..* MS
* item.extension contains EstimatedDateOfService named estimatedDateOfService 0..1 MS
* item.extension[estimatedDateOfService] ^comment = "This could be the scheduled date of admission or service."
* item.extension contains GFEBillingProviderLineItemCtrlNum named gfeBillingProviderLineItemCtrlNum 0..1 MS

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

* item.location[x]  from $CMSPOSVS (required)

* item.encounter MS

* item.detail MS
* item.detail ^short = "Drug Pricing Information"
//ISSUE: use FDANDCOrCompound or FDANationalDrugCode from CARIN BB??
* item.detail.productOrService from PCTGFEItemNDCVS (required)

* item.detail.quantity MS

// * item.detail.extension contains ProductOrServiceBillingCode named productOrServiceBillingCode 0..1 MS
// * item.detail.extension contains ProductOrServiceOtherCharge named productOrServiceOtherCharge 0..1 MS
* item.detail.extension contains CompoundDrugLinkingNumber named compoundDrugLinkingNumber 0..1 MS

* total 1..1
* total ^short = "Total GFE Charges Submitted"
