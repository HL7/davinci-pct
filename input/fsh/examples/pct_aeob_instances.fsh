Alias: ICD10 = http://hl7.org/fhir/sid/icd-10-cm
Alias: PKGCODE = http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup
Alias: NUBC = https://www.nubc.org/CodeSystem/RevenueCodes
Alias: CPT4 = http://www.ama-assn.org/go/cpt
//Alias: ISO4217 = urn:iso:std:iso:4217

////////////////////////////////////////////

Instance: PCT-AEOB-1
InstanceOf: PCTAdvancedEOB
Description: "An example instance of the PCTAdvancedEOB Profile"
Usage: #example

// * id = "89fdfb03-b700-4e21-a116-bc0658c68a00"
//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"

// * extension[provider-contracting-status].valueCoding = #in "In Network"
// * extension[provider-contracting-rate].valueDecimal = 2000.00
// * extension[provider-contracting-rate].valueMoney.value = 2000.00
// * extension[provider-contracting-rate].valueMoney.currency = #USD

// * extension[gfeReference].valueReference.reference = "urn:uuid:b5ff05d5-b645-4676-b8ed-a3937dabac7b" // = Reference(PCT-GFE-Bundle-Inst-1)
* extension[gfeReference].valueReference = Reference(PCT-GFE-Bundle-Inst-1)

* extension[serviceDescription].valueString = "Example service"

* extension[OutOfNetworkProviderInfo].valueUrl = "http://example.org/out-of-network.html"
// * extension[disclaimer].valueString = "Estimate Only ..."
// * extension[expirationDate].valueDate = "2021-10-31"

* status = #active
* type = $ClaimTypeCS#institutional "Institutional"
* use = #predetermination
// * patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* patient = Reference(patient1001)
* created = "2021-10-12"

// * insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* insurer = Reference(org1001)


// * provider.reference = "urn:uuid:646ce5de-3216-4098-ae71-c96d5f02b088" // = Reference(org1002)
* provider = Reference(org1002)


// * provider.extension[contracting-status].valueCoding = #in "In Network"
// * provider.extension[contracting-rate].valueDecimal = 2000.00


* priority = $PROCPRIORITY#normal

//* payee.type.coding = #provider

* claim.identifier.system = "http://example.com/identifiers/bundle"
* claim.identifier.value = "59688475-2324-3242-23473847"
* outcome = #complete

* insurance.focal = true

// * insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)

* insurance.coverage = Reference(coverage1001)

* benefitPeriod.start = "2022-01-01"
* benefitPeriod.end = "2023-01-01"

* item.sequence = 1
* item.revenue = $NUBCREVENUE#0611 "Magnetic Resonance Technology (MRT) - Brain/brain stem"
//* item.productOrService = $CPT#30130 "Removal of nasal air passage" Example of CPT with consumer friendly display value
* item.productOrService = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.modifier = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.servicedDate = "2022-01-01"
* item.net.value = 200.00
* item.net.currency = #USD
* item.adjudication[medicalmanagement].extension[subjectToMedicalMgmt].valueCodeableConcept = MedicalManagementType#concurrent-review "Concurrent Review"
* item.adjudication[medicalmanagement].category = PCTAdjudicationCategoryCS#medicalmanagement "Medical Management"
// * item.adjudication[medicalmanagement].amount.value = 200.00
// * item.adjudication[medicalmanagement].amount.currency = #USD

* adjudication[medicalmanagement].category = PCTAdjudicationCategoryCS#medicalmanagement "Medical Management"
* adjudication[medicalmanagement].extension[subjectToMedicalMgmt].valueCodeableConcept = MedicalManagementType#concurrent-review "Concurrent Review"
* adjudication[submitted].category = http://terminology.hl7.org/CodeSystem/adjudication#submitted "Submitted Amount"
* adjudication[memberliability].category = PCTAdjudicationCategoryCS#memberliability "Member Liability"

* total[submitted].category = $ADJUDCS#submitted "Submitted Amount"
* total[submitted].amount.value = 200.00
* total[submitted].amount.currency = #USD

* total[memberliability].category = PCTAdjudicationCategoryCS#memberliability "Member liability"
* total[memberliability].amount.value = 20.00
* total[memberliability].amount.currency = #USD

* total[eligible].category = $ADJUDCS#eligible "Eligible Amount"
* total[eligible].amount.value = 190.00
* total[eligible].amount.currency = #USD

* processNote.extension[processNoteClass].valueCodeableConcept = http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTAEOBProcessNoteCS#disclaimer "Disclaimer"
* processNote.text = "processNote disclaimer text"


* benefitBalance
* benefitBalance.category = https://x12.org/codes/service-type-codes#1 "Medical Care"
* benefitBalance.category.text = "Medical Care"
* benefitBalance.unit = http://terminology.hl7.org/CodeSystem/benefit-unit#individual
* benefitBalance.term = http://terminology.hl7.org/CodeSystem/benefit-term#annual
* benefitBalance.financial
* benefitBalance.financial.type = http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTFinancialType#allowed
* benefitBalance.financial.allowedMoney
* benefitBalance.financial.allowedMoney.value = 1
* benefitBalance.financial.allowedMoney.currency = #USD
* benefitBalance.financial.usedMoney
* benefitBalance.financial.usedMoney.value = 1
* benefitBalance.financial.usedMoney.currency = #USD
* benefitBalance.financial.extension[RemainingBenefit].valueMoney.value = 0
* benefitBalance.financial.extension[RemainingBenefit].valueMoney.currency = #USD
////////////////////////////////////////////


////////////////////////////////////////////

Instance: PCT-AEOB-Summary-1
InstanceOf: PCTAdvancedEOBSummary
Description: "An example instance of the PCTAdvancedEOBSummary Profile"
Usage: #example

// * id = "645c61ac-963d-44c7-b6a2-17f3ec6a5f60"
* extension[serviceDescription].valueString = "Example service"
* extension[OutOfNetworkProviderInfo].valueUrl = "http://example.org/out-of-network.html"

* status = #active
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
* use = #predetermination

// * patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(patient1001) //"urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* patient = Reference(patient1001) 

* created = "2021-10-12"

// * insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* insurer = Reference(org1001)

// * provider.extension[contracting-status].valueCoding = #in "In Network"
// * provider.extension[contracting-rate].valueDecimal = 2000.00
* provider.extension[dataAbsentReason].valueCode = #not-applicable
//* priority = $PROCPRIORITY#normal

* outcome = #complete

* insurance.focal = true

// * insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)

* insurance.coverage = Reference(coverage1001)

* benefitPeriod.start = "2022-01-01"
* benefitPeriod.end = "2022-01-01"
* billablePeriod.start = "2022-01-01"
* billablePeriod.end = "2022-01-01"

* total[submitted].category = $ADJUDCS#submitted "Submitted Amount"
* total[submitted].amount.value = 200.00
* total[submitted].amount.currency = #USD

* total[memberliability].category = PCTAdjudicationCategoryCS#memberliability "Member liability"
* total[memberliability].amount.value = 20.00
* total[memberliability].amount.currency = #USD

* total[eligible].category = $ADJUDCS#eligible "Eligible Amount"
* total[eligible].amount.value = 190.00
* total[eligible].amount.currency = #USD


* processNote.extension[processNoteClass].valueCodeableConcept = http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTAEOBProcessNoteCS#disclaimer "Disclaimer"
* processNote.text = "processNote disclaimer text"


* benefitBalance
* benefitBalance.category = https://x12.org/codes/service-type-codes#1 "Medical Care"
* benefitBalance.category.text = "Medical Care"
* benefitBalance.unit = http://terminology.hl7.org/CodeSystem/benefit-unit#individual
* benefitBalance.term = http://terminology.hl7.org/CodeSystem/benefit-term#annual
* benefitBalance.financial
* benefitBalance.financial.type = http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTFinancialType#allowed
* benefitBalance.financial.allowedMoney
* benefitBalance.financial.allowedMoney.value = 1
* benefitBalance.financial.allowedMoney.currency = #USD
* benefitBalance.financial.usedMoney
* benefitBalance.financial.usedMoney.value = 1
* benefitBalance.financial.usedMoney.currency = #USD
* benefitBalance.financial.extension[RemainingBenefit].valueMoney.value = 0
* benefitBalance.financial.extension[RemainingBenefit].valueMoney.currency = #USD




Instance: PCT-AEOB-Packet-1
InstanceOf: PCTAEOBPacket
Description: "PCT AEOB Packet Example 1"
Usage: #example
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-1234568"
* timestamp = "2025-01-10T11:01:00+05:00"



// * entry[composition].fullUrl = "urn:uuid:3b46e3b7-ea0a-455f-a797-48c2d9faca1d" // "http://example.org/fhir/Composition/PCT-AEOB-Composition-1"
// * entry[composition].resource = 3b46e3b7-ea0a-455f-a797-48c2d9faca1d //PCT-AEOB-Composition-1
// * entry[composition].id = "PCT-AEOB-Composition-1"
* entry[composition].fullUrl = "http://example.org/fhir/Composition/PCT-AEOB-Composition-1"
* entry[composition].resource = PCT-AEOB-Composition-1

// * entry[aeob][+].fullUrl = "urn:uuid:645c61ac-963d-44c7-b6a2-17f3ec6a5f60" // "http://example.org/fhir/ExplanationOfBenefit/PCT-AEOB-Summary-1"
// * entry[aeob][=].resource = 645c61ac-963d-44c7-b6a2-17f3ec6a5f60 // PCT-AEOB-Summary-1
// * entry[aeob][=].id = "PCT-AEOB-Summary-1"

* entry[aeob][+].fullUrl = "http://example.org/fhir/ExplanationOfBenefit/PCT-AEOB-Summary-1"
* entry[aeob][=].resource = PCT-AEOB-Summary-1

// * entry[aeob][+].fullUrl = "urn:uuid:89fdfb03-b700-4e21-a116-bc0658c68a00" // "http://example.org/fhir/ExplanationOfBenefit/PCT-AEOB-1"
// * entry[aeob][=].resource = 89fdfb03-b700-4e21-a116-bc0658c68a00  // PCT-AEOB-1
// * entry[aeob][=].id = "PCT-AEOB-1"

* entry[aeob][+].fullUrl = "http://example.org/fhir/ExplanationOfBenefit/PCT-AEOB-1"
* entry[aeob][=].resource = PCT-AEOB-1

// * entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
// * entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4 //patient1001 //9c05d948-b931-4bff-8766-18b99b0650d4
// * entry[patient].id = "patient1001"

* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient1001"
* entry[patient].resource = patient1001


// * entry[coverage].fullUrl = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // "http://example.org/fhir/Coverage/coverage1001"
// * entry[coverage].resource = 49fd53a8-7eb7-4319-acc8-04bf8a3cb603
// * entry[coverage].id = "coverage1001"

* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].resource = coverage1001

// * entry[organization][+].fullUrl = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // "http://example.org/fhir/Organization/org1001"
// * entry[organization][=].resource = 2ccf0ff7-2af1-4598-b667-6e35b79529df // org1001
// * entry[organization][=].id = "org1001"

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].resource = org1001

// * entry[organization][+].fullUrl = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // "http://example.org/fhir/Organization/Submitter-Org-1"
// * entry[organization][=].resource = e7c36e30-edb8-4a0a-8208-c92085663b00 //Submitter-Org-1
// * entry[organization][=].id = "Submitter-Org-1"

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/Submitter-Org-1"
* entry[organization][=].resource = Submitter-Org-1

// * entry[organization][+].fullUrl = "urn:uuid:646ce5de-3216-4098-ae71-c96d5f02b088" // "http://example.org/fhir/Organization/Submitter-Org-1"
// * entry[organization][=].resource = 646ce5de-3216-4098-ae71-c96d5f02b088 //org1002
// * entry[organization][=].id = "org1002"

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1002"
* entry[organization][=].resource = org1002


// * entry[gfeBundle][+].fullUrl = "urn:uuid:b5ff05d5-b645-4676-b8ed-a3937dabac7b" // "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Inst-1"
// * entry[gfeBundle][=].resource = b5ff05d5-b645-4676-b8ed-a3937dabac7b //PCT-GFE-Bundle-Inst-1
// * entry[gfeBundle][=].id = "PCT-GFE-Bundle-Inst-1"


* entry[gfeBundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Inst-1"
* entry[gfeBundle][=].resource = PCT-GFE-Bundle-Inst-1

// * entry[gfeBundle][+].fullUrl = "urn:uuid:e1b566b9-34a6-467b-83d2-8107a5ee987d" // "http://example.org/fhir/Bundle/PCT-GFE-Missing-Bundle-1"
// * entry[gfeBundle][=].id = "PCT-GFE-Missing-Bundle-1"
// * entry[gfeBundle][=].resource = e1b566b9-34a6-467b-83d2-8107a5ee987d //PCT-GFE-Missing-Bundle-1

* entry[gfeBundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Missing-Bundle-1"
* entry[gfeBundle][=].resource = PCT-GFE-Missing-Bundle-1


Instance: PCT-AEOB-Composition-1
InstanceOf: PCTAdvancedEOBComposition
Description: "PCT AEOB Composition Example 1"
Usage: #inline // has to be inline because of the aggregation requirement. As example, it produces and error because it looks like an external reference and produces an IG Publisher error

// * id = "3b46e3b7-ea0a-455f-a797-48c2d9faca1d"
* extension[requestInitiationTime].valueInstant = "2025-01-08T09:01:00+05:00"
* identifier.system = "http://www.example.org/identifiers/composition"
* identifier.value = "019283475"
* status = #final
* type = PCTDocumentTypeTemporaryTrialUse#aeob-packet "AEOB Packet"
* category[estimate] = PCTDocumentTypeTemporaryTrialUse#estimate
// * subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subject = Reference(patient1001)

* date = "2025-01-10T11:01:00+05:00"

// TODO Discuss who the author is
// * author[+].reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* author[+] = Reference(org1001)

// * author[+].reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* author[+] = Reference(Submitter-Org-1)

* title = "Advanced Explanation of Benefit Packet for Eve Betterhalf - 2025-01-10"

* section[aeob-summary].code = PCTDocumentSection#aeob-summary-section
// * section[aeob-summary].entry.reference = "urn:uuid:645c61ac-963d-44c7-b6a2-17f3ec6a5f60" // = Reference(PCT-AEOB-Summary-1)
* section[aeob-summary].entry = Reference(PCT-AEOB-Summary-1)
* section[aeob-summary].text.status = #generated
* section[aeob-summary].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: ExplanationOfBenefit PCT-AEOB-Summary-1</b></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-aeob-summary.html\">PCT Advanced EOB Summary</a></p></div><p><b>Service Description</b>: Example service</p><p><b>In Network Provider Options Link</b>: <a href=\"http://example.org/out-of-network.html\">http://example.org/out-of-network.html</a></p><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTEstimateTypeSummaryCSTemporaryTrialUse estimate-summary}\">Estimate Summary</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 ( http://example.com/identifiers/patient#1001)</a></p><p><b>billablePeriod</b>: 2022-01-01 --&gt; 2022-01-01</p><p><b>created</b>: 2021-10-12</p><p><b>insurer</b>: <a href=\"Organization-org1001.html\">Organization Umbrella Insurance Company</a></p><p><b>provider</b>: ?rref?</p><p><b>outcome</b>: Processing Complete</p><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>true</td><td><a href=\"Coverage-coverage1001.html\">Coverage: extension = insurance; status = active; subscriberId = PFP123450000; relationship = Self; period = 2021-01-01 --&gt; 2022-01-01</a></td></tr></table><blockquote><p><b>total</b></p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/adjudication submitted}\">Submitted Amount</span></p><h3>Amounts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></blockquote><blockquote><p><b>total</b></p><p><b>category</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTAdjudicationCategoryCS memberliability}\">Member liability</span></p><h3>Amounts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>20</td><td>United States dollar</td></tr></table></blockquote><blockquote><p><b>total</b></p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/adjudication eligible}\">Eligible Amount</span></p><h3>Amounts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>190</td><td>United States dollar</td></tr></table></blockquote><h3>ProcessNotes</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Extension</b></td><td><b>Text</b></td></tr><tr><td style=\"display: none\">*</td><td/><td>processNote disclaimer text</td></tr></table><p><b>benefitPeriod</b>: 2022-01-01 --&gt; 2022-01-01</p><blockquote><p><b>benefitBalance</b></p><p><b>category</b>: <span title=\"Codes:{https://x12.org/codes/service-type-codes 1}\">Medical Care</span></p><p><b>unit</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/benefit-unit individual}\">Individual</span></p><p><b>term</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/benefit-term annual}\">Annual</span></p><h3>Financials</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Extension</b></td><td><b>Type</b></td><td><b>Allowed[x]</b></td><td><b>Used[x]</b></td></tr><tr><td style=\"display: none\">*</td><td/><td><span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTFinancialType allowed}\">Allowed</span></td><td><span title=\"US Dollar\">$1.00</span> (USD)</td><td><span title=\"US Dollar\">$1.00</span> (USD)</td></tr></table></blockquote></div>"


* section[aeob].code = PCTDocumentSection#aeob-section
// * section[aeob].entry.reference = "urn:uuid:89fdfb03-b700-4e21-a116-bc0658c68a00" // = Reference(PCT-AEOB-1)
* section[aeob].entry = Reference(PCT-AEOB-1)
* section[aeob].text.status = #generated
* section[aeob].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: ExplanationOfBenefit PCT-AEOB-Summary-1</b></p><a name=\"PCT-AEOB-Summary-1\"> </a><a name=\"hcPCT-AEOB-Summary-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-aeob-summary.html\">PCT Advanced EOB Summary</a></p></div><p><b>Service Description</b>: Example service</p><p><b>In Network Provider Options Link</b>: <a href=\"http://example.org/out-of-network.html\">http://example.org/out-of-network.html</a></p><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTEstimateTypeSummaryCSTemporaryTrialUse estimate-summary}\">Estimate Summary</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 ( http://example.com/identifiers/patient#1001)</a></p><p><b>billablePeriod</b>: 2022-01-01 --&gt; 2022-01-01</p><p><b>created</b>: 2021-10-12</p><p><b>insurer</b>: <a href=\"Organization-org1001.html\">Organization Umbrella Insurance Company</a></p><p><b>provider</b>: ?rref?</p><p><b>outcome</b>: Processing Complete</p><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>true</td><td><a href=\"Coverage-coverage1001.html\">Coverage: extension = insurance; status = active; subscriberId = PFP123450000; relationship = Self; period = 2021-01-01 --&gt; 2022-01-01</a></td></tr></table><blockquote><p><b>total</b></p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/adjudication submitted}\">Submitted Amount</span></p><h3>Amounts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></blockquote><blockquote><p><b>total</b></p><p><b>category</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTAdjudicationCategoryCS memberliability}\">Member liability</span></p><h3>Amounts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>20</td><td>United States dollar</td></tr></table></blockquote><blockquote><p><b>total</b></p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/adjudication eligible}\">Eligible Amount</span></p><h3>Amounts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>190</td><td>United States dollar</td></tr></table></blockquote><h3>ProcessNotes</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Extension</b></td><td><b>Text</b></td></tr><tr><td style=\"display: none\">*</td><td/><td>processNote disclaimer text</td></tr></table><p><b>benefitPeriod</b>: 2022-01-01 --&gt; 2022-01-01</p><blockquote><p><b>benefitBalance</b></p><p><b>category</b>: <span title=\"Codes:{https://x12.org/codes/service-type-codes 1}\">Medical Care</span></p><p><b>unit</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/benefit-unit individual}\">Individual</span></p><p><b>term</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/benefit-term annual}\">Annual</span></p><h3>Financials</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Extension</b></td><td><b>Type</b></td><td><b>Allowed[x]</b></td><td><b>Used[x]</b></td></tr><tr><td style=\"display: none\">*</td><td/><td><span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTFinancialType allowed}\">Allowed</span></td><td><span title=\"US Dollar\">$1.00</span> (USD)</td><td><span title=\"US Dollar\">$1.00</span> (USD)</td></tr></table></blockquote></div>"


* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
// * section[gfeBundle][=].author.reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* section[gfeBundle][=].author = Reference(Submitter-Org-1)
// * section[gfeBundle][=].entry.reference = "urn:uuid:b5ff05d5-b645-4676-b8ed-a3937dabac7b" // = Reference(PCT-GFE-Bundle-Inst-1)
* section[gfeBundle][=].entry = Reference(PCT-GFE-Bundle-Inst-1)
* section[gfeBundle].text.status = #generated
* section[gfeBundle].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Claim PCT-GFE-Institutional-1</b></p><a name=\"PCT-GFE-Institutional-1\"> </a><a name=\"hcPCT-GFE-Institutional-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-institutional.html\">PCT Good Faith Estimate Institutional</a></p></div><p><b>ProviderEventMethodology</b>: EEMM1021</p><p><b>GFEDisclaimer</b>: For estimation purposes only</p><blockquote><p><b>GFEServiceLinkingInfo</b></p><ul><li>linkingIdentifier: <code>http://example.org/Claim/identifiers</code>/223452-2342-2435-008001</li><li>plannedPeriodOfService: 2021-10-31</li></ul></blockquote><p><b>identifier</b>: Placer Identifier/GFEProviderAssignedID0001</p><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/claim-type institutional}\">Institutional</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 ( http://example.com/identifiers/patient#1001)</a></p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Organization-org1001.html\">Organization Umbrella Insurance Company</a></p><p><b>provider</b>: <a href=\"Organization-Submitter-Org-1.html\">Organization GFE Service Help INC.</a></p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Payees</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/payeetype provider}\">Provider</span></td></tr></table><p><b>referral</b>: Referral Number</p><h3>SupportingInfos</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Category</b></td><td><b>Code</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTSupportingInfoType typeofbill}\">Type of Bill</span></td><td><span title=\"Codes:{https://www.nubc.org/CodeSystem/TypeOfBill 011X}\">Hospital Inpatient (Part A)</span></td></tr></table><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Coverage-coverage1001.html\">Coverage: extension = insurance; status = active; subscriberId = PFP123450000; relationship = Self; period = 2021-01-01 --&gt; 2022-01-01</a></td></tr></table><blockquote><p><b>item</b></p><p><b>Service Description</b>: Imaging</p><p><b>sequence</b>: 1</p><p><b>revenue</b>: <span title=\"Codes:{https://www.nubc.org/CodeSystem/RevenueCodes 0611}\">Magnetic Resonance Technology (MRT) - Brain/brain stem</span></p><p><b>productOrService</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>modifier</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>serviced</b>: 2021-10-31</p><p><b>quantity</b>: 1</p><h3>Nets</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></blockquote><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"

* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
// * section[gfeBundle][=].entry.reference = "urn:uuid:e1b566b9-34a6-467b-83d2-8107a5ee987d" // = Reference(PCT-GFE-Bundle-Inst-1)
* section[gfeBundle][=].entry = Reference(PCT-GFE-Missing-Bundle-1)
// * section[gfeBundle][=].author.reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* section[gfeBundle][=].author = Reference(Submitter-Org-1)
* section[gfeBundle].text.status = #generated
* section[gfeBundle].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: PCT-GFE-Missing-Bundle-1</b></p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 (http://example.com/identifiers/patient#1001)</a></p><p><b>coverage</b>: <a href=\"Patient-patient1001.html\">Coverage_coverage1001, period: 2021-01-01 --&gt; 2022-01-01</a></p><p><b>organization</b>: <a href=\"Organization-org1001.html\">Umbrella Insurance Company</a></p><h3>Requested Services</h3><ul><li><b>device request</b>: KNEE ORTHOSIS, ELASTIC WITH CONDYLAR PADS AND JOINTS, WITH OR WITHOUT PATELLAR CONTROL, PREFABRICATED, INCLUDES FITTING AND ADJUSTMENT</li></ul> </div>"


Instance: PCT-AEOB-DocumentReference-1
InstanceOf: PCTAdvancedEOBDocumentReference
Description: "PCT AEOB DocumentReference Example 1"
Usage: #example

* extension[requestInitiationTime].valueInstant = "2025-01-08T09:01:00+05:00"
* extension[procedureOrService].valueCodeableConcept = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* extension[condition].valueCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* status = #current
* docStatus = #final
* type = PCTDocumentTypeTemporaryTrialUse#aeob-packet
* category[estimate] = PCTDocumentTypeTemporaryTrialUse#estimate
// * subject = Reference(patient1001)  //"urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subject = Reference(patient1001)

* date = "2025-01-10T11:01:00+05:00"

// * author[+].reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* author[+] = Reference(org1001)
// * author[+].reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* author[+] = Reference(Submitter-Org-1)

* content[+].attachment.url = "http://example.org/fhir/Bundle/PCT-AEOB-Packet-1"



/*
Instance: PCT-AEOB-Bundle-1
InstanceOf: PCTAEOBBundle
Description: "PCT AEOB Bundle Example 1"
Usage: #example
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-1234567"
* timestamp = "2021-11-10T11:01:00+05:00"

* entry[aeob][+].fullUrl = "http://example.org/fhir/ExplanationOfBenefit/PCT-AEOB-Summary-1"
* entry[aeob][=].resource = PCT-AEOB-Summary-1
* entry[aeob][=].id = "PCT-AEOB-Summary-1"
* entry[aeob][+].fullUrl = "http://example.org/fhir/ExplanationOfBenefit/PCT-AEOB-1"
* entry[aeob][=].resource = PCT-AEOB-1
* entry[aeob][=].id = "PCT-AEOB-1"
* entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
* entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4
//* entry[patient].id = "patient1001"
* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].resource = coverage1001
* entry[coverage].id = "coverage1001"
* entry[organization].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization].resource = org1001
* entry[organization].id = "org1001"
* entry[gfeBundle].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Inst-1"
* entry[gfeBundle].resource = PCT-GFE-Bundle-Inst-1
* entry[gfeBundle].id = "PCT-GFE-Bundle-Inst-1"


*/

