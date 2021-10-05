
ValueSet: PCTOrgIdentifierTypeVS
Title: "PCT Organization Identifier Type Value Set"
Description: "Codes to specify the type of identifiers for organizations to indicate usage for a specific purpose"
* include codes from valueset $IdentifierTypeVS
* include codes from system PCTOrgIdentifierTypeCS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTOrganizationTypeVS
Title: "PCT Organization Type Value Set"
Description: "Codes to specify the type of entity involved in the PCT GFE process"
* include codes from valueset $OrganizationType
* include codes from system PCTOrganizationTypeCS
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTGFEBillingCodeVS
Title: "PCT GFE Billing Code Value Set"
Description: "GFE billing codes ..."
* codes from system PCTGFEBillingCS

ValueSet: PCTCoverageCopayTypeVS
Title: "PCT Coverage Copay Type Value Set"
Description: "Codes for the classification of insurance coverage copay types for patient. This is an extension of the CoverageCopayTypeCodes value set"
Id: pct-coverage-copay-codes
* include codes from valueset $CoverageCopayTypeCodes
* include codes from system PCTCoverageCopayTypeCS

ValueSet: PCTSubjectToMedicalMgmtConditionVS
Title: "PCT Subject-To-Medical-Management Condition Value Set"
Description: "Codes for the classification of subject-to-medical-management conditions"
Id: pct-medical-mgmt-condition-codes
* codes from system PCTSubjectToMedicalMgmtConditionCS

ValueSet: PCTSupportingInfoTypeVS
Title: "PCT Supporting Info Type Value Set"
Description: "Codes to specify the type of the supplied supporting information"
* include codes from valueset $C4BBSupportingInfoTypeVS
* include codes from system PCTSupportingInfoType
* ^copyright = "This Valueset is not copyrighted."

ValueSet: PCTInstitutionalCareTeamRoleVS
Title: "PCT Institutional Care Team Role Value Set"
Description: "Codes to specify the the functional roles of the care team members."
* $CARETEAMROLECS#primary "Primary provider"
* include codes from system PCTInstitutionalCareTeamRole
* ^copyright = "This Valueset is not copyrighted."