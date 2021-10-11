
CodeSystem: PCTOrgIdentifierTypeCS
Title: "PCT Organization Identifier Type Code System"
Description: "Identifier Type codes for defining the type of identifier payers and providers assign to organizations"
* #ETIN "Electronic Transmitter Identification Number" "Electronic Transmitter Identification Number"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTOrganizationTypeCS
Title: "PCT Organization Type Code System"
Description: "Organization Type codes for describing the type of organizations involved in the PCT GFE process"
* #Institutional-submitter "Institutional GFE Submitter" "Institutional GFE Submitter"
* #professional-submitter "Professional GFE Submitter" "Professional GFE Submitter"
* #billing-provider "Billing Provider" "Billing Provider"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTCoverageCopayTypeCS
Title: "PCT Coverage Copay Type Code System"
Id: pct-coverage-copay-type
Description: "Defining codes for the classification of insurance coverage copay types for patient"
* #pharmacy-deductible "Pharmacy-Deductible" "The accumulated amount of patient payment before the coverage begins to pay for medicines."
* #pharmacy-maxoutofpocket "Pharmacy-Maximum Out Of Pocket" "The maximum amout of payment for medicines which a patient, or family, is expected to incur - typically annually."
* ^copyright = "This CodeSystem is not copyrighted."

// CodeSystem: PCTGFEBillingCS
// Title: "PCT GFE Billing Code System"
// Description: "Claim Billing Code System"
// * #salesTax "Sales Tax" "The billing is for sales tax"
// * #other "Other Charge"  "The billing is for other charge"
// * ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTSubjectToMedicalMgmtReasonCS
Title: "PCT Subject-To-Medical-Management Reason Code System"
Id: pct-medical-mgmt-condition-type
Description: "Defining codes for the classification of subject-to-medical-management reason types"
* #concurrent-review "Concurrent Review" "Concurrent Review"
* #prior-auth "Prior Authorization" "Prior Authorization"
* #step-therapy "Step Therapy" "Step Therapy"
* #fail-first "Fail-First" "Fail-First"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTSupportingInfoType
Title: "PCT GFE Supporting Info Type Code System"
Description: "Defining codes for the classification of the supplied supporting information"
* #cmspos "CMS Place of Service" "Place of Service Codes are two-digit codes placed on health care professional claims to indicate the setting in which a service was provided. The Centers for Medicare & Medicaid Services (CMS) maintain POS codes used throughout the health care industry."
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTCareTeamRole
Title: "PCT Care Team Role"
Description: "PCT code system for defining the functional roles of the care team members."
* #attending "Attending provider" "The attending provider"
* #referring "Referring provider" "The referring provider"
* #operating "Operating physician" "The operating physician"
* #otheroperating "Other Operating physician" "The other operating physician"
* #rendering "Rendering provider" "The rendering/performing provider"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTOrgContactPurposeType
Title: "PCT Organization Contact Purpose Type Code System"
Description: "Organization Contact Purpose Type Code System"
* #GFE-RELATED "GFE-related" "Contact details for dealing with issues related to Good Faith Estimate (GFE)."
* ^copyright = "This CodeSystem is not copyrighted."