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
* extension[disclaimer].valueString = "Estimate Only ..."
* extension[expirationDate].valueDate = "2021-10-31"

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
* item.net.value = 200.00
* item.net.currency = #USD
* item.adjudication.extension[subjectToMedicalMgmt].valueCoding = PCTSubjectToMedicalMgmtReasonCS#concurrent-review "Concurrent Review"
* item.adjudication.category = PCTAdjudicationCategoryType#paidtoprovider "Paid to provider"
* item.adjudication.amount.value = 200.00
* item.adjudication.amount.currency = #USD

* total.category = $ADJUDCS#submitted "Submitted Amount"
* total.amount.value = 200.00
* total.amount.currency = #USD

////////////////////////////////////////////

Instance: PCT-AEOB-Bundle-1
InstanceOf: PCTAEOBBundle
Description: "PCT AEOB Bundle Example 1"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-1234567"
* timestamp = "2021-11-10T11:01:00+05:00"
* entry[ExplanationOfBenefit].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Inst-Example-1"
* entry[ExplanationOfBenefit].id = "PCT-AEOB-1"
* entry[ExplanationOfBenefit].resource = PCT-AEOB-1

///////////////////////////////////////////

