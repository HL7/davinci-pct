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

//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"PCT-GFE-Institutional-1\"> </a><a name=\"hcPCT-GFE-Institutional-1\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Claim &quot;PCT-GFE-Institutional-1&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-institutional.html\">PCT Good Faith Estimate Institutional</a></p></div><p><b>ProviderEventMethodology</b>: EEMM1021</p><p><b>GFEDisclaimer</b>: For estimation purposes only</p><blockquote><p><b>GFEServiceLinkingInfo</b></p><blockquote><p><b>url</b></p><code>linkingIdentifier</code></blockquote><p><b>value</b>: 223452-2342-2435-008001</p><blockquote><p><b>url</b></p><code>plannedPeriodOfService</code></blockquote><p><b>value</b>: 2021-10-31</p></blockquote><p><b>identifier</b>: Placer Identifier/GFEProviderAssignedID0001</p><p><b>status</b>: active</p><p><b>type</b>: Institutional <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-claim-type.html\">Claim Type Codes</a>#institutional)</span></p><p><b>use</b>: predetermination</p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Patient/patient1001</a> &quot; BETTERHALF&quot;</p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Organization-org1001.html\">Organization/org1001</a> &quot;Umbrella Insurance Company&quot;</p><p><b>provider</b>: <a href=\"Organization-Submitter-Org-1.html\">Organization/Submitter-Org-1</a> &quot;GFE Service Help INC.&quot;</p><p><b>priority</b>: Normal <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-processpriority.html\">Process Priority Codes</a>#normal)</span></p><h3>Payees</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td></tr><tr><td style=\"display: none\">*</td><td>Provider <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-payeetype.html\">Payee Type Codes</a>#provider)</span></td></tr></table><p><b>referral</b>: <span>: Referral Number</span></p><h3>SupportingInfos</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Category</b></td><td><b>Code</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>Type of Bill <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"CodeSystem-PCTSupportingInfoType.html\">PCT GFE Supporting Info Type Code System</a>#typeofbill)</span></td><td>Hospital Inpatient (Part A) <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-AHANUBCTypeOfBill.html\">AHA NUBC Type Of Bill Codes</a>#011X)</span></td></tr></table><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>Unspecified focal traumatic brain injury <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-icd10CM.html\">International Classification of Diseases, 10th Revision, Clinical Modification (ICD-10-CM)</a>#S06.30)</span></td><td>Principal Diagnosis <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-ex-diagnosistype.html\">Example Diagnosis Type Codes</a>#principal)</span></td><td>Head trauma - concussion <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-ex-diagnosisrelatedgroup.html\">Example Diagnosis Related Group Codes</a>#400)</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Coverage-coverage1001.html\">Coverage/coverage1001</a></td></tr></table><blockquote><p><b>item</b></p><p><b>Service Description</b>: Imaging</p><p><b>sequence</b>: 1</p><p><b>revenue</b>: Magnetic Resonance Technology (MRT) - Brain/brain stem <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-AHANUBCRevenueCodes.html\">AHA NUBC Revenue Codes</a>#0611)</span></p><p><b>productOrService</b>: Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-CPT.html\">Current Procedural Terminology (CPT®)</a>#70551)</span></p><p><b>modifier</b>: Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-CPT.html\">Current Procedural Terminology (CPT®)</a>#70551)</span></p><p><b>serviced</b>: 2021-10-31</p><p><b>quantity</b>: 1</p><h3>Nets</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>USD</td></tr></table></blockquote><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>USD</td></tr></table></div>"
* identifier[PLAC].system = V2-0203
* identifier[PLAC].value = "GFEProviderAssignedID0001"
/* Remove GFE Submitter
* extension[gfeSubmitter].valueReference = Reference(Submitter-Org-1)
*/
* extension[providerEventMethodology].valueString = "EEMM1021"
* extension[gfeDisclaimer].valueString = "For estimation purposes only"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueString = "223452-2342-2435-008001"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
* type = $ClaimTypeCS#institutional "Institutional"
* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2021-10-05"
* insurer = Reference(org1001)
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

//* identifier[ETIN].system = "http://hl7.org/fhir/us/pacio-rat"
//* identifier[ETIN].value = "ETIN-10010001"
* text.status = #additional 
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"PCT-GFE-Summary-1\"> </a><a name=\"hcPCT-GFE-Summary-1\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Claim &quot;PCT-GFE-Summary-1&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-summary.html\">PCT Good Faith Estimate  Summary</a></p></div><p><b>status</b>: active</p><p><b>type</b>: Estimate Summary <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"CodeSystem-PCTEstimateTypeSummaryCSTemporaryTrialUse.html\">PCT Estimate Type Code System</a>#estimate-summary)</span></p><p><b>use</b>: predetermination</p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Patient/patient1001</a> &quot; BETTERHALF&quot;</p><p><b>billablePeriod</b>: 2021-10-31 --&gt; 2021-10-31</p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Organization-org1001.html\">Organization/org1001</a> &quot;Umbrella Insurance Company&quot;</p><p><b>provider</b>: <span>??</span></p><p><b>priority</b>: Normal <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-processpriority.html\">Process Priority Codes</a>#normal)</span></p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>Unspecified focal traumatic brain injury <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-icd10CM.html\">International Classification of Diseases, 10th Revision, Clinical Modification (ICD-10-CM)</a>#S06.30)</span></td><td>Principal Diagnosis <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-ex-diagnosistype.html\">Example Diagnosis Type Codes</a>#principal)</span></td><td>Head trauma - concussion <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-ex-diagnosisrelatedgroup.html\">Example Diagnosis Related Group Codes</a>#400)</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Coverage-coverage1001.html\">Coverage/coverage1001</a></td></tr></table><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>USD</td></tr></table></div>"

* status = #active
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2021-10-05"
* billablePeriod.start = "2021-10-31"
* billablePeriod.end = "2021-10-31"
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
* insurance.coverage = Reference(coverage1001)
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

* identifier[PLAC].system = V2-0203
* identifier[PLAC].value = "GFEProviderAssignedID0002"
/* Remove GFE Submitter
* extension[gfeSubmitter].valueReference = Reference(Submitter-Practitioner-1)
*/
* extension[providerEventMethodology].valueString = "EEMM1022"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueString = "223452-2342-2435-008001"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
* type = $ClaimTypeCS#professional "Professional"
* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2021-10-05"
* insurer = Reference(org1001)
* provider = Reference(Submitter-Practitioner-1)
* provider.extension[ProviderTaxonomy].valueCodeableConcept = NUCC#2085D0003X "Diagnostic Neuroimaging (Radiology) Physician"
* priority = $PROCPRIORITY#normal
* payee.type.coding = $PAYEETYPE#provider
* referral.extension[referralNumber].valueString = "REF12022002-122"
* referral.display = "Referral Number"
* insurance.sequence = 1
* insurance.focal = true
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

//* extension[gfeSubmitter].valueReference = Reference(Submitter-Practitioner-1)
//* extension[providerEventMethodology].valueString = "EEMM1022"
//* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueString = "223452-2342-2435-008001"
//* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* status = #active
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"

* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2021-10-05"
* billablePeriod.start = "2021-10-31"
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

* identifier[PLAC].value = "GFEProviderAssignedID0001MRI"
/* Remove GFE Submitter
* extension[gfeSubmitter].valueReference = Reference(Submitter-Org-1)
*/
* extension[providerEventMethodology].valueString = "EEMM1021"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueString = "223452-2342-2435-008002"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2022-02-02"
* status = #active
* type = $ClaimTypeCS#institutional "Institutional"
* patient.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* created = "2022-02-02"
* insurer = Reference(org1001)
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

* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-23473847"
* timestamp = "2021-11-09T11:01:00+05:00"
* entry[gfe][+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Summary-1"
* entry[gfe][=].id = "PCT-GFE-Summary-1"
* entry[gfe][=].resource = PCT-GFE-Summary-1
* entry[gfe][+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Institutional-1"
* entry[gfe][=].id = "PCT-GFE-Institutional-1"
* entry[gfe][=].resource = PCT-GFE-Institutional-1
// * entry[gfeInstitutional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Institutional-1"
// * entry[gfeInstitutional].id = "PCT-GFE-Institutional-1"
// * entry[gfeInstitutional].resource = PCT-GFE-Institutional-1
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/Submitter-Org-1"
* entry[organization][=].id = "Submitter-Org-1"
* entry[organization][=].resource = Submitter-Org-1
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].id = "org1001"
* entry[organization][=].resource = org1001
* entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
//* entry[patient].id = "patient1001"
* entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4
* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].resource = coverage1001

Instance: PCT-GFE-Bundle-Prof-1
InstanceOf: PCTGFEBundle
Description: "PCT GFE Bundle Professional Example 1"
Usage: #example

* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-23473847"
* timestamp = "2021-11-09T11:01:00+05:00"

* entry[gfe][+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Summary-MRI"
* entry[gfe][=].id = "PCT-GFE-Summary-MRI"
* entry[gfe][=].resource = PCT-GFE-Summary-MRI
* entry[gfe][+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Professional-MRI"
* entry[gfe][=].id = "PCT-GFE-Professional-MRI"
* entry[gfe][=].resource = PCT-GFE-Professional-MRI
// * entry[gfeProfessional].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Professional-MRI"
// * entry[gfeProfessional].id = "PCT-GFE-Professional-MRI"
// * entry[gfeProfessional].resource = PCT-GFE-Professional-MRI
* entry[practitioner][+].fullUrl = "http://example.org/fhir/Practitioner/Submitter-Practitioner-1"
* entry[practitioner][=].id = "Submitter-Practitioner-1"
* entry[practitioner][=].resource = Submitter-Practitioner-1
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].id = "org1001"
* entry[organization][=].resource = org1001
* entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
//* entry[patient].id = "patient1001"
* entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4
* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].resource = coverage1001



///////////////////////////////////////////

Instance: patient1001
Description: "An instance of Patient"
InstanceOf: USCorePatientProfile
Usage: #example

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
* extension[PCTEndpoint].valueReference = Reference(endpoint001)

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

Instance: Submitter-Org-1
InstanceOf: PCTOrganization
Description: "Institutional GFE Submitter 1"
Usage: #example

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"Submitter-Org-1\"> </a><a name=\"hcSubmitter-Org-1\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Organization &quot;Submitter-Org-1&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-organization.html\">PCT Organization</a></p></div><p><b>identifier</b>: Electronic Transmitter Identification Number/ETIN-10010301</p><p><b>active</b>: true</p><p><b>type</b>: Non-Healthcare Business or Corporation <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-organization-type.html\">Organization type</a>#bus)</span></p><p><b>name</b>: GFE Service Help INC.</p><h3>Contacts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Purpose</b></td><td><b>Name</b></td><td><b>Telecom</b></td></tr><tr><td style=\"display: none\">*</td><td>GFE-related <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"CodeSystem-PCTOrgContactPurposeType.html\">PCT Organization Contact Purpose Type Code System</a>#GFERELATED)</span></td><td>Clara Sender</td><td>ph: 781-632-3209(WORK), <a href=\"mailto:csender@GFEServiceHelp.com\">csender@GFEServiceHelp.com</a></td></tr></table></div>"
* type = $ORGTYPE#bus
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
Usage: #example

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"org1001\"> </a><a name=\"hcorg1001\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Organization &quot;org1001&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-organization.html\">PCT Organization</a></p></div><p><b>identifier</b>: Electronic Transmitter Identification Number/ETIN-3200002</p><p><b>active</b>: true</p><p><b>type</b>: Payer <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-organization-type.html\">Organization type</a>#pay)</span></p><p><b>name</b>: Umbrella Insurance Company</p><p><b>telecom</b>: ph: 860-547-5001(WORK)</p><p><b>address</b>: 680 Asylum Street Hartford CT 06155 US </p></div>"
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
Usage: #example

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"org1002\"> </a><a name=\"hcorg1002\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Organization &quot;org1002&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-organization.html\">PCT Organization</a></p></div><p><b>identifier</b>: National provider identifier/1234568095, Tax ID number/TAX-3211001</p><p><b>active</b>: true</p><p><b>type</b>: Healthcare Provider <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-organization-type.html\">Organization type</a>#prov)</span></p><p><b>name</b>: Boston Radiology Center</p><p><b>telecom</b>: ph: 781-232-3200(WORK)</p><p><b>address</b>: 32 Fruit Street Boston MA 02114 US </p></div>"
* type = $ORGTYPE#prov "Healthcare Provider"
* identifier[NPI].value = "9941339100"
* identifier[tin].value = "TAX-3211001"
* name = "Boston Radiology Center"
* active = true
* telecom.system = #phone
* telecom.value = "781-232-3200"
* telecom.use = #work
* address.line = "32 Fruit Street"
* address.city = "Boston"
* address.state = "MA"
* address.postalCode = "02114"
* address.country = "US"
* address.extension[countrySubdivisionCode].valueCoding = $ISO3166-P2-CSC#US-MA

Instance: coverage1001
InstanceOf: PCTCoverage
Description: "An instance of PCTCoverage"
Usage: #example

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"coverage1001\"> </a><a name=\"hccoverage1001\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Coverage &quot;coverage1001&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-coverage.html\">PCT Coverage</a></p></div><p><b>Extension Definition for Coverage.kind for Version 5.0</b>: insurance</p><p><b>status</b>: active</p><p><b>subscriberId</b>: PFP123450000</p><p><b>beneficiary</b>: <a href=\"Patient-patient1001.html\">Patient/patient1001</a> &quot; BETTERHALF&quot;</p><p><b>relationship</b>: Self <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-subscriber-relationship.html\">SubscriberPolicyholder Relationship Codes</a>#self)</span></p><p><b>period</b>: 2021-01-01 --&gt; 2022-01-01</p><p><b>payor</b>: <a href=\"Organization-org1001.html\">Organization/org1001</a> &quot;Umbrella Insurance Company&quot;</p><h3>Classes</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value</b></td><td><b>Name</b></td></tr><tr><td style=\"display: none\">*</td><td>Plan <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-coverage-class.html\">Coverage Class Codes</a>#plan)</span></td><td>Premim Family Plus</td><td>Premim Family Plus Plan</td></tr></table><h3>CostToBeneficiaries</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value[x]</b></td></tr><tr><td style=\"display: none\">*</td><td>Copay Percentage <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-coverage-copay-type.html\">Coverage Copay Type Codes</a>#copaypct)</span></td><td>20</td></tr></table></div>"
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
* payor = Reference(org1001)
//* subscriber.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subscriberId = "PFP123450000"
* costToBeneficiary.type = COPAYTYPE#copaypct "Copay Percentage"
* costToBeneficiary.valueQuantity.value = 20.00
//* costToBeneficiary.valueMoney.currency = #USD
//* contract = Reference(contract1001)



Instance: selfpaycoverage2001
InstanceOf: PCTSelfPayCoverage
Description: "An instance of PCTCoverage"
Usage: #example

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"coverage1001\"> </a><a name=\"hccoverage1001\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Coverage &quot;coverage1001&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-coverage.html\">PCT Coverage</a></p></div><p><b>Extension Definition for Coverage.kind for Version 5.0</b>: insurance</p><p><b>status</b>: active</p><p><b>subscriberId</b>: PFP123450000</p><p><b>beneficiary</b>: <a href=\"Patient-patient1001.html\">Patient/patient1001</a> &quot; BETTERHALF&quot;</p><p><b>relationship</b>: Self <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-subscriber-relationship.html\">SubscriberPolicyholder Relationship Codes</a>#self)</span></p><p><b>period</b>: 2021-01-01 --&gt; 2022-01-01</p><p><b>payor</b>: <a href=\"Organization-org1001.html\">Organization/org1001</a> &quot;Umbrella Insurance Company&quot;</p><h3>Classes</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value</b></td><td><b>Name</b></td></tr><tr><td style=\"display: none\">*</td><td>Plan <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-coverage-class.html\">Coverage Class Codes</a>#plan)</span></td><td>Premim Family Plus</td><td>Premim Family Plus Plan</td></tr></table><h3>CostToBeneficiaries</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value[x]</b></td></tr><tr><td style=\"display: none\">*</td><td>Copay Percentage <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-coverage-copay-type.html\">Coverage Copay Type Codes</a>#copaypct)</span></td><td>20</td></tr></table></div>"
* extension[coverage-kind].valueCode = #self-pay
* extension[self-pay-declared].valueBoolean = true
* beneficiary.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* relationship = RELATE#self "Self"
* status = #active
* class.name = "Premim Family Plus Plan"
* class.type = COVCLASS#plan "Plan"
* class.value = "Premim Family Plus"
* period.start = "2021-01-01"
* period.end = "2022-01-01"
* payor.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4"
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



