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
//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"

// * extension[provider-contracting-status].valueCoding = #in "In Network"
// * extension[provider-contracting-rate].valueDecimal = 2000.00
// * extension[provider-contracting-rate].valueMoney.value = 2000.00
// * extension[provider-contracting-rate].valueMoney.currency = #USD

* extension[gfeReference].valueReference = Reference(PCT-GFE-Bundle-Inst-1)
* extension[serviceDescription].valueString = "Example service"

* extension[OutOfNetworkProviderInfo].valueUrl = "http://example.com/out-of-network.html"
// * extension[disclaimer].valueString = "Estimate Only ..."
// * extension[expirationDate].valueDate = "2021-10-31"

* status = #active
* type = $ClaimTypeCS#institutional "Institutional"
* use = #predetermination
* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2021-10-12"

* insurer = Reference(org1001)

* provider = Reference(org1002)
// * provider.extension[contracting-status].valueCoding = #in "In Network"
// * provider.extension[contracting-rate].valueDecimal = 2000.00


* priority = $PROCPRIORITY#normal

//* payee.type.coding = #provider

* claim.identifier.system = "http://example.com/identifiers/bundle"
* claim.identifier.value = "59688475-2324-3242-23473847"
* outcome = #complete

* insurance.focal = true
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
* item.adjudication[medicalmanagement].extension[subjectToMedicalMgmt].valueCodeableConcept = PCTSubjectToMedicalMgmtReasonCS#concurrent-review "Concurrent Review"
* item.adjudication[medicalmanagement].category = PCTAdjudicationCategoryCS#medicalmanagement "Medical Management"
// * item.adjudication[medicalmanagement].amount.value = 200.00
// * item.adjudication[medicalmanagement].amount.currency = #USD

* adjudication[medicalmanagement].category = PCTAdjudicationCategoryCS#medicalmanagement "Medical Management"
* adjudication[medicalmanagement].extension[subjectToMedicalMgmt].valueCodeableConcept = PCTSubjectToMedicalMgmtReasonCS#concurrent-review "Concurrent Review"
* adjudication[submitted].category = http://terminology.hl7.org/CodeSystem/adjudication#submitted "Submitted Amount"
* adjudication[memberliability].category = PCTAdjudicationCategoryCS#memberliability "Member Liability"

* total[submitted].category = $ADJUDCS#submitted "Submitted Amount"
* total[submitted].amount.value = 200.00
* total[submitted].amount.currency = #USD

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

* extension[serviceDescription].valueString = "Example service"
* extension[OutOfNetworkProviderInfo].valueUrl = "http://example.com/out-of-network.html"

* status = #active
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
* use = #predetermination
* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2021-10-12"

* insurer = Reference(org1001)

// * provider.extension[contracting-status].valueCoding = #in "In Network"
// * provider.extension[contracting-rate].valueDecimal = 2000.00
* provider.extension[dataAbsentReason].valueCode = #not-applicable
//* priority = $PROCPRIORITY#normal

* outcome = #complete

* insurance.focal = true
* insurance.coverage = Reference(coverage1001)

* benefitPeriod.start = "2022-01-01"
* benefitPeriod.end = "2022-01-01"
* billablePeriod.start = "2022-01-01"
* billablePeriod.end = "2022-01-01"

* total[submitted].category = $ADJUDCS#submitted "Submitted Amount"
* total[submitted].amount.value = 200.00
* total[submitted].amount.currency = #USD

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



* entry[composition].fullUrl = "http://example.org/fhir/Composition/PCT-AEOB-Composition-1"
* entry[composition].resource = PCT-AEOB-Composition-1
* entry[composition].id = "PCT-AEOB-Composition-1"

* entry[aeob][+].fullUrl = "http://example.org/fhir/ExplanationOfBenefit/PCT-AEOB-Summary-1"
* entry[aeob][=].resource = PCT-AEOB-Summary-1
* entry[aeob][=].id = "PCT-AEOB-Summary-1"
* entry[aeob][+].fullUrl = "http://example.org/fhir/ExplanationOfBenefit/PCT-AEOB-1"
* entry[aeob][=].resource = PCT-AEOB-1
* entry[aeob][=].id = "PCT-AEOB-1"
* entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
* entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4
* entry[patient].id = "patient1001"
* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].resource = coverage1001
* entry[coverage].id = "coverage1001"
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].resource = org1001
* entry[organization][=].id = "org1001"

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/Submitter-Org-1"
* entry[organization][=].resource = Submitter-Org-1
* entry[organization][=].id = "Submitter-Org-1"

* entry[gfeBundle].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Inst-1"
* entry[gfeBundle].resource = PCT-GFE-Bundle-Inst-1
* entry[gfeBundle].id = "PCT-GFE-Bundle-Inst-1"




Instance: PCT-AEOB-Composition-1
InstanceOf: PCTAdvancedEOBComposition
Description: "PCT AEOB Composition Example 1"
Usage: #inline
* identifier.system = "http://www.example.org/identifiers/composition"
* identifier.value = "019283475"
* status = #final
* type = PCTDocumentTypeTemporaryTrialUse#aeob-packet "AEOB Packet"
* category = PCTDocumentTypeTemporaryTrialUse#estimate
* subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)


* date = "2025-01-10T11:01:00+05:00"

// TODO Discuss who the author is
* author[+] = Reference(org1001)
* author[+] = Reference(Submitter-Org-1)

* title = "Advanced Explanation of Benefit Packet for Eve Betterhalf - 2025-01-10"

* section[aeob-summary].code = PCTDocumentSection#aeob-summary-section
* section[aeob-summary].entry = Reference(PCT-AEOB-Summary-1)

* section[aeob].code = PCTDocumentSection#aeob-section
* section[aeob].entry = Reference(PCT-AEOB-1)

* section[gfeBundle].code = PCTDocumentSection#gfe-section
* section[gfeBundle].author = Reference(Submitter-Org-1)
* section[gfeBundle].entry = Reference(PCT-GFE-Bundle-Inst-1)





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
* subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)

* date = "2025-01-10T11:01:00+05:00"

* author[+]  = Reference(org1001)
* author[+]  = Reference(Submitter-Org-1)

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

