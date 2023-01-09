Alias: ICD10 = http://hl7.org/fhir/sid/icd-10-cm
Alias: PKGCODE = http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup
Alias: NUBC = https://www.nubc.org/CodeSystem/RevenueCodes
Alias: CPT4 = http://www.ama-assn.org/go/cpt
//Alias: ISO4217 = urn:iso:std:iso:4217

////////////////////////////////////////////

Instance: PCT-AEOB-1
InstanceOf: PCTAdvancedEOB
Description: "An instance of the PCTAdvancedEOB Profile"
//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"

// * extension[provider-contracting-status].valueCoding = #in "In Network"
// * extension[provider-contracting-rate].valueDecimal = 2000.00
// * extension[provider-contracting-rate].valueMoney.value = 2000.00
// * extension[provider-contracting-rate].valueMoney.currency = #USD

* extension[gfeReference].valueReference = Reference(PCT-GFE-Bundle-Inst-1)
* extension[serviceDescription].valueString = "Example service"
// * extension[disclaimer].valueString = "Estimate Only ..."
// * extension[expirationDate].valueDate = "2021-10-31"

* status = #active
* type = $ClaimTypeCS#institutional "Institutional"
* use = #predetermination
* patient = Reference(patient1001)
* created = "2021-10-12"

* insurer = Reference(org1001)

* provider = Reference(org1002)
// * provider.extension[contracting-status].valueCoding = #in "In Network"
// * provider.extension[contracting-rate].valueDecimal = 2000.00
* provider.extension[OutOfNetworkProviderInfo].valueUrl = "http://example.com/out-of-network.html"
* priority = $PROCPRIORITY#normal

//* payee.type.coding = #provider

* claim.identifier.system = "http://example.com/identifiers/bundle"
* claim.identifier.value = "59688475-2324-3242-23473847"
* outcome = #complete

* insurance.focal = true
* insurance.coverage = Reference(coverage1001)

* benefitPeriod.start = "2022-01-01"
* benefitPeriod.end = "2023-01-01"

* item.extension[serviceDescription].valueString = "Imaging"
* item.sequence = 1
* item.revenue = $NUBCREVENUE#0611 "Magnetic Resonance Technology (MRT) - Brain/brain stem"
* item.productOrService = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem)"
* item.modifier = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem)"
* item.servicedDate = "2022-01-01"
* item.net.value = 200.00
* item.net.currency = #USD
* item.adjudication[medicalmanagement].extension[subjectToMedicalMgmt].valueCodeableConcept = PCTSubjectToMedicalMgmtReasonCS#concurrent-review "Concurrent Review"
* item.adjudication[medicalmanagement].category = PCTAdjudicationCategoryCS#medicalmanagement "Medical Management"
// * item.adjudication[medicalmanagement].amount.value = 200.00
// * item.adjudication[medicalmanagement].amount.currency = #USD

* adjudication[medicalmanagement].category = PCTAdjudicationCategoryCS#medicalmanagement "Medical Management"
* adjudication[medicalmanagement].extension[subjectToMedicalMgmt].valueCodeableConcept = PCTSubjectToMedicalMgmtReasonCS#concurrent-review "Concurrent Review"
* adjudication[submitted].category = http://terminology.hl7.org/CodeSystem/adjudication#submitted "Submitted"
* adjudication[memberliability].category = PCTAdjudicationCategoryCS#memberliability "Member Liability"

* total.category = $ADJUDCS#submitted "Submitted Amount"
* total.amount.value = 200.00
* total.amount.currency = #USD

// * processNote.extension[processNoteClass].valueCoding = #disclaimer "Disclaimer"
* processNote.text = "processNote disclaimer text"

* benefitBalance
* benefitBalance.category = http://terminology.hl7.org/CodeSystem/ex-benefitcategory#1 "Medical Care"
* benefitBalance.unit = http://terminology.hl7.org/CodeSystem/benefit-unit#individual
* benefitBalance.term = http://terminology.hl7.org/CodeSystem/benefit-term#annual
* benefitBalance.financial
* benefitBalance.financial.type = http://terminology.hl7.org/CodeSystem/benefit-type#benefit
* benefitBalance.financial.allowedMoney
* benefitBalance.financial.allowedMoney.value = 1
* benefitBalance.financial.allowedMoney.currency = #USD
* benefitBalance.financial.usedMoney
* benefitBalance.financial.usedMoney.value = 1
* benefitBalance.financial.usedMoney.currency = #USD
////////////////////////////////////////////

Instance: PCT-AEOB-Bundle-1
InstanceOf: PCTAEOBBundle
Description: "PCT AEOB Bundle Example 1"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-1234567"
* timestamp = "2021-11-10T11:01:00+05:00"
* entry[aeob].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Inst-Example-1"
* entry[aeob].resource = PCT-AEOB-1
* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient1001"
* entry[patient].resource = patient1001
* entry[coverage].fullUrl = "http://example.org/fhir/Patient/patient1001"
* entry[coverage].resource = coverage1001
* entry[organization].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization].resource = org1001

///////////////////////////////////////////

