
CodeSystem: PCTOrgIdentifierTypeCS
Title: "PCT Organization Identifier Type Code System"
Description: "Identifier Type codes for defining the type of identifier payers and providers assign to organizations"
* ^caseSensitive = true
* #ETIN "Electronic Transmitter Identification Number" "Electronic Transmitter Identification Number"
* #payerid "Payer ID" "Payer ID used in HIPAA covered claims submission transactions"
* #naiccode "NAIC Code" "An identifier assigned to licensed and authorized insurance companies by the National Association of Insurance Commissioners (NAIC)"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTCoverageCopayTypeCS
Title: "PCT Coverage Copay Type Code System"
//Id: pct-coverage-copay-type
Description: "Defining codes for the classification of insurance coverage copay types for patient"
* ^caseSensitive = true
* #pharmacy-deductible "Pharmacy-Deductible" "The accumulated amount of patient payment before the coverage begins to pay for medicines."
* #pharmacy-maxoutofpocket "Pharmacy-Maximum Out Of Pocket" "The maximum amout of payment for medicines which a patient, or family, is expected to incur - typically annually."
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTDiagnosisType
Title: "PCT Diagnosis Type"
Description: "Defining codes for the classification of diagnosis types"
* ^caseSensitive = true
* #patientReasonForVisit "Patient's Reason for Visit" "Identifies the patient's reason for the outpatient institutional visit"
//* #externalCauseOfInjury "External Cause of Injury"	  "Required when an external cause of injury is needed to describe the injury"
* #other "Other" "Required when other conditions coexist or develop subsequently during the treatment"
//* #secondary "Secondary" "Required when necessary to report additional diagnoses on professional and non-clinician claims"
* #externalCauseOfInjury "External Cause of Injury" "Required when an external cause of injury is needed to describe the injury"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTProcedureType
Title: "PCT Procedure Type"
Description: "Defining codes for the classification of procedure types"
* ^caseSensitive = true
* #principal "Pricipal" "Principal procedure information"
* #procedureRequiringAnesthesia  "Surgical procedure requiring anesthesia" "Identifies the surgical procedure requiring anesthesia"
* #other "Other" "Other procedure information"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTSubjectToMedicalMgmtReasonCS
Title: "PCT Subject-To-Medical-Management Reason Code System"
//Id: pct-medical-mgmt-condition-type
Description: "Defining codes for the classification of subject-to-medical-management reason types"
* ^caseSensitive = true
* #concurrent-review "Concurrent Review" "Concurrent Review"
* #prior-auth "Prior Authorization" "Prior Authorization"
* #step-therapy "Step Therapy" "Step Therapy"
* #fail-first "Fail-First" "Fail-First"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTSupportingInfoType
Title: "PCT GFE Supporting Info Type Code System"
Description: "Defining codes for the classification of the supplied supporting information"
* ^caseSensitive = true
* #cmspos "CMS Place of Service" "Place of Service Codes are two-digit codes placed on health care professional claims to indicate the setting in which a service was provided. The Centers for Medicare & Medicaid Services (CMS) maintain POS codes used throughout the health care industry."
* #typeofbill "Type of Bill"  "UB-04 Type of Bill (FL-04) provides specific information for payer purposes."
* #servicefacility "Service Facility" "The facility where the service occurred. Examples include hospitals, nursing homes, laboratories or homeless shelters."
* #drg "DRG" "DRG (Diagnosis Related Group), including the code system, the DRG version and the code value"
* #pointoforigin "Point of Origin" "UB-04 Source of Admission (FL-15) identifies the place where the patient is identified as needing admission to a facility."
* #admtype "Admission Type" "UB-04 Priority of the admission (FL-14) indicates, for example, an admission type of elective indicates that the patient's condition permitted time for medical services to be scheduled."
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTCareTeamRole
Title: "PCT Care Team Role"
Description: "PCT code system for defining the functional roles of the care team members."
* ^caseSensitive = true
* #attending "Attending provider" "The attending physician."
* #referring "Referring provider" "The referring provider."
* #operating "Operating provider" "The operating physician."
* #otheroperating "Other Operating" "The other operating physician."
* #purchasedservice "Purchased service" "The provider from which a service was purchased by another provider."
* #rendering "Rendering provider" "The rendering/performing provider."
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTOrgContactPurposeType
Title: "PCT Organization Contact Purpose Type Code System"
Description: "Organization Contact Purpose Type Code System"
* ^caseSensitive = true
* #GFERELATED "GFE-related" "Contact details for dealing with issues related to Good Faith Estimate (GFE)."
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTAdjudicationCategoryCS
Title: "PCT Adjudication Category CodeSystem"
Description: "Codes indicating the type of adjudication information provided."
* ^caseSensitive = true
* #billingnetworkstatus "Billing Network Status" "Indicates the Billing Provider network status in relation to the patient's coverage."
* #renderingnetworkstatus "Rendering Network Status" "Indicates the Rendering Provider network status in relation to the patient's coverage."
* #benefitpaymentstatus "Benefit Payment Status" "Indicates the in network or out of network payment status of the claim."
* #adjustmentreason "Adjustment Reason" "Defines the adjudication slice to identify the adjustment reason"
* #medicalmanagement "Medical Management" "Defines the adjudication slice to identify medical management"

CodeSystem: PCTIdentifierType
Title:  "PCT Identifier Type"
Description: "Defining codes for types of identifiers"
* #INTER "Intermediary System Identifier" "Identifier assigned by an intermediary system"

CodeSystem: PCTNetworkStatusCS
Id: PCTNetworkStatusCS-TEMPORARY-TRIAL-USE
Title: "PCT Network Status"
* ^caseSensitive = true
* ^copyright = "This CodeSystem is not copyrighted."
* #innetwork "In Network" "Indicates an in network status in relation to a patient's coverage"
* #outofnetwork "Out Of Network" "Indicates a not in network status in relation to a patient's coverage"
* #other "Other" "Indicates other network status or when a network does not apply"