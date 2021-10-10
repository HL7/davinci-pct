Alias: ICD10 = http://hl7.org/fhir/sid/icd-10-cm
Alias: PKGCODE = http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup

////////////////////////////////////////////

Instance: PCT-Good-Faith-Estimate-1
InstanceOf: PCTGoodFaithEstimate
Description: "An instance of the PCTGoodFaithEstimate Profile"
//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"
* extension[gfeSubmitter].valueReference = Reference(Submitter-Org-1)
* extension[gfeAssignedServiceIdentifier].valueIdentifier.value = "GFEAssignedServiceID0001"
* extension[interTransIdentifier].valueIdentifier.value = "InterTransID0001"
* status = #active
* type = $ClaimTypeCS#institutional "Institutional"
* use = #claim
* patient = Reference(patientBSJ1)
* created = "2021-10-05"

* insurer = Reference(Insurer-Org-1)

* provider = Reference(Provider-Role-neurologist)

* priority = #normal

* payee.type.coding = #provider

* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(BSJ-Coverage-1)
* diagnosis[principal].diagnosisCodeableConcept = ICD10#J44.9 "Chronic obstructive pulmonary disease, unspecified"
* diagnosis[principal].packageCode = PKGCODE#500 "Chronic obstructive pulmonary disease"

* item.extension[estimatedDateOfService].valueDate = "2021-10-31"
* item.sequence = 1
* item.revenue = NUBC#1212 "Some revenue code description"
* item.productOrService = CPT4#1010 "Some CPT-4 code description"
* item.modifier = CPT4#1020 "Some CPT-4 code description"
* item.net.value = 2000.00
* item.net.currency = #USD

* total.value = 2000.00
* total.currency = #USD

///////////////////////////////////////////

Instance: patientBSJ1
Description: "An instance of Patient"
InstanceOf: Patient
* name.given = "Betsy"
* name.family = "Smith-Johnson"
* name.text = "Betsy Smith-Johnson"

Instance: Provider-Role-neurologist
InstanceOf: PractitionerRole
Description: "An instance of PractitionerRole"
* code = NUCC#2084N0400X
* code.coding.display = "Neurology"
* specialty = NUCC#2084N0400X
* specialty.coding.display = "Neurology"
* active = true
* practitioner = Reference(Practitioner-NoraOlogist)
* organization = Reference(Provider-Org-1)
* location = Reference(Provider-Org-Loc-1)

Instance: Practitioner-NoraOlogist
InstanceOf: Practitioner
Description: "An instance of Practitioner"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "3668788925"
* name.given = "Nora"
* name.family = "Ologist"
* name.text = "Nora Ologist"
* active = true
* gender = #female

Instance: Submitter-Org-1
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization"
* type = #Institutional-submitter "Institutional GFE Submitter"
* name = "GFE Service Help INC."
* identifier[ETIN].value = "ETIN-10010001"
* active = true

Instance: Insurer-Org-1
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization"
* type = #pay "Payer"
* name = "Blue Cross Blue Shield"
* identifier[ETIN].value = "ETIN-70010001"
* active = true

Instance: Provider-Org-1
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization"
* type = #prov "Healthcare Provider"
* name = "Neuro Care INC."
* active = true

Instance: Provider-Org-Loc-1
InstanceOf: Location
Description: "An instance of Location"
* status = #active
* name = "Neuro Care INC."
* address.text = "26022 Meadowlark Bay, San Antonio, TX 78260"

Instance: BSJ-Coverage-1
InstanceOf: Coverage
Description: "An instance of Coverage"
* subscriber = Reference(patientBSJ1)
* beneficiary = Reference(patientBSJ1)
* status = #active
* class.type = #plan "Plan"
* class.value = "Blue Advantage HMO"
* period.start = "2020-12-01"
* period.end = "2021-11-30"
* payor = Reference(Insurer-Org-1)
* subscriberId = "123456789"
