/*

PCTGFECoordinationBundle


PCTGFECoordinationTask

PCTGFEContributorTask


PCTGFEInformationBundle
PCTServiceRequest
PCTMedicationRequest
PCTDeviceRequest

PCTGFECollectionBundle

*/



Instance: PCT-GFE-Coordination-Bundle-1
InstanceOf: PCTGFECoordinationBundle
Description: "PCT GFE Coordination Bundle Example 1"
Usage: #example
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-2347384710"
* timestamp = "2024-03-27T11:01:00+05:00"
* entry[gfe-task][+].fullUrl = "http://example.org/fhir/Task/PCT-GFE-Coordination-Task-1"
* entry[gfe-task][=].id = "PCT-GFE-Coordination-Task-1"
* entry[gfe-task][=].resource = PCT-GFE-Coordination-Task-1
* entry[gfe-task][=].request.method = #POST
* entry[gfe-task][=].request.url = "Task"
* entry[gfe-task][+].fullUrl = "http://example.org/fhir/Task/PCT-GFE-Contributor-Task-1"
* entry[gfe-task][=].id = "PCT-GFE-Contributor-Task-1"
* entry[gfe-task][=].resource = PCT-GFE-Contributor-Task-1
* entry[gfe-task][=].request.method = #POST
* entry[gfe-task][=].request.url = "Task"
* entry[gfe-task][+].fullUrl = "http://example.org/fhir/Task/PCT-GFE-Contributor-Task-2"
* entry[gfe-task][=].id = "PCT-GFE-Contributor-Task-2"
* entry[gfe-task][=].resource = PCT-GFE-Contributor-Task-2
* entry[gfe-task][=].request.method = #POST
* entry[gfe-task][=].request.url = "Task"



Instance: PCT-GFE-Coordination-Task-1
InstanceOf: PCTGFECoordinationTask
Description: "PCT GFE Coordination Task example 1"
Usage: #example

* extension[requested-period].valuePeriod.end = "2024-03-30T11:01:00+05:00"

* extension[request-initiation-time].valueInstant = "2024-03-27T11:01:00+05:00"

* extension[planned-service-period].valuePeriod.start = "2024-04-27T10:00:00+05:00"
* extension[planned-service-period].valuePeriod.end = "2024-04-27T11:00:00+05:00"

* status = $HL7TaskStatus#requested
//* statusReason from PCTCoordinationTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTypeCSTemporaryTrialUse#gfe-coordination-task
* requester = Reference(Submitter-Org-1)


* reasonCode = PCTGFERequestTypeCSTemporaryTrialUse#scheduled-request
* input[gfe-information-bundle].type.text = "GFE Information Bundle"
//* input[gfe-information-bundle].valueAttachment.contentType = #application/fhir+json
* input[gfe-information-bundle].valueReference = Reference(PCT-GFE-Information-Bundle-1)
//* input.valueAttachment.data = ""


Instance: PCT-GFE-Contributor-Task-1
InstanceOf: PCTGFEContributorTask
Description: "PCT GFE Contributor Task example 1"
Usage: #example

* extension[requested-period].valuePeriod.end = "2024-03-30T11:01:00+05:00"

* extension[request-initiation-time].valueInstant = "2024-03-27T11:01:00+05:00"

* extension[planned-service-period].valuePeriod.start = "2024-04-27T10:00:00+05:00"
* extension[planned-service-period].valuePeriod.end = "2024-04-27T11:00:00+05:00"

* partOf = Reference(PCT-GFE-Coordination-Task-1)

* status = $HL7TaskStatus#received
//* statusReason from PCTCoordinationTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTypeCSTemporaryTrialUse#gfe-contributor-task
* requester = Reference(Submitter-Org-1)
* owner = Reference(Submitter-Org-1)


Instance: PCT-GFE-Contributor-Task-2
InstanceOf: PCTGFEContributorTask
Description: "PCT GFE Contributor Task example 2"
Usage: #example

* extension[requested-period].valuePeriod.end = "2024-03-30T11:01:00+05:00"

* extension[request-initiation-time].valueInstant = "2024-03-27T11:01:00+05:00"

* extension[planned-service-period].valuePeriod.start = "2024-04-27T10:00:00+05:00"
* extension[planned-service-period].valuePeriod.end = "2024-04-27T11:00:00+05:00"

* partOf = Reference(PCT-GFE-Coordination-Task-1)

* status = $HL7TaskStatus#received
//* statusReason from PCTCoordinationTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTypeCSTemporaryTrialUse#gfe-contributor-task
* requester = Reference(Submitter-Org-1)
* owner = Reference(org1002)


Instance: PCT-GFE-Information-Bundle-1
InstanceOf: PCTGFEInformationBundle
Description: "PCT GFE Information Bundle Example 1"
Usage: #example

* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-2347384711"
* timestamp = "2024-03-27T11:01:00+05:00"

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

// * entry[organization][+].fullUrl = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // "http://example.org/fhir/Organization/org1001"
// * entry[organization][=].id = "org1001"
// * entry[organization][=].resource = 2ccf0ff7-2af1-4598-b667-6e35b79529df // org1001

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].resource = org1001

* entry[service-location].fullUrl = "http://example.org/fhir/Location/PCT-ServiceLocation-1"
* entry[service-location].id = "PCT-ServiceLocation-1"
* entry[service-location].resource = PCT-ServiceLocation-1

* entry[requested-items-service][+].fullUrl = "http://example.org/fhir/ServiceRequest/PCT-ServiceRequest-1"
* entry[requested-items-service][=].id = "PCT-ServiceRequest-1"
* entry[requested-items-service][=].resource = PCT-ServiceRequest-1
* entry[requested-items-device][+].fullUrl = "http://example.org/fhir/DeviceRequest/PCT-DeviceRequest-1"
* entry[requested-items-device][=].id = "PCT-DeviceRequest-1"
* entry[requested-items-device][=].resource = PCT-DeviceRequest-1



Instance: PCT-GFE-Missing-Bundle-1
InstanceOf: PCTGFEMissingBundle
Description: "PCT GFE Missing Bundle Example 1"
Usage: #example

// * id = "e1b566b9-34a6-467b-83d2-8107a5ee987d"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-2347384376"
* timestamp = "2024-03-27T11:01:00+05:00"
// * entry[organization][+].fullUrl = "urn:uuid:646ce5de-3216-4098-ae71-c96d5f02b088" // "http://example.org/fhir/Organization/org1002"
// * entry[organization][=].id = "org1002"
// * entry[organization][=].resource = 646ce5de-3216-4098-ae71-c96d5f02b088

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1002"
* entry[organization][=].resource = org1002

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

// * entry[organization][+].fullUrl = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // "http://example.org/fhir/Organization/org1001"
// * entry[organization][=].id = "org1001"
// * entry[organization][=].resource = 2ccf0ff7-2af1-4598-b667-6e35b79529df // org1001

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].resource = org1001

* entry[requested-items-device].fullUrl = "http://example.org/fhir/DeviceRequest/PCT-DeviceRequest-1"
* entry[requested-items-device].id = "PCT-DeviceRequest-1"
* entry[requested-items-device].resource = PCT-DeviceRequest-1













Instance: PCT-GFE-Coordination-Replacement-Task-1
InstanceOf: PCTGFECoordinationTask
Description: "PCT GFE Coordination Task replacement example 1"
Usage: #example

* extension[requested-period].valuePeriod.end = "2024-03-31T11:01:00+05:00"

* extension[request-initiation-time].valueInstant = "2024-03-28T11:01:00+05:00"

* extension[planned-service-period].valuePeriod.start = "2024-04-29T10:00:00+05:00"
* extension[planned-service-period].valuePeriod.end = "2024-04-29T11:00:00+05:00"

* extension[predecessor-task]
  * extension[relationship].valueCodeableConcept = $v3ActRelationship#RPLC "replaces"
  * extension[related].valueReference = Reference(PCT-GFE-Coordination-Task-1)
  * extension[description].valueMarkdown = "Change to Planned period of Service"

* status = $HL7TaskStatus#requested
//* statusReason from PCTCoordinationTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTypeCSTemporaryTrialUse#gfe-coordination-task
* requester = Reference(Submitter-Org-1)


* reasonCode = PCTGFERequestTypeCSTemporaryTrialUse#scheduled-request
* input[gfe-information-bundle].type.text = "GFE Information Bundle"
//* input[gfe-information-bundle].valueAttachment.contentType = #application/fhir+json
* input[gfe-information-bundle].valueReference = Reference(PCT-GFE-Information-Bundle-1)
//* input.valueAttachment.data = ""


Instance: PCT-GFE-Contributor-Replacement-Task-1
InstanceOf: PCTGFEContributorTask
Description: "PCT GFE Contributor Task replacement example 1"
Usage: #example

* extension[requested-period].valuePeriod.end = "2024-03-31T11:01:00+05:00"

* extension[request-initiation-time].valueInstant = "2024-03-28T11:01:00+05:00"

* extension[planned-service-period].valuePeriod.start = "2024-04-29T10:00:00+05:00"
* extension[planned-service-period].valuePeriod.end = "2024-04-29T11:00:00+05:00"

* extension[predecessor-task]
  * extension[relationship].valueCodeableConcept = $v3ActRelationship#RPLC "replaces"
  * extension[related].valueReference = Reference(PCT-GFE-Contributor-Task-1)
  * extension[description].valueMarkdown = "Change to Planned period of Service"


* partOf = Reference(PCT-GFE-Coordination-Replacement-Task-1)

* status = $HL7TaskStatus#received
//* statusReason from PCTCoordinationTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTypeCSTemporaryTrialUse#gfe-contributor-task
* requester = Reference(Submitter-Org-1)
* owner = Reference(Submitter-Org-1)


Instance: PCT-GFE-Contributor-Replacement-Task-2
InstanceOf: PCTGFEContributorTask
Description: "PCT GFE Contributor Task replacement example 2"
Usage: #example

* extension[requested-period].valuePeriod.end = "2024-03-31T11:01:00+05:00"

* extension[request-initiation-time].valueInstant = "2024-03-28T11:01:00+05:00"

* extension[planned-service-period].valuePeriod.start = "2024-04-29T10:00:00+05:00"
* extension[planned-service-period].valuePeriod.end = "2024-04-29T11:00:00+05:00"

* extension[predecessor-task]
  * extension[relationship].valueCodeableConcept = $v3ActRelationship#RPLC "replaces"
  * extension[related].valueReference = Reference(PCT-GFE-Contributor-Task-2)
  * extension[description].valueMarkdown = "Change to Planned period of Service"

* partOf = Reference(PCT-GFE-Coordination-Replacement-Task-1)

* status = $HL7TaskStatus#received
//* statusReason from PCTCoordinationTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTypeCSTemporaryTrialUse#gfe-contributor-task
* requester = Reference(Submitter-Org-1)
* owner = Reference(org1002)






////////////////////////////////////////////

Instance: PCT-GFE-Packet-Inst-1
InstanceOf: PCTGFEPacket
Description: "PCT GFE Packet Institutional Example 1"
Usage: #example

* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-2347384711"
* timestamp = "2024-03-29T11:01:00+05:00"

* entry[composition].fullUrl = "http://example.org/fhir/Composition/PCT-GFE-Composition-Inst-1"
* entry[composition].id = "PCT-GFE-Composition-Inst-1"
* entry[composition].resource = PCT-GFE-Composition-Inst-1


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

// * entry[organization][+].fullUrl = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // "http://example.org/fhir/Organization/Submitter-Org-1"
// * entry[organization][=].id = "Submitter-Org-1"
// * entry[organization][=].resource = e7c36e30-edb8-4a0a-8208-c92085663b00

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/Submitter-Org-1"
* entry[organization][=].resource = Submitter-Org-1

// * entry[organization][+].fullUrl = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // "http://example.org/fhir/Organization/org1001"
// * entry[organization][=].id = "org1001"
// * entry[organization][=].resource = 2ccf0ff7-2af1-4598-b667-6e35b79529df


* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].resource = org1001




// * entry[gfeBundle][+].fullUrl = "urn:uuid:b5ff05d5-b645-4676-b8ed-a3937dabac7b" // "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Inst-1"
// * entry[gfeBundle][=].id = "PCT-GFE-Bundle-Inst-1"
// * entry[gfeBundle][=].resource = b5ff05d5-b645-4676-b8ed-a3937dabac7b

* entry[gfeBundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Inst-1"
* entry[gfeBundle][=].resource = PCT-GFE-Bundle-Inst-1

// * entry[gfeBundle][+].fullUrl = "urn:uuid:e1b566b9-34a6-467b-83d2-8107a5ee987d" // "http://example.org/fhir/Bundle/PCT-GFE-Missing-Bundle-1"
// * entry[gfeBundle][=].id = "PCT-GFE-Missing-Bundle-1"
// * entry[gfeBundle][=].resource = e1b566b9-34a6-467b-83d2-8107a5ee987d

* entry[gfeBundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Missing-Bundle-1"
* entry[gfeBundle][=].resource = PCT-GFE-Missing-Bundle-1


Instance: PCT-GFE-Packet-Prof-1
InstanceOf: PCTGFEPacket
Description: "PCT GFE Packet Professional Example 1"
Usage: #example

* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-2347384711"
* timestamp = "2024-03-29T11:01:00+05:00"

* entry[composition].fullUrl = "http://example.org/fhir/Composition/PCT-GFE-Composition-Prof-1"
* entry[composition].id = "PCT-GFE-Composition-Prof-1"
* entry[composition].resource = PCT-GFE-Composition-Prof-1

// * entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
// * entry[patient].id = "patient1001"
// * entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4  // patient1001

* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient1001"
* entry[patient].resource = patient1001

// * entry[coverage].fullUrl = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // "http://example.org/fhir/Coverage/coverage1001"
// * entry[coverage].id = "coverage1001"
// * entry[coverage].resource = 49fd53a8-7eb7-4319-acc8-04bf8a3cb603

* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].resource = coverage1001

// * entry[practitioner][+].fullUrl = "urn:uuid:2e4341dc-70b8-4709-9fa9-0b6d64cf21bb" // "http://example.org/fhir/Practitioner/Submitter-Practitioner-1"
// * entry[practitioner][=].id = "Submitter-Practitioner-1"
// * entry[practitioner][=].resource = 2e4341dc-70b8-4709-9fa9-0b6d64cf21bb // Submitter-Practitioner-1

* entry[practitioner][+].fullUrl = "http://example.org/fhir/Practitioner/Submitter-Practitioner-1"
* entry[practitioner][=].resource = Submitter-Practitioner-1


// * entry[organization][+].fullUrl = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // "http://example.org/fhir/Organization/org1001"
// * entry[organization][=].id = "org1001"
// * entry[organization][=].resource = 2ccf0ff7-2af1-4598-b667-6e35b79529df //org1001

* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].resource = org1001


// * entry[gfeBundle][+].fullUrl = "urn:uuid:f8c054ba-e496-4230-b74e-a3ad871fb563" // "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Prof-1"
// * entry[gfeBundle][=].id = "PCT-GFE-Bundle-Prof-1"
// * entry[gfeBundle][=].resource = f8c054ba-e496-4230-b74e-a3ad871fb563 //PCT-GFE-Bundle-Prof-1

* entry[gfeBundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Prof-1"
* entry[gfeBundle][=].resource = PCT-GFE-Bundle-Prof-1

// * entry[gfeBundle][+].fullUrl = "urn:uuid:e1b566b9-34a6-467b-83d2-8107a5ee987d" // "http://example.org/fhir/Bundle/PCT-GFE-Missing-Bundle-1"
// * entry[gfeBundle][=].id = "PCT-GFE-Missing-Bundle-1"
// * entry[gfeBundle][=].resource = e1b566b9-34a6-467b-83d2-8107a5ee987d //PCT-GFE-Missing-Bundle-1

* entry[gfeBundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Missing-Bundle-1"
* entry[gfeBundle][=].resource = PCT-GFE-Missing-Bundle-1





Instance: PCT-GFE-Composition-Inst-1
InstanceOf: PCTGFEComposition
Description: "PCT GFE Composition Institutional Example 1"
Usage: #inline // has to be inline because of the aggregation requirement. As example, it produces and error because it looks like an external reference and produces an IG Publisher error
// Usage: #example

* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier.value = "223452-2342-2435-008002"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier.system = "http://example.org/Claim/identifiers"

* extension[requestOriginationType].valueCodeableConcept = PCTGFERequestTypeCSTemporaryTrialUse#nonscheduled-request
* extension[requestInitiationTime].valueInstant = "2025-01-08T09:01:00+05:00"

* identifier[+].system = "http://www.example.org/identifiers/composition"
* identifier[=].value = "019283476"
* status = #final
* type = PCTDocumentTypeTemporaryTrialUse#gfe-packet "GFE Packet"
* category[estimate] = PCTDocumentTypeTemporaryTrialUse#estimate
// * subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subject = Reference(patient1001)

* date = "2025-01-10T11:01:00+05:00"

// TODO Discuss who the author is
// * author[+].reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* author[+] = Reference(org1001)

// * author[+].reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* author[+] = Reference(Submitter-Org-1)

* title = "Institutional Good Faith Estimate Packet for Eve Betterhalf - 2025-01-10"

* section[coverage].code = PCTDocumentSection#coverage-section
// * section[coverage].entry.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603"  // = Reference(coverage1001)
* section[coverage].entry[+] = Reference(coverage1001)
* section[coverage].text.status = #extensions
* section[coverage].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Coverage selfpaycoverage2001</b></p><a name=\"selfpaycoverage2001\"> </a><a name=\"hcselfpaycoverage2001\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-coverage.html\">PCT Coverage</a></p></div><p><b>Extension Definition for Coverage.kind for Version 5.0</b>: self-pay</p><p><b>Self-Pay Declared</b>: true</p><p><b>status</b>: Active</p><p><b>subscriberId</b>: Absent because : not-applicable</p><p><b>beneficiary</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 ( http://example.com/identifiers/patient#1001)</a></p><p><b>relationship</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/subscriber-relationship self}\">Self</span></p><p><b>payor</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 ( http://example.com/identifiers/patient#1001)</a></p></div>"

* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
// * section[gfeBundle][=].author.reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* section[gfeBundle][=].author = Reference(Submitter-Org-1)
// * section[gfeBundle][=].entry.reference = "urn:uuid:b5ff05d5-b645-4676-b8ed-a3937dabac7b" // = Reference(PCT-GFE-Bundle-Inst-1)
* section[gfeBundle][=].entry = Reference(PCT-GFE-Bundle-Inst-1)
* section[gfeBundle][=].text.status = #extensions
* section[gfeBundle][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Claim PCT-GFE-Institutional-1</b></p><a name=\"PCT-GFE-Institutional-1\"> </a><a name=\"hcPCT-GFE-Institutional-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-institutional.html\">PCT Good Faith Estimate Institutional</a></p></div><p><b>ProviderEventMethodology</b>: EEMM1021</p><p><b>GFEDisclaimer</b>: For estimation purposes only</p><blockquote><p><b>GFEServiceLinkingInfo</b></p><ul><li>linkingIdentifier: <code>http://example.org/Claim/identifiers</code>/223452-2342-2435-008001</li><li>plannedPeriodOfService: 2021-10-31</li></ul></blockquote><p><b>identifier</b>: Placer Identifier/GFEProviderAssignedID0001</p><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/claim-type institutional}\">Institutional</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 ( http://example.com/identifiers/patient#1001)</a></p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Organization-org1001.html\">Organization Umbrella Insurance Company</a></p><p><b>provider</b>: <a href=\"Organization-Submitter-Org-1.html\">Organization GFE Service Help INC.</a></p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Payees</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/payeetype provider}\">Provider</span></td></tr></table><p><b>referral</b>: Referral Number</p><h3>SupportingInfos</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Category</b></td><td><b>Code</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTSupportingInfoType typeofbill}\">Type of Bill</span></td><td><span title=\"Codes:{https://www.nubc.org/CodeSystem/TypeOfBill 011X}\">Hospital Inpatient (Part A)</span></td></tr></table><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Coverage-coverage1001.html\">Coverage: extension = insurance; status = active; subscriberId = PFP123450000; relationship = Self; period = 2021-01-01 --&gt; 2022-01-01</a></td></tr></table><blockquote><p><b>item</b></p><p><b>Service Description</b>: Imaging</p><p><b>sequence</b>: 1</p><p><b>revenue</b>: <span title=\"Codes:{https://www.nubc.org/CodeSystem/RevenueCodes 0611}\">Magnetic Resonance Technology (MRT) - Brain/brain stem</span></p><p><b>productOrService</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>modifier</b>: <span title=\"Codes:{http://www.ama-assn.org/go/cpt 70551}\">Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material</span></p><p><b>serviced</b>: 2021-10-31</p><p><b>quantity</b>: 1</p><h3>Nets</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></blockquote><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"


* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
// * section[gfeBundle][=].entry.reference = "urn:uuid:e1b566b9-34a6-467b-83d2-8107a5ee987d" // = Reference(PCT-GFE-Missing-Bundle-1)
* section[gfeBundle][=].entry = Reference(PCT-GFE-Missing-Bundle-1)
// * section[gfeBundle][=].author.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* section[gfeBundle][=].author = Reference(org1001)
* section[gfeBundle][=].text.status = #extensions
* section[gfeBundle][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: PCT-GFE-Missing-Bundle-1</b></p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 (http://example.com/identifiers/patient#1001)</a></p><p><b>coverage</b>: <a href=\"Patient-patient1001.html\">Coverage_coverage1001, period: 2021-01-01 --&gt; 2022-01-01</a></p><p><b>organization</b>: <a href=\"Organization-org1001.html\">Umbrella Insurance Company</a></p><h3>Requested Services</h3><ul><li><b>device request</b>: KNEE ORTHOSIS, ELASTIC WITH CONDYLAR PADS AND JOINTS, WITH OR WITHOUT PATELLAR CONTROL, PREFABRICATED, INCLUDES FITTING AND ADJUSTMENT</li></ul> </div>"

Instance: PCT-GFE-Composition-Prof-1
InstanceOf: PCTGFEComposition
Description: "PCT GFE Composition Professional Example 1"
Usage: #inline // has to be inline because of the aggregation requirement. As example, it produces and error because it looks like an external reference and produces an IG Publisher error
// Usage: #example
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier.value = "223452-2342-2435-008003"
* extension[GFEServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier.system = "http://example.org/Claim/identifiers"
* extension[GFEServiceLinkingInfo].extension[plannedPeriodOfService].valueDate = "2021-10-31"
* extension[requestOriginationType].valueCodeableConcept = PCTGFERequestTypeCSTemporaryTrialUse#scheduled-request
* extension[requestInitiationTime].valueInstant = "2025-01-08T09:01:00+05:00"
* identifier[+].system = "http://www.example.org/identifiers/composition"
* identifier[=].value = "019283477"
* status = #final
* type = PCTDocumentTypeTemporaryTrialUse#gfe-packet "GFE Packet"
* category[estimate] = PCTDocumentTypeTemporaryTrialUse#estimate
// * subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subject = Reference(patient1001)

* date = "2025-01-10T11:01:00+05:00"

// TODO Discuss who the author is
// * author[+].reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* author[+] = Reference(org1001)
// * author[+].reference = "urn:uuid:2e4341dc-70b8-4709-9fa9-0b6d64cf21bb" // = Reference(Submitter-Practitioner-1)
* author[+] = Reference(Submitter-Practitioner-1)

* title = "Professional Good Faith Estimate Packet for Eve Betterhalf - 2025-01-10"

* section[coverage].code = PCTDocumentSection#coverage-section
// * section[coverage].entry.reference = "urn:uuid:49fd53a8-7eb7-4319-acc8-04bf8a3cb603" // = Reference(coverage1001)
* section[coverage].entry = Reference(coverage1001)
* section[coverage].text.status = #extensions
* section[coverage].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Coverage coverage1001</b></p><a name=\"coverage1001\"> </a><a name=\"hccoverage1001\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-coverage.html\">PCT Coverage</a></p></div><p><b>Extension Definition for Coverage.kind for Version 5.0</b>: insurance</p><p><b>status</b>: Active</p><p><b>subscriberId</b>: PFP123450000</p><p><b>beneficiary</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 ( http://example.com/identifiers/patient#1001)</a></p><p><b>relationship</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/subscriber-relationship self}\">Self</span></p><p><b>period</b>: 2021-01-01 --&gt; 2022-01-01</p><p><b>payor</b>: <a href=\"Organization-org1001.html\">Organization Umbrella Insurance Company</a></p><h3>Classes</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value</b></td><td><b>Name</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/coverage-class plan}\">Plan</span></td><td>Premim Family Plus</td><td>Premim Family Plus Plan</td></tr></table><h3>CostToBeneficiaries</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value[x]</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/coverage-copay-type copaypct}\">Copay Percentage</span></td><td>20</td></tr></table></div>"

* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
// * section[gfeBundle][=].author.reference = "urn:uuid:2e4341dc-70b8-4709-9fa9-0b6d64cf21bb" // = Reference(Submitter-Practitioner-1)
* section[gfeBundle][=].author = Reference(Submitter-Practitioner-1)

// * section[gfeBundle][=].entry.reference = "urn:uuid:f8c054ba-e496-4230-b74e-a3ad871fb563" // = Reference(PCT-GFE-Bundle-Prof-1)
* section[gfeBundle][=].entry = Reference(PCT-GFE-Bundle-Prof-1)
* section[gfeBundle][=].text.status = #extensions
* section[gfeBundle][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Claim PCT-GFE-Summary-MRI</b></p><a name=\"PCT-GFE-Summary-MRI\"> </a><a name=\"hcPCT-GFE-Summary-MRI\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-gfe-summary.html\">PCT Good Faith Estimate  Summary</a></p></div><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://hl7.org/fhir/us/davinci-pct/CodeSystem/PCTEstimateTypeSummaryCSTemporaryTrialUse estimate-summary}\">Estimate Summary</span></p><p><b>use</b>: Predetermination</p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 ( http://example.com/identifiers/patient#1001)</a></p><p><b>billablePeriod</b>: 2021-10-31 --&gt; (ongoing)</p><p><b>created</b>: 2021-10-05</p><p><b>insurer</b>: <a href=\"Organization-org1001.html\">Organization Umbrella Insurance Company</a></p><p><b>provider</b>: ?rref?</p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/processpriority normal}\">Normal</span></p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Diagnosis[x]</b></td><td><b>Type</b></td><td><b>PackageCode</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td><span title=\"Codes:{http://hl7.org/fhir/sid/icd-10-cm S06.30}\">Unspecified focal traumatic brain injury</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosistype principal}\">Principal Diagnosis</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup 400}\">Head trauma - concussion</span></td></tr></table><h3>Insurances</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Sequence</b></td><td><b>Focal</b></td><td><b>Coverage</b></td></tr><tr><td style=\"display: none\">*</td><td>1</td><td>true</td><td><a href=\"Coverage-coverage1001.html\">Coverage: extension = insurance; status = active; subscriberId = PFP123450000; relationship = Self; period = 2021-01-01 --&gt; 2022-01-01</a></td></tr></table><h3>Totals</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Value</b></td><td><b>Currency</b></td></tr><tr><td style=\"display: none\">*</td><td>200</td><td>United States dollar</td></tr></table></div>"


* section[gfeBundle][+].code = PCTDocumentSection#gfe-section
// * section[gfeBundle][=].entry.reference = "urn:uuid:e1b566b9-34a6-467b-83d2-8107a5ee987d" // = Reference(PCT-GFE-Missing-Bundle-1)
* section[gfeBundle][=].entry = Reference(PCT-GFE-Missing-Bundle-1)

// * section[gfeBundle][=].author.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* section[gfeBundle][=].author = Reference(org1001)
* section[gfeBundle][=].text.status = #extensions
* section[gfeBundle][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: PCT-GFE-Missing-Bundle-1</b></p><p><b>patient</b>: <a href=\"Patient-patient1001.html\">Eve Betterhalf Female, DoB: 1955-07-23 (http://example.com/identifiers/patient#1001)</a></p><p><b>coverage</b>: <a href=\"Patient-patient1001.html\">Coverage_coverage1001, period: 2021-01-01 --&gt; 2022-01-01</a></p><p><b>organization</b>: <a href=\"Organization-org1001.html\">Umbrella Insurance Company</a></p><h3>Requested Services</h3><ul><li><b>device request</b>: KNEE ORTHOSIS, ELASTIC WITH CONDYLAR PADS AND JOINTS, WITH OR WITHOUT PATELLAR CONTROL, PREFABRICATED, INCLUDES FITTING AND ADJUSTMENT</li></ul> </div>"


Instance: PCT-GFE-DocumentReference-Inst-1
InstanceOf: PCTGFEDocumentReference
Description: "PCT GFE DocumentReference Institutional Example 1"
Usage: #example

* extension[requestInitiationTime].valueInstant = "2025-01-08T09:01:00+05:00"
* extension[procedureOrService].valueCodeableConcept = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* extension[condition].valueCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* status = #current
* docStatus = #final
* type = PCTDocumentTypeTemporaryTrialUse#gfe-packet
* category[estimate] = PCTDocumentTypeTemporaryTrialUse#estimate
// * subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subject = Reference(patient1001)

* date = "2025-01-10T11:01:00+05:00"

// * author[+].reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* author[+] = Reference(org1001)

// * author[+].reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* author[+] = Reference(Submitter-Org-1)

* content[+].attachment.url = "http://example.org/fhir/Bundle/PCT-GFE-Packet-Inst-1"



Instance: PCT-GFE-DocumentReference-Prof-1
InstanceOf: PCTGFEDocumentReference
Description: "PCT GFE DocumentReference Professional Example 1"
Usage: #example

* extension[requestInitiationTime].valueInstant = "2025-01-08T09:01:00+05:00"
* extension[procedureOrService].valueCodeableConcept = $CPT#70551 "Magnetic resonance (eg, proton) imaging, brain (including brain stem); without contrast material"
* extension[condition].valueCodeableConcept = ICD10#S06.30 "Unspecified focal traumatic brain injury"
* status = #current
* docStatus = #final
* type = PCTDocumentTypeTemporaryTrialUse#gfe-packet
* category[estimate] = PCTDocumentTypeTemporaryTrialUse#estimate
// * subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subject = Reference(patient1001)

* date = "2025-01-10T11:01:00+05:00"

// * author[+].reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* author[+] = Reference(org1001)
// * author[+].reference = "urn:uuid:e7c36e30-edb8-4a0a-8208-c92085663b00" // = Reference(Submitter-Org-1)
* author[+] = Reference(Submitter-Org-1)

* content[+].attachment.url = "http://example.org/fhir/Bundle/PCT-GFE-Packet-Prof-1"





Instance: PCT-ServiceRequest-1
InstanceOf: PCTServiceRequest
Description: "PCT ServiceRequest Example 1"
Usage: #example

* status = #active
* intent = #proposal

* code = $CPT#73722 "Magnetic resonance (eg, proton) imaging, any joint of lower extremity; with contrast material(s)"

// * subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)

* subject = Reference(patient1001)


Instance: PCT-MedicationRequest-1
InstanceOf: PCTMedicationRequest
Description: "PCT MedicationRequest Example 1"
Usage: #example

* status = #active
* intent = #proposal

* medicationCodeableConcept = $RXNORM#692620 "gadobenate"

// * subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subject = Reference(patient1001)


Instance: PCT-DeviceRequest-1
InstanceOf: PCTDeviceRequest
Description: "PCT DeviceRequest Example 1"
Usage: #example

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"PCT-DeviceRequest-1\"> </a><a name=\"hcPCT-DeviceRequest-1\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource DeviceRequest &quot;PCT-DeviceRequest-1&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-devicerequest.html\">PCT GFE DeviceRequest</a></p></div><p><b>status</b>: active</p><p><b>intent</b>: proposal</p><p><b>code</b>: KNEE ORTHOSIS, ELASTIC WITH CONDYLAR PADS AND JOINTS, WITH OR WITHOUT PATELLAR CONTROL, PREFABRICATED, INCLUDES FITTING AND ADJUSTMENT <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (HCPCSReleaseCodeSets#L1820)</span></p><p><b>subject</b>: <a href=\"Patient-9c05d948-b931-4bff-8766-18b99b0650d4.html\">patient1001</a> &quot; BETTERHALF&quot;</p></div>"

* status = #active
* intent = #proposal

* codeCodeableConcept = $HCPCS#L1820 "KNEE ORTHOSIS, ELASTIC WITH CONDYLAR PADS AND JOINTS, WITH OR WITHOUT PATELLAR CONTROL, PREFABRICATED, INCLUDES FITTING AND ADJUSTMENT"

// * subject.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subject = Reference(patient1001)


Instance: PCT-ServiceLocation-1
InstanceOf: PCTServiceLocation
Description: "PCT ServiceLocation Example 1"
Usage: #example

* status = #active

* name = "Hospital"
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#HOSP "Hospital"





/*
Instance: PCT-GFE-Collection-Bundle-Inst-1
InstanceOf: PCTGFECollectionBundle
Description: "PCT GFE Collection Bundle Institutional Example 1"
Usage: #example

* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-2347384711"
* timestamp = "2024-03-29T11:01:00+05:00"

* entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
//* entry[patient].id = "patient1001"
* entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4

* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
// * entry[coverage].id = "coverage1001"
* entry[coverage].resource = coverage1001
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/Submitter-Org-1"
* entry[organization][=].id = "Submitter-Org-1"
* entry[organization][=].resource = Submitter-Org-1
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
// * entry[organization][=].id = "org1001"
* entry[organization][=].resource = org1001



* entry[gfe-bundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Inst-1"
* entry[gfe-bundle][=].id = "PCT-GFE-Bundle-Inst-1"
* entry[gfe-bundle][=].resource = PCT-GFE-Bundle-Inst-1

* entry[gfe-bundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Missing-Bundle-1"
* entry[gfe-bundle][=].id = "PCT-GFE-Missing-Bundle-1"
* entry[gfe-bundle][=].resource = PCT-GFE-Missing-Bundle-1


Instance: PCT-GFE-Collection-Bundle-Prof-1
InstanceOf: PCTGFECollectionBundle
Description: "PCT GFE Collection Bundle Professional Example 1"
Usage: #example

* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-2347384711"
* timestamp = "2024-03-29T11:01:00+05:00"

* entry[patient].fullUrl = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // "http://example.org/fhir/Patient/patient1001"
* entry[patient].id = "patient1001"
* entry[patient].resource = 9c05d948-b931-4bff-8766-18b99b0650d4

* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
// * entry[coverage].id = "coverage1001"
* entry[coverage].resource = coverage1001
* entry[practitioner][+].fullUrl = "http://example.org/fhir/Practitioner/Submitter-Practitioner-1"
* entry[practitioner][=].id = "Submitter-Practitioner-1"
* entry[practitioner][=].resource = Submitter-Practitioner-1
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
// * entry[organization][=].id = "org1001"
* entry[organization][=].resource = org1001



* entry[gfe-bundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Prof-1"
* entry[gfe-bundle][=].id = "PCT-GFE-Bundle-Prof-1"
* entry[gfe-bundle][=].resource = PCT-GFE-Bundle-Prof-1

* entry[gfe-bundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Missing-Bundle-1"
* entry[gfe-bundle][=].id = "PCT-GFE-Missing-Bundle-1"
* entry[gfe-bundle][=].resource = PCT-GFE-Missing-Bundle-1

*/