
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
* codes from system PCTOrganizationTypeCS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTDiagnosisTypeVS
Title: "PCT Diagnosis Type Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Sample Adjudication codes to indicate the amounts eligible under the plan, the amount of benefit, copays etc."
* include $DIAGTYPECS#principal
* include $DIAGTYPECS#admitting
* codes from system PCTDiagnosisType
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTProcedureTypeVS
Title: "PCT Procedure Type Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Sample Adjudication codes to indicate the amounts eligible under the plan, the amount of benefit, copays etc."
* include $PROCTYPECS#primary
* codes from system PCTProcedureType
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTGFETypeOfBillVS
Title: "PCT GFE Type Of Bill Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes to indicate the specific Type of Bill (TOB), e.g., hospital inpatient, outpatient, replacements, voids, etc. The first digit is a leading zero*. The fourth digit defines the frequency of the bill for the institutional and electronic professional claim."
* codes from system $TOBFL-04
* codes from system PCTGFETypeOfBillCS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTGFEItemRevenueVS
Title: "PCT GFE Item Revenue Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Sample Revenue Center codes"
* codes from valueset $REVENUEVS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTGFEItemCptHcpcsVS
Title: "PCT GFE Item CPT and HCPCS Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes to report medical procedures and services under public and private health insurance programs"
* codes from system $CPT
* codes from system $HCPCS
* codes from system PCTGFEItemCptHcpcsCS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTGFEItemNDCVS
Title: "PCT GFE Item NDC Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "The FDA published list of NDC codes for finished drug products"
* codes from system $NDC
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTGFEItemAdjudicationVS
Title: "PCT GFE Item Adjudication Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Sample Adjudication codes to indicate the amounts eligible under the plan, the amount of benefit, copays etc."
* codes from valueset $ADJUDVS
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
* codes from valueset $C4BBSupportingInfoTypeVS
* codes from system PCTSupportingInfoType
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTCareTeamRoleVS
Title: "PCT Care Team Role Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes to specify the the functional roles of the care team members."
* $CARETEAMROLECS#primary "Primary provider"
* codes from system PCTCareTeamRole
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTOrgContactPurposeTypeVS
Title: "PCT Organization Contact Purpose Value Set - locally defined for testing purpose; an external FHIR value set will be created through the HL7 Terminology (THO) process to replace this value set"
Description: "Codes for the classification of organization contact purposes"
* codes from system $ContactPurposeCS
* codes from system PCTOrgContactPurposeType
* ^copyright = "This Valueset is not copyrighted."