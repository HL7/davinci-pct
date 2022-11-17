
ValueSet: PCTOrgIdentifierTypeVS
Title: "PCT Organization Identifier Type Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes to specify the type of identifiers for organizations to indicate usage for a specific purpose"
* codes from valueset $IdentifierTypeVS
* codes from system PCTOrgIdentifierTypeCS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTOrganizationTypeVS
Title: "PCT Organization Type Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes to specify the type of entity involved in the PCT GFE process"
* codes from valueset $OrganizationType
* ^copyright = "This Valueset is not copyrighted."

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

ValueSet: PCTDiagnosisTypeVS
Title: "PCT Diagnosis Type Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes to specify the type of diagnosis"
* include $DIAGTYPECS#principal
* include $DIAGTYPECS#admitting
* codes from system PCTDiagnosisType
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTProcedureTypeVS
Title: "PCT Procedure Type Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes to specify the type of procedure"
* include $PROCTYPECS#primary
* codes from system PCTProcedureType
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTProcedureSurgicalCodes
Title: "PCT CMS HCPCS and AMA CPT Procedure Surgical Codes"
Description: "Combination of CMS HCPCS and AMA CPT codes to specify the type of surgical procedure"
//* include Combination of CMS HCPCS and AMA CPTs
* codes from system $HCPCS
* codes from valueset $AMACPTALL
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTGFETypeOfBillVS
Title: "PCT GFE NUBC Uniform Billing (UB-04) Type of Bill Value Set"
Description: "NUBC Uniform Billing (UB-04) codes to indicate the specific Type of Bill (TOB), e.g., hospital inpatient, outpatient, replacements, voids, etc. The first digit is a leading zero*. The fourth digit defines the frequency of the bill for the institutional and electronic professional claim."
* codes from system $TOBFL-04
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTGFEItemRevenueVS
Title: "PCT GFE NUBC Revenue Value Set"
Description: "NUBC UB-04 Revenue codes"
* codes from system $NUBCREVENUE
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTGFEItemCptHcpcsVS
Title: "PCT GFE Item CPT - HCPCS Value Set"
Description: "CPT - HCPCS codes to report medical procedures and services under public and private health insurance programs"
* codes from system $CPT
* codes from system $HCPCS
* ^copyright = "Current Procedural Terminology (CPT) is copyright 2020 American Medical Association. All rights reserved."

ValueSet: PCTGFECMSPOS
Title: "PCT GFE CMS Place of Service Value Set"
Description: "CMS Place of Service codes"
* codes from system $CMSPOSCS
//* codes from system PCTGFEPOSCS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTGFEItemNDCVS
Title: "PCT GFE Item NDC Value Set"
Description: "The FDA published list of NDC codes for finished drug products"
* codes from system $NDC
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTAdjudicationCategoryVS
Title: "PCT GFE Item Adjudication Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Value Set containing codes for the type of adjudication information provided."
* codes from system $ADJUDCS
* codes from system PCTAdjudicationCategoryCS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTCoverageCopayTypeVS
Title: "PCT Coverage Copay Type Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes for the classification of insurance coverage copay types for patient. This is an extension of the CoverageCopayTypeCodes value set"
Id: pct-coverage-copay-codes
* codes from valueset $CoverageCopayTypeCodes
* codes from system PCTCoverageCopayTypeCS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTSubjectToMedicalMgmtReasonVS
Title: "PCT Subject-To-Medical-Management Reason Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes for the classification of subject-to-medical-management reasons"
//Id: pct-medical-mgmt-reason-codes
* codes from system PCTSubjectToMedicalMgmtReasonCS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTSupportingInfoTypeVS
Title: "PCT Supporting Info Type Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes to specify the type of the supplied supporting information"
//* codes from valueset $C4BBSupportingInfoTypeVS
* codes from system PCTSupportingInfoType
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTCareTeamRoleVS
Title: "PCT Care Team Role Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes to specify the the functional roles of the care team members."
* $CARETEAMROLECS#primary "Primary provider"
* codes from system PCTCareTeamRole
* http://terminology.hl7.org/CodeSystem/claimcareteamrole#supervisor "Supervisor"
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTOrgContactPurposeTypeVS
Title: "PCT Organization Contact Purpose Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes for the classification of organization contact purposes"
* codes from system $ContactPurposeCS
* codes from system PCTOrgContactPurposeType
* ^copyright = "This Valueset is not copyrighted."

// TODO replace with THO defined VS
ValueSet: USClaimMedicalProductOrServiceCodes
Title: "Claim Medical Product or Service Value Set"
Description: "CPT - HCPCS - HIPPS codes to report medical procedures and services under public and private health insurance programs "
* codes from system $CPT
* codes from system $HCPCS
* codes from system $HIPPS
* $DAR#not-applicable "Not Applicable"
* ^copyright = "This Valueset is not copyrighted."

// TODO replace with THO VS
ValueSet: USClaimDRGCodes
Title: "US Claim DRG Codes"
Description: "US Claim Diagnosis Related Group Codes. All codes from MS-DRGs - AP-DRGs - APR-DRGs"
* codes from system MSDRG
* codes from system APDRG
* codes from system APRDRG 

ValueSet: PCTAEOBTypeVS
Title: "PCT Advance Explanation of Benefit Type Value Set"
Description: "Codes to specify the type of AEOB"
* include $ClaimTypeCS#institutional
* include $ClaimTypeCS#professional
* codes from system $ClaimTypeCS


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

ValueSet: PCTPayerProviderNetworkStatusVS
Title: "PCT Payer Provider Network Status"
Description: "Indicates the Provider network status with the Payer as of the effective date of service or admission."
* include PCTNetworkStatusCS#innetwork
* include PCTNetworkStatusCS#outofnetwork
* codes from system PCTNetworkStatusCS

ValueSet: PCTPayerBenefitPaymentStatusVS
Title: "PCT Payer Benefit Payment Status"
Description: "Indicates the in network or out of network payment status of the claim or line item."
* include PCTNetworkStatusCS#innetwork
* include PCTNetworkStatusCS#outofnetwork
* include PCTNetworkStatusCS#other
* codes from system PCTNetworkStatusCS

ValueSet: PCTAdjustmentReasonVS
Title: "PCT Adjustment Reason"
Description: "Codes indicating reasons why a claim or line item is adjusted."
* codes from system https://x12.org/codes/claim-adjustment-reason-codes
* codes from system https://x12.org/codes/remittance-advice-remark-codes