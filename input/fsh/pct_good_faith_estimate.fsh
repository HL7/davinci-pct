Profile: PCTGoodFaithEstimate
Parent: Claim
Id: davinci-pct-gfe
Title: "DaVinci PCT Good Faith Estimate"
Description: "PCT Good Faith Estimate is a profile..."

* insurer 1..1
* insurer only Reference(PCTOrganization)

//* item 1..* MS
//* diagnosis 1..* MS

* total 1..1
* total ^short = "Total GFE Charges Submitted"

//// Profile entension elements ////

// extension GFESender
* extension contains GFESubmitter named gfeSubmitter 1..1 MS

// Billing provider as Organization
* provider only Reference($USCorePractitionerRole)

//extension Claim.extension(InterTransIdentifier) GFE Service Identifier for Transmission Intermediaries
* extension contains InterTransIdentifier named interTransIdentifier 0..1 MS

//item.extension  GFE Coordinating Provider Line Item Control Number
* item.extension contains GFECoordinatingProviderLineItemControlNumber named gfeCoordinatingProviderLineItemControlNumber 0..1 MS

//item.detail.extension  Compound Drug Linking Number
* item.detail.extension contains CompoundDrugLinkingNumber named compoundDrugLinkingNumber 0..1 MS


//// Entension definitions ////
Extension: GFESubmitter
Description: "Submitter of GFE request"
* value[x] only Reference(PCTOrganization)

Extension: InterTransIdentifier
Description: "GFE Service Identifier for Transmission Intermediaries"
* value[x] only Identifier


Extension: GFECoordinatingProviderLineItemControlNumber
Description: "GFE Coordinating Provider Line Item Control Number"
* value[x] only Identifier

Extension: CompoundDrugLinkingNumber
Description: "Compound Drug Linking Number"
* value[x] only string
