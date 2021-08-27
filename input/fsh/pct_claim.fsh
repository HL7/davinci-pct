Profile: PCTClaim
Parent: Claim
Id: davinci-pct-claim
Title: "DaVinci PCT Claim"
Description: "PCT Claim"

// Billing provider as Organization
* provider only Reference(PractitionerRole)

// extension GFESender
* extension contains GFESubmitter named gfeSubmitter 1..1 MS

//extension Claim.extension(InterTransIdentifier) GFE Service Identifier for Transmission Intermediaries
* extension contains InterTransIdentifier named interTransIdentifier 0..1

//item.extension  GFE Coordinating Provider Line Item Control Number
* extension contains GFECoordinatingProviderLineItemControlNumber named gfeCoordinatingProviderLineItemControlNumber 0..1

//item.detail.extension  Compound Drug Linking Number
* item.detail.extension contains CompoundDrugLinkingNumber named compoundDrugLinkingNumber 0..1

// for sale tax billing codes using new value set 
* item.detail.productOrService from PCTClaimBillingCode (extensible)

Extension: GFESubmitter
Description: "Submitter of GFE request"
* value[x] only Reference(Organization)

Extension: InterTransIdentifier
Description: "GFE Service Identifier for Transmission Intermediaries"
* value[x] only Identifier


Extension: GFECoordinatingProviderLineItemControlNumber
Description: "GFE Coordinating Provider Line Item Control Number"
* value[x] only Identifier

Extension: CompoundDrugLinkingNumber
Description: "Compound Drug Linking Number"
* value[x] only string
