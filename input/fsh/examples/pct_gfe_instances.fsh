Alias: ICD10 = http://hl7.org/fhir/sid/icd-10-cm
Alias: PKGCODE = http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup
Alias: Hl7FhirAdminGender = http://hl7.org/fhir/administrative-gender
Alias: Hl7V3MS = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus
Alias: LANGVALSET = urn:ietf:bcp:47
Alias: PRO-ROLE = http://nucc.org/provider-taxonomy
Alias: SPECIALTY = http://nucc.org/provider-taxonomy
Alias: V2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: RELATE = http://terminology.hl7.org/CodeSystem/subscriber-relationship
Alias: CONTRACTTYPE = http://terminology.hl7.org/CodeSystem/contract-type
Alias: COPAYTYPE = http://terminology.hl7.org/CodeSystem/coverage-copay-type
Alias: COVCLASS = http://terminology.hl7.org/CodeSystem/coverage-class
Alias: PAYLOADTYPE = http://hl7.org/fhir/resource-types
Alias: ENDPOINTCONNECTIONTYPE = http://terminology.hl7.org/CodeSystem/endpoint-connection-type

////////////////////////////////////////////

Instance: PCT-GFE-Institutional-1
InstanceOf: PCTGFEInstitutional
Description: "PCT Institutional GFE Example 1"
//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"
* extension[gfeSubmitter].valueReference = Reference(Submitter-Org-1)
* extension[gfeProviderAssignedIdentifier].valueIdentifier.value = "GFEProviderAssignedID0001"
* extension[referralNumber].valueString = "REF12022002-121"
* extension[providerEventMethodology].valueString = "EEMM1021"
* extension[interTransIdentifier].valueIdentifier.value = "InterTransID0001"
* extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
//* type = $ClaimTypeCS#institutional "Institutional"
//* use = #claim
* patient = Reference(patient1001)
* created = "2021-10-05"
* insurer = Reference(org1001)
* provider = Reference(org1002)
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage1001)
* diagnosis[principal].diagnosisCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* diagnosis[principal].packageCode = PKGCODE#400 "Head trauma - concussion"
* item.extension[estimatedDateOfService].valueDate = "2021-10-31"
* item.sequence = 1
* item.revenue = PCTGFEItemRevenueCS#2011 "Revenue Code 1"
* item.productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* item.modifier = PCTGFEItemProcedureCodes#34503 "Some CPT Code 2"
* item.quantity.value = 1
* item.net.value = 200.00
* item.net.currency = #USD
* total.value = 200.00
* total.currency = #USD
* item.detail.sequence = 1
* item.detail.productOrService = $NDC#47781-457
* item.detail.extension[compoundDrugLinkingNumber].valueInteger = 123456

Instance: PCT-GFE-Professional-1
InstanceOf: PCTGFEProfessional
Description: "PCT Professional GFE Example 1"
* extension[gfeSubmitter].valueReference = Reference(Submitter-Practitioner-1)
* extension[gfeProviderAssignedIdentifier].valueIdentifier.value = "GFEProviderAssignedID0002"
* extension[referralNumber].valueString = "REF12022002-122"
* extension[providerEventMethodology].valueString = "EEMM1022"
* extension[interTransIdentifier].valueIdentifier.value = "InterTransID0002"
* extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
//* type = $ClaimTypeCS#professional "Professional"
//* use = #claim
* patient = Reference(patient1001)
* created = "2021-10-05"
* insurer = Reference(org1001)
* provider = Reference(pracRole002)
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage1001)
* diagnosis[principal].diagnosisCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* diagnosis[principal].packageCode = PKGCODE#400 "Head trauma - concussion"
* item.extension[estimatedDateOfService].valueDate = "2021-10-31"
* item.sequence = 1
* item.productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* item.modifier = PCTGFEItemProcedureCodes#34503 "Some CPT Code 2"
* item.locationCodeableConcept = $CMSPOSOID#21 "Inpatient Hospital"
* item.quantity.value = 1
* item.net.value = 200.00
* item.extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0001" 
* item.net.currency = #USD
* total.value = 200.00
* total.currency = #USD

///////////////////////////////////////////

Instance: PCT-GFE-Bundle-Inst-1
InstanceOf: PCTGFEBundleInstitutional
Description: "PCT GFE Bundle Institutional Example 1"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-23473847"
* timestamp = "2021-11-09T11:01:00+05:00"
* entry[Claim].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Inst-Example-1"
* entry[Claim].id = "PCT-GFE-Inst-Example-1"
* entry[Claim].resource.resourceType = "Claim"
* entry[Claim].resource.id = "PCT-GFE-Institutional-1"
//* entry[Claim].resource.meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/pct-gfe-institutional"
* entry[Claim].resource.extension[gfeSubmitter].valueReference = Reference(Submitter-Org-1)
* entry[Claim].resource.extension[gfeProviderAssignedIdentifier].valueIdentifier.value = "GFEProviderAssignedID0001"
* entry[Claim].resource.extension[interTransIdentifier].valueIdentifier.value = "InterTransID0001"
* entry[Claim].resource.status = #active
* entry[Claim].resource.patient = Reference(patient1001)
* entry[Claim].resource.created = "2021-10-05"
* entry[Claim].resource.insurer = Reference(org1001)
* entry[Claim].resource.provider = Reference(org1002)
* entry[Claim].resource.priority = $PROCPRIORITY#normal
* entry[Claim].resource.payee.type.coding = $PAYEETYPE#provider
* entry[Claim].resource.insurance.sequence = 1
* entry[Claim].resource.insurance.focal = true
* entry[Claim].resource.insurance.coverage = Reference(coverage1001)
* entry[Claim].resource.diagnosis[principal].diagnosisCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* entry[Claim].resource.diagnosis[principal].packageCode = PKGCODE#400 "Head trauma - concussion"
* entry[Claim].resource.item.extension[estimatedDateOfService].valueDate = "2021-10-31"
* entry[Claim].resource.item.sequence = 1
* entry[Claim].resource.item.revenue = PCTGFEItemRevenueCS#2011 "Revenue Code 1"
* entry[Claim].resource.item.productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* entry[Claim].resource.item.modifier = PCTGFEItemProcedureCodes#34503 "Some CPT Code 2"
* entry[Claim].resource.item.quantity.value = 1
* entry[Claim].resource.item.net.value = 200.00
* entry[Claim].resource.item.net.currency = #USD
* entry[Claim].resource.total.value = 200.00
* entry[Claim].resource.total.currency = #USD

Instance: PCT-GFE-Bundle-Prof-1
InstanceOf: PCTGFEBundleProfessional
Description: "PCT GFE Bundle Professional Example 1"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-23473847"
* timestamp = "2021-11-09T11:01:00+05:00"
* entry[Claim].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Prof-Example-1"
* entry[Claim].id = "PCT-GFE-Prof-Example-1"
* entry[Claim].resource.resourceType = "Claim"
* entry[Claim].resource.id = "PCT-GFE-Professional-1"
//* entry[Claim].resource.meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/pct-gfe-professional"
* entry[Claim].resource.extension[gfeSubmitter].valueReference = Reference(Submitter-Org-1)
* entry[Claim].resource.extension[gfeProviderAssignedIdentifier].valueIdentifier.value = "GFEProviderAssignedID0001"
* entry[Claim].resource.extension[interTransIdentifier].valueIdentifier.value = "InterTransID0001"
* entry[Claim].resource.status = #active
* entry[Claim].resource.patient = Reference(patient1001)
* entry[Claim].resource.created = "2021-10-05"
* entry[Claim].resource.insurer = Reference(org1001)
* entry[Claim].resource.provider = Reference(org1002)
* entry[Claim].resource.priority = $PROCPRIORITY#normal
* entry[Claim].resource.payee.type.coding = $PAYEETYPE#provider
* entry[Claim].resource.insurance.sequence = 1
* entry[Claim].resource.insurance.focal = true
* entry[Claim].resource.insurance.coverage = Reference(coverage1001)
* entry[Claim].resource.diagnosis[principal].diagnosisCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* entry[Claim].resource.diagnosis[principal].packageCode = PKGCODE#400 "Head trauma - concussion"
* entry[Claim].resource.item.extension[estimatedDateOfService].valueDate = "2021-10-31"
* entry[Claim].resource.item.sequence = 1
* entry[Claim].resource.item.productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* entry[Claim].resource.item.modifier = PCTGFEItemProcedureCodes#34503 "Some CPT Code 2"
* entry[Claim].resource.item.locationCodeableConcept = $CMSPOSOID#21 "Inpatient Hospital"
* entry[Claim].resource.item.quantity.value = 1
* entry[Claim].resource.item.net.value = 200.00
* entry[Claim].resource.item.net.currency = #USD
* entry[Claim].resource.total.value = 200.00
* entry[Claim].resource.total.currency = #USD

///////////////////////////////////////////

Instance: patient1001
Description: "An instance of Patient"
InstanceOf: PCTPatient
* name.given = "Eve"
* name.family = "Betterhalf"
* name.text = "Eve Betterhalf"
//* identifier[memberID].type = #MB
* identifier[memberID].system = "http://example.com/identifiers/member"
* identifier[memberID].value = "12345"
* identifier[employeeID].system = "http://example.com/identifiers/employee"
* identifier[employeeID].value = "667788"
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
InstanceOf: PCTPractitioner
Description: "An instance of PCTPractitioner"
* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[NPI].value = "1234567893"
* name.given = "Patricia"
* name.family = "Primary"
* name.text = "Patricia	Primary"
* name.prefix = "Dr."
* active = true
* gender = Hl7FhirAdminGender#female
* telecom.system = #phone
* telecom.value = "781-232-3231"
* address.text = "32 Fruit Street, Boston MA 02114"
* extension[PCTEndpoint].valueReference = Reference(endpoint001)

Instance: prac002
InstanceOf: PCTPractitioner
Description: "An instance of PCTPractitioner"
* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[NPI].value = "1234567995"
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
InstanceOf: PCTPractitionerRole
Description: "An instance of PCTPractitionerRole"
* code = PRO-ROLE#247100000X
* code.coding.display = "Radiologic Technologist"
* specialty = SPECIALTY#261QM1200X
* specialty.coding.display = "Magnetic Resonance Imaging (MRI) Clinic/Center"
* active = true
* telecom.system = #phone
* telecom.value = "781-232-3232"
* practitioner = Reference(prac002)
* organization = Reference(org1002)
* location = Reference(Provider-Org-Loc-2)


Instance: Submitter-Practitioner-1
InstanceOf: PCTPractitioner
Description: "Professional GFE Submitter 1"
* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[NPI].value = "6456789016"
* identifier[ETIN].value = "ETIN-20020001"
* identifier[ETIN].system = "http://example.com/us-etin"
* name.given = "Nora"
* name.family = "Ologist"
* name.text = "Nora Ologist"
* active = true
* telecom.system = #phone
* telecom.value = "860-547-3301"
* telecom.use = #work
* telecom[1].system = #email
* telecom[1].value = "csender@GFEServiceHelp.com"
* telecom[1].use = #work

Instance: Submitter-Org-1
InstanceOf: PCTOrganization
Description: "Institutional GFE Submitter 1"
* type = PCTOrganizationTypeCS#institutional-submitter "Institutional GFE Submitter"
* name = "GFE Service Help INC."
* identifier[ETIN].value = "ETIN-10010301"
* active = true
* contact[gfeServiceHotline].name.text = "Clara Sender"
* contact[gfeServiceHotline].telecom.system = #phone
* contact[gfeServiceHotline].telecom.value = "781-632-3209"
* contact[gfeServiceHotline].telecom.use = #work
* contact[gfeServiceHotline].telecom[1].system = #email
* contact[gfeServiceHotline].telecom[1].value = "csender@GFEServiceHelp.com"
* contact[gfeServiceHotline].telecom[1].use = #work

Instance: org1001
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization as a payer"
* type = $ORGTYPE#pay "Payer"
* name = "Umbrella Insurance Company"
//* identifier[ETIN].type = PCTOrgIdentifierTypeCS#ETIN "Electronic Transmitter Identification Number"
* identifier[ETIN].value = "ETIN-3200002"
* active = true
* telecom.system = #phone
* telecom.value = "860-547-5001"
* telecom.use = #work
* address.line = "680 Asylum Street"
* address.city = "Hartford"
* address.state = "CT"
* address.postalCode = "06155"
* address.country = "US"
* address.extension[countrySubdivisionCode].valueCoding = $ISO3166-P2-CSC#US-CT

Instance: org1002
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization as a healthcare provider"
* type = $ORGTYPE#prov "Healthcare Provider"
* identifier[NPI].value = "1234568095"
//* identifier.type = V2-0203#TAX "Tax ID number"
* identifier[TAX].value = "TAX-3211001"
* name = "Boston Radiology Center"
* active = true
* extension[ProviderRole].valueCodeableConcept = NUCC#2085D0003X "Diagnostic Neuroimaging (Radiology) Physician"
* telecom.system = #phone
* telecom.value = "781-232-3200"
* telecom.use = #work
* address.line = "32 Fruit Street"
* address.city = "Boston"
* address.state = "MA"
* address.postalCode = "02114"
* address.country = "US"
* address.extension[countrySubdivisionCode].valueCoding = $ISO3166-P2-CSC#US-MA

Instance: Provider-Org-Loc-2
InstanceOf: PCTLocation
Description: "An instance of PCTLocation"
* status = #active
* name = "Boston Radiology Center"
* address.text = "32 Fruit Street, Boston MA 02114"
* managingOrganization = Reference(org1002)

Instance: coverage1001
InstanceOf: PCTCoverage
Description: "An instance of PCTCoverage"
* subscriber = Reference(patient1001)
* beneficiary = Reference(patient1001)
* relationship = RELATE#self "Self"
* status = #active
* class.name = "Premim Family Plus Plan"
* class.type = COVCLASS#plan "Plan"
* class.value = "Premim Family Plus"
* period.start = "2021-01-01"
* period.end = "2022-01-01"
* payor = Reference(org1001)
* subscriberId = "PFP123450000"
* costToBeneficiary.type = COPAYTYPE#copaypct "Copay Percentage"
* costToBeneficiary.valueQuantity.value = 20.00
//* costToBeneficiary.valueMoney.currency = #USD
* contract = Reference(contract1001)

Instance: contract1001
InstanceOf: Contract
Description: "An instance of Contract"
* applies.start = "2021-01-01"
* applies.end = "2022-01-01"
* subject = Reference(patient1001)
* type = CONTRACTTYPE#healthinsurance "Health Insurance"

Instance: endpoint001
InstanceOf: Endpoint
Description: "An instance of Endpoint"
* status = #active
* payloadType = PAYLOADTYPE#CarePlan
* connectionType = ENDPOINTCONNECTIONTYPE#hl7-fhir-rest
* identifier.system = "http://example.org/enpoint-identifier"
* identifier.value = "epid-1"
* address = "http://fhir3.healthintersections.com.au/open/CarePlan"

