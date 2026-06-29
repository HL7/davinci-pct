

Instance: Patient-Alex-Morgan
InstanceOf: USCorePatientProfile|7.0.0
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient|7.0.0"
* identifier[0].system = "http://example.org/fhir/sid/mrn"
* identifier[=].value = "MR-ALEX-7714"
* identifier[+].system = "http://example.org/fhir/sid/member-id"
* identifier[=].value = "COL123456789"
* name.family = "Morgan"
* name.given = "Alex"
* gender = #unknown
* birthDate = "1974-06-22"
* address.line = "742 Cedar Ave"
* address.city = "Portland"
* address.state = "OR"
* address.postalCode = "97205"
* address.country = "US"

Instance: Org-Northwest-Health-Plan
InstanceOf: PCTOrganization
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-organization"
* identifier.system = "http://example.org/fhir/sid/payer-id"
* identifier.value = "PAYER-NHP-001"
* active = true
* type = $ORGTYPE#pay "Payer"
* name = "Northwest Health Plan"
* address.line = "400 Benefit Plaza"
* address.city = "Seattle"
* address.state = "WA"
* address.postalCode = "98101"
* address.country = "US"

Instance: Org-Evergreen-Endoscopy-Center
InstanceOf: PCTOrganization
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-organization"
* identifier[0].system = $USNPI
* identifier[=].value = "2345678900"
* identifier[+].system = "urn:oid:2.16.840.1.113883.4.4"
* identifier[=].value = "23-4567890"
* active = true
* type = $ORGTYPE#prov "Healthcare Provider"
* name = "Evergreen Endoscopy Center"
* address.line = "100 Endoscopy Way"
* address.city = "Portland"
* address.state = "OR"
* address.postalCode = "97205"
* address.country = "US"

Instance: Org-Digestive-Health-Associates
InstanceOf: PCTOrganization
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-organization"
* identifier[0].system = $USNPI
* identifier[=].value = "1234567893"
* identifier[+].system = "urn:oid:2.16.840.1.113883.4.4"
* identifier[=].value = "12-3456789"
* active = true
* type = $ORGTYPE#prov "Healthcare Provider"
* name = "Digestive Health Associates"
* address.line = "200 GI Clinic Dr"
* address.city = "Portland"
* address.state = "OR"
* address.postalCode = "97205"
* address.country = "US"

Instance: Org-Northwest-Anesthesia-Group
InstanceOf: PCTOrganization
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-organization"
* identifier[0].system = $USNPI
* identifier[=].value = "3456789015"
* identifier[+].system = "urn:oid:2.16.840.1.113883.4.4"
* identifier[=].value = "34-5678901"
* active = true
* type = $ORGTYPE#prov "Healthcare Provider"
* name = "Northwest Anesthesia Group"
* address.line = "300 Anesthesia Ave"
* address.city = "Portland"
* address.state = "OR"
* address.postalCode = "97205"
* address.country = "US"

Instance: Org-Regional-Pathology-Services
InstanceOf: PCTOrganization
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-organization"
* identifier[0].system = $USNPI
* identifier[=].value = "4567890122"
* identifier[+].system = "urn:oid:2.16.840.1.113883.4.4"
* identifier[=].value = "45-6789012"
* active = true
* type = $ORGTYPE#prov "Healthcare Provider"
* name = "Regional Pathology Services"
* address.line = "800 Lab Lane"
* address.city = "Portland"
* address.state = "OR"
* address.postalCode = "97206"
* address.country = "US"

Instance: Practitioner-Jordan-Lee
InstanceOf: PCTPractitioner
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-practitioner"
* identifier.system = $USNPI
* identifier.value = "1987654328"
* name.text = "Dr. Jordan Lee, MD"
* name.family = "Lee"
* name.given = "Jordan"
* name.prefix = "Dr."
* name.suffix = "MD"
* qualification.code = $NUCC#"208C00000X" "Colon & Rectal Surgery Physician"
* qualification.code.text = "Gastroenterology"

Instance: Practitioner-Riley-Chen
InstanceOf: PCTPractitioner
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-practitioner"
* identifier.system = $USNPI
* identifier.value = "1876543210"
* name.text = "Dr. Riley Chen, MD"
* name.family = "Chen"
* name.given = "Riley"
* name.prefix = "Dr."
* name.suffix = "MD"
* qualification.code = $NUCC#207L00000X "Anesthesiology Physician"
* qualification.code.text = "Anesthesiology Physician"

Instance: Practitioner-Samira-Patel
InstanceOf: PCTPractitioner
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-practitioner"
* identifier.system = $USNPI
* identifier.value = "1765432103"
* name.text = "Dr. Samira Patel, MD"
* name.family = "Patel"
* name.given = "Samira"
* name.prefix = "Dr."
* name.suffix = "MD"
* qualification.code = $NUCC#"246Q00000X" "Pathology Specialist/Technologist"
* qualification.code.text = "Anatomic Pathology & Clinical Pathology Physician"

Instance: Coverage-NHP-PPO-250
InstanceOf: PCTCoverage
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-coverage"
* extension.url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Coverage.kind"
* extension.valueCode = #insurance
* identifier.system = "http://northwest-health-plan.example.org/coverage-id"
* identifier.value = "COV-COL-2026-017"
* status = #active
* subscriberId = "COL123456789"
* beneficiary = Reference(Patient-Alex-Morgan)
* relationship = RELATE#self "Self"
* period.start = "2026-01-01"
* period.end = "2026-12-31"
* payor = Reference(Org-Northwest-Health-Plan)
* class[0].type = COVCLASS#group "Group"
* class[=].value = "NHP-GRP-4410"
* class[=].name = "Employer group"
* class[+].type = COVCLASS#plan "Plan"
* class[=].value = "PPO-250"
* class[=].name = "Preferred Provider Organization 250"
* network = "NHP-PPO-Network"

Instance: PCT-GFE-Packet-Colonoscopy-Integrated
InstanceOf: PCTGFEPacket
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-packet"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:72b3cefe-10c1-5479-8f38-66552bab4fcb"
* type = #document
* timestamp = "2026-09-15T12:00:00-07:00"
* entry[0].fullUrl = "http://example.org/fhir/Composition/PCT-GFE-Composition-Colonoscopy-Integrated"
* entry[=].resource = PCT-GFE-Composition-Colonoscopy-Integrated
* entry[+].fullUrl = "http://example.org/fhir/Patient/Patient-Alex-Morgan"
* entry[=].resource = Patient-Alex-Morgan
* entry[+].fullUrl = "http://example.org/fhir/Coverage/Coverage-NHP-PPO-250"
* entry[=].resource = Coverage-NHP-PPO-250
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Northwest-Health-Plan"
* entry[=].resource = Org-Northwest-Health-Plan
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Evergreen-Endoscopy-Center"
* entry[=].resource = Org-Evergreen-Endoscopy-Center
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Digestive-Health-Associates"
* entry[=].resource = Org-Digestive-Health-Associates
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Northwest-Anesthesia-Group"
* entry[=].resource = Org-Northwest-Anesthesia-Group
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Regional-Pathology-Services"
* entry[=].resource = Org-Regional-Pathology-Services
* entry[+].fullUrl = "http://example.org/fhir/Practitioner/Practitioner-Jordan-Lee"
* entry[=].resource = Practitioner-Jordan-Lee
* entry[+].fullUrl = "http://example.org/fhir/Practitioner/Practitioner-Riley-Chen"
* entry[=].resource = Practitioner-Riley-Chen
* entry[+].fullUrl = "http://example.org/fhir/Practitioner/Practitioner-Samira-Patel"
* entry[=].resource = Practitioner-Samira-Patel
* entry[+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Colon-GI"
* entry[=].resource = PCT-GFE-Bundle-Colon-GI
* entry[+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Colon-Facility"
* entry[=].resource = PCT-GFE-Bundle-Colon-Facility
* entry[+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Colon-Anesthesia"
* entry[=].resource = PCT-GFE-Bundle-Colon-Anesthesia
* entry[+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Colon-Pathology"
* entry[=].resource = PCT-GFE-Bundle-Colon-Pathology

Instance: PCT-GFE-Composition-Colonoscopy-Integrated
InstanceOf: PCTGFEComposition
Usage: #inline
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-composition"
* extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/requestInitiationTime"
* extension[=].valueInstant = "2026-09-15T12:00:00-07:00"
* extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/requestOriginationType"
* extension[=].valueCodeableConcept = PCTGFERequestTypeCSTemporaryTrialUse#scheduled-request "Scheduled Service Request"
* extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension[=].extension[0].url = "plannedPeriodOfService"
* extension[=].extension[=].valuePeriod.start = "2026-10-08"
* extension[=].extension[+].url = "linkingIdentifier"
* extension[=].extension[=].valueIdentifier.system = "http://evergreen-endoscopy.example.org/gfe-linking-id"
* extension[=].extension[=].valueIdentifier.value = "COLON-2026-LINK-00017"
* extension[=].extension[+].url = "anticipatedSubmittingProviderCount"
* extension[=].extension[=].valueUnsignedInt = 4
* identifier.system = "http://evergreen-endoscopy.example.org/gfe-composition-id"
* identifier.value = "PCT-GFE-Composition-Colonoscopy-Integrated"
* status = #final
* type = $loinc#111480-0 "Good faith estimate"
* subject = Reference(Patient-Alex-Morgan)
* date = "2026-09-15T12:00:00-07:00"
* author[+] = Reference(Org-Evergreen-Endoscopy-Center)
* author[+] = Reference(Practitioner-Jordan-Lee)
* author[+] = Reference(Practitioner-Riley-Chen)
* author[+] = Reference(Practitioner-Samira-Patel)
* author[+] = Reference(Org-Digestive-Health-Associates)
* author[+] = Reference(Org-Northwest-Anesthesia-Group)
* author[+] = Reference(Org-Regional-Pathology-Services)
* title = "Screening colonoscopy with anticipated polypectomy integrated Good Faith Estimate packet"
* section[0].title = "Coverage"
* section[=].code.text = "Coverage"
* section[=].entry = Reference(Coverage-NHP-PPO-250)

* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
* section[gfeBundle][=].author = Reference(Practitioner-Jordan-Lee)
* section[gfeBundle][=].entry = Reference(PCT-GFE-Bundle-Colon-GI)
//* section[gfeBundle][=].text.status = #extensions
//* section[gfeBundle][=].text.div = "<div xmlns="http://www.w3.org/1999/xhtml">GI contributor Good Faith Estimate Bundle</div>"

* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
* section[gfeBundle][=].author = Reference(Org-Evergreen-Endoscopy-Center)
* section[gfeBundle][=].entry = Reference(PCT-GFE-Bundle-Colon-Facility)
//* section[gfeBundle][=].text.status = #extensions
//* section[gfeBundle][=].text.div = "<div xmlns="http://www.w3.org/1999/xhtml">Facility contributor Good Faith Estimate Bundle</div>"

* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
* section[gfeBundle][=].author = Reference(Practitioner-Riley-Chen)
* section[gfeBundle][=].entry = Reference(PCT-GFE-Bundle-Colon-Anesthesia)
//* section[gfeBundle][=].text.status = #extensions
//* section[gfeBundle][=].text.div = "<div xmlns="http://www.w3.org/1999/xhtml">Anesthesia contributor Good Faith Estimate Bundle</div>"

* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
* section[gfeBundle][=].author = Reference(Practitioner-Samira-Patel)
* section[gfeBundle][=].entry = Reference(PCT-GFE-Bundle-Colon-Pathology)
//* section[gfeBundle][=].text.status = #extensions
//* section[gfeBundle][=].text.div = "<div xmlns="http://www.w3.org/1999/xhtml">Pathology contributor Good Faith Estimate Bundle</div>"

Instance: PCT-GFE-Bundle-Colon-GI
InstanceOf: PCTGFEBundle
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-bundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c520e57-8bdd-5517-bf07-d48b2405c1d5"
* type = #collection
* timestamp = "2026-09-15T12:00:00-07:00"
* entry[0].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Colon-GI-Summary-001"
* entry[=].resource = PCT-GFE-Colon-GI-Summary-001
* entry[+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Colon-GI-001"
* entry[=].resource = PCT-GFE-Colon-GI-001
* entry[+].fullUrl = "http://example.org/fhir/Patient/Patient-Alex-Morgan"
* entry[=].resource = Patient-Alex-Morgan
* entry[+].fullUrl = "http://example.org/fhir/Coverage/Coverage-NHP-PPO-250"
* entry[=].resource = Coverage-NHP-PPO-250
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Northwest-Health-Plan"
* entry[=].resource = Org-Northwest-Health-Plan
* entry[+].fullUrl = "http://example.org/fhir/Practitioner/Practitioner-Jordan-Lee"
* entry[=].resource = Practitioner-Jordan-Lee
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Digestive-Health-Associates"
* entry[=].resource = Org-Digestive-Health-Associates

Instance: PCT-GFE-Bundle-Colon-Facility
InstanceOf: PCTGFEBundle
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-bundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:e374dc48-8724-5852-9f10-1f812cad546a"
* type = #collection
* timestamp = "2026-09-15T12:00:00-07:00"
* entry[0].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Colon-Facility-Summary-001"
* entry[=].resource = PCT-GFE-Colon-Facility-Summary-001
* entry[+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Colon-Facility-001"
* entry[=].resource = PCT-GFE-Colon-Facility-001
* entry[+].fullUrl = "http://example.org/fhir/Patient/Patient-Alex-Morgan"
* entry[=].resource = Patient-Alex-Morgan
* entry[+].fullUrl = "http://example.org/fhir/Coverage/Coverage-NHP-PPO-250"
* entry[=].resource = Coverage-NHP-PPO-250
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Northwest-Health-Plan"
* entry[=].resource = Org-Northwest-Health-Plan
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Evergreen-Endoscopy-Center"
* entry[=].resource = Org-Evergreen-Endoscopy-Center

Instance: PCT-GFE-Bundle-Colon-Anesthesia
InstanceOf: PCTGFEBundle
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-bundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:f9245dcd-9c07-5dc1-822a-178aeeb2fb06"
* type = #collection
* timestamp = "2026-09-15T12:00:00-07:00"
* entry[0].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Colon-Anesthesia-Summary-001"
* entry[=].resource = PCT-GFE-Colon-Anesthesia-Summary-001
* entry[+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Colon-Anesthesia-001"
* entry[=].resource = PCT-GFE-Colon-Anesthesia-001
* entry[+].fullUrl = "http://example.org/fhir/Patient/Patient-Alex-Morgan"
* entry[=].resource = Patient-Alex-Morgan
* entry[+].fullUrl = "http://example.org/fhir/Coverage/Coverage-NHP-PPO-250"
* entry[=].resource = Coverage-NHP-PPO-250
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Northwest-Health-Plan"
* entry[=].resource = Org-Northwest-Health-Plan
* entry[+].fullUrl = "http://example.org/fhir/Practitioner/Practitioner-Riley-Chen"
* entry[=].resource = Practitioner-Riley-Chen
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Northwest-Anesthesia-Group"
* entry[=].resource = Org-Northwest-Anesthesia-Group

Instance: PCT-GFE-Bundle-Colon-Pathology
InstanceOf: PCTGFEBundle
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-bundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:6344960a-5b9d-5c17-bf55-71faa81cc4cf"
* type = #collection
* timestamp = "2026-09-15T12:00:00-07:00"
* entry[0].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Colon-Pathology-Summary-001"
* entry[=].resource = PCT-GFE-Colon-Pathology-Summary-001
* entry[+].fullUrl = "http://example.org/fhir/Claim/PCT-GFE-Colon-Pathology-001"
* entry[=].resource = PCT-GFE-Colon-Pathology-001
* entry[+].fullUrl = "http://example.org/fhir/Patient/Patient-Alex-Morgan"
* entry[=].resource = Patient-Alex-Morgan
* entry[+].fullUrl = "http://example.org/fhir/Coverage/Coverage-NHP-PPO-250"
* entry[=].resource = Coverage-NHP-PPO-250
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Northwest-Health-Plan"
* entry[=].resource = Org-Northwest-Health-Plan
* entry[+].fullUrl = "http://example.org/fhir/Practitioner/Practitioner-Samira-Patel"
* entry[=].resource = Practitioner-Samira-Patel
* entry[+].fullUrl = "http://example.org/fhir/Organization/Org-Regional-Pathology-Services"
* entry[=].resource = Org-Regional-Pathology-Services

Instance: PCT-GFE-Colon-GI-Summary-001
InstanceOf: PCTGFESummary
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-summary"
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
* provider.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* provider.extension.valueCode = #not-applicable
* billablePeriod.start = "2026-10-08"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-10-08"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://evergreen-endoscopy.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "COLON-2026-LINK-00017"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 4
* total.value = 2280
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Patient-Alex-Morgan)
* created = "2026-09-15"
* insurer = Reference(Org-Northwest-Health-Plan)
* priority = $PROCPRIORITY#normal "Normal"
* diagnosis[0].sequence = 1
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#Z12.11 "Encounter for screening for malignant neoplasm of colon"
* diagnosis[+].sequence = 2
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#K63.5 "Polyp of colon"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(Coverage-NHP-PPO-250)
* careTeam.sequence = 1
* careTeam.provider = Reference(Practitioner-Jordan-Lee)
* careTeam.role = $CARETEAMROLECS#primary "Primary provider"
* careTeam.qualification = $NUCC#"208C00000X" "Colon & Rectal Surgery Physician"
* identifier.type = $V2-0203#PLAC "Placer Identifier"
* identifier.system = "http://evergreen-endoscopy.example.org/gfe-summary-id"
* identifier.value = "PCT-GFE-Colon-GI-Summary-001"

Instance: PCT-GFE-Colon-GI-001
InstanceOf: PCTGFEProfessional
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-professional"
* type = $ClaimTypeCS#professional "Professional"
* provider.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerTaxonomy"
* provider.extension.valueCodeableConcept = $NUCC#"208C00000X" "Colon & Rectal Surgery Physician"
* provider = Reference(Practitioner-Jordan-Lee)
* billablePeriod.start = "2026-10-08"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-10-08"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://evergreen-endoscopy.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "COLON-2026-LINK-00017"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 4
* total.value = 2280
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Patient-Alex-Morgan)
* created = "2026-09-15"
* insurer = Reference(Org-Northwest-Health-Plan)
* priority = $PROCPRIORITY#normal "Normal"
* diagnosis[0].sequence = 1
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#Z12.11 "Encounter for screening for malignant neoplasm of colon"
* diagnosis[+].sequence = 2
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#K63.5 "Polyp of colon"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(Coverage-NHP-PPO-250)
* supportingInfo[0].sequence = 1
* supportingInfo[=].category.text = "GFE disclaimer"
* supportingInfo[=].valueString = "This Good Faith Estimate is not a guarantee of final charges. Actual charges depend on services furnished."
* supportingInfo[+].sequence = 2
* supportingInfo[=].category.text = "Prior authorization note"
* supportingInfo[=].valueString = "Prior authorization requirements are payer-specific; anesthesia or site of service may require review."
* identifier.type = $V2-0203#PLAC "Placer Identifier"
* identifier.system = "http://evergreen-endoscopy.example.org/gfe-claim-id"
* identifier.value = "PCT-GFE-Colon-GI-001"
* extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerEventMethodology"
* extension[=].valueString = "Generated from scheduled colonoscopy scenario using expected service package and historical allowed-charge methodology."
* item[0].sequence = 1
* item[=].productOrService = $cpt#45378 "Colonoscopy, flexible; diagnostic, including collection of specimen(s) by brushing or washing, when performed (separate procedure)"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 900
* item[=].unitPrice.currency = #USD
* item[=].net.value = 900
* item[=].net.currency = #USD
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#24 "Ambulatory Surgical Center"
* item[=].servicedDate = "2026-10-08"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-001"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Screening colonoscopy, base service"
* item[+].sequence = 2
* item[=].productOrService = $cpt#45385 "Colonoscopy, flexible; with removal of tumor(s), polyp(s), or other lesion(s) by snare technique"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 1200
* item[=].unitPrice.currency = #USD
* item[=].net.value = 1200
* item[=].net.currency = #USD
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#24 "Ambulatory Surgical Center"
* item[=].servicedDate = "2026-10-08"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-002"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Colonoscopy with snare polypectomy"
* item[+].sequence = 3
* item[=].productOrService = $cpt#99213 "Established patient office or other outpatient visit, 20-29 minutes"
* item[=].modifier = $cpt#25 "Significant, Separately Identifiable Evaluation and Management Service by the Same Physician or Other Qualified Health Care Professional on the Same Day of the Procedure or Other Service: It may be necessary to indicate that on the day a procedure or service identified by a CPT code was performed, the patient's condition required a significant, separately identifiable E/M service above and beyond the other service provided or beyond the usual preoperative and postoperative care associated with the procedure that was performed. A significant, separately identifiable E/M service is defined or substantiated by documentation that satisfies the relevant criteria for the respective E/M service to be reported (see Evaluation and Management Services Guidelines for instructions on determining level of E/M service). The E/M service may be prompted by the symptom or condition for which the procedure and/or service was provided. As such, different diagnoses are not required for reporting of the E/M services on the same date. This circumstance may be reported by adding modifier 25 to the appropriate level of E/M service. Note: This modifier is not used to report an E/M service that resulted in a decision to perform surgery. See modifier 57 For significant, separately identifiable non-E/M services, see modifier 59."
* item[=].quantity.value = 1
* item[=].unitPrice.value = 180
* item[=].unitPrice.currency = #USD
* item[=].net.value = 180
* item[=].net.currency = #USD
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#11 "Office"
* item[=].servicedDate = "2026-10-08"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-003"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Pre-procedure evaluation and documentation"
* procedure.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* procedure.extension.valueString = "Screening colonoscopy with anticipated polypectomy"
* procedure.sequence = 1
* procedure.date = "2026-10-08"
* procedure.procedureCodeableConcept = $cpt#45385 "Colonoscopy, flexible; with removal of tumor(s), polyp(s), or other lesion(s) by snare technique"
* careTeam.sequence = 1
* careTeam.provider = Reference(Practitioner-Jordan-Lee)
* careTeam.role = $CARETEAMROLECS#primary "Primary provider"
* careTeam.qualification = $NUCC#"208C00000X" "Colon & Rectal Surgery Physician"

Instance: PCT-GFE-Colon-Facility-Summary-001
InstanceOf: PCTGFESummary
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-summary"
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
* provider.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* provider.extension.valueCode = #not-applicable
* billablePeriod.start = "2026-10-08"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-10-08"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://evergreen-endoscopy.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "COLON-2026-LINK-00017"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 4
* total.value = 2950
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Patient-Alex-Morgan)
* created = "2026-09-15"
* insurer = Reference(Org-Northwest-Health-Plan)
* priority = $PROCPRIORITY#normal "Normal"
* diagnosis[0].sequence = 1
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#Z12.11 "Encounter for screening for malignant neoplasm of colon"
* diagnosis[+].sequence = 2
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#K63.5 "Polyp of colon"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(Coverage-NHP-PPO-250)
* careTeam.sequence = 1
* careTeam.provider = Reference(Org-Evergreen-Endoscopy-Center)
* careTeam.role = $CARETEAMROLECS#primary "Primary provider"
* careTeam.qualification = $NUCC#"208C00000X" "Colon & Rectal Surgery Physician"
* identifier.type = $V2-0203#PLAC "Placer Identifier"
* identifier.system = "http://evergreen-endoscopy.example.org/gfe-summary-id"
* identifier.value = "PCT-GFE-Colon-Facility-Summary-001"

Instance: PCT-GFE-Colon-Facility-001
InstanceOf: PCTGFEInstitutional
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-institutional"
* type = $ClaimTypeCS#institutional "Institutional"
* provider.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerTaxonomy"
* provider.extension.valueCodeableConcept = $NUCC#"208C00000X" "Colon & Rectal Surgery Physician"
* provider = Reference(Org-Evergreen-Endoscopy-Center)
* billablePeriod.start = "2026-10-08"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-10-08"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://evergreen-endoscopy.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "COLON-2026-LINK-00017"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 4
* total.value = 2950
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Patient-Alex-Morgan)
* created = "2026-09-15"
* insurer = Reference(Org-Northwest-Health-Plan)
* priority = $PROCPRIORITY#normal "Normal"
* diagnosis[0].sequence = 1
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#Z12.11 "Encounter for screening for malignant neoplasm of colon"
* diagnosis[+].sequence = 2
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#K63.5 "Polyp of colon"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(Coverage-NHP-PPO-250)
* supportingInfo[typeOfBill].sequence = 1
* supportingInfo[typeOfBill].category = $PCTSupportingInfoType#typeofbill
* supportingInfo[typeOfBill].code = https://www.nubc.org/CodeSystem/TypeOfBill#011X "Hospital Inpatient (Part A)"
* supportingInfo[+].sequence = 2
* supportingInfo[=].category.text = "GFE disclaimer"
* supportingInfo[=].valueString = "This Good Faith Estimate is not a guarantee of final charges. Actual charges depend on services furnished."
* supportingInfo[+].sequence = 3
* supportingInfo[=].category.text = "Prior authorization note"
* supportingInfo[=].valueString = "Prior authorization requirements are payer-specific; anesthesia or site of service may require review."
* identifier.type = $V2-0203#PLAC "Placer Identifier"
* identifier.system = "http://evergreen-endoscopy.example.org/gfe-claim-id"
* identifier.value = "PCT-GFE-Colon-Facility-001"
* extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerEventMethodology"
* extension[=].valueString = "Generated from scheduled colonoscopy scenario using expected service package and historical allowed-charge methodology."
* item[0].sequence = 1
* item[=].productOrService = $cpt#45385 "Colonoscopy, flexible; with removal of tumor(s), polyp(s), or other lesion(s) by snare technique"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 1500
* item[=].unitPrice.currency = #USD
* item[=].net.value = 1500
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0750 "Gastro-intestinal services, general"
* item[=].servicedDate = "2026-10-08"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-001"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Gastro-intestinal services, general"
* item[+].sequence = 2
* item[=].productOrService = $cpt#45385 "Colonoscopy, flexible; with removal of tumor(s), polyp(s), or other lesion(s) by snare technique"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 900
* item[=].unitPrice.currency = #USD
* item[=].net.value = 900
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0360 "Operating room services, general"
* item[=].servicedDate = "2026-10-08"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-002"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Operating room services, general"
* item[+].sequence = 3
* item[=].productOrService = $cpt#45385 "Colonoscopy, flexible; with removal of tumor(s), polyp(s), or other lesion(s) by snare technique"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 250
* item[=].unitPrice.currency = #USD
* item[=].net.value = 250
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0272 "Medical/surgical supplies"
* item[=].servicedDate = "2026-10-08"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-003"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Medical/surgical supplies"
* item[+].sequence = 4
* item[=].productOrService = $cpt#45385 "Colonoscopy, flexible; with removal of tumor(s), polyp(s), or other lesion(s) by snare technique"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 120
* item[=].unitPrice.currency = #USD
* item[=].net.value = 120
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0250 "Pharmacy / routine medications"
* item[=].servicedDate = "2026-10-08"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-004"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Pharmacy / routine medications"
* item[+].sequence = 5
* item[=].productOrService = $cpt#45385 "Colonoscopy, flexible; with removal of tumor(s), polyp(s), or other lesion(s) by snare technique"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 180
* item[=].unitPrice.currency = #USD
* item[=].net.value = 180
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0300 "Laboratory, general"
* item[=].servicedDate = "2026-10-08"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-005"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Laboratory, general"
* procedure.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* procedure.extension.valueString = "Screening colonoscopy with anticipated polypectomy"
* procedure.sequence = 1
* procedure.date = "2026-10-08"
* procedure.procedureCodeableConcept = $cpt#45385 "Colonoscopy, flexible; with removal of tumor(s), polyp(s), or other lesion(s) by snare technique"
* careTeam.sequence = 1
* careTeam.provider = Reference(Org-Evergreen-Endoscopy-Center)
* careTeam.role = $CARETEAMROLECS#primary "Primary provider"
* careTeam.qualification = $NUCC#"208C00000X" "Colon & Rectal Surgery Physician"

Instance: PCT-GFE-Colon-Anesthesia-Summary-001
InstanceOf: PCTGFESummary
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-summary"
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
* provider.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* provider.extension.valueCode = #not-applicable
* billablePeriod.start = "2026-10-08"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-10-08"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://evergreen-endoscopy.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "COLON-2026-LINK-00017"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 4
* total.value = 1000
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Patient-Alex-Morgan)
* created = "2026-09-15"
* insurer = Reference(Org-Northwest-Health-Plan)
* priority = $PROCPRIORITY#normal "Normal"
* diagnosis[0].sequence = 1
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#Z12.11 "Encounter for screening for malignant neoplasm of colon"
* diagnosis[+].sequence = 2
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#K63.5 "Polyp of colon"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(Coverage-NHP-PPO-250)
* careTeam.sequence = 1
* careTeam.provider = Reference(Practitioner-Riley-Chen)
* careTeam.role = $CARETEAMROLECS#primary "Primary provider"
* careTeam.qualification = $NUCC#207L00000X "Anesthesiology Physician"
* identifier.type = $V2-0203#PLAC "Placer Identifier"
* identifier.system = "http://evergreen-endoscopy.example.org/gfe-summary-id"
* identifier.value = "PCT-GFE-Colon-Anesthesia-Summary-001"

Instance: PCT-GFE-Colon-Anesthesia-001
InstanceOf: PCTGFEProfessional
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-professional"
* type = $ClaimTypeCS#professional "Professional"
* provider.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerTaxonomy"
* provider.extension.valueCodeableConcept = $NUCC#207L00000X "Anesthesiology Physician"
* provider = Reference(Practitioner-Riley-Chen)
* billablePeriod.start = "2026-10-08"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-10-08"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://evergreen-endoscopy.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "COLON-2026-LINK-00017"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 4
* total.value = 1000
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Patient-Alex-Morgan)
* created = "2026-09-15"
* insurer = Reference(Org-Northwest-Health-Plan)
* priority = $PROCPRIORITY#normal "Normal"
* diagnosis[0].sequence = 1
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#Z12.11 "Encounter for screening for malignant neoplasm of colon"
* diagnosis[+].sequence = 2
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#K63.5 "Polyp of colon"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(Coverage-NHP-PPO-250)
* supportingInfo[0].sequence = 1
* supportingInfo[=].category.text = "GFE disclaimer"
* supportingInfo[=].valueString = "This Good Faith Estimate is not a guarantee of final charges. Actual charges depend on services furnished."
* supportingInfo[+].sequence = 2
* supportingInfo[=].category.text = "Prior authorization note"
* supportingInfo[=].valueString = "Prior authorization requirements are payer-specific; anesthesia or site of service may require review."
* identifier.type = $V2-0203#PLAC "Placer Identifier"
* identifier.system = "http://evergreen-endoscopy.example.org/gfe-claim-id"
* identifier.value = "PCT-GFE-Colon-Anesthesia-001"
* extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerEventMethodology"
* extension[=].valueString = "Generated from scheduled colonoscopy scenario using expected service package and historical allowed-charge methodology."
* item[0].sequence = 1
* item[=].productOrService = $cpt#00812 "Anesthesia for lower intestinal endoscopic procedures, endoscope introduced distal to duodenum; screening colonoscopy"
//* item[=].modifier = $cpt#AA "Modifier AA"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 850
* item[=].unitPrice.currency = #USD
* item[=].net.value = 850
* item[=].net.currency = #USD
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#24 "Ambulatory Surgical Center"
* item[=].servicedDate = "2026-10-08"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-001"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Anesthesia for screening colonoscopy"
* item[+].sequence = 2
* item[=].productOrService = $cpt#99242 "Outpatient consultation with straightforward medical decision making, if using time, at least 20 minutes"
* item[=].productOrService.text = "Anesthesia pre-operative assessment"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 150
* item[=].unitPrice.currency = #USD
* item[=].net.value = 150
* item[=].net.currency = #USD
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#11 "Office"
* item[=].servicedDate = "2026-10-08"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-002"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Anesthesia pre-operative assessment"
* procedure.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* procedure.extension.valueString = "Screening colonoscopy with anticipated polypectomy"
* procedure.sequence = 1
* procedure.date = "2026-10-08"
* procedure.procedureCodeableConcept = $cpt#00812 "Anesthesia for lower intestinal endoscopic procedures, endoscope introduced distal to duodenum; screening colonoscopy"
* careTeam.sequence = 1
* careTeam.provider = Reference(Practitioner-Riley-Chen)
* careTeam.role = $CARETEAMROLECS#primary "Primary provider"
* careTeam.qualification = $NUCC#207L00000X "Anesthesiology Physician"

Instance: PCT-GFE-Colon-Pathology-Summary-001
InstanceOf: PCTGFESummary
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-summary"
* type = PCTEstimateTypeSummaryCSTemporaryTrialUse#estimate-summary "Estimate Summary"
* provider.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* provider.extension.valueCode = #not-applicable
* billablePeriod.start = "2026-10-08"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-10-08"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://evergreen-endoscopy.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "COLON-2026-LINK-00017"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 4
* total.value = 600
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Patient-Alex-Morgan)
* created = "2026-09-15"
* insurer = Reference(Org-Northwest-Health-Plan)
* priority = $PROCPRIORITY#normal "Normal"
* diagnosis[0].sequence = 1
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#Z12.11 "Encounter for screening for malignant neoplasm of colon"
* diagnosis[+].sequence = 2
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#K63.5 "Polyp of colon"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(Coverage-NHP-PPO-250)
* careTeam.sequence = 1
* careTeam.provider = Reference(Practitioner-Samira-Patel)
* careTeam.role = $CARETEAMROLECS#primary "Primary provider"
* careTeam.qualification = $NUCC#"246Q00000X" "Pathology Specialist/Technologist"
* identifier.type = $V2-0203#PLAC "Placer Identifier"
* identifier.system = "http://evergreen-endoscopy.example.org/gfe-summary-id"
* identifier.value = "PCT-GFE-Colon-Pathology-Summary-001"

Instance: PCT-GFE-Colon-Pathology-001
InstanceOf: PCTGFEProfessional
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-professional"
* type = $ClaimTypeCS#professional "Professional"
* provider.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerTaxonomy"
* provider.extension.valueCodeableConcept = $NUCC#"246Q00000X" "Pathology Specialist/Technologist"
* provider = Reference(Practitioner-Samira-Patel)
* billablePeriod.start = "2026-10-08"
* extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo"
* extension.extension[0].url = "plannedPeriodOfService"
* extension.extension[=].valuePeriod.start = "2026-10-08"
* extension.extension[+].url = "linkingIdentifier"
* extension.extension[=].valueIdentifier.system = "http://evergreen-endoscopy.example.org/gfe-linking-id"
* extension.extension[=].valueIdentifier.value = "COLON-2026-LINK-00017"
* extension.extension[+].url = "anticipatedSubmittingProviderCount"
* extension.extension[=].valueUnsignedInt = 4
* total.value = 600
* total.currency = #USD
* status = #active
* use = #predetermination
* patient = Reference(Patient-Alex-Morgan)
* created = "2026-09-15"
* insurer = Reference(Org-Northwest-Health-Plan)
* priority = $PROCPRIORITY#normal "Normal"
* diagnosis[0].sequence = 1
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#Z12.11 "Encounter for screening for malignant neoplasm of colon"
* diagnosis[+].sequence = 2
* diagnosis[=].diagnosisCodeableConcept = $icd-10-cm#K63.5 "Polyp of colon"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(Coverage-NHP-PPO-250)
* supportingInfo[0].sequence = 1
* supportingInfo[=].category.text = "GFE disclaimer"
* supportingInfo[=].valueString = "This Good Faith Estimate is not a guarantee of final charges. Actual charges depend on services furnished."
* supportingInfo[+].sequence = 2
* supportingInfo[=].category.text = "Prior authorization note"
* supportingInfo[=].valueString = "Prior authorization requirements are payer-specific; anesthesia or site of service may require review."
* identifier.type = $V2-0203#PLAC "Placer Identifier"
* identifier.system = "http://evergreen-endoscopy.example.org/gfe-claim-id"
* identifier.value = "PCT-GFE-Colon-Pathology-001"
* extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/providerEventMethodology"
* extension[=].valueString = "Generated from scheduled colonoscopy scenario using expected service package and historical allowed-charge methodology."
* item[0].sequence = 1
* item[=].productOrService = $cpt#88305 "Surgical pathology with gross and microscopic examination of colorectal polyp"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 420
* item[=].unitPrice.currency = #USD
* item[=].net.value = 420
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0300 "Surgical pathology gross and microscopic examination"
* item[=].servicedDate = "2026-10-08"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#21 "Inpatient Hospital"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-001"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Surgical pathology gross and microscopic examination"
* item[+].sequence = 2
* item[=].productOrService = $cpt#88312 "Special stain including interpretation and report; Group I for microorganisms (eg, acid fast, methenamine silver)"
* item[=].quantity.value = 1
* item[=].unitPrice.value = 180
* item[=].unitPrice.currency = #USD
* item[=].net.value = 180
* item[=].net.currency = #USD
* item[=].revenue = $RevenueCodes#0300 "Special stains if medically necessary"
* item[=].servicedDate = "2026-10-08"
* item[=].locationCodeableConcept = $Place_of_Service_Code_Set#21 "Inpatient Hospital"
* item[=].extension[0].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeBillingProviderLineItemCtrlNum"
* item[=].extension[=].valueIdentifier.value = "COLON-002"
* item[=].extension[+].url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* item[=].extension[=].valueString = "Special stains if medically necessary"
* procedure.extension.url = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/serviceDescription"
* procedure.extension.valueString = "Screening colonoscopy with anticipated polypectomy"
* procedure.sequence = 1
* procedure.date = "2026-10-08"
* procedure.procedureCodeableConcept = $cpt#88305 "Surgical pathology with gross and microscopic examination of colorectal polyp"
* careTeam.sequence = 1
* careTeam.provider = Reference(Practitioner-Samira-Patel)
* careTeam.role = $CARETEAMROLECS#primary "Primary provider"
* careTeam.qualification = $NUCC#"246Q00000X" "Pathology Specialist/Technologist"
