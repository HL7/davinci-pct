Profile: PCTGoodFaithEstimate
Parent: Claim
Id: davinci-pct-gfe
Title: "PCT Good Faith Estimate"
Description: "PCT Good Faith Estimate is a profile ..."

//// Profile entension elements ////
* extension contains GFESubmitter named gfeSubmitter 1..1 MS
* extension contains GFEAssignedServiceIdentifier named gfeAssignedServiceIdentifier 1..1 MS
* extension contains GFEServiceLinkingInfo named GFEServiceLinkingInfo 0..1 MS
* extension contains ReferralNumber named referralNumber 0..1 MS
* extension contains ProviderEventMethodology named providerEventMethodology 0..1 MS
* extension contains InterTransIdentifier named interTransIdentifier 0..1 MS

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
* diagnosis contains
   principal 1..1 MS
* diagnosis[principal].type = #principal
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
* procedure contains
   principal 0..1 MS
* procedure[principal].type = #principal
* procedure[principal].sequence = 1
* procedure[principal].procedure[x] MS
* procedure[principal].procedure[x] only CodeableConcept

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
* supportingInfo[typeOfBill].category = $C4BBSupportingInfoType#typeofbill "Type of Bill"
* supportingInfo[typeOfBill].code 1..1 MS
* supportingInfo[typeOfBill].code from $AHANUBCTypeOfBill (required)

* item 1..* MS
* item.extension contains EstimatedDateOfService named estimatedDateOfService 0..1 MS
* item.extension contains GFECoordinatingProviderLineItemCtrlNum named gfeCoordinatingProviderLineItemCtrlNum 0..1 MS

* item.revenue MS
* item.revenue from $AHANUBCRevenueCodes (required)

* item.modifier 0..4 MS
* item.modifier from $AMACPTCMSHCPCSModifiers (required)

* item.productOrService from $C4BBEOBInstitutionalProcedureCodes (required)
// Need to make item.productOrService required when item.revenue is provided ??
//* item.productOrService obeys EOB-out-inst-item-productorservice
//* item.productOrService ^comment = "Put the comment here for item.productOrService here"

* item.net 1..1 MS
* item.quantity MS

* item.encounter MS

* item.detail MS
//ISSUE: use FDANDCOrCompound or FDANationalDrugCode from CARIN BB??
* item.detail.productOrService from $FDANationalDrugCode (required)
* item.detail.quantity MS

// * item.detail.extension contains ProductOrServiceBillingCode named productOrServiceBillingCode 0..1 MS
// * item.detail.extension contains ProductOrServiceOtherCharge named productOrServiceOtherCharge 0..1 MS
* item.detail.extension contains CompoundDrugLinkingNumber named compoundDrugLinkingNumber 0..1 MS

* total 1..1
* total ^short = "Total GFE Charges Submitted"
