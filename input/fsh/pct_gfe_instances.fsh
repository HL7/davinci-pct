Alias: ICD10 = http://hl7.org/fhir/sid/icd-10-cm
Alias: PKGCODE = http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup
Alias: Hl7FhirAdminGender = http://hl7.org/fhir/administrative-gender
Alias: Hl7V3MS = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus
Alias: LANGVALSET = urn:ietf:bcp:47
Alias: PRO-ROLE = http://nucc.org/provider-taxonomy
Alias: SPECIALTY = http://nucc.org/provider-taxonomy
Alias: V2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203

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
* patient = Reference(patient1001)
* created = "2021-10-05"

* insurer = Reference(org1001)

* provider = Reference(pracRole002)

* priority = #normal

* payee.type.coding = #provider

* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage1001)
* diagnosis[principal].diagnosisCodeableConcept = ICD10#S06.3 "Focal traumatic brain injury"
* diagnosis[principal].packageCode = PKGCODE#400 "Head trauma - concussion"

* item.extension[estimatedDateOfService].valueDate = "2021-10-31"
* item.sequence = 1
* item.revenue = NUBC#1212 "Some revenue code description"
* item.productOrService = CPT4#71010 "Some CPT code description"
* item.modifier = CPT4#71020 "Some CPT code description"
* item.net.value = 200.00
* item.net.currency = #USD

* total.value = 200.00
* total.currency = #USD

///////////////////////////////////////////

Instance: patient1001
Description: "An instance of Patient"
InstanceOf: Patient
* name.given = "Eve"
* name.family = "Betterhalf"
* name.text = "Eve Betterhalf"
* identifier.type = #MB
* identifier.system = "http://www.acme.com/identifiers/patient"
* identifier.value = "12345"
* gender = Hl7FhirAdminGender#female
* birthDate = "1955-07-23"
* maritalStatus = Hl7V3MS#U "unmarried"
* telecom.system = #phone
* telecom.value = "781-949-4949"
* telecom.use = #mobile
* address.text = "222 Burlington Road, Bedford MA 01730"
* communication.language.coding = LANGVALSET#en-US "English (United States)"
* communication.preferred = true

Instance: prac001
InstanceOf: Practitioner
Description: "An instance of Practitioner"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1234567893"
* name.given = "Patricia"
* name.family = "Primary"
* name.text = "Patricia	Primary"
* name.prefix = "Dr."
* active = true
* gender = Hl7FhirAdminGender#female
* telecom.system = #phone
* telecom.value = "781-232-3231"
* address.text = "32 Fruit Street, Boston MA 02114"

Instance: prac002
InstanceOf: Practitioner
Description: "An instance of Practitioner"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1234567893"
* name.given = "Christine"
* name.family = "Curie"
* name.text = "Christine Curie"
* name.prefix = "Dr."
* active = true
* gender = Hl7FhirAdminGender#female
* telecom.system = #phone
* telecom.value = "781-232-3232"
* address.text = "32 Fruit Street, Boston MA 02114"

Instance: pracRole002
InstanceOf: PractitionerRole
Description: "An instance of PractitionerRole"
* code = PRO-ROLE#247100000X
* code.coding.display = "Radiologic Technologist"
* specialty = SPECIALTY#261QM1200X
* specialty.coding.display = "Magnetic Resonance Imaging (MRI)"
* active = true
* practitioner = Reference(prac002)
* organization = Reference(org1002)
* location = Reference(Provider-Org-Loc-1)

// Instance: prac002
// InstanceOf: Practitioner
// Description: "An instance of Practitioner"
// * identifier.system = "http://hl7.org/fhir/sid/us-npi"
// * identifier.value = "3668788925"
// * name.given = "Nora"
// * name.family = "Ologist"
// * name.text = "Nora Ologist"
// * active = true
// * gender = #female

Instance: Submitter-Org-1
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization"
* type = #Institutional-submitter "Institutional GFE Submitter"
* name = "GFE Service Help INC."
* identifier[ETIN].value = "ETIN-10010001"
* active = true

Instance: org1001
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization"
* type = #pay "Payer"
* name = "Umbrella Insurance Company"
* identifier[ETIN].value = "ETIN-1001001"
* active = true
* telecom.system = #phone
* telecom.value = "860-547-5001"
* telecom.use = #work
* address.line = "680 Asylum Street"
* address.city = "Hartford"
* address.state = "CT"
* address.postalCode = "06155"
* address.country = "USA"
* address.extension[countrySubdivisionCode].valueString = "US-CT"

Instance: org1002
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization"
* type = #prov "Healthcare Provider"
* identifier.type = V2-0203#TAX "Tax ID number"
* identifier.value = "TAX-1001001"
* name = "Boston Radiology Center"
* active = true
* telecom.system = #phone
* telecom.value = "781-232-3200"
* telecom.use = #work
* address.line = "32 Fruit Street"
* address.city = "Boston"
* address.state = "MA"
* address.postalCode = "02114"
* address.country = "USA"
* address.extension[countrySubdivisionCode].valueString = "US-MA"

Instance: Provider-Org-Loc-1
InstanceOf: Location
Description: "An instance of Location"
* status = #active
* name = "Boston Radiology Center"
* address.text = "32 Fruit Street, Boston MA 02114"

Instance: coverage1001
InstanceOf: Coverage
Description: "An instance of Coverage"
* subscriber = Reference(patient1001)
* beneficiary = Reference(patient1001)
* status = #active
* class.type = #plan "Plan"
* class.value = "Premim Family Plus"
* period.start = "2021-01-01"
* period.end = "2022-01-01"
* payor = Reference(org1001)
* subscriberId = "PFP123450000"
