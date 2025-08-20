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
Usage: #example

* id = "aedb6db2-c8a4-41e8-a8e1-722258ff01dd"
//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Claim PCT-GFE-Institutional-1</b></p><a name=\"PCT-GFE-Institutional-1\"> </a><a name=\"hcPCT-GFE-Institutional-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-institutional.html\">PCT Good Faith Estimate Institutional</a></p></div><p><b>ProviderEventMethodology</b>: EEMM1021</p><p><b>GFEDisclaimer</b>: For estimation purposes only</p><blockquote><p><b>GFEServiceLinkingInfo</b></p><ul><li>linkingIdentifier: <code>http://example.org/Claim/identifiers</code>/223452-2342-2435-008001</li><li>plannedPeriodOfService: 2021-10-31</li></ul></blockquote><p><b>identifier</b>: Placer Identifier/GFEProviderAssignedID0001</p><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/claim-type institutional}\">Institutional</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-9c05d948-b931-4bff-8766-18b99b0650d4\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-2ccf0ff7-2af1-4598-b667-6e35b79529df\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>provider</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-e7c36e30-edb8-4a0a-8208-c92085663b00\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Payees</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/payeetype provider}\">Provider</span></td></tr></table><p><b>referral</b>: Referral Number</p><h3>SupportingInfos</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Category</b></td><td><b>Code</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTSupportingInfoType typeofbill}\">Type of Bill</span></td><td><span title=\"Codes:{https://www.nubc.org/CodeSystem/TypeOfBill 011X}\">Hospital Inpatient (Part A)</span></td></tr></table><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-49fd53a8-7eb7-4319-acc8-04bf8a3cb603\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></td></tr></table><blockquote><p><b>item</b></p><p><b>Service Description</b>: Imaging</p><p><b>sequence</b>: 1</p><p><b>revenue</b>: <span title=\"Codes:{https://www.nubc.org/CodeSystem/RevenueCodes 0611}\">Magnetic Resonance Technology (MRT) - Brain/brain stem</span></p><p><b>productOrService</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>modifier</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>serviced</b>: 2021-10-31</p><p><b>quantity</b>: 1</p><h3>Nets</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></blockquote><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"
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
* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2021-10-05"
* insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(2ccf0ff7-2af1-4598-b667-6e35b79529df) // = Reference(org1001)
* provider.reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
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
* insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
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

* id = "3e67b7e5-e15b-4003-802b-79bfc0ba4847"
//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"
* text.status = #generated 
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Claim PCT-GFE-Summary-1</b></p><a name=\"PCT-GFE-Summary-1\"> </a><a name=\"hcPCT-GFE-Summary-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-summary.html\">PCT Good Faith Estimate  Summary</a></p></div><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTEstimateTypeSummaryCSTemporaryTrialUse estimate-summary}\">Estimate Summary</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-9c05d948-b931-4bff-8766-18b99b0650d4\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>billablePeriod</b>: 2021-10-31 --&gt; 2021-10-31</p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-2ccf0ff7-2af1-4598-b667-6e35b79529df\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>provider</b>: ?rref?</p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-49fd53a8-7eb7-4319-acc8-04bf8a3cb603\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></td></tr></table><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"

* status = #active
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2021-10-05"
* billablePeriod.start = "2021-10-31"
* billablePeriod.end = "2021-10-31"
* insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df"
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
* insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
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

* id = "6369b2f8-1154-4935-a27f-4a578d9e384c"
* text.status = #generated 
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Claim PCT-GFE-Professional-MRI</b></p><a name=\"PCT-GFE-Professional-MRI\"> </a><a name=\"hcPCT-GFE-Professional-MRI\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-professional.html\">PCT Good Faith Estimate Professional</a></p></div><p><b>ProviderEventMethodology</b>: EEMM1022</p><blockquote><p><b>GFEServiceLinkingInfo</b></p><ul><li>linkingIdentifier: <code>http://example.org/Claim/identifiers</code>/223452-2342-2435-008001</li><li>plannedPeriodOfService: 2021-10-31</li></ul></blockquote><p><b>identifier</b>: Placer Identifier/GFEProviderAssignedID0002</p><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/claim-type professional}\">Professional</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-9c05d948-b931-4bff-8766-18b99b0650d4\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-2ccf0ff7-2af1-4598-b667-6e35b79529df\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>provider</b>: <a href=\"Bundle-PCT-GFE-Packet-Prof-1.html#urn-uuid-2e4341dc-70b8-4709-9fa9-0b6d64cf21bb\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-2347384711; type = document; timestamp = 2024-03-29 11:01:00+0500</a></p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Payees</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/payeetype provider}\">Provider</span></td></tr></table><p><b>referral</b>: Referral Number</p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-49fd53a8-7eb7-4319-acc8-04bf8a3cb603\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></td></tr></table><blockquote><p><b>item</b></p><p><b>Service Description</b>: Imaging</p><p><b>GFEBillingProviderLineItemCtrlNum</b>: GFEBillingProviderLineItemCtrlNum-0001</p><p><b>sequence</b>: 1</p><p><b>productOrService</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>modifier</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>serviced</b>: 2021-10-31</p><p><b>location</b>: <span title=\"Codes:{https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set 21}\">Inpatient Hospital</span></p><p><b>quantity</b>: 1</p><h3>UnitPrices</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table><h3>Nets</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></blockquote><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"

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
* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2021-10-05"
* insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* provider.reference = "urn:uuid:2e4341dc-70b8-4709-9fa9-0b6d64cf21bb" // = Reference(Submitter-Practitioner-1)
* provider.extension[ProviderTaxonomy].valueCodeableConcept = NUCC#2085D0003X "Diagnostic Neuroimaging (Radiology) Physician"
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* referral.extension[referralNumber].valueString = "REF12022002-122"
* referral.display = "Referral Number"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
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

* id = "ef5c6c33-aab0-4346-a79c-22b8f1e75ff4"
* text.status = #generated 
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Claim PCT-GFE-Summary-MRI</b></p><a name=\"PCT-GFE-Summary-MRI\"> </a><a name=\"hcPCT-GFE-Summary-MRI\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-summary.html\">PCT Good Faith Estimate  Summary</a></p></div><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTEstimateTypeSummaryCSTemporaryTrialUse estimate-summary}\">Estimate Summary</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-9c05d948-b931-4bff-8766-18b99b0650d4\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>billablePeriod</b>: 2021-10-31 --&gt; (ongoing)</p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-2ccf0ff7-2af1-4598-b667-6e35b79529df\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>provider</b>: ?rref?</p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-49fd53a8-7eb7-4319-acc8-04bf8a3cb603\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></td></tr></table><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"
//* extension[gfeSubmitter].valueReference = Reference(Submitter-Practitioner-1)
//* extension[providerEventMethodology].valueString = "EEMM1022"
//* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueString = "223452-2342-2435-008001"
//* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"

* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2021-10-05"
* billablePeriod.start = "2021-10-31"
* insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* provider.extension[dataAbsentReason].valueCode = #not-applicable
//* provider = Reference(Submitter-Practitioner-1)
//* provider.extension[ProviderTaxonomy].valueCodeableConcept = NUCC#2085D0003X "Diagnostic Neuroimaging (Radiology) Physician"
* priority = $PROCPRIORITY#normal
//* payee.type.coding = $PAYEETYPE#provider
//* referral.extension[referralNumber].valueString = "REF12022002-122"
//* referral.display = "Referral Number"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
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

* id = "914c0b2c-4ce3-4260-965e-4366c174a785"
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
* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2022-02-02"
* insurer.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* provider.reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
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
* insurance.coverage.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
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

* id = "b5ff05d5-b645-4676-b8ed-a3937dabac7b"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-23473847"
* timestamp = "2021-11-09T11:01:00+05:00"
* entry[gfe][+].fullUrl = "urn:uuid:3e67b7e5-e15b-4003-802b-79bfc0ba4847"  // "http://example.org/fhir/Claim/PCT-GFE-Summary-1"
* entry[gfe][=].id = "PCT-GFE-Summary-1"
* entry[gfe][=].resource = 3e67b7e5-e15b-4003-802b-79bfc0ba4847 // PCT-GFE-Summary-1
* entry[gfe][+].fullUrl = "urn:uuid:aedb6db2-c8a4-41e8-a8e1-722258ff01dd" // "http://example.org/fhir/Claim/PCT-GFE-Institutional-1"
* entry[gfe][=].id = "PCT-GFE-Institutional-1"
* entry[gfe][=].resource = aedb6db2-c8a4-41e8-a8e1-722258ff01dd // PCT-GFE-Institutional-1
// * entry[gfeInstitutional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Institutional-1"
// * entry[gfeInstitutional].id = "PCT-GFE-Institutional-1"
// * entry[gfeInstitutional].resource = PCT-GFE-Institutional-1
* entry[organization][+].fullUrl = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // "http://example.org/fhir/Organization/Submitter-Org-1"
* entry[organization][=].id = "Submitter-Org-1"
* entry[organization][=].resource = e7c36e30-edb8-4a0a-8208-c92085663b00 // Submitter-Org-1
* entry[organization][+].fullUrl = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // "http://example.org/fhir/Organization/org1001"
* entry[organization][=].id = "org1001"
* entry[organization][=].resource = 2ccf0ff7-2af1-4598-b667-6e35b79529df //org1001
* entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
//* entry[patient].id = "patient1001"
* entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4
* entry[coverage].fullUrl = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].id = "coverage1001"
* entry[coverage].resource = 49fd53a8-7eb7-4319-acc8-04bf8a3cb603


Instance: PCT-GFE-Bundle-Prof-1
InstanceOf: PCTGFEBundle
Description: "PCT GFE Bundle Professional Example 1"
Usage: #example

* id = "f8c054ba-e496-4230-b74e-a3ad871fb563"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-23473847"
* timestamp = "2021-11-09T11:01:00+05:00"

* entry[gfe][+].fullUrl = "urn:uuid:ef5c6c33-aab0-4346-a79c-22b8f1e75ff4" // "http://example.org/fhir/Claim/PCT-GFE-Summary-MRI"
* entry[gfe][=].id = "PCT-GFE-Summary-MRI"
* entry[gfe][=].resource = ef5c6c33-aab0-4346-a79c-22b8f1e75ff4 // PCT-GFE-Summary-MRI
* entry[gfe][+].fullUrl = "urn:uuid:6369b2f8-1154-4935-a27f-4a578d9e384c" // "http://example.org/fhir/Claim/PCT-GFE-Professional-MRI"
* entry[gfe][=].id = "PCT-GFE-Professional-MRI"
* entry[gfe][=].resource = 6369b2f8-1154-4935-a27f-4a578d9e384c // PCT-GFE-Professional-MRI
// * entry[gfeProfessional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Professional-MRI"
// * entry[gfeProfessional].id = "PCT-GFE-Professional-MRI"
// * entry[gfeProfessional].resource = PCT-GFE-Professional-MRI
* entry[practitioner][+].fullUrl = "urn:uuid:2e4341dc-70b8-4709-9fa9-0b6d64cf21bb" // "http://example.org/fhir/Practitioner/Submitter-Practitioner-1"
* entry[practitioner][=].id = "Submitter-Practitioner-1"
* entry[practitioner][=].resource = 2e4341dc-70b8-4709-9fa9-0b6d64cf21bb // Submitter-Practitioner-1
* entry[organization][+].fullUrl = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // "http://example.org/fhir/Organization/org1001"
* entry[organization][=].id = "org1001"
* entry[organization][=].resource = 2ccf0ff7-2af1-4598-b667-6e35b79529df //org1001
* entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
//* entry[patient].id = "patient1001"
* entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4
* entry[coverage].fullUrl = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].id = "coverage1001"
* entry[coverage].resource = 49fd53a8-7eb7-4319-acc8-04bf8a3cb603



///////////////////////////////////////////

Instance: patient1001
Description: "An instance of Patient"
InstanceOf: USCorePatientProfile|7.0.0
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient|7.0.0"
* id = "9c05d948-b931-4bff-8766-18b99b0650d4"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\"><b>Eve Betterhalf</b> female, DoB: 1955-07-23 ( <code>http://example.com/identifiers/patient</code>/1001)</p><hr/><table class=\"grid\"><tr><td style=\"background-color: #f3f5da\" title=\"Known Marital status of Patient\">Marital Status:</td><td colspan=\"3\"><span title=\"Codes: {http://terminology.hl7.org/CodeSystem/v3-MaritalStatus U}\">unmarried</span></td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Ways to contact the Patient\">Contact Details:</td><td colspan=\"3\"><ul><li>ph: 781-949-4949(MOBILE)</li><li>222 Burlington Road, Bedford MA 01730</li></ul></td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Languages spoken\">Language:</td><td colspan=\"3\"><span title=\"Codes: {urn:ietf:bcp:47 en-US}\">English (United States)</span> (preferred)</td></tr></table></div>"
* identifier.system = "http://example.com/identifiers/patient"
* identifier.value = "1001"
* name.given = "Eve"
* name.family = "Betterhalf"
* name.text = "Eve Betterhalf"
//* identifier[memberID].type = #MB
//* identifier[employeeID].system = "http://example.com/identifiers/employee"
//* identifier[employeeID].value = "667788"
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
Usage: #example

* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[NPI].value = "9941339100"
* name.given = "Patricia"
* name.family = "Primary"
* name.text = "Patricia	Primary"
* name.prefix = "Dr."
* active = true
* gender = Hl7FhirAdminGender#female
* telecom.system = #phone
* telecom.value = "781-232-3231"
* address.text = "32 Fruit Street, Boston MA 02114"
//* extension[PCTEndpoint].valueReference = Reference(endpoint001)

Instance: prac002
InstanceOf: PCTPractitioner
Description: "An instance of PCTPractitioner"
Usage: #example

* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[NPI].value = "9941339100"
* name.given = "Christine"
* name.family = "Curie"
* name.text = "Christine Curie"
* name.prefix = "Dr."
* active = true
* gender = Hl7FhirAdminGender#female
* telecom.system = #phone
* telecom.value = "781-232-3232"
* address.text = "32 Fruit Street, Boston MA 02114"

Instance: Submitter-Practitioner-1
InstanceOf: PCTPractitioner
Description: "Professional GFE Submitter 1"
Usage: #example

* id = "2e4341dc-70b8-4709-9fa9-0b6d64cf21bb"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Practitioner 2e4341dc-70b8-4709-9fa9-0b6d64cf21bb</b></p><a name=\"2e4341dc-70b8-4709-9fa9-0b6d64cf21bb\"> </a><a name=\"hc2e4341dc-70b8-4709-9fa9-0b6d64cf21bb\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-practitioner.html\">PCT Practitioner</a></p></div><p><b>identifier</b>: <a href=\"http://terminology.hl7.org/6.5.0/NamingSystem-npi.html\" title=\"National Provider Identifier\">United States National Provider Identifier</a>/9941339100, Electronic Transmitter Identification Number/ETIN-20020001</p><p><b>active</b>: true</p><p><b>name</b>: Nora Ologist</p><p><b>telecom</b>: ph: 860-547-3301(Work), <a href=\"mailto:csender@GFEServiceHelp.com\">csender@GFEServiceHelp.com</a></p></div>"

* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[NPI].value = "9941339100"
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


Instance: coverage1001
InstanceOf: PCTCoverage
Description: "An instance of PCTCoverage"
Usage: #example

* id = "49fd53a8-7eb7-4319-acc8-04bf8a3cb603"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Coverage 49fd53a8-7eb7-4319-acc8-04bf8a3cb603</b></p><a name=\"49fd53a8-7eb7-4319-acc8-04bf8a3cb603\"> </a><a name=\"hc49fd53a8-7eb7-4319-acc8-04bf8a3cb603\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-coverage.html\">PCT Coverage</a></p></div><p><b>Extension Definition for Coverage.kind for Version 5.0</b>: insurance</p><p><b>status</b>: Active</p><p><b>subscriberId</b>: PFP123450000</p><p><b>beneficiary</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-9c05d948-b931-4bff-8766-18b99b0650d4\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>relationship</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/subscriber-relationship self}\">Self</span></p><p><b>period</b>: 2021-01-01 --&gt; 2022-01-01</p><p><b>payor</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-2ccf0ff7-2af1-4598-b667-6e35b79529df\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><h3>Classes</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value</b></td><td><b>Name</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/coverage-class plan}\">Plan</span></td><td>Premim Family Plus</td><td>Premim Family Plus Plan</td></tr></table><h3>CostToBeneficiaries</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value[x]</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/coverage-copay-type copaypct}\">Copay Percentage</span></td><td>20</td></tr></table></div>"
* extension[coverage-kind].valueCode = #insurance
//* extension[self-pay-declared].valueBoolean = false
* beneficiary.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* relationship = RELATE#self "Self"
* status = #active
* class.name = "Premim Family Plus Plan"
* class.type = COVCLASS#plan "Plan"
* class.value = "Premim Family Plus"
* period.start = "2021-01-01"
* period.end = "2022-01-01"
* payor.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
//* subscriber.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subscriberId = "PFP123450000"
* costToBeneficiary.type = COPAYTYPE#copaypct "Copay Percentage"
* costToBeneficiary.valueQuantity.value = 20.00
//* costToBeneficiary.valueMoney.currency = #USD
//* contract = Reference(contract1001)



Instance: selfpaycoverage2001
InstanceOf: PCTCoverage
Description: "An instance of PCTCoverage"
Usage: #example

//* text.status = #additional
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"coverage1001\"> </a><a name=\"hccoverage1001\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Coverage &quot;coverage1001&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-coverage.html\">PCT Coverage</a></p></div><p><b>Extension Definition for Coverage.kind for Version 5.0</b>: insurance</p><p><b>status</b>: active</p><p><b>subscriberId</b>: PFP123450000</p><p><b>beneficiary</b>: <a href=\"Patient-patient1001.html\">Patient/patient1001</a> &quot; BETTERHALF&quot;</p><p><b>relationship</b>: Self <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-subscriber-relationship.html\">SubscriberPolicyholder Relationship Codes</a>#self)</span></p><p><b>period</b>: 2021-01-01 --&gt; 2022-01-01</p><p><b>payor</b>: <a href=\"Organization-org1001.html\">Organization/org1001</a> &quot;Umbrella Insurance Company&quot;</p><h3>Classes</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value</b></td><td><b>Name</b></td></tr><tr><td style=\"display: none\">*</td><td>Plan <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-coverage-class.html\">Coverage Class Codes</a>#plan)</span></td><td>Premim Family Plus</td><td>Premim Family Plus Plan</td></tr></table><h3>CostToBeneficiaries</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value[x]</b></td></tr><tr><td style=\"display: none\">*</td><td>Copay Percentage <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-coverage-copay-type.html\">Coverage Copay Type Codes</a>#copaypct)</span></td><td>20</td></tr></table></div>"
* extension[coverage-kind].valueCode = #self-pay
* extension[self-pay-declared].valueBoolean = true
* beneficiary = Reference(patient1001) // "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* relationship = RELATE#self "Self"
* subscriberId.extension[dataAbsentReason].valueCode = DataAbsentReason#not-applicable
* status = #active
* payor.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(patient1001)
//* subscriber.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)

/*
Instance: contract1001
InstanceOf: Contract
Description: "An instance of Contract"
Usage: #example

* applies.start = "2021-01-01"
* applies.end = "2022-01-01"
* subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* type = CONTRACTTYPE#healthinsurance "Health Insurance"
*/
/*
Instance: endpoint001
InstanceOf: Endpoint
Description: "An instance of Endpoint"
Usage: #example

* status = #active
* payloadType = PAYLOADTYPE#CarePlan
* connectionType = ENDPOINTCONNECTIONTYPE#hl7-fhir-rest
* identifier.system = "http://example.org/enpoint-identifier"
* identifier.value = "epid-1"
* address = "http://fhir3.healthintersections.com.au/open/CarePlan"
*/


