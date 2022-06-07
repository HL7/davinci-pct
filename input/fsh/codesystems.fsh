
CodeSystem: PCTOrgIdentifierTypeCS
Title: "PCT Organization Identifier Type Code System"
Description: "Identifier Type codes for defining the type of identifier payers and providers assign to organizations"
* ^caseSensitive = true
* #ETIN "Electronic Transmitter Identification Number" "Electronic Transmitter Identification Number"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTOrganizationTypeCS
Title: "PCT Organization Type Code System"
Description: "Organization Type codes for describing the type of organizations involved in the PCT GFE process"
* ^caseSensitive = true
* #institutional-submitter "Institutional GFE Submitter" "Institutional GFE Submitter"
* #professional-submitter "Professional GFE Submitter" "Professional GFE Submitter"
* #billing-provider "Billing Provider" "Billing Provider"
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
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTProcedureType
Title: "PCT Procedure Type"
Description: "Defining codes for the classification of procedure types"
* ^caseSensitive = true
* #procedureRequiringAnesthesia  "Surgical procedure requiring anesthesia" "Identifies the surgical procedure requiring anesthesia"
* #other "Other" "Other procedure information"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTProcedureSurgicalCS
Title: "PCT Procedure Surgical Code System"
Description: "Defining codes for the classification of surgical procedure types"
* ^caseSensitive = true
* #153001 "PROC-1" "This is for testing purpose only - WILL BE REMOVED"
* #153002 "PROC-2" "This is for testing purpose only - WILL BE REMOVED"
* #153003 "PROC-3" "This is for testing purpose only - WILL BE REMOVED"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTGFETypeOfBillCS
Title: "PCT GFE Type Of Bill Code System"
Description: "Defining codes to indicate the specific Type of Bill (TOB)"
* ^caseSensitive = true
* #012133 "Hospital Inpatient" "This is for testing purpose only - WILL BE REMOVED"
* #013144 "Outpatient"  "This is for testing purpose only - WILL BE REMOVED"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTGFEItemRevenueCS
Title: "PCT GFE Item Revenue Code System"
Description: "Defining codes to report medical procedures and services under public and private health insurance programs"
* ^caseSensitive = true
* #2011 "Revenue Code 1" "This is for testing purpose only - WILL BE REMOVED"
* #2012 "Revenue Code 2" "This is for testing purpose only - WILL BE REMOVED"
* #0611 "Magnetic Resonance Technology (MRT) - Brain/brain stem"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTGFEItemProcedureCodes
Title: "PCT GFE Item Procedure Code System"
Description: "Defining codes to report medical procedures and services under public and private health insurance programs"
* ^caseSensitive = true
* #33502 "Some CPT Code 1" "This is for testing purpose only - WILL BE REMOVED"
* #34503 "Some CPT Code 2" "This is for testing purpose only - WILL BE REMOVED"
* #70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem)" 
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
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTCareTeamRole
Title: "PCT Care Team Role"
Description: "PCT code system for defining the functional roles of the care team members."
* ^caseSensitive = true
* #attending "Attending provider" "The attending provider"
* #referring "Referring provider" "The referring provider"
* #operating "Operating physician" "The operating physician"
* #otheroperating "Other Operating physician" "The other operating physician"
* #rendering "Rendering provider" "The rendering/performing provider"
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTOrgContactPurposeType
Title: "PCT Organization Contact Purpose Type Code System"
Description: "Organization Contact Purpose Type Code System"
* ^caseSensitive = true
* #GFERELATED "GFE-related" "Contact details for dealing with issues related to Good Faith Estimate (GFE)."
* ^copyright = "This CodeSystem is not copyrighted."

CodeSystem: PCTAdjudicationCategoryType
Title: "PCT Adjudication Category Type"
Description: "Describes the various amount fields used when payers receive and adjudicate a claim.  It complements the values defined in http://terminology.hl7.org/CodeSystem/adjudication."
* ^caseSensitive = true
* #coinsurance "Co-insurance" "The amount the insured individual pays, as a set percentage of the cost of covered medical services, as an out-of-pocket payment to the provider. Example: Insured pays 20% and the insurer pays 80%."
* #noncovered "Noncovered" "The portion of the cost of this service that was deemed not eligible by the insurer because the service or member was not covered by the subscriber contract."
* #priorpayerpaid "Prior payer paid" "The reduction in the payment amount to reflect the carrier as a secondary payor."
* #paidbypatient "Paid by patient" "The amount paid by the patient at the point of service."
* #paidtoprovider "Paid to provider" "The amount paid to the provider."
* #paidtopatient "Paid to patient" "paid to patient"
* #memberliability "Member liability" "The amount of the member's liability."
* #discount "Discount" "The amount of the discount"
* #drugcost "Drug cost" "Price paid for the drug excluding mfr or other discounts.  It typically is the sum of the following components: ingredient cost, dispensing fee, sales tax, and vaccine administration"