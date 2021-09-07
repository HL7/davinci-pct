Instance: PCT-Good-Faith-Estimate-1
InstanceOf: PCTGoodFaithEstimate
Description: "An instance of the PCTGoodFaithEstimate Profile"
//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"
* extension[GFESubmitter].valueReference = Reference(Submitter-Org-1)
* extension[InterTransIdentifier].valueIdentifier.value = "GFEService0001"
* status = #active
* type = $ClaimTypeCS#institutional "Institutional"
* use = #predetermination
* patient = Reference(patientBSJ1)
* created = "2021-09-07"

* insurer = Reference(Insurer-Org-1)

* provider = Reference(Provider-Role-neurologist)

* priority = #normal

* payee.type.coding = #subscriber

* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(BSJ-Coverage-1)

* total.value = 600.00
* total.currency = #USD

////

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
* name = "GFE Service Help INC."
* identifier[ETIN].value = "ETIN-10010001"
* active = true

Instance: Insurer-Org-1
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization"
* name = "Blue Cross Blue Shield"
* identifier[ETIN].value = "ETIN-70010001"
* active = true

Instance: Provider-Org-1
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization"
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
* class.type = #plan
* class.value = "Blue Advantage HMO"
* period.start = "2020-12-01"
* period.end = "2021-11-30"
* payor = Reference(Insurer-Org-1)
* subscriberId = "123456789"
