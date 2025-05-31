
ValueSet: PCTOrgIdentifierTypeVS
Title: "PCT Organization Identifier Type Value Set"
Description: "Codes to specify the type of identifiers for organizations to indicate usage for a specific purpose. This ValueSet is currently locally defined; an external FHIR value set may be created through the HL7 Terminology (THO) process to replace this value set in a future version."
* codes from valueset $IdentifierTypeVS
* codes from system PCTOrgIdentifierTypeCS
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTOrganizationTypeVS
Title: "PCT Organization Type Value Set"
Description: "Codes to specify the type of entity involved in the PCT GFE process. This ValueSet is currently locally defined; an external FHIR value set may be created through the HL7 Terminology (THO) process to replace this value set in a future version."
* codes from valueset $OrganizationType
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

// ValueSet: PCTGFEProcessPriorityVS
// Title: "PCT GFE Process Priority Value Set"
// Description: "Codes to specify the urgency of processing the request"
// * codes from system $PROCPRIORITY
// * ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTDiagnosticCodes
Title: "PCT ICD-10 Diagnostic Codes"
Description: "ICD-10 Codes to specify the type of diagnosis"
* codes from system $ICD10CM
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTDiagnosisTypeVS
Title: "PCT Diagnosis Type Value Set"
Description: "Codes to specify the type of diagnosis"
* include $DIAGTYPECS#principal
* include $DIAGTYPECS#admitting
* codes from system PCTDiagnosisType
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTProcedureTypeVS
Title: "PCT Procedure Type Value Set"
Description: "Codes to specify the type of procedure"
* include $PROCTYPECS#primary
* codes from system PCTProcedureType
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTProcedureSurgicalCodes
Title: "PCT CMS HCPCS and AMA CPT Procedure Surgical Codes"
Description: "Combination of CMS HCPCS and AMA CPT codes to specify the type of surgical procedure"
//* include Combination of CMS HCPCS and AMA CPTs
* codes from system $HCPCS
* codes from valueset $AMACPTALL
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTGFETypeOfBillVS
Title: "PCT GFE NUBC Uniform Billing (UB-04) Type of Bill Value Set"
Description: "NUBC Uniform Billing (UB-04) codes to indicate the specific Type of Bill (TOB), e.g., hospital inpatient, outpatient, replacements, voids, etc. The first digit is a leading zero*. The fourth digit defines the frequency of the bill for the institutional and electronic professional claim."
* codes from system $TOBFL-04
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTGFEFrequencyVS
Title: "PCT GFE Frequency Code Value Set"
Description: "These codes in this value set are derived from the NUBC Uniform Billing (UB-04) Type of Bill (TOB) codes.  The fourth digit of the TOB code defines the frequency of the bill for the institutional and electronic professional claim."
* codes from system PCTGFEFrequency
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTGFEItemRevenueVS
Title: "PCT GFE NUBC Revenue Value Set"
Description: "NUBC UB-04 Revenue codes"
* codes from system $NUBCREVENUE
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTGFEItemCptHcpcsVS
Title: "PCT GFE Item CPT - HCPCS Value Set"
Description: "CPT - HCPCS codes to report medical procedures and services under public and private health insurance programs"
* codes from system $CPT
* codes from system $HCPCS
* ^copyright = "Current Procedural Terminology (CPT) is copyright 2020 American Medical Association. All rights reserved."
* ^experimental = false

ValueSet: PCTGFECMSPOS
Title: "PCT GFE CMS Place of Service Value Set"
Description: "CMS Place of Service codes"
* codes from system $CMSPOSCS
//* codes from system PCTGFEPOSCS
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTGFEItemNDCVS
Title: "PCT GFE Item NDC Value Set"
Description: "The FDA published list of NDC codes for finished drug products"
* codes from system $NDC
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTAdjudicationCategoryVS
Title: "PCT GFE Item Adjudication Value Set"
Description: "Value Set containing codes for the type of adjudication information provided."
* codes from system $ADJUDCS
* codes from system PCTAdjudicationCategoryCS
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTAdjudication   
Title: "PCT Adjudication Value Set"
Description: "Describes the various amount fields used when payers receive and adjudicate a claim.  It includes the values 
defined in http://terminology.hl7.org/CodeSystem/adjudication, as well as those defined in the C4BB Adjudication CodeSystem."
* $HL7AdjudicationCS#submitted 
* $HL7AdjudicationCS#copay 
* $HL7AdjudicationCS#eligible
* $HL7AdjudicationCS#deductible  
* $HL7AdjudicationCS#benefit 
* PCTAdjudication#coinsurance "Coinsurance" 
* PCTAdjudication#noncovered "Noncovered" 
* PCTAdjudication#memberliability "Member liability" 
* PCTAdjudication#discount "Discount" 
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTTotal   
Title: "PCT Total Value Set"
Description: "Describes the various amount fields used when payers receive and adjudicate a claim.  It includes the values 
defined in http://terminology.hl7.org/CodeSystem/adjudication, as well as those defined in the Network Status."
* codes from valueset PCTAdjudication 
* PCTNetworkStatusCS#innetwork "In Network"
* PCTNetworkStatusCS#outofnetwork "Out Of Network"
* PCTNetworkStatusCS#negotiated "Negotiated Service or Product"
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false


// ValueSet: PCTCoverageCopayTypeVS
// Title: "PCT Coverage Copay Type Value Set - locally defined for testing purpose; an external FHIR value set will be created // through the HL7 Terminology (THO) process to replace this value set"
// Description: "Codes for the classification of insurance coverage copay types for patient. This is an extension of the // // // CoverageCopayTypeCodes value set"
// Id: pct-coverage-copay-codes
// * codes from valueset $CoverageCopayTypeCodes
// * codes from system PCTCoverageCopayTypeCS
// * ^copyright = "This Valueset is not copyrighted."
// * ^experimental = false

ValueSet: PCTSubjectToMedicalMgmtReasonVS
Title: "PCT Subject-To-Medical-Management Reason Value Set"
Description: "Codes for the classification of subject-to-medical-management reasons"
//Id: pct-medical-mgmt-reason-codes
* codes from system PCTSubjectToMedicalMgmtReasonCS
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTSupportingInfoTypeVS
Title: "PCT Supporting Info Type Value Set"
Description: "Codes to specify the type of the supplied supporting information"
//* codes from valueset $C4BBSupportingInfoTypeVS
* codes from system PCTSupportingInfoType
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTCareTeamRoleVS
Title: "PCT Care Team Role Value Set"
Description: "Codes to specify the the functional roles of the care team members."
//* $CARETEAMROLECS#primary "Primary provider"
//* codes from system PCTCareTeamRole
* codes from system $CARETEAMROLECS
* http://terminology.hl7.org/CodeSystem/claimcareteamrole#supervisor "Supervisor"
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

ValueSet: PCTOrgContactPurposeTypeVS
Title: "PCT Organization Contact Purpose Value Set"
Description: "Codes for the classification of organization contact purposes. This ValueSet is currently locally defined; an external FHIR value set may be created through the HL7 Terminology (THO) process to replace this value set in a future version."
* codes from system $ContactPurposeCS
* codes from system PCTOrgContactPurposeType
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false

// TODO replace with THO defined VS
ValueSet: USClaimMedicalProductOrServiceCodes
Title: "Claim Medical Product or Service Value Set"
Description: "CPT - HCPCS - HIPPS - CDT codes to report medical procedures and services under public and private health insurance programs"
* codes from system $CPT
* codes from system $CDT
* codes from system $HCPCS
* codes from system $HIPPS
* $DAR#not-applicable "Not Applicable"
// * ^copyright = "This Valueset is not copyrighted."
* ^copyright = "Current Procedural Terminology (CPT) is copyright 2020 American Medical Association. All rights reserved."
* ^experimental = false

// TODO replace with THO VS
ValueSet: USClaimDRGCodes
Title: "US Claim DRG Codes"
Description: "US Claim Diagnosis Related Group Codes. All codes from MS-DRGs - AP-DRGs - APR-DRGs"
* codes from system MSDRG
* codes from system APDRG
* codes from system APRDRG 
* ^experimental = false

/*
ValueSet: PCTAEOBTypeVS
Title: "PCT Advance Explanation of Benefit Type Value Set"
Description: "Codes to specify the type of AEOB"
* include $ClaimTypeCS#institutional
* include $ClaimTypeCS#professional
* codes from system $ClaimTypeCS
* ^experimental = false
*/


ValueSet: AHANUBCPointOfOriginVS
Title: "NUBC Point Of Origin"
Description: "The UB-04 Data File contains the complete set of NUBC codes. Every code in the range of possible codes is accounted for sequentially. 

There are no gaps because all used and unused codes are identified. This value set consists of the following: 
* FL 15 - Point of Origin for Admission or Visit for Non-newborn
* FL 15 - Point of Origin for Admission or Visit for Newborn

These codes are used to convey the patient point of origin for an admission or visit and are the property of the American Hospital Association.

To obtain the underlying code systems, please see information [here](https://www.nubc.org/subscription-information)
Statement of Understanding between AHA and HL7 can be found [here](http://www.hl7.org/documentcenter/public/mou/AHA%20HL7%20SOU%202020%20AHA%20Fully%20Executed.pdf). In particular see sections 4.1d and 4.2.

The UB-04 Manual has a 12-month subscription period from June 30 through July 1.

For frequently asked questions, see here [here](https://www.nubc.org/nubc-faqs)"
* codes from system http://terminology.hl7.org/CodeSystem/AHANUBCPointOfOriginNonnewborn
* codes from system http://terminology.hl7.org/CodeSystem/AHANUBCPointOfOriginNewborn 
* ^experimental = false



ValueSet: AHANUBCPriorityTypeOfAdmissionOrVisitVS
Title: "NUBC Priority (Type) of Admission or Visit"
Description: "The UB-04 Data File contains the complete set of NUBC codes. Every code in the range of possible codes is accounted for sequentially. There are no gaps because all used and unused codes are identified.

This value set consists of the following:

* FL 14 - Priority (Type) of Admission or Visit

These codes are used to convey the priority of an admission or visit and are the property of the American Hospital Association.

To obtain the underlying code systems, please see information [here](https://www.nubc.org/subscription-information)

Statement of Understanding between AHA and HL7 can be found [here](http://www.hl7.org/documentcenter/public/mou/AHA%20HL7%20SOU%202020%20AHA%20Fully%20Executed.pdf). In particular see sections 4.1d and 4.2.

The UB-04 Manual has a 12-month subscription period from June 30 through July 1.

For frequently asked questions, see here [here](https://www.nubc.org/nubc-faqs)

This Code system is referenced in the content logical definition of the following value sets:

This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

This code system https://www.nubc.org/CodeSystem/PriorityTypeOfAdmitOrVisit defines many codes, but they are not represented here"
* codes from system http://terminology.hl7.org/CodeSystem/AHANUBCPriorityTypeOfAdmitOrVisit 
* ^experimental = false

ValueSet: PCTPayerProviderNetworkStatusVS
Title: "PCT Payer Provider Network Status"
Description: "Indicates the Provider network status with the Payer as of the effective date of service or admission."
//* include PCTNetworkStatusCS#innetwork
//* include PCTNetworkStatusCS#outofnetwork
* codes from system PCTNetworkStatusCS
* ^experimental = false

ValueSet: PCTPayerBenefitPaymentStatusVS
Title: "PCT Payer Benefit Payment Status"
Description: "Indicates the in network or out of network payment status of the claim or line item."
//* include PCTNetworkStatusCS#innetwork
//* include PCTNetworkStatusCS#outofnetwork
//* include PCTNetworkStatusCS#other
* codes from system PCTNetworkStatusCS
* ^experimental = false

ValueSet: PCTAdjustmentReasonVS
Title: "PCT Adjustment Reason"
Description: "Codes indicating reasons why a claim or line item is adjusted."
* codes from system https://x12.org/codes/claim-adjustment-reason-codes
* codes from system https://x12.org/codes/remittance-advice-remark-codes
* ^experimental = false

ValueSet: PCTAEOBProcessNoteVS
Title: "PCT AEOB Process Note Types"
Description: "Indicates the type of .processNote for AEOB."
* include PCTAEOBProcessNoteCS#disclaimer
* include PCTAEOBProcessNoteCS#adjudication-note
* include PCTAEOBProcessNoteCS#conditional
* include PCTAEOBProcessNoteCS#other
* codes from system PCTAEOBProcessNoteCS
* ^experimental = false

ValueSet: PCTFinancialTypeVS
Title: "PCT Financial Type Value Set"
Description: "Financial Type codes for benefitBalance.financial.type."
* ^experimental = false
* codes from system PCTFinancialType

ValueSet: PCTBenefitBalanceCategoryVS
Title: "PCT benefitBalance.category codes"
Description: "Category codes for PCT benefitBalance.category from X12 service type."
* ^experimental = false
* codes from system https://x12.org/codes/service-type-codes

ValueSet: ICD10ProcedureCodes
Title: "ICD-10 Procedure Codes"
Description: "Procedure Codes from https://www.cms.gov/Medicare/Coding/ICD10"
* ^experimental = false
* codes from system http://www.cms.gov/Medicare/Coding/ICD10



ValueSet: PCTCoordinationTaskStatusCodes
Title: "GFE Coordination Task Status Codes"
Description: "Codes allowed for a GFE Coordination Task status"
* ^experimental = false
* include $HL7TaskStatus#draft
* include $HL7TaskStatus#requested
* include $HL7TaskStatus#in-progress
* include $HL7TaskStatus#cancelled
* include $HL7TaskStatus#on-hold
* include $HL7TaskStatus#failed
* include $HL7TaskStatus#completed
* include $HL7TaskStatus#entered-in-error


// TODO !!! Provide more details on which each request means (definition)
ValueSet: PCTContributorTaskStatusCodes
Title: "Provider GFE Contributor Task Status Codes"
Description: "Codes allowed for a GFE Contributor-specific service task status"
* ^experimental = false
* include $HL7TaskStatus#draft
* include $HL7TaskStatus#requested
* include $HL7TaskStatus#received
* include $HL7TaskStatus#accepted
* include $HL7TaskStatus#rejected
* include $HL7TaskStatus#failed
* include $HL7TaskStatus#completed
* include $HL7TaskStatus#entered-in-error


ValueSet: PCTGFERequestTypeVS
Title: "PCT GFE Request Type Codes ValueSet"
Description: "Codes for the Good Faith Estimate (GFE) request origination types."
* ^experimental = false
* include PCTGFERequestTypeCSTemporaryTrialUse#scheduled-request
* include PCTGFERequestTypeCSTemporaryTrialUse#nonscheduled-request

ValueSet: PCTCoordinationTaskStatusReasonCodes
Title: "PCT GFE Request Coordination Task Status Reason Codes ValueSet"
Description: "Defining codes for GFE Coordination Task status reason types."
* ^experimental = false
* include PCTTaskStatusReasonCSTemporaryTrialUse#fulfilled
* include PCTTaskStatusReasonCSTemporaryTrialUse#time-limit-reached
* include PCTTaskStatusReasonCSTemporaryTrialUse#no-longer-needed
* include PCTTaskStatusReasonCSTemporaryTrialUse#service-cancelled
* include PCTTaskStatusReasonCSTemporaryTrialUse#requires-new-request
* include PCTTaskStatusReasonCSTemporaryTrialUse#patient-declined

ValueSet: PCTContributorTaskStatusReasonCodes
Title: "PCT GFE Contributor Task Status Reason Codes ValueSet"
Description: "Defining codes for defining GFE request GFE contributor task status reason types."
* ^experimental = false
* include PCTTaskStatusReasonCSTemporaryTrialUse#fulfilled
* include PCTTaskStatusReasonCSTemporaryTrialUse#schedule
* include PCTTaskStatusReasonCSTemporaryTrialUse#service-not-provided
* include PCTTaskStatusReasonCSTemporaryTrialUse#time-limit-reached
* include PCTTaskStatusReasonCSTemporaryTrialUse#no-longer-needed
* include PCTTaskStatusReasonCSTemporaryTrialUse#service-cancelled
* include PCTTaskStatusReasonCSTemporaryTrialUse#requires-new-request
* include PCTTaskStatusReasonCSTemporaryTrialUse#patient-declined


ValueSet: PCTTaskBusinessStatusCodes
Title: "PCT GFE Request Task Business Status ValueSet"
Description: "Codes for defining  GFE request task business status types."
* ^experimental = false
* PCTTaskBusinessStatusCSTemporaryTrialUse#closed

ValueSet: PCTTaskAttachmentContentType
Title: "US Claim DRG Codes"
Description: "US Claim Diagnosis Related Group Codes. All codes from MS-DRGs - AP-DRGs - APR-DRGs"
* $MIMETypes#application/fhir+json
* $MIMETypes#application/fhir+xml
* ^experimental = false


ValueSet: PCTGFETaskRelationship
Title: "PCT GFE Task Relationship"
Description: "Code expressing a relationship that the source Task has with the referenced GFE Task has with the source GFE Task. "
* $v3ActRelationship#PREV
* $v3ActRelationship#RPLC
* ^experimental = false