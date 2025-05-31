
CodeSystem: PCTOrgIdentifierTypeCS
Title: "PCT Organization Identifier Type Code System"
Description: "Identifier Type codes for defining the type of identifier payers and providers assign to organizations. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
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
Description: "Defining codes for the classification of diagnosis types. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
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
Description: "Defining codes for the classification of procedure types. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^caseSensitive = true
* #principal "Principal" "Principal procedure information"
* #procedureRequiringAnesthesia  "Surgical procedure requiring anesthesia" "Identifies the surgical procedure requiring anesthesia"
* #other "Other" "Other procedure information"
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

CodeSystem: PCTSubjectToMedicalMgmtReasonCS
Title: "PCT Subject-To-Medical-Management Reason Code System"
//Id: pct-medical-mgmt-condition-type
Description: "Defining codes for the classification of subject-to-medical-management reason types. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^caseSensitive = true
* #concurrent-review "Concurrent Review" "Concurrent Review"
* #prior-auth "Prior Authorization" "Prior Authorization"
* #step-therapy "Step Therapy" "Step Therapy"
* #fail-first "Fail-First" "Fail-First"
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

CodeSystem: PCTSupportingInfoType
Title: "PCT GFE Supporting Info Type Code System"
Description: "Defining codes for the classification of the supplied supporting information. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
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
Description: "These codes are derived from the NUBC Uniform Billing (UB-04) Type of Bill (TOB) codes.  The fourth digit of the TOB code defines the frequency of the bill for the institutional and electronic professional claim. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^caseSensitive = false
* #1 "1"
* #7 "7"
* #8 "8"
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

CodeSystem: PCTCareTeamRole
Title: "PCT Care Team Role"
Description: "PCT code system for defining the functional roles of the care team members. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
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
Description: "Organization Contact Purpose Type Code System. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^caseSensitive = true
* #GFERELATED "GFE-related" "Contact details for dealing with issues related to Good Faith Estimate (GFE)."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

CodeSystem: PCTAdjudicationCategoryCS
Title: "PCT Adjudication Category CodeSystem"
Description: "Codes indicating the type of adjudication information provided. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
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
Description: "Describes the various amount fields used when payers receive and adjudicate a claim.  It complements the values defined in http://terminology.hl7.org/CodeSystem/adjudication. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
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
Description: "Defining codes for types of identifiers. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
* ^caseSensitive = true
* #INTER "Intermediary System Identifier" "Identifier assigned by an intermediary system"
* #uc "Unique Claim ID" "Indicates that the claim identifier is that assigned by a payer for a claim received from a provider or subscriber"

CodeSystem: PCTNetworkStatusCS
Id: PCTNetworkStatusCS
Title: "PCT Network Status"
Description: "Defining codes for network status.  This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
* ^caseSensitive = true
* #innetwork "In Network" "Indicates an in network status in relation to a patient's coverage"
* #outofnetwork "Out Of Network" "Indicates a not in network status in relation to a patient's coverage"
* #negotiated "Negotiated Service or Product" "Indicates a special negotiated status in relation to a patient's coverage"
* #other "Other" "Indicates other network status or when a network does not apply"

CodeSystem: PCTAEOBProcessNoteCS
Id: PCTAEOBProcessNoteCS
Title: "PCT AEOB Process Note Code System"
Description: "Defining codes for process notes.  This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
* ^caseSensitive = true
* #disclaimer "Disclaimer" "Indicates a disclaimer type of process note"
* #adjudication-note "Adjudication Note" "Indicates an adjudication note type of process note"
* #conditional "Conditional" "Indicates a conditional type of note which supplements information that is already included in the required Medical Management or Prior Authorization information.  A process note that includes information about conditional factors of the estimate not captured in the originating GFE submission of  the advanced explanation of benefit."
* #other "Other" "Indicates other type of AEOB process note"

CodeSystem: PCTFinancialType
Title: "PCT Financial Type Code System"
Description: "Financial Type codes for benefitBalance.financial.type. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
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

CodeSystem: PCTEstimateTypeSummaryCSTemporaryTrialUse
Title: "PCT Estimate Type Code System"
Description: "Defining the code for a estimate (GFE or AEOB) type summary.  This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^caseSensitive = true
* #estimate-summary "Estimate Summary"
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

CodeSystem: PCTGFERequestTypeCSTemporaryTrialUse
Title: "PCT GFE Request Type Codes Code System"
Description: "Codes for defining GFE request types. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
* ^caseSensitive = true
* #gfe-coordination-task "GFE Coordination Task" "The Coordination Task representing the general request for a Good Faith Estimate (GFE) from all potential GFE contributors."
* #gfe-contributor-task "GFE Contributor Task" "The Contributor Task representing a provider specific request for a Good Faith Estimate (GFE)."
* #scheduled-request "Scheduled Service Request" "Request of a GFE for a scheduled service."
* #nonscheduled-request "Nonscheduled Service Request" "Request of a GFE for a scheduled service, such as a request from a patient."


CodeSystem: PCTTaskStatusReasonCSTemporaryTrialUse
Title: "PCT GFE Request Task Status Reason Code Code System"
Description: "Codes for defining GFE request task status reason types. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
* ^caseSensitive = true
* #fulfilled "Fulfilled" "The GFE Request was fulfilled."
* #time-limit-reached "Time Limit Reached" "The time period to provide the GFE has been reached."
* #no-longer-needed "No Longer Needed" "The GFE is not longer needed."
* #service-cancelled "Service Cancelled" "Scheduled service was cancelled."
* #requires-new-request "Requires New Request" "Changes need to be made to the request which require the current request be cancelled and a new request be made."
* #patient-declined "Patient Declined" "Patient has declined to receive a GFE or AEOB."
* #schedule "Schedule" "Provider cannot participate due to proposed schedule dates and or times."
* #service-not-provided "Service Not Provided" "Services or Products being requested are not available from this GFE contributor."


CodeSystem: PCTTaskBusinessStatusCSTemporaryTrialUse
Title: "PCT GFE Request Task Business Status Code System"
Description: "Codes for defining  GFE request task business status types. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as THO, which will result in a code system url change and possibly modified codes and definitions."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
* ^caseSensitive = true
* #closed "Task Closed" "The Task is closed and business actor updates are no longer allowed."


CodeSystem: PCTDocumentTypeTemporaryTrialUse
Title: "PCT Document Types"
Description: "Defining codes for types and categories of documents and collections used for Patient Cost Transparency estimates. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as LOINC, which will result in a code system url change and possibly modified codes and definitions."
* ^caseSensitive = true
* #gfe-packet "GFE Packet" "A Good Faith Estimate (GFE) Packet providing a notification of reasonably expected charges and billing codes for a scheduled or requested item or service. This document type bundle may contain one or more individual GFE (Claim) resources."
* #gfe-bundle "GFE Bundle" "A Good Faith Estimate (GFE) Bundle GFE Bundle that contains all resources for a Good faith estimate submitted by a single GFE contributing provider. Organizations for both the provider and payer MAY be included. This single contributing provider GFE Bundle may be included in a set of GFE bundles from other providers in a GFE Packet that can then be made available to the patient or sent to a payer for insurance estimation."
* #gfe-information-bundle "GFE Information Bundle" "A Good Faith Estimate (GFE) Informational Bundle that contains the information necessary for GFE contributors to create their estimates. This bundle may for all GFE Contributors or  specific to a single contributor and may include, but is not limited to, the Patient Resource, request resources (such as ServiceRequest, MedicationRequest, and DeviceRequest), Service location information, Coverage and Payer Organization resources (if applicable)."
* #aeob-packet "AEOB Packet" "An Advanced Explanation of Benefit (AEOB) Packet providing a notification of reasonably expected charges and billing codes provided by a payer according to the member benefits in relation a Good Faith Estimate (GFE) supplied by one or more providers for a given period of service.  AEOBs need to include which providers are expected to provide treatment, the network status of providers, good faith estimates of cost, cost-sharing and progress towards meeting deductibles and out-of-pocket maximums, as well as whether a service is subject to medical management and relevant disclaimers of estimates; for example, the disclaimer might state that the information provided in the notification is only an estimate based on the items and services reasonably expected, at the time of scheduling (or requesting) and is subject to change."
* #estimate "Estimation Packet" "An estimate of healthcare services, products, costs and/or benefits."
* #pct-gfe-packet "PCT GFE Packet" "Patient Cost Transparency (PCT) Good Faith Estimate (GFE) Packet bundle that contains GFE Bundles from GFE contributors."
* #pct-aeob-packet "PCT AEOB Packet" "Patient Cost Transparency (PCT) Advanced Explanation of Benefit (AEOB) Packet PCT AEOB Packet that contains product and service estimations provided by a payer based on a provider submitted Good Faith Estimate (GFE) and a members coverage and benefits."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false

/*
CodeSystem: PCTDocumentCategoryTemporaryTrialUse
Title: "PCT Document Categories"
Description: "Defining codes for categories of documents used for Patient Cost Transparency estimates. This CodeSystem is currently defined by this IG, but is anticipated to be temporary. The concepts within are expected to be moved in a future version to a more central terminology specification such as LOINC, which will result in a code system url change and possibly modified codes and definitions."
* ^caseSensitive = true
* #estimate "Estimation Document" "An estimate of healthcare services, products, costs and/or benefits."
* #pct-gfe-packet "PCT GFE Packet" "Patient Cost Transparency (PCT) Good Faith Estimate (GFE) Packet bundle that contains GFE Bundles from GFE contributors."
* #pct-aeob-packet "PCT AEOB Packet" "Patient Cost Transparency (PCT) Advanced Explanation of Benefit (AEOB) Packet PCT AEOB Document Bundle that contains product and service estimations provided by a payer based on a provider submitted Good Faith Estimate (GFE) and a members coverage and benefits."
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false
*/

CodeSystem: PCTDocumentSection
Title: "PCT Packet Section Codes"
Description: "Defining codes for the sections found in packets (document bundles) used for Patient Cost Transparency estimates."
* ^caseSensitive = true
* #aeob-summary-section "AEOB Summary" "The Advanced Explanation of Benefit (AEOB) Summary Packet Section"
* #aeob-section "AEOB Section" "The Advanced Explanation of Benefit (AEOB) Packet Section"
* #gfe-section "GFE Section" "A Good Faith Estimate (GFE) Packet Section (one per provider)"
* ^copyright = "This CodeSystem is not copyrighted."
* ^experimental = false