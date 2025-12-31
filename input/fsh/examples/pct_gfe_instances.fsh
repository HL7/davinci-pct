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
Usage: #example

// * id = "aedb6db2-c8a4-41e8-a8e1-722258ff01dd"
// * identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
// * identifier[ETIN].value = "ETIN-10010001"
// * text.status = #generated
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Claim PCT-GFE-Institutional-1</b></p><a name=\"PCT-GFE-Institutional-1\"> </a><a name=\"hcPCT-GFE-Institutional-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-institutional.html\">PCT Good Faith Estimate Institutional</a></p></div><p><b>ProviderEventMethodology</b>: EEMM1021</p><p><b>GFEDisclaimer</b>: For estimation purposes only</p><blockquote><p><b>GFEServiceLinkingInfo</b></p><ul><li>linkingIdentifier: <code>http://example.org/Claim/identifiers</code>/223452-2342-2435-008001</li><li>plannedPeriodOfService: 2021-10-31</li></ul></blockquote><p><b>identifier</b>: Placer Identifier/GFEProviderAssignedID0001</p><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/claim-type institutional}\">Institutional</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-9c05d948-b931-4bff-8766-18b99b0650d4\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-2ccf0ff7-2af1-4598-b667-6e35b79529df\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>provider</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-e7c36e30-edb8-4a0a-8208-c92085663b00\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Payees</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/payeetype provider}\">Provider</span></td></tr></table><p><b>referral</b>: Referral Number</p><h3>SupportingInfos</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Category</b></td><td><b>Code</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTSupportingInfoType typeofbill}\">Type of Bill</span></td><td><span title=\"Codes:{https://www.nubc.org/CodeSystem/TypeOfBill 011X}\">Hospital Inpatient (Part A)</span></td></tr></table><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-49fd53a8-7eb7-4319-acc8-04bf8a3cb603\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></td></tr></table><blockquote><p><b>item</b></p><p><b>Service Description</b>: Imaging</p><p><b>sequence</b>: 1</p><p><b>revenue</b>: <span title=\"Codes:{https://www.nubc.org/CodeSystem/RevenueCodes 0611}\">Magnetic Resonance Technology (MRT) - Brain/brain stem</span></p><p><b>productOrService</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>modifier</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>serviced</b>: 2021-10-31</p><p><b>quantity</b>: 1</p><h3>Nets</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></blockquote><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"
* identifier[PLAC].system = V2-0203
* identifier[PLAC].value = "GFEProviderAssignedID0001"
/* Remove GFE Submitter
* extension[gfeSubmitter].valueReference = Reference(Submitter-Org-1)
*/
* extension[providerEventMethodology].valueString = "EEMM1021"
* extension[gfeDisclaimer].valueString = "For estimation purposes only"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier.value = "223452-2342-2435-008001"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier.system = "http://example.org/Claim/identifiers"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
* type = $ClaimTypeCS#institutional "Institutional"
// * patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* patient = Reference(patient1001)

* created = "2021-10-05"
// * insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(2ccf0ff7-2af1-4598-b667-6e35b79529df) // = Reference(org1001)
* insurer = Reference(org1001)
// * provider.reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* provider = Reference(Submitter-Org-1)
* provider.extension[ProviderTaxonomy].valueCodeableConcept = NUCC#2085D0003X "Diagnostic Neuroimaging (Radiology) Physician"
* provider.extension[consentForBalanceBilling].valueBoolean = true
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* referral.extension[referralNumber].valueString = "REF12022002-121"
* referral.display = "Referral Number"
* supportingInfo[typeOfBill].sequence = 1
* supportingInfo[typeOfBill].category = http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTSupportingInfoType#typeofbill
* supportingInfo[typeOfBill].code = https://www.nubc.org/CodeSystem/TypeOfBill#011X "Hospital Inpatient (Part A)"
* insurance.sequence = 1
* insurance.focal = true
// * insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
* insurance.coverage = Reference(coverage1001)
* diagnosis[principal].diagnosisCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* diagnosis[principal].packageCode = PKGCODE#400 "Head trauma - concussion"
* item.extension[ServiceDescription].valueString = "Imaging"
* item.sequence = 1
* item.revenue = $NUBCREVENUE#0611 "Magnetic Resonance Technology (MRT) - Brain/brain stem"
* item.productOrService = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.modifier = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.servicedDate = 2021-10-31
* item.quantity.value = 1
* item.net.value = 200.00
* item.net.currency = #USD
//* item.detail.sequence = 1
//* item.detail.productOrService = $NDC#47781-457
* total.value = 200.00
* total.currency = #USD




Instance: PCT-GFE-Summary-1
InstanceOf: PCTGFESummary
Description: "PCT Summary GFE Example 1"
Usage: #example

// * id = "3e67b7e5-e15b-4003-802b-79bfc0ba4847"
//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"
// * text.status = #generated 
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Claim PCT-GFE-Summary-1</b></p><a name=\"PCT-GFE-Summary-1\"> </a><a name=\"hcPCT-GFE-Summary-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-summary.html\">PCT Good Faith Estimate  Summary</a></p></div><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTEstimateTypeSummaryCSTemporaryTrialUse estimate-summary}\">Estimate Summary</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-9c05d948-b931-4bff-8766-18b99b0650d4\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>billablePeriod</b>: 2021-10-31 --&gt; 2021-10-31</p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-2ccf0ff7-2af1-4598-b667-6e35b79529df\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>provider</b>: ?rref?</p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-49fd53a8-7eb7-4319-acc8-04bf8a3cb603\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></td></tr></table><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"

* status = #active
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
// * patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* patient = Reference(patient1001)

* created = "2021-10-05"
* billablePeriod.start = "2021-10-31"
* billablePeriod.end = "2021-10-31"

// * insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df"
* insurer = Reference(org1001)

//* provider = Reference(Submitter-Org-1)
//* provider.extension[ProviderTaxonomy].valueCodeableConcept = NUCC#2085D0003X "Diagnostic Neuroimaging (Radiology) Physician"
//* provider.extension[consentForBalanceBilling].valueBoolean = true
* priority = $PROCPRIORITY#normal
//* payee.type.coding = $PAYEETYPE#provider
//* referral.extension[referralNumber].valueString = "REF12022002-121"
//* referral.display = "Referral Number"
//* supportingInfo[typeOfBill].sequence = 1
//* supportingInfo[typeOfBill].category = http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTSupportingInfoType#typeofbill
//* supportingInfo[typeOfBill].code = https://www.nubc.org/CodeSystem/TypeOfBill#011X "Hospital Inpatient (Part A)"
* insurance.sequence = 1
* insurance.focal = true

// * insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
* insurance.coverage  = Reference(coverage1001)

* diagnosis[principal].diagnosisCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* diagnosis[principal].packageCode = PKGCODE#400 "Head trauma - concussion"
/* item.extension[ServiceDescription].valueString = "Imaging"
* item.sequence = 1
* item.revenue = $NUBCREVENUE#0611 "Magnetic Resonance Technology (MRT) - Brain/brain stem"
* item.productOrService = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.modifier = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.servicedDate = 2021-10-31
* item.quantity.value = 1
* item.net.value = 200.00
* item.net.currency = #USD
//* item.detail.sequence = 1
//* item.detail.productOrService = $NDC#47781-457

*/
* total.value = 200.00
* total.currency = #USD

Instance: PCT-GFE-Professional-MRI
InstanceOf: PCTGFEProfessional
Description: "PCT Professional GFE Example 1"
Usage: #example

// * id = "6369b2f8-1154-4935-a27f-4a578d9e384c"
// * text.status = #generated 
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Claim PCT-GFE-Professional-MRI</b></p><a name=\"PCT-GFE-Professional-MRI\"> </a><a name=\"hcPCT-GFE-Professional-MRI\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-professional.html\">PCT Good Faith Estimate Professional</a></p></div><p><b>ProviderEventMethodology</b>: EEMM1022</p><blockquote><p><b>GFEServiceLinkingInfo</b></p><ul><li>linkingIdentifier: <code>http://example.org/Claim/identifiers</code>/223452-2342-2435-008001</li><li>plannedPeriodOfService: 2021-10-31</li></ul></blockquote><p><b>identifier</b>: Placer Identifier/GFEProviderAssignedID0002</p><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/claim-type professional}\">Professional</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-9c05d948-b931-4bff-8766-18b99b0650d4\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-2ccf0ff7-2af1-4598-b667-6e35b79529df\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>provider</b>: <a href=\"Bundle-PCT-GFE-Packet-Prof-1.html#urn-uuid-2e4341dc-70b8-4709-9fa9-0b6d64cf21bb\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-2347384711; type = document; timestamp = 2024-03-29 11:01:00+0500</a></p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Payees</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/payeetype provider}\">Provider</span></td></tr></table><p><b>referral</b>: Referral Number</p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-49fd53a8-7eb7-4319-acc8-04bf8a3cb603\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></td></tr></table><blockquote><p><b>item</b></p><p><b>Service Description</b>: Imaging</p><p><b>GFEBillingProviderLineItemCtrlNum</b>: GFEBillingProviderLineItemCtrlNum-0001</p><p><b>sequence</b>: 1</p><p><b>productOrService</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>modifier</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>serviced</b>: 2021-10-31</p><p><b>location</b>: <span title=\"Codes:{https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set 21}\">Inpatient Hospital</span></p><p><b>quantity</b>: 1</p><h3>UnitPrices</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table><h3>Nets</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></blockquote><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"

* identifier[PLAC].system = V2-0203
* identifier[PLAC].value = "GFEProviderAssignedID0002"
/* Remove GFE Submitter
* extension[gfeSubmitter].valueReference = Reference(Submitter-Practitioner-1)
*/
* extension[providerEventMethodology].valueString = "EEMM1022"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier.value = "223452-2342-2435-008001"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier.system = "http://example.org/Claim/identifiers"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
* type = $ClaimTypeCS#professional "Professional"
// * patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* patient = Reference(patient1001)

* created = "2021-10-05"
// * insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* insurer = Reference(org1001)
// * provider.reference = "urn:uuid:2e4341dc-70b8-4709-9fa9-0b6d64cf21bb" // = Reference(Submitter-Practitioner-1)
* provider = Reference(Submitter-Practitioner-1)
* provider.extension[ProviderTaxonomy].valueCodeableConcept = NUCC#2085D0003X "Diagnostic Neuroimaging (Radiology) Physician"
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* referral.extension[referralNumber].valueString = "REF12022002-122"
* referral.display = "Referral Number"
* insurance.sequence = 1
* insurance.focal = true
// * insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
* insurance.coverage = Reference(coverage1001)
* diagnosis[principal].diagnosisCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* diagnosis[principal].packageCode = PKGCODE#400 "Head trauma - concussion"
* item.extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0001"
* item.sequence = 1
* item.productOrService = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.modifier = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.servicedDate = 2021-10-31
* item.extension[ServiceDescription].valueString = "Imaging"
* item.locationCodeableConcept = $CMSPOSCS#21 "Inpatient Hospital"
* item.quantity.value = 1
* item.unitPrice.value = 200.00
* item.unitPrice.currency = #USD
* item.net.value = 200.00
* item.net.currency = #USD
* total.value = 200.00
* total.currency = #USD

Instance: PCT-GFE-Summary-MRI
InstanceOf: PCTGFESummary
Description: "PCT Summary MRI GFE"
Usage: #example

// * id = "ef5c6c33-aab0-4346-a79c-22b8f1e75ff4"
// * text.status = #generated 
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Claim PCT-GFE-Summary-MRI</b></p><a name=\"PCT-GFE-Summary-MRI\"> </a><a name=\"hcPCT-GFE-Summary-MRI\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-summary.html\">PCT Good Faith Estimate  Summary</a></p></div><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTEstimateTypeSummaryCSTemporaryTrialUse estimate-summary}\">Estimate Summary</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-9c05d948-b931-4bff-8766-18b99b0650d4\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>billablePeriod</b>: 2021-10-31 --&gt; (ongoing)</p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-2ccf0ff7-2af1-4598-b667-6e35b79529df\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>provider</b>: ?rref?</p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-49fd53a8-7eb7-4319-acc8-04bf8a3cb603\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></td></tr></table><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"
//* extension[gfeSubmitter].valueReference = Reference(Submitter-Practitioner-1)
//* extension[providerEventMethodology].valueString = "EEMM1022"
//* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueString = "223452-2342-2435-008001"
//* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"

* status = #active
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"

// * patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* patient = Reference(patient1001)


* created = "2021-10-05"
* billablePeriod.start = "2021-10-31"

// * insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* insurer = Reference(org1001)

* provider.extension[dataAbsentReason].valueCode = #not-applicable
//* provider = Reference(Submitter-Practitioner-1)
//* provider.extension[ProviderTaxonomy].valueCodeableConcept = NUCC#2085D0003X "Diagnostic Neuroimaging (Radiology) Physician"
* priority = $PROCPRIORITY#normal
//* payee.type.coding = $PAYEETYPE#provider
//* referral.extension[referralNumber].valueString = "REF12022002-122"
//* referral.display = "Referral Number"
* insurance.sequence = 1
* insurance.focal = true

// * insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
* insurance.coverage = Reference(coverage1001)

* diagnosis[principal].diagnosisCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* diagnosis[principal].packageCode = PKGCODE#400 "Head trauma - concussion"
/* item.extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0001"
* item.sequence = 1
* item.productOrService = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.modifier = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.servicedDate = 2021-10-31
* item.extension[ServiceDescription].valueString = "Imaging"
* item.locationCodeableConcept = $CMSPOSCS#21 "Inpatient Hospital"
* item.quantity.value = 1
* item.unitPrice.value = 200.00
* item.unitPrice.currency = #USD
* item.net.value = 200.00
* item.net.currency = #USD
*/
* total.value = 200.00
* total.currency = #USD

Instance: PCT-GFE-Institutional-MRI
InstanceOf: PCTGFEInstitutional
Description: "PCT Institutional GFE for MRI"
Usage: #example

// * id = "914c0b2c-4ce3-4260-965e-4366c174a785"
* identifier[PLAC].value = "GFEProviderAssignedID0001MRI"
/* Remove GFE Submitter
* extension[gfeSubmitter].valueReference = Reference(Submitter-Org-1)
*/
* extension[providerEventMethodology].valueString = "EEMM1021"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier.value = "223452-2342-2435-008002"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier.system = "http://example.org/Claim/identifiers"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2022-02-02"
* status = #active
* type = $ClaimTypeCS#institutional "Institutional"
// * patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* patient = Reference(patient1001)

* created = "2022-02-02"
// * insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* insurer = Reference(org1001)
// * provider.reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* provider = Reference(Submitter-Org-1)
* provider.extension[ProviderTaxonomy].valueCodeableConcept = NUCC#2085D0003X "Diagnostic Neuroimaging (Radiology) Physician"
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* referral.extension[referralNumber].valueString = "REF12022002-122"
* referral.display = "Referral Number"
* supportingInfo[typeOfBill].sequence = 1
* supportingInfo[typeOfBill].category = http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTSupportingInfoType#typeofbill
* supportingInfo[typeOfBill].code = https://www.nubc.org/CodeSystem/TypeOfBill#example-bill-type
* insurance.sequence = 1
* insurance.focal = true
// * insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
* insurance.coverage = Reference(coverage1001)
* diagnosis[principal].diagnosisCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* diagnosis[principal].packageCode = PKGCODE#400 "Head trauma - concussion"
* item.sequence = 1
* item.revenue = $NUBCREVENUE#0611 "Magnetic Resonance Technology (MRT) - Brain/brain stem"
* item.productOrService = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* item.servicedDate = 2022-02-02
* item.extension[ServiceDescription].valueString = "Imaging"
* item.quantity.value = 1
* item.net.value = 266.00
* item.net.currency = #USD
* total.value = 266.00
* total.currency = #USD







///////////////////////////////////////////

Instance: PCT-GFE-Bundle-Inst-1
InstanceOf: PCTGFEBundle
Description: "PCT GFE Bundle Institutional Example 1"
Usage: #example

// * id = "b5ff05d5-b645-4676-b8ed-a3937dabac7b"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-23473847"
* timestamp = "2021-11-09T11:01:00+05:00"

// * entry[gfe][+].fullUrl = "urn:uuid:3e67b7e5-e15b-4003-802b-79bfc0ba4847"  // "http://example.org/fhir/Claim/PCT-GFE-Summary-1"
// * entry[gfe][=].id = "PCT-GFE-Summary-1"
// * entry[gfe][=].resource = 3e67b7e5-e15b-4003-802b-79bfc0ba4847 // PCT-GFE-Summary-1

* entry[gfe][+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Summary-1"
* entry[gfe][=].resource = PCT-GFE-Summary-1

// * entry[gfe][+].fullUrl = "urn:uuid:aedb6db2-c8a4-41e8-a8e1-722258ff01dd" // "http://example.org/fhir/Claim/PCT-GFE-Institutional-1"
// * entry[gfe][=].id = "PCT-GFE-Institutional-1"
// * entry[gfe][=].resource = aedb6db2-c8a4-41e8-a8e1-722258ff01dd // PCT-GFE-Institutional-1

* entry[gfe][+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Institutional-1"
* entry[gfe][=].resource = PCT-GFE-Institutional-1

// * entry[gfeInstitutional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Institutional-1"
// * entry[gfeInstitutional].id = "PCT-GFE-Institutional-1"
// * entry[gfeInstitutional].resource = PCT-GFE-Institutional-1
// * entry[organization][+].fullUrl = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // "http://example.org/fhir/Organization/Submitter-Org-1"
// * entry[organization][=].id = "Submitter-Org-1"
// * entry[organization][=].resource = e7c36e30-edb8-4a0a-8208-c92085663b00 // Submitter-Org-1
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/Submitter-Org-1"
* entry[organization][=].resource = Submitter-Org-1

// * entry[organization][+].fullUrl = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // "http://example.org/fhir/Organization/org1001"
// * entry[organization][=].id = "org1001"
// * entry[organization][=].resource = 2ccf0ff7-2af1-4598-b667-6e35b79529df //org1001

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].resource = org1001


// * entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
// * entry[patient].id = "patient1001"
// * entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4


* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient1001"
* entry[patient].resource = patient1001

// * entry[coverage].fullUrl = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // "http://example.org/fhir/Coverage/coverage1001"
// * entry[coverage].id = "coverage1001"
// * entry[coverage].resource = 49fd53a8-7eb7-4319-acc8-04bf8a3cb603

* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].resource = coverage1001


Instance: PCT-GFE-Bundle-Prof-1
InstanceOf: PCTGFEBundle
Description: "PCT GFE Bundle Professional Example 1"
Usage: #example

// * id = "f8c054ba-e496-4230-b74e-a3ad871fb563"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-23473847"
* timestamp = "2021-11-09T11:01:00+05:00"

// * entry[gfe][+].fullUrl = "urn:uuid:ef5c6c33-aab0-4346-a79c-22b8f1e75ff4" // "http://example.org/fhir/Claim/PCT-GFE-Summary-MRI"
// * entry[gfe][=].id = "PCT-GFE-Summary-MRI"
// * entry[gfe][=].resource = ef5c6c33-aab0-4346-a79c-22b8f1e75ff4 // PCT-GFE-Summary-MRI

* entry[gfe][+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Summary-MRI"
* entry[gfe][=].resource = PCT-GFE-Summary-MRI

// * entry[gfe][+].fullUrl = "urn:uuid:6369b2f8-1154-4935-a27f-4a578d9e384c" // "http://example.org/fhir/Claim/PCT-GFE-Professional-MRI"
// * entry[gfe][=].id = "PCT-GFE-Professional-MRI"
// * entry[gfe][=].resource = 6369b2f8-1154-4935-a27f-4a578d9e384c // PCT-GFE-Professional-MRI

* entry[gfe][+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Professional-MRI"
* entry[gfe][=].resource = PCT-GFE-Professional-MRI


// * entry[gfeProfessional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Professional-MRI"
// * entry[gfeProfessional].id = "PCT-GFE-Professional-MRI"
// * entry[gfeProfessional].resource = PCT-GFE-Professional-MRI

// * entry[practitioner][+].fullUrl = "urn:uuid:2e4341dc-70b8-4709-9fa9-0b6d64cf21bb" // "http://example.org/fhir/Practitioner/Submitter-Practitioner-1"
// * entry[practitioner][=].id = "Submitter-Practitioner-1"
// * entry[practitioner][=].resource = 2e4341dc-70b8-4709-9fa9-0b6d64cf21bb // Submitter-Practitioner-1

* entry[practitioner][+].fullUrl = "http://example.org/fhir/Practitioner/Submitter-Practitioner-1"
* entry[practitioner][=].resource = Submitter-Practitioner-1

// * entry[organization][+].fullUrl = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // "http://example.org/fhir/Organization/org1001"
// * entry[organization][=].id = "org1001"
// * entry[organization][=].resource = 2ccf0ff7-2af1-4598-b667-6e35b79529df //org1001

* entry[organization][+].fullUrl =  "http://example.org/fhir/Organization/org1001"
* entry[organization][=].resource = org1001

// * entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
// * entry[patient].id = "patient1001"
// * entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4

* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient1001"
* entry[patient].resource = patient1001

// * entry[coverage].fullUrl = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // "http://example.org/fhir/Coverage/coverage1001"
// * entry[coverage].id = "coverage1001"
// * entry[coverage].resource = 49fd53a8-7eb7-4319-acc8-04bf8a3cb603

* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].resource = coverage1001



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

////////////////////////////////////////////

Instance: PCT-GFE-Professional-At-Home-Infusion
InstanceOf: PCTGFEProfessional
Description: "PCT Professional GFE Example - At Home Infusion Therapy"
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
* provider = Reference(org1007)
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* referral.extension[referralNumber].valueString = "REF12022002-122"
* referral.display = "Referral Number"
* careTeam[0].sequence = 1
* careTeam[0].provider = Reference(prac003)
* careTeam[0].role = CTROLE#referring
* careTeam[1].sequence = 2
* careTeam[1].provider = Reference(org1007)
* careTeam[1].role = CTROLE#rendering
* careTeam[1].qualification = NUCC#251F00000X "Home Infusion Agency"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage1002)
* diagnosis[principal].diagnosisCodeableConcept = ICD10#M06.9 "Rheumatoid arthritis, unspecified"
* item[0].extension[estimatedDateOfService].valueDate = "2021-10-31"
* item[0].sequence = 1
//* item[0].productOrService = PCTGFEItemProcedureCodes#96413 "Chemo administration, intravenous infusion; up to 1 hour, single or initial substance or drug"
* item[0].productOrService = $HCPCS#G0090 "Adm iv chemo 1st home visit"
* item[0].locationCodeableConcept = $CMSPOSOID#12 "Home"
* item[0].quantity.value = 6
* item[0].unitPrice.value = 319.00
* item[0].net.value = 1914.00
* item[0].extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0001" 
* item[0].net.currency = #USD
* item[1].extension[estimatedDateOfService].valueDate = "2021-10-31"
* item[1].sequence = 2
//* item[1].productOrService = PCTGFEItemProcedureCodes#J9312 "Inj., Rituximab, 10 Mg"
* item[1].productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* item[1].locationCodeableConcept = $CMSPOSOID#12 "Home"
* item[1].quantity.value = 75
* item[1].unitPrice.value = 182.70
* item[1].net.value = 13702.00
* item[1].extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0002" 
* item[1].net.currency = #USD
* item[2].extension[estimatedDateOfService].valueDate = "2021-10-31"
* item[2].sequence = 3
//* item[2].productOrService = PCTGFEItemProcedureCodes#J9260 "Methotrexate sodium, 50 mg"
* item[2].productOrService = PCTGFEItemProcedureCodes#33502 "Some CPT Code 1"
* item[2].locationCodeableConcept = $CMSPOSOID#12 "Home"
* item[2].quantity.value = 1
* item[2].unitPrice.value = 23.00
* item[2].net.value = 23.00
* item[2].extension[GFEBillingProviderLineItemCtrlNum].valueIdentifier.value = "GFEBillingProviderLineItemCtrlNum-0003" 
* item[2].net.currency = #USD
* total.value = 15639.00
* total.currency = #USD

///////////////////////////////////////////

Instance: PCT-GFE-Bundle-Prof-At-Home-Infusion
InstanceOf: PCTGFEBundle
Description: "PCT GFE Bundle Professional Example - At Home Infusion Therapy"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-34584958"
* timestamp = "2022-01-07T11:01:00+05:00"
* entry[gfeProfessional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Prof-At-Home-Example-Inf"
* entry[gfeProfessional].id = "PCT-GFE-Prof-At-Home-Example-Inf"
* entry[gfeProfessional].resource = PCT-GFE-Professional-At-Home-Infusion

///////////////////////////////////////////

Instance: org1007
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization as a healthcare provider"
* type = $ORGTYPE#prov "Healthcare Provider"
* identifier[NPI].value = "9998887653"
* name = "Happy Harry’s Home Infusion Services"
* active = true
* extension[ProviderTaxonomy].valueCodeableConcept = NUCC#251F00000X "Home Infusion Agency"
* telecom.system = #phone
* telecom.value = "781-232-4207"
* telecom.use = #work
* address.line = "137 Fruit Street"
* address.city = "Boston"
* address.state = "MA"
* address.postalCode = "02114"
* address.country = "US"
* address.extension[countrySubdivisionCode].valueCoding = $ISO3166-P2-CSC#US-MA
* partOf = Reference(org1006)
