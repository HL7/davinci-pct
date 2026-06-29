Instance: Jane-Smith
InstanceOf: USCorePatientProfile|7.0.0
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient|7.0.0"
* identifier[0].system = "http://springfield-general.example.org/mrn"
* identifier[=].value = "MR-Jane-9901"
* identifier[+].system = "http://hcpayor.example.org/member-id"
* identifier[=].value = "HC123456789"
* name.family = "Smith"
* name.given = "Jane"
* gender = #female
* birthDate = "1952-03-15"
* address.line = "123 Maple St"
* address.city = "Springfield"
* address.state = "IL"
* address.postalCode = "62701"
* address.country = "US"




Instance: HCPayor
InstanceOf: Organization
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-organization"
* identifier.system = "http://hcpayor.example.org/payer-id"
* identifier.value = "PAYER-HC-001"
* active = true
* type = $ORGTYPE#pay "Payer"
* name = "HC Payor, Inc."
* address.line = "999 Insurance Way"
* address.city = "Chicago"
* address.state = "IL"
* address.postalCode = "60601"
* address.country = "US"



Instance: coverage-HC123456789
InstanceOf: Coverage
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-coverage"
* extension.url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Coverage.kind"
* extension.valueCode = #insurance
* identifier.system = "http://hcpayor.example.org/coverage-id"
* identifier.value = "COV-HC-2026-001"
* status = #active
* subscriberId = "HC123456789"
* beneficiary = Reference(Jane-Smith)
* relationship = RELATE#self "Self"
* period.start = "2026-01-01"
* period.end = "2026-12-31"
* payor = Reference(HCPayor)
* class[0].type = COVCLASS#group "Group"
* class[=].value = "GRP-9900"
* class[=].name = "Employer group"
* class[+].type = COVCLASS#plan "Plan"
* class[=].value = "PPO-500"
* class[=].name = "PPO-500"
* network = "HC-PPO-Network"




Instance: Dr-Ana-Esthesia
InstanceOf: Practitioner
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-practitioner"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1122334455"
* name.text = "Dr. Ana Esthesia, MD"
* name.family = "Esthesia"
* name.given = "Ana"
* name.prefix = "Dr."
* name.suffix = "MD"
* qualification.code = $provider-taxonomy#207L00000X "Anesthesiology Physician"
* qualification.code.text = "Anesthesiology Physician"


Instance: Dr-Robert-Ortho
InstanceOf: Practitioner
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-practitioner"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1122334455"
* name.text = "Dr. Robert Ortho, MD"
* name.family = "Ortho"
* name.given = "Robert"
* name.prefix = "Dr."
* name.suffix = "MD"
* qualification.code = $provider-taxonomy#207X00000X "Orthopaedic Surgery Physician"
* qualification.code.text = "Orthopaedic Surgeon"



Instance: Springfield-General
InstanceOf: Organization
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-organization"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1122334455"
* active = true
* type = $ORGTYPE#prov "Healthcare Provider"
* name = "Springfield General Hospital"
* telecom.system = #phone
* telecom.value = "217-555-0100"
* address.line = "500 Hospital Blvd"
* address.city = "Springfield"
* address.state = "IL"
* address.postalCode = "62702"
* address.country = "US"



Instance: PCT-GFE-Packet-TKR-Integrated
InstanceOf: PCTGFEPacket
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-packet"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:663b990f-b621-5c13-a157-9a48d7563a05"
* type = #document
* timestamp = "2026-08-20T12:00:00-04:00"
* entry[0].fullUrl = "http://example.org/fhir/Composition/PCT-GFE-Composition-TKR-Integrated"
* entry[=].resource = PCT-GFE-Composition-TKR-Integrated
* entry[+].fullUrl = "http://example.org/fhir/Patient/Jane-Smith"
* entry[=].resource = Jane-Smith
* entry[+].fullUrl = "http://example.org/fhir/Coverage/coverage-HC123456789"
* entry[=].resource = coverage-HC123456789
* entry[+].fullUrl = "http://example.org/fhir/Organization/Springfield-General"
* entry[=].resource = Springfield-General
* entry[+].fullUrl = "http://example.org/fhir/Organization/HCPayor"
* entry[=].resource = HCPayor
* entry[+].fullUrl = "http://example.org/fhir/Practitioner/Dr-Robert-Ortho"
* entry[=].resource = Dr-Robert-Ortho
// * entry[+].fullUrl = "http://example.org/fhir/Practitioner/Dr-Ana-Esthesia"
// * entry[=].resource = Dr-Ana-Esthesia
* entry[+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-TKR-Inst"
* entry[=].resource = PCT-GFE-Bundle-TKR-Inst
* entry[+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-TKR-Prof-Surg"
* entry[=].resource = PCT-GFE-Bundle-TKR-Prof-Surg
* entry[+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-TKR-Prof-Anes"
* entry[=].resource = PCT-GFE-Bundle-TKR-Prof-Anes

Instance: PCT-GFE-Composition-TKR-Integrated
InstanceOf: PCTGFEComposition
Usage: #inline
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-composition"
* extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/requestInitiationTime"
* extension[=].valueInstant = "2026-08-20T12:00:00-04:00"
* extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/requestOriginationType"
* extension[=].valueCodeableConcept = PCTGFERequestTypeCSTemporaryTrialUse#scheduled-request "Scheduled Service Request"
* extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension[=].extension[0].url = "plannedPeriodOfService"
* extension[=].extension[=].valuePeriod.start = "2026-09-15"
* extension[=].extension[=].valuePeriod.end = "2026-09-17"
* extension[=].extension[+].url = "linkingIdentifier"
* extension[=].extension[=].valueIdentifier.system = "http://springfield-general.example.org/gfe-linking-id"
* extension[=].extension[=].valueIdentifier.value = "TKR-2026-LINK-00042"
* extension[=].extension[+].url = "anticipatedSubmittingProviderCount"
* extension[=].extension[=].valueUnsignedInt = 3
* identifier.system = "http://springfield-general.example.org/gfe-composition-id"
* identifier.value = "PCT-GFE-Composition-TKR-Integrated"
* status = #final
//* type = $loinc#75492-9 "Risk assessment and screening note"
* type = $loinc#111480-0 "Good faith estimate"
* subject = Reference(Jane-Smith)
* date = "2026-08-20T12:00:00-04:00"
* author[0] = Reference(Springfield-General)
* author[1] = Reference(Dr-Robert-Ortho)
//* author[2] = Reference(Dr-Ana-Esthesia)
* title = "Total knee replacement integrated Good Faith Estimate packet"
* section[0].title = "Coverage"
* section[=].code.text = "Coverage"
* section[=].entry = Reference(coverage-HC123456789)



// * section[aeob].code = PCTDocumentSection#aeob-section
// // * section[aeob].entry.reference = "urn:uuid:89fdfb03-b700-4e21-a116-bc0658c68a00" // = Reference(PCT-AEOB-1)
// * section[aeob].entry = Reference(PCT-AEOB-1)
// * section[aeob].text.status = #extensions
// * section[aeob].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: ExplanationOfBenefit PCT-AEOB-Summary-1</b></p><a name=\"PCT-AEOB-Summary-1\"> </a><a name=\"hcPCT-AEOB-Summary-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-aeob-summary.html\">PCT Advanced EOB Summary</a></p></div><p><b>Service Description</b>: Example service</p><p><b>In Network Provider Options Link</b>: <a href=\"http://example.org/out-of-network.html\">http://example.org/out-of-network.html</a></p><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTEstimateTypeSummaryCSTemporaryTrialUse estimate-summary}\">Estimate Summary</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 ( http://example.com/identifiers/patient#1001)</a></p><p><b>billablePeriod</b>: 2022-01-01 --&gt; 2022-01-01</p><p><b>created</b>: 2021-10-12</p><p><b>insurer</b>: <a href=\"Organization-org1001.html\">Organization Umbrella Insurance Company</a></p><p><b>provider</b>: ?rref?</p><p><b>outcome</b>: Processing Complete</p><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>true</td><td><a href=\"Coverage-coverage1001.html\">Coverage: extension = insurance; status = active; subscriberId = PFP123450000; relationship = Self; period = 2021-01-01 --&gt; 2022-01-01</a></td></tr></table><blockquote><p><b>total</b></p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/adjudication submitted}\">Submitted Amount</span></p><h3>Amounts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></blockquote><blockquote><p><b>total</b></p><p><b>category</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTAdjudicationCategoryCS memberliability}\">Member liability</span></p><h3>Amounts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>20</td><td>United States dollar</td></tr></table></blockquote><blockquote><p><b>total</b></p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/adjudication eligible}\">Eligible Amount</span></p><h3>Amounts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>190</td><td>United States dollar</td></tr></table></blockquote><h3>ProcessNotes</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Extension</b></td><td><b>Text</b></td></tr><tr><td style=\"display: none\">*</td><td/><td>processNote disclaimer text</td></tr></table><p><b>benefitPeriod</b>: 2022-01-01 --&gt; 2022-01-01</p><blockquote><p><b>benefitBalance</b></p><p><b>category</b>: <span title=\"Codes:{https://x12.org/codes/service-type-codes 1}\">Medical Care</span></p><p><b>unit</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/benefit-unit individual}\">Individual</span></p><p><b>term</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/benefit-term annual}\">Annual</span></p><h3>Financials</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Extension</b></td><td><b>Type</b></td><td><b>Allowed[x]</b></td><td><b>Used[x]</b></td></tr><tr><td style=\"display: none\">*</td><td/><td><span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTFinancialType allowed}\">Allowed</span></td><td><span title=\"US Dollar\">$1.00</span> (USD)</td><td><span title=\"US Dollar\">$1.00</span> (USD)</td></tr></table></blockquote></div>"


* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
* section[gfeBundle][=].author = Reference(Springfield-General)

* section[gfeBundle][=].entry = Reference(PCT-GFE-Bundle-TKR-Inst)
* section[gfeBundle][=].text.status = #extensions
* section[gfeBundle][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">REPLACE</div>"


* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
// * section[gfeBundle][=].author.reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)

// * section[gfeBundle][=].author.reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* section[gfeBundle][=].author = Reference(Dr-Robert-Ortho)

* section[gfeBundle][=].entry = Reference(PCT-GFE-Bundle-TKR-Prof-Surg)
* section[gfeBundle][=].text.status = #extensions
* section[gfeBundle][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">REPLACE</div>"


* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
* section[gfeBundle][=].author = Reference(Dr-Ana-Esthesia)

* section[gfeBundle][=].entry = Reference(PCT-GFE-Bundle-TKR-Prof-Anes)
* section[gfeBundle][=].text.status = #extensions
* section[gfeBundle][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">REPLACE</div>"





Instance: PCT-GFE-Bundle-TKR-Prof-Anes
InstanceOf: Bundle
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-bundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:47dc4a66-303d-5070-a3af-11e2dee0c759"
* type = #collection
* timestamp = "2026-08-20T12:00:00-04:00"
* entry[0].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-TKR-Prof-Anes-Summary-001"
* entry[=].resource = PCT-GFE-TKR-Prof-Anes-Summary-001
* entry[+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-TKR-Prof-Anes-001"
* entry[=].resource = PCT-GFE-TKR-Prof-Anes-001
* entry[+].fullUrl = "http://example.org/fhir/Practitioner/Dr-Ana-Esthesia"
* entry[=].resource = Dr-Ana-Esthesia
* entry[+].fullUrl = "http://example.org/fhir/Organization/Springfield-General"
* entry[=].resource = Springfield-General
* entry[+].fullUrl = "http://example.org/fhir/Organization/HCPayor"
* entry[=].resource = HCPayor
* entry[+].fullUrl = "http://example.org/fhir/Patient/Jane-Smith"
* entry[=].resource = Jane-Smith
* entry[+].fullUrl = "http://example.org/fhir/Coverage/coverage-HC123456789"
* entry[=].resource = coverage-HC123456789



Instance: PCT-GFE-Bundle-TKR-Prof-Surg
InstanceOf: Bundle
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-bundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:8a02637a-aceb-5f43-930e-1b928d75570c"
* type = #collection
* timestamp = "2026-08-20T12:00:00-04:00"
* entry[0].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-TKR-Prof-Surg-Summary-001"
* entry[=].resource = PCT-GFE-TKR-Prof-Surg-Summary-001
* entry[+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-TKR-Prof-Surg-001"
* entry[=].resource = PCT-GFE-TKR-Prof-Surg-001
* entry[+].fullUrl = "http://example.org/fhir/Practitioner/Dr-Robert-Ortho"
* entry[=].resource = Dr-Robert-Ortho
* entry[+].fullUrl = "http://example.org/fhir/Organization/Springfield-General"
* entry[=].resource = Springfield-General
* entry[+].fullUrl = "http://example.org/fhir/Organization/HCPayor"
* entry[=].resource = HCPayor
* entry[+].fullUrl = "http://example.org/fhir/Patient/Jane-Smith"
* entry[=].resource = Jane-Smith
* entry[+].fullUrl = "http://example.org/fhir/Coverage/coverage-HC123456789"
* entry[=].resource = coverage-HC123456789


Instance: PCT-GFE-TKR-Inst-001
InstanceOf: PCTGFEInstitutional
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-institutional"
* type = $ClaimTypeCS#institutional "Institutional"
* provider.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerTaxonomy"
* provider.extension.valueCodeableConcept = $provider-taxonomy#282N00000X "General Acute Care Hospital"
* provider = Reference(Springfield-General)
* billablePeriod.start = "2026-09-15"
* billablePeriod.end = "2026-09-17"
* extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension[=].extension[0].url = "plannedPeriodOfService"
* extension[=].extension[=].valuePeriod.start = "2026-09-15"
* extension[=].extension[=].valuePeriod.end = "2026-09-17"
* extension[=].extension[+].url = "linkingIdentifier"
* extension[=].extension[=].valueIdentifier.system = "http://springfield-general.example.org/gfe-linking-id"
* extension[=].extension[=].valueIdentifier.value = "TKR-2026-LINK-00042"
* extension[=].extension[+].url = "anticipatedSubmittingProviderCount"
* extension[=].extension[=].valueUnsignedInt = 3
* extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerEventMethodology"
* extension[=].valueString = "EEMM1021"
* item[0].sequence = 1
* item[=].productOrService.text = "Room & Board - Semi-Private (2 nights)"
* item[=].productOrService.coding = $cpt#99221 "Initial hospital inpatient or observation care, per day, for the evaluation and management of a patient, which requires a medically appropriate history and/or examination and straightforward or low level medical decision making. When using total time on the date of the encounter for code selection, 40 minutes must be met or exceeded."
* item[=].quantity.value = 2
* item[=].unitPrice.value = 1800
* item[=].unitPrice.currency = #USD
* item[=].net.value = 3600
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0110 "Room & Board - Semi-Private (2 nights)"
* item[=].servicedDate = "2026-09-15"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#21 "Inpatient Hospital"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-001"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Inpatient Hospital Stay"
* item[+].sequence = 2
//* item[=].productOrService.text = "Operating Room Services"
* item[=].productOrService.coding = $cpt#27447 "Total Knee Arthroplasty"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 8500
* item[=].unitPrice.currency = #USD
* item[=].net.value = 8500
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0360 "Operating Room Services"
* item[=].servicedDate = "2026-09-15"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-002"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Operating Room Services"
* item[+].sequence = 3
//* item[=].productOrService.text = "Med/Surg Supply - Knee Prosthesis Implant"
* item[=].productOrService.coding = $cpt#27447 "Total Knee Arthroplasty"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 14200
* item[=].unitPrice.currency = #USD
* item[=].net.value = 14200
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0271 "Med/Surg Supply - Knee Prosthesis Implant"
* item[=].servicedDate = "2026-09-15"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-003"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Knee Implant Prosthesis"
* item[+].sequence = 4
//* item[=].productOrService.text = "Med/Surg Supply - Orthopedic hardware misc"
* item[=].productOrService.coding = $cpt#27447 "Total Knee Arthroplasty"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 1200
* item[=].unitPrice.currency = #USD
* item[=].net.value = 1200
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0274 "Med/Surg Supply - Orthopedic hardware misc"
* item[=].servicedDate = "2026-09-15"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-004"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "General Orthopedic Hardware"
* item[+].sequence = 5
//* item[=].productOrService.text = "Pharmacy - IV solutions & antibiotics"
* item[=].productOrService.coding = $cpt#27447 "Total Knee Arthroplasty"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 620
* item[=].unitPrice.currency = #USD
* item[=].net.value = 620
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0258 "Pharmacy - IV solutions & antibiotics"
* item[=].servicedDate = "2026-09-15"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-005"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "IV Solutions"
* item[+].sequence = 6
//* item[=].productOrService.text = "Lab - Hematology (CBC, coag panel)"
* item[=].productOrService.coding = $cpt#85025 "Blood count; complete (CBC), automated (Hgb, Hct, RBC, WBC and platelet count) and automated differential WBC count"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 480
* item[=].unitPrice.currency = #USD
* item[=].net.value = 480
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0305 "Lab - Hematology (CBC, coag panel)"
* item[=].servicedDate = "2026-09-15"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-006"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Laboratory Blood Tests"
* item[+].sequence = 7
//* item[=].productOrService.text = "EKG / Cardiology - pre-op"
* item[=].productOrService.coding = $cpt#93000 "Electrocardiogram, routine ECG with at least 12 leads; with interpretation and report"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 310
* item[=].unitPrice.currency = #USD
* item[=].net.value = 310
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0730 "EKG / Cardiology - pre-op"
* item[=].servicedDate = "2026-09-15"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-007"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Electrocardiogram (EKG)"
* item[+].sequence = 8
//* item[=].productOrService.text = "IV Therapy"
* item[=].productOrService.coding = $cpt#96360 "Intravenous infusion, hydration; initial, 31 minutes to 1 hour"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 280
* item[=].unitPrice.currency = #USD
* item[=].net.value = 280
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0260 "IV Therapy"
* item[=].servicedDate = "2026-09-15"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-008"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "IV Therapy"
* item[+].sequence = 9
//* item[=].productOrService.text = "Physical Therapy - post-op PT eval"
* item[=].productOrService.coding = $cpt#97162 "Physical therapy evaluation, moderate complexity, typical time with patient 30 minutes"
* item[=].quantity.value = 2
* item[=].unitPrice.value = 350
* item[=].unitPrice.currency = #USD
* item[=].net.value = 700
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0420 "Physical Therapy - post-op PT eval"
* item[=].servicedDate = "2026-09-17"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-009"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Post Op Physical Therapy"
* item[+].sequence = 10
* item[=].productOrService = $HCPCS#J1885 "Injection, ketorolac tromethamine, per 15 mg"
* item[=].quantity.value = 4
* item[=].unitPrice.value = 28
* item[=].unitPrice.currency = #USD
* item[=].net.value = 112
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0631 "Drugs Requiring Detailed Coding - Ketorolac"
* item[=].servicedDate = "2026-09-15"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-010"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Ketorolac Injection"
* total.value = 30002
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Jane-Smith)
* created = "2026-08-20"
* insurer = Reference(HCPayor)
* priority = $processpriority#normal "Normal"
* diagnosis.sequence = 1
* diagnosis.diagnosisCodeableConcept = $icd-10-cm#M17.11 "Unilateral primary osteoarthritis, right knee"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage-HC123456789)
// * supportingInfo[0].sequence = 1
// * supportingInfo[=].category.text = "GFE disclaimer"
// * supportingInfo[=].valueString = "This Good Faith Estimate is not a guarantee of final charges. Actual charges depend on services furnished."
* supportingInfo[typeOfBill].sequence = 1
* supportingInfo[typeOfBill].category = $PCTSupportingInfoType#typeofbill
* supportingInfo[typeOfBill].code = https://www.nubc.org/CodeSystem/TypeOfBill#011X "Hospital Inpatient (Part A)"
* procedure.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* procedure.extension.valueString = "ARTHROPLASTY"
* procedure.sequence = 1
* procedure.date = "2026-09-15"
* procedure.procedureCodeableConcept = $cpt#27447 "ARTHROPLASTY, KNEE, CONDYLE AND PLATEAU; MEDIAL AND LATERAL COMPARTMENTS WITH OR WITHOUT PATELLA RESURFACING (TOTAL KNEE ARTHROPLASTY)"
* identifier.type = $v2-0203#PLAC "Placer Identifier"
* identifier.system = "http://springfield-general.example.org/gfe-claim-id"
* identifier.value = "PCT-GFE-TKR-Inst-001"



Instance: PCT-GFE-TKR-Inst-Summary-001
InstanceOf: PCTGFESummary
Usage: #inline
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-summary"
//* identifier[PLAC].type = $v2-0203#PLAC "Placer Identifier"
//* identifier[PLAC].system = "http://springfield-general.example.org/gfe-summary-id"
//* identifier[PLAC].value = "PCT-GFE-TKR-Inst-Summary-001"
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
//* provider = Reference(Springfield-General)
* provider.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* provider.extension.valueCode = #not-applicable
* billablePeriod.start = "2026-09-15"
* billablePeriod.end = "2026-09-17"
* extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension[=].extension[0].url = "plannedPeriodOfService"
* extension[=].extension[=].valuePeriod.start = "2026-09-15"
* extension[=].extension[=].valuePeriod.end = "2026-09-17"
* extension[=].extension[+].url = "linkingIdentifier"
* extension[=].extension[=].valueIdentifier.system = "http://springfield-general.example.org/gfe-linking-id"
* extension[=].extension[=].valueIdentifier.value = "TKR-2026-LINK-00042"
* extension[=].extension[+].url = "anticipatedSubmittingProviderCount"
* extension[=].extension[=].valueUnsignedInt = 3
* extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerEventMethodology"
* extension[=].valueString = "EEMM1021"
* total.value = 30002
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Jane-Smith)
* created = "2026-08-20"
* insurer = Reference(HCPayor)
* priority = $processpriority#normal "Normal"
* diagnosis.sequence = 1
* diagnosis.diagnosisCodeableConcept = $icd-10-cm#M17.11 "Unilateral primary osteoarthritis, right knee"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage-HC123456789)
//* identifier.system = "http://springfield-general.example.org/gfe-summary-id"
//* identifier.value = "PCT-GFE-TKR-Inst-Summary-001"
// * item.sequence = 1
// * item.productOrService.text = "Hospital facility total knee replacement facility estimate summary"
// * item.net.value = 30002
// * item.net.currency = #USD




Instance: PCT-GFE-Bundle-TKR-Inst
InstanceOf: Bundle
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-bundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0bdeed0d-666c-50d1-a6b7-7818b1a2dbe1"
* type = #collection
* timestamp = "2026-08-20T12:00:00-04:00"
* entry[0].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-TKR-Inst-Summary-001"
* entry[=].resource = PCT-GFE-TKR-Inst-Summary-001
* entry[+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-TKR-Inst-001"
* entry[=].resource = PCT-GFE-TKR-Inst-001
* entry[+].fullUrl = "http://example.org/fhir/Organization/Springfield-General"
* entry[=].resource = Springfield-General
* entry[+].fullUrl = "http://example.org/fhir/Organization/HCPayor"
* entry[=].resource = HCPayor
* entry[+].fullUrl = "http://example.org/fhir/Patient/Jane-Smith"
* entry[=].resource = Jane-Smith
* entry[+].fullUrl = "http://example.org/fhir/Coverage/coverage-HC123456789"
* entry[=].resource = coverage-HC123456789


Instance: PCT-GFE-TKR-Prof-Surg-Summary-001
InstanceOf: PCTGFESummary
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-summary"
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
* provider.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* provider.extension.valueCode = #not-applicable
* billablePeriod.start = "2026-09-15"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-09-15"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://springfield-general.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "TKR-2026-LINK-00042"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 3
* total.value = 5800
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Jane-Smith)
* created = "2026-08-20"
* insurer = Reference(HCPayor)
* priority = $processpriority#normal "Normal"
* diagnosis.sequence = 1
* diagnosis.diagnosisCodeableConcept = $icd-10-cm#M17.11 "Unilateral primary osteoarthritis, right knee"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage-HC123456789)
* careTeam.sequence = 1
* careTeam.provider = Reference(Dr-Robert-Ortho)
* careTeam.role = $CARETEAMROLECS#operating "Operating"
* careTeam.qualification = $provider-taxonomy#207X00000X "Orthopaedic Surgery Physician"
* identifier.type = $v2-0203#PLAC "Placer Identifier"
* identifier.system = "http://springfield-general.example.org/gfe-summary-id"
* identifier.value = "PCT-GFE-TKR-Prof-Surg-Summary-001"


Instance: PCT-GFE-TKR-Prof-Surg-001
InstanceOf: PCTGFEProfessional
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-professional"
* type = $ClaimTypeCS#professional "Professional"
* provider.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerTaxonomy"
* provider.extension.valueCodeableConcept = $provider-taxonomy#207X00000X "Orthopaedic Surgery Physician"
* provider = Reference(Dr-Robert-Ortho)
* billablePeriod.start = "2026-09-15"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-09-15"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://springfield-general.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "TKR-2026-LINK-00042"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 3
* item[0].sequence = 1
* item[=].productOrService = $cpt#27447 "TOTAL KNEE ARTHROPLASTY"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 5200
* item[=].unitPrice.currency = #USD
* item[=].net.value = 5200
* item[=].net.currency = #USD
* item[=].servicedDate = "2026-09-15"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#21 "Inpatient Hospital"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-001"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Arthroplasty"
* item[+].sequence = 2
* item[=].productOrService = $cpt#27447 "TOTAL KNEE ARTHROPLASTY"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 0
* item[=].unitPrice.currency = #USD
* item[=].net.value = 0
* item[=].net.currency = #USD
* item[=].modifier = $cpt#55 "Postoperative Management Only: When 1 physician or other qualified health care professional performed the postoperative management and another performed the surgical procedure, the postoperative component may be identified by adding modifier 55 to the usual procedure number"
* item[=].servicedDate = "2026-09-15"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#11 "Office"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-002"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Total Knee Replacement"
* item[+].sequence = 3
* item[=].productOrService = $cpt#99213 "Established patient office or other outpatient visit, 20-29 minutes"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 220
* item[=].unitPrice.currency = #USD
* item[=].net.value = 220
* item[=].net.currency = #USD
* item[=].modifier = $cpt#25 "Significant, Separately Identifiable Evaluation and Management Service by the Same Physician or Other Qualified Health Care Professional on the Same Day of the Procedure or Other Service: It may be necessary to indicate that on the day a procedure or service identified by a CPT code was performed, the patient's condition required a significant, separately identifiable E/M service above and beyond the other service provided or beyond the usual preoperative and postoperative care associated with the procedure that was performed. A significant, separately identifiable E/M service is defined or substantiated by documentation that satisfies the relevant criteria for the respective E/M service to be reported (see Evaluation and Management Services Guidelines for instructions on determining level of E/M service). The E/M service may be prompted by the symptom or condition for which the procedure and/or service was provided. As such, different diagnoses are not required for reporting of the E/M services on the same date. This circumstance may be reported by adding modifier 25 to the appropriate level of E/M service. Note: This modifier is not used to report an E/M service that resulted in a decision to perform surgery. See modifier 57 For significant, separately identifiable non-E/M services, see modifier 59."
* item[=].servicedDate = "2026-09-15"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#11 "Office"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-003"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Office Visit Evaluation"
* item[+].sequence = 4
* item[=].productOrService = $cpt#86891 "Autologous blood or component, collection processing and storage; intra- or postoperative salvage"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 380
* item[=].unitPrice.currency = #USD
* item[=].net.value = 380
* item[=].net.currency = #USD
* item[=].servicedDate = "2026-09-15"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#21 "Inpatient Hospital"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-004"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Post Operative Blood Test"
* item[+].sequence = 5
* item[=].productOrService = $cpt#99024 "POSTOP FOLLOW-UP VISIT"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 0
* item[=].unitPrice.currency = #USD
* item[=].net.value = 0
* item[=].net.currency = #USD
* item[=].servicedDate = "2026-09-15"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#11 "Office"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-005"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Post Operative Follow-up Visit"
* total.value = 5800
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Jane-Smith)
* created = "2026-08-20"
* insurer = Reference(HCPayor)
* priority = $processpriority#normal "Normal"
* diagnosis.sequence = 1
* diagnosis.diagnosisCodeableConcept = $icd-10-cm#M17.11 "Unilateral primary osteoarthritis, right knee"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage-HC123456789)
* supportingInfo.sequence = 1
* supportingInfo.category.text = "GFE disclaimer"
* supportingInfo.valueString = "This Good Faith Estimate is not a guarantee of final charges. Actual charges depend on services furnished."
* procedure.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* procedure.extension.valueString = "ARTHROPLASTY"
* procedure.sequence = 1
* procedure.date = "2026-09-15"
* procedure.procedureCodeableConcept = $cpt#27447 "ARTHROPLASTY, KNEE, CONDYLE AND PLATEAU; MEDIAL AND LATERAL COMPARTMENTS WITH OR WITHOUT PATELLA RESURFACING (TOTAL KNEE ARTHROPLASTY)"
* careTeam.sequence = 1
* careTeam.provider = Reference(Dr-Robert-Ortho)
* careTeam.role = $CARETEAMROLECS#operating "Operating"
* careTeam.qualification = $provider-taxonomy#207X00000X "Orthopaedic Surgery Physician"
* identifier.type = $v2-0203#PLAC "Placer Identifier"
* identifier.system = "http://springfield-general.example.org/gfe-claim-id"
* identifier.value = "PCT-GFE-TKR-Prof-Surg-001"

Instance: PCT-GFE-TKR-Prof-Anes-Summary-001
InstanceOf: PCTGFESummary
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-summary"
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
* provider.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* provider.extension.valueCode = #not-applicable
* billablePeriod.start = "2026-09-15"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-09-15"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://springfield-general.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "TKR-2026-LINK-00042"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 3
* total.value = 2250
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Jane-Smith)
* created = "2026-08-20"
* insurer = Reference(HCPayor)
* priority = $processpriority#normal "Normal"
* diagnosis.sequence = 1
* diagnosis.diagnosisCodeableConcept = $icd-10-cm#M17.11 "Unilateral primary osteoarthritis, right knee"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage-HC123456789)
* careTeam.sequence = 1
* careTeam.provider = Reference(Dr-Ana-Esthesia)
* careTeam.role = $CARETEAMROLECS#primary "Primary provider"
* careTeam.qualification = $provider-taxonomy#207L00000X "Anesthesiology Physician"
* identifier.type = $v2-0203#PLAC "Placer Identifier"
* identifier.system = "http://springfield-general.example.org/gfe-summary-id"
* identifier.value = "PCT-GFE-TKR-Prof-Anes-Summary-001"


Instance: PCT-GFE-TKR-Prof-Anes-001
InstanceOf: PCTGFEProfessional
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-professional"
* type = $ClaimTypeCS#professional "Professional"
* provider.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerTaxonomy"
* provider.extension.valueCodeableConcept = $provider-taxonomy#207L00000X "Anesthesiology Physician"
* provider = Reference(Dr-Ana-Esthesia)
* billablePeriod.start = "2026-09-15"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-09-15"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://springfield-general.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "TKR-2026-LINK-00042"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 3
* item[0].sequence = 1
* item[=].productOrService = $cpt#01402 "Anesthesia for open or surgical arthroscopic procedures on knee joint; total knee arthroplasty"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 1950
* item[=].unitPrice.currency = #USD
* item[=].net.value = 1950
* item[=].net.currency = #USD
//* item[=].modifier = $HCPCS#AA "Anesthesia perf by anesgst"
* item[=].servicedDate = "2026-09-15"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#21 "Inpatient Hospital"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-001"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Anesthesia"
* item[+].sequence = 2
* item[=].productOrService = $cpt#99100 "Anesthesia for patient of extreme age, younger than 1 year and older than 70 (List separately in addition to code for primary anesthesia procedure)"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 180
* item[=].unitPrice.currency = #USD
* item[=].net.value = 180
* item[=].net.currency = #USD
* item[=].servicedDate = "2026-09-15"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#21 "Inpatient Hospital"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-002"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Anesthesia"
* item[+].sequence = 3
* item[=].productOrService = $cpt#99140 "Anesthesia complicated by emergency conditions (specify) (List separately in addition to code for primary anesthesia procedure)"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 120
* item[=].unitPrice.currency = #USD
* item[=].net.value = 120
* item[=].net.currency = #USD
* item[=].servicedDate = "2026-09-15"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#21 "Inpatient Hospital"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "TKR-003"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Anesthesia complicated by emergency conditions"
* total.value = 2250
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Jane-Smith)
* created = "2026-08-20"
* insurer = Reference(HCPayor)
* priority = $processpriority#normal "Normal"
* diagnosis.sequence = 1
* diagnosis.diagnosisCodeableConcept = $icd-10-cm#M17.11 "Unilateral primary osteoarthritis, right knee"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage-HC123456789)
* supportingInfo[0].sequence = 1
* supportingInfo[=].category.text = "GFE disclaimer"
* supportingInfo[=].valueString = "This Good Faith Estimate is not a guarantee of final charges. Actual charges depend on services furnished."
* supportingInfo[+].sequence = 2
* supportingInfo[=].category.text = "Anesthesia calculation method"
* supportingInfo[=].valueString = "Base Units (7) + Time Units (15 min/unit x estimated 90 minutes = 6 time units); total 13 units."
* procedure.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* procedure.extension.valueString = "ARTHROPLASTY"
* procedure.sequence = 1
* procedure.date = "2026-09-15"
* procedure.procedureCodeableConcept = $cpt#27447 "ARTHROPLASTY, KNEE, CONDYLE AND PLATEAU; MEDIAL AND LATERAL COMPARTMENTS WITH OR WITHOUT PATELLA RESURFACING (TOTAL KNEE ARTHROPLASTY)"
* careTeam.sequence = 1
* careTeam.provider = Reference(Dr-Ana-Esthesia)
* careTeam.role = $CARETEAMROLECS#primary "Primary provider"
* careTeam.qualification = $provider-taxonomy#207L00000X "Anesthesiology Physician"
* identifier.type = $v2-0203#PLAC "Placer Identifier"
* identifier.system = "http://springfield-general.example.org/gfe-claim-id"
* identifier.value = "PCT-GFE-TKR-Prof-Anes-001"