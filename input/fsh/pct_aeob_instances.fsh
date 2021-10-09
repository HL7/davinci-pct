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

* extension[gfe-reference].valueReference = Reference(PCT-Good-Faith-Estimate-1)
* extension[disclaimer].valueString = "Estimate Only ..."
* extension[expiration-date].valueDate = "2021-10-31"

* status = #active
* type = $ClaimTypeCS#institutional "Institutional"
* use = #claim
* patient = Reference(patientBSJ1)
* created = "2021-09-07"

* insurer = Reference(Insurer-Org-1)

* provider = Reference(Provider-Org-1)
* provider.extension[contracting-status].valueCoding = #in "In Network"
* provider.extension[contracting-rate].valueDecimal = 2000.00

* priority = #normal

//* payee.type.coding = #provider

* outcome = #complete

* insurance.focal = true
* insurance.coverage = Reference(BSJ-Coverage-1)

* item.extension[EstimatedDateOfService].valueDate = "2021-10-31"
* item.sequence = 1
* item.revenue = NUBC#1212 "Some revenue code description"
* item.productOrService = CPT4#1010 "Some CPT-4 code description"
* item.modifier = CPT4#1020 "Some CPT-4 code description"
* item.net.value = 2000.00
* item.net.currency = #USD
* item.adjudication.extension[subjectToMedicalMgmt].valueCoding = #concurrent-review "Concurrent Review"
* item.adjudication.category = #paidtoprovider "Paid to provider"
* item.adjudication.amount.value = 2000.00
* item.adjudication.amount.currency = #USD

* total.category = #submitted "Submitted Amount"
* total.amount.value = 2000.00
* total.amount.currency = #USD

////////////////////////////////////////////





///////////////////////////////////////////

