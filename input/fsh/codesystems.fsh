
CodeSystem: PCTOrgIdentifierTypeCS
Title: "PCT Organization Identifier Type Code System"
Description: "Identifier Type codes for defining the type of identifier payers and providers assign to organizations"
* ^caseSensitive = true
* #ETIN "Electronic Transmitter Identification Number" "Electronic Transmitter Identification Number"
* #payerid "Payer ID" "Payer ID used in HIPAA covered claims submission transactions"
* #naiccode "NAIC Code" "An identifier assigned to licensed and authorized insurance companies by the National Association of Insurance Commissioners (NAIC)"
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

// CodeSystem: PCTCoverageCopayTypeCS
// Title: "PCT Coverage Copay Type Code System"
// Id: pct-coverage-copay-type
// Description: "Defining codes for the classification of insurance coverage copay types for patient"
// * ^caseSensitive = true
// * #pharmacy-deductible "Pharmacy-Deductible" "The accumulated amount of patient payment before the coverage begins to pay for medicines."
// * #pharmacy-maxoutofpocket "Pharmacy-Maximum Out Of Pocket" "The maximum amout of payment for medicines which a patient, or family, is expected to incur - typically annually."
// * ^copyright = "This CodeSystem is not copyrighted."
// * ^experimental = false

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
* ^experimental = false

CodeSystem: PCTProcedureType
Title: "PCT Procedure Type"
Description: "Defining codes for the classification of procedure types"
* ^caseSensitive = true
* #principal "Pricipal" "Principal procedure information"
* #procedureRequiringAnesthesia  "Surgical procedure requiring anesthesia" "Identifies the surgical procedure requiring anesthesia"
* #other "Other" "Other procedure information"
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

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
* ^experimental = false

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
* #claimFrequency "Claim Frequency" "Claim frequency - uses the last digit of the NUBC type of billing code."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

CodeSystem: PCTGFEFrequency
Title: "PCT GFE Frequency Code System"
Description: "These codes are derived from the NUBC Uniform Billing (UB-04) Type of Bill (TOB) codes.  The fourth digit of the TOB code defines the frequency of the bill for the institutional and electronic professional claim."
* ^caseSensitive = false
* #1 "1"
* #7 "7"
* #8 "8"
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

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
* ^experimental = false

CodeSystem: PCTOrgContactPurposeType
Title: "PCT Organization Contact Purpose Type Code System"
Description: "Organization Contact Purpose Type Code System"
* ^caseSensitive = true
* #GFERELATED "GFE-related" "Contact details for dealing with issues related to Good Faith Estimate (GFE)."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

CodeSystem: PCTAdjudicationCategoryCS
Title: "PCT Adjudication Category CodeSystem"
Description: "Codes indicating the type of adjudication information provided."
* ^caseSensitive = true
* ^experimental = false
* #billingnetworkstatus "Billing Network Status" "Indicates the Billing Provider network status in relation to the patient's coverage."
* #renderingnetworkstatus "Rendering Network Status" "Indicates the Rendering Provider network status in relation to the patient's coverage."
* #benefitpaymentstatus "Benefit Payment Status" "Indicates the in network or out of network payment status of the claim."
* #adjustmentreason "Adjustment Reason" "Defines the adjudication slice to identify the adjustment reason"
* #medicalmanagement "Medical Management" "Defines the adjudication slice to identify medical management"
* #memberliability "Member Liability" "Defines the adjudication slice to identify member liability"

CodeSystem: PCTAdjudication
Title: "PCT Adjudication Code System"
Description: "Describes the various amount fields used when payers receive and adjudicate a claim.  It complements the values defined in http://terminology.hl7.org/CodeSystem/adjudication.
This is a code system defined locally by the PCT IG. As this IG matures, it is expected that this CodeSystem will be migrated to THO (terminology.hl7.org). The current CodeSystem url should be considered temporary and subject to change in a future version."
* #coinsurance "Co-insurance" "The amount the insured individual pays, as a set percentage of the cost of covered medical services, as an out-of-pocket payment to the provider. Example: Insured pays 20% and the insurer pays 80%."
* #noncovered "Noncovered" "The portion of the cost of this service that was deemed not eligible by the insurer because the service or member was not covered by the subscriber contract."
* #memberliability "Member liability" "The amount of the member's liability."
* #discount "Discount" "The amount of the discount"
* ^content = #complete
* ^caseSensitive = true
* ^experimental = false
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTIdentifierType
Title:  "PCT Identifier Type"
Description: "Defining codes for types of identifiers"
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
* ^caseSensitive = true
* #INTER "Intermediary System Identifier" "Identifier assigned by an intermediary system"
* #uc "Unique Claim ID" "Indicates that the claim identifier is that assigned by a payer for a claim received from a provider or subscriber"

CodeSystem: PCTNetworkStatusCS
Id: PCTNetworkStatusCS
Title: "PCT Network Status"
Description: "Defining codes for network status. This is for trial use."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
* ^caseSensitive = true
* #innetwork "In Network" "Indicates an in network status in relation to a patient's coverage"
* #outofnetwork "Out Of Network" "Indicates a not in network status in relation to a patient's coverage"
* #other "Other" "Indicates other network status or when a network does not apply"

CodeSystem: PCTAEOBProcessNoteCS
Id: PCTAEOBProcessNoteCS
Title: "PCT AEOB Process Note"
Description: "Defining codes for process notes. This is for trial use."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
* ^caseSensitive = true
* #disclaimer "Disclaimer" "Indicates a disclaimer type of process note"
* #adjudication-note "Adjudication Note" "Indicates an adjudication note type of process note"
* #other "Other" "Indicates other type of AEOB process note"

CodeSystem: PCTFinancialType
Title: "PCT Financial Type"
Description: "Financial Type codes for benefitBalance.financial.type."
* ^caseSensitive = true
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
* #allowed "Allowed" "The maximum amount a plan will pay for a covered health care service. May also be called \"payment allowance\", or \"negotiated rate\"."
* #coinsurance "Co-Insurance" "The amount the insured individual pays, as a set percentage of the cost of covered services, as an out-of-pocket payment to the provider. Example: Insured pays 20% and the insurer pays 80%."
* #copay "CoPay"  "A fixed amount ($20, for example) the insured individual pays for a covered health care service after the deductible is paid."
* #deductible "Deductible" "The amount the insured individual pays for covered health care services before the insurance plan starts to pay."
* #eligible "Eligible Amount" "Amount of the charge which is considered for adjudication."
* #memberliability "Member Liability" "The amount of the member's liability."
* #noncovered "Noncovered" "The portion of the cost of the service that was deemed not eligible by the insurer because the service or member was not covered by the subscriber contract."
* #out-of-pocket-maximum "Out-of-Pocket Maximum" "The most the insured individual has to pay for covered services in a plan year. After this amount is spent on deductibles, copayments, and coinsurance for in-network care and services, the health plan pays 100% of the costs of covered benefits."
* #visit "Visit" "A medical visit means diagnostic, therapeutic, or consultative services provided to a client by a healthcare professional in an outpatient setting."
* #penalty "Penalty" "Benefit penalty is an approach used by the insurance company to reduce their payment on a claim when the patient or medical provider does not satisfy the rules of the health plan. Benefit penalties may occur when a pre-authorization is not obtained, for example."
