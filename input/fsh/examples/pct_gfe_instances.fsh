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
Alias: CTROLE = http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTCareTeamRole

////////////////////////////////////////////

Instance: PCT-GFE-Institutional-1
InstanceOf: PCTGFEInstitutional
Description: "PCT Institutional GFE Example 1"
//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"
* extension[gfeSubmitter].valueReference = Reference(Submitter-Org-1)
* extension[gfeProviderAssignedIdentifier].valueIdentifier.value = "GFEProviderAssignedID0001"
* extension[providerEventMethodology].valueString = "EEMM1021"
* extension[interTransIdentifier].valueIdentifier.value = "InterTransID0001"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueString = "223452-2342-2435-008001"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
* patient = Reference(patient1001)
* created = "2021-10-05"
* insurer = Reference(org1001)
* provider = Reference(org1002)
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* referral.extension[referralNumber].valueString = "REF12022002-121"
* referral.display = "Referral Number"
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
* extension[providerEventMethodology].valueString = "EEMM1022"
* extension[interTransIdentifier].valueIdentifier.value = "InterTransID0002"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueString = "223452-2342-2435-008001"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
* patient = Reference(patient1001)
* created = "2021-10-05"
* insurer = Reference(org1001)
* provider = Reference(pracRole002)
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* referral.extension[referralNumber].valueString = "REF12022002-122"
* referral.display = "Referral Number"
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
InstanceOf: PCTGFEBundle
Description: "PCT GFE Bundle Institutional Example 1"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-23473847"
* timestamp = "2021-11-09T11:01:00+05:00"
* entry[gfeInstitutional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Inst-Example-1"
* entry[gfeInstitutional].id = "PCT-GFE-Inst-Example-1"
* entry[gfeInstitutional].resource = PCT-GFE-Institutional-1

Instance: PCT-GFE-Bundle-Prof-1
InstanceOf: PCTGFEBundle
Description: "PCT GFE Bundle Professional Example 1"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-23473847"
* timestamp = "2021-11-09T11:01:00+05:00"
* entry[gfeProfessional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Prof-Example-1"
* entry[gfeProfessional].id = "PCT-GFE-Prof-Example-1"
* entry[gfeProfessional].resource = PCT-GFE-Professional-1


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
* identifier[TAX].value = "TAX-3211001"
* name = "Boston Radiology Center"
* active = true
* extension[ProviderTaxonomy].valueCodeableConcept = NUCC#2085D0003X "Diagnostic Neuroimaging (Radiology) Physician"
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

////////////////////////////////////////////

Instance: PCT-GFE-Institutional-Infusion
InstanceOf: PCTGFEInstitutional
Description: "PCT Institutional GFE Example - Infusion Therapy"
* extension[gfeSubmitter].valueReference = Reference(Submitter-Org-2)
* extension[gfeProviderAssignedIdentifier].valueIdentifier.value = "GFEProviderAssignedID0004"
* extension[providerEventMethodology].valueString = "EEMM1022"
* extension[interTransIdentifier].valueIdentifier.value = "InterTransID0004"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueString = "223452-2342-2435-008001"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
* patient = Reference(patient1002)
* created = "2022-01-07"
* insurer = Reference(org1003)
* provider = Reference(org1005)
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* referral.extension[referralNumber].valueString = "REF12022002-122"
* referral.display = "Referral Number"
* careTeam[0].sequence = 1
* careTeam[0].provider = Reference(prac003)
* careTeam[0].role = CTROLE#referring
* careTeam[1].sequence = 2
* careTeam[1].provider = Reference(org1005)
* careTeam[1].role = CTROLE#rendering
* careTeam[1].qualification = NUCC#261QI0500X "Infusion Therapy Clinic/Center"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage1002)
* diagnosis[principal].diagnosisCodeableConcept = ICD10#M06.9 "Rheumatoid arthritis, unspecified"
* item[0].extension[estimatedDateOfService].valueDate = "2021-10-31"
* item[0].sequence = 1
* item[0].revenue = PCTGFEItemRevenueCS#2011 "Revenue Code 1"
//* item[0].productOrService = PCTGFEItemProcedureCodes#96413 "Chemo administration, intravenous infusion; up to 1 hour, single or initial substance or drug"
* item[0].productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* item[0].locationCodeableConcept = $CMSPOSOID#11 "Office"
* item[0].quantity.value = 2
* item[0].unitPrice.value = 148.30
* item[0].net.value = 296.60
* item[0].extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0001" 
* item[0].net.currency = #USD
* item[1].extension[estimatedDateOfService].valueDate = "2021-10-31"
* item[1].sequence = 2
* item[1].revenue = PCTGFEItemRevenueCS#2011 "Revenue Code 1"
//* item[1].productOrService = PCTGFEItemProcedureCodes#J9312 "Inj., Rituximab, 10 Mg"
* item[1].productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* item[1].locationCodeableConcept = $CMSPOSOID#11 "Office"
* item[1].quantity.value = 75
* item[1].unitPrice.value = 182.70
* item[1].net.value = 13702.00
* item[1].extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0002" 
* item[1].net.currency = #USD
* item[2].extension[estimatedDateOfService].valueDate = "2021-10-31"
* item[2].sequence = 3
* item[2].revenue = PCTGFEItemRevenueCS#2011 "Revenue Code 1"
//* item[2].productOrService = PCTGFEItemProcedureCodes#J9260 "Methotrexate sodium, 50 mg"
* item[2].productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* item[2].locationCodeableConcept = $CMSPOSOID#11 "Office"
* item[2].quantity.value = 1
* item[2].unitPrice.value = 23.00
* item[2].net.value = 23.00
* item[2].extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0003" 
* item[2].net.currency = #USD
* total.value = 14082.00
* total.currency = #USD

Instance: PCT-GFE-Professional-Infusion
InstanceOf: PCTGFEProfessional
Description: "PCT Professional GFE Example - Infusion Therapy"
* extension[gfeSubmitter].valueReference = Reference(Submitter-Practitioner-2)
* extension[gfeProviderAssignedIdentifier].valueIdentifier.value = "GFEProviderAssignedID0004"
* extension[providerEventMethodology].valueString = "EEMM1022"
* extension[interTransIdentifier].valueIdentifier.value = "InterTransID0004"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueString = "223452-2342-2435-008001"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
* patient = Reference(patient1002)
* created = "2022-01-07"
* insurer = Reference(org1003)
* provider = Reference(org1005)
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* referral.extension[referralNumber].valueString = "REF12022002-122"
* referral.display = "Referral Number"
* careTeam[0].sequence = 1
* careTeam[0].provider = Reference(prac003)
* careTeam[0].role = CTROLE#referring
* careTeam[1].sequence = 2
* careTeam[1].provider = Reference(org1005)
* careTeam[1].role = CTROLE#rendering
* careTeam[1].qualification = NUCC#261QI0500X "Infusion Therapy Clinic/Center"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage1002)
* diagnosis[principal].diagnosisCodeableConcept = ICD10#M06.9 "Rheumatoid arthritis, unspecified"
* item[0].extension[estimatedDateOfService].valueDate = "2021-10-31"
* item[0].sequence = 1
//* item[0].productOrService = PCTGFEItemProcedureCodes#96413 "Chemo administration, intravenous infusion; up to 1 hour, single or initial substance or drug"
* item[0].productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* item[0].locationCodeableConcept = $CMSPOSOID#11 "Office"
* item[0].quantity.value = 2
* item[0].unitPrice.value = 148.30
* item[0].net.value = 296.60
* item[0].extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0001" 
* item[0].net.currency = #USD
* item[1].extension[estimatedDateOfService].valueDate = "2021-10-31"
* item[1].sequence = 2
//* item[1].productOrService = PCTGFEItemProcedureCodes#J9312 "Inj., Rituximab, 10 Mg"
* item[1].productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* item[1].locationCodeableConcept = $CMSPOSOID#11 "Office"
* item[1].quantity.value = 75
* item[1].unitPrice.value = 182.70
* item[1].net.value = 13702.00
* item[1].extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0002" 
* item[1].net.currency = #USD
* item[2].extension[estimatedDateOfService].valueDate = "2021-10-31"
* item[2].sequence = 3
//* item[2].productOrService = PCTGFEItemProcedureCodes#J9260 "Methotrexate sodium, 50 mg"
* item[2].productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* item[2].locationCodeableConcept = $CMSPOSOID#11 "Office"
* item[2].quantity.value = 1
* item[2].unitPrice.value = 23.00
* item[2].net.value = 23.00
* item[2].extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0003" 
* item[2].net.currency = #USD
* total.value = 14082.00
* total.currency = #USD

///////////////////////////////////////////

Instance: PCT-GFE-Bundle-Inst-Infusion
InstanceOf: PCTGFEBundle
Description: "PCT GFE Bundle Institutional Example - Infusion Therapy"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-34584958"
* timestamp = "2022-01-07T11:01:00+05:00"
* entry[gfeInstitutional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Inst-Example-Inf"
* entry[gfeInstitutional].id = "PCT-GFE-Inst-Example-Inf"
* entry[gfeInstitutional].resource = PCT-GFE-Institutional-Infusion

Instance: PCT-GFE-Bundle-Prof-Infusion
InstanceOf: PCTGFEBundle
Description: "PCT GFE Bundle Professional Example - Infusion Therapy"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-34584958"
* timestamp = "2022-01-07T11:01:00+05:00"
* entry[gfeProfessional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Prof-Example-Inf"
* entry[gfeProfessional].id = "PCT-GFE-Prof-Example-Inf"
* entry[gfeProfessional].resource = PCT-GFE-Professional-Infusion

///////////////////////////////////////////

Instance: patient1002
Description: "An instance of Patient"
InstanceOf: PCTPatient
* name.given = "RayAnn"
* name.family = "Reeves"
* name.text = "RayAnn Reeves"
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

Instance: prac003
InstanceOf: PCTPractitioner
Description: "An instance of PCTPractitioner"
* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[NPI].value = "1234567894"
* name.given = "Rose"
* name.family = "Ruma"
* name.text = "Rose Ruma"
* name.prefix = "Dr."
* active = true
* gender = Hl7FhirAdminGender#female
* telecom.system = #phone
* telecom.value = "781-232-3231"
* address.text = "32 Fruit Street, Boston MA 02114"
* extension[PCTEndpoint].valueReference = Reference(endpoint002)

Instance: pracRole003
InstanceOf: PCTPractitionerRole
Description: "An instance of PCTPractitionerRole"
* code = PRO-ROLE#207RR0500X
* code.coding.display = "Rheumatology Physician"
* active = true
* telecom.system = #phone
* telecom.value = "781-232-3232"
* practitioner = Reference(prac003)
* organization = Reference(org1004)
* location = Reference(Provider-Org-Loc-4)

Instance: Submitter-Practitioner-2
InstanceOf: PCTPractitioner
Description: "Professional GFE Submitter 2"
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

Instance: Submitter-Org-2
InstanceOf: PCTOrganization
Description: "Institutional GFE Submitter 2"
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

Instance: org1003
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization as a payer"
* type = $ORGTYPE#pay "Payer"
* name = "HC Payor, Inc."
* identifier[ETIN].value = "ETIN-4300003"
* active = true
* telecom.system = #phone
* telecom.value = "860-547-5003"
* telecom.use = #work
* address.line = "780 Asylum Street"
* address.city = "Hartford"
* address.state = "CT"
* address.postalCode = "06155"
* address.country = "US"
* address.extension[countrySubdivisionCode].valueCoding = $ISO3166-P2-CSC#US-CT

Instance: org1004
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization as a healthcare provider"
* type = $ORGTYPE#prov "Healthcare Provider"
* identifier[NPI].value = "1234568097"
* identifier[TAX].value = "TAX-3211003"
* name = "Allied Arthritis Associates"
* active = true
* extension[ProviderTaxonomy].valueCodeableConcept = NUCC#207RR0500X "Rheumatology Physician"
* telecom.system = #phone
* telecom.value = "781-232-3203"
* telecom.use = #work
* address.line = "35 Fruit Street"
* address.city = "Boston"
* address.state = "MA"
* address.postalCode = "02114"
* address.country = "US"
* address.extension[countrySubdivisionCode].valueCoding = $ISO3166-P2-CSC#US-MA

Instance: org1005
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization as a healthcare provider"
* type = $ORGTYPE#prov "Healthcare Provider"
* identifier[NPI].value = "2223334563"
* name = "University Infusion Center"
* active = true
* extension[ProviderTaxonomy].valueCodeableConcept = NUCC#261QI0500X "Infusion Therapy Clinic/Center"
* telecom.system = #phone
* telecom.value = "781-232-3207"
* telecom.use = #work
* address.line = "37 Fruit Street"
* address.city = "Boston"
* address.state = "MA"
* address.postalCode = "02114"
* address.country = "US"
* address.extension[countrySubdivisionCode].valueCoding = $ISO3166-P2-CSC#US-MA
* partOf = Reference(org1006)

Instance: org1006
InstanceOf: USCoreOrganizationProfile
Description: "An instance of Organization (US Core) as an educational institution"
* type = $ORGTYPE#edu "Educational Institute"
* name = "University"
* active = true
* telecom.system = #phone
* telecom.value = "781-232-3207"
* telecom.use = #work
* address.line = "39 Fruit Street"
* address.city = "Boston"
* address.state = "MA"
* address.postalCode = "02114"
* address.country = "US"
* address.extension[countrySubdivisionCode].valueCoding = $ISO3166-P2-CSC#US-MA

Instance: Provider-Org-Loc-4
InstanceOf: PCTLocation
Description: "An instance of PCTLocation"
* status = #active
* name = "Allied Arthritis Associates"
* address.text = "35 Fruit Street, Boston MA 02114"
* managingOrganization = Reference(org1004)

Instance: coverage1002
InstanceOf: PCTCoverage
Description: "An instance of PCTCoverage"
* subscriber = Reference(patient1002)
* beneficiary = Reference(patient1002)
* relationship = RELATE#self "Self"
* status = #active
* class.name = "Premim Family Plus Plan"
* class.type = COVCLASS#plan "Plan"
* class.value = "Premim Family Plus"
* period.start = "2021-01-01"
* period.end = "2022-01-01"
* payor = Reference(org1003)
* subscriberId = "PFP123450001"
* costToBeneficiary.type = COPAYTYPE#copaypct "Copay Percentage"
* costToBeneficiary.valueQuantity.value = 20.00
//* costToBeneficiary.valueMoney.currency = #USD
* contract = Reference(contract1002)

Instance: contract1002
InstanceOf: Contract
Description: "An instance of Contract"
* applies.start = "2021-01-01"
* applies.end = "2022-01-01"
* subject = Reference(patient1002)
* type = CONTRACTTYPE#healthinsurance "Health Insurance"

Instance: endpoint002
InstanceOf: Endpoint
Description: "An instance of Endpoint"
* status = #active
* payloadType = PAYLOADTYPE#CarePlan
* connectionType = ENDPOINTCONNECTIONTYPE#hl7-fhir-rest
* identifier.system = "http://example.org/enpoint-identifier"
* identifier.value = "epid-1"
* address = "http://fhir3.healthintersections.com.au/open/CarePlan"
