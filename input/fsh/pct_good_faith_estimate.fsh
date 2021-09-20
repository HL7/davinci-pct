Profile: PCTGoodFaithEstimate
Parent: Claim
Id: davinci-pct-gfe
Title: "PCT Good Faith Estimate"
Description: "PCT Good Faith Estimate is a profile ..."

//// Profile entension elements ////

// extension GFESubmitter
* extension contains GFESubmitter named gfeSubmitter 1..1 MS

// Billing provider as Organization
* provider only Reference($USCorePractitionerRole)

* insurer 1..1
* insurer only Reference(PCTOrganization)

* insurance MS
* insurance.coverage only Reference(PCTCoverage)
* insurance.preAuthRef MS

* item MS
//* item 1..* MS
//* item.extension contains PCTProposedDateOfService named proposedDateOfService 1..1 MS
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

//item.extension  GFE Coordinating Provider Line Item Control Number
* item.extension contains GFECoordinatingProviderLineItemControlNumber named gfeCoordinatingProviderLineItemControlNumber 0..1 MS

* item.detail MS
//ISSUE: use FDANDCOrCompound or FDANationalDrugCode from CARIN BB??
* item.detail.productOrService from $FDANationalDrugCode (required)
* item.detail.quantity MS

//item.detail.extension  Compound Drug Linking Number
* item.detail.extension contains CompoundDrugLinkingNumber named compoundDrugLinkingNumber 0..1 MS


* total 1..1
* total ^short = "Total GFE Charges Submitted"


//extension Claim.extension(InterTransIdentifier) GFE Service Identifier for Transmission Intermediaries
* extension contains InterTransIdentifier named interTransIdentifier 0..1 MS
