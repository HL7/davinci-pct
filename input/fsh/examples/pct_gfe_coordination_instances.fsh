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


* extension[requested-period].valuePeriod.end = "2024-03-30T11:01:00+05:00"

* extension[request-initiation-time].valueInstant = "2024-03-27T11:01:00+05:00"

* extension[planned-service-period].valuePeriod.start = "2024-04-27T10:00:00+05:00"
* extension[planned-service-period].valuePeriod.end = "2024-04-27T11:00:00+05:00"

* status = $HL7TaskStatus#requested
//* statusReason from PCTCoordinationTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTaskCSTemporaryTrialUse#gfe-coordination-task
* requester = Reference(Submitter-Org-1)


* reasonCode = PCTGFERequestTaskCSTemporaryTrialUse#scheduled-request
* input.type.text = "GFE Information Bundle"
* input.valueAttachment.contentType = #application/fhir+json
//* input.valueAttachment.data = ""


Instance: PCT-GFE-Contributor-Task-1
InstanceOf: PCTGFEContributorTask
Description: "PCT GFE Contributor Task example 1"


* extension[requested-period].valuePeriod.end = "2024-03-30T11:01:00+05:00"

* extension[request-initiation-time].valueInstant = "2024-03-27T11:01:00+05:00"

* extension[planned-service-period].valuePeriod.start = "2024-04-27T10:00:00+05:00"
* extension[planned-service-period].valuePeriod.end = "2024-04-27T11:00:00+05:00"

* partOf = Reference(PCT-GFE-Coordination-Task-1)

* status = $HL7TaskStatus#received
//* statusReason from PCTCoordinationTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTaskCSTemporaryTrialUse#gfe-contributor-task
* requester = Reference(Submitter-Org-1)
* owner = Reference(Submitter-Org-1)


Instance: PCT-GFE-Contributor-Task-2
InstanceOf: PCTGFEContributorTask
Description: "PCT GFE Contributor Task example 2"


* extension[requested-period].valuePeriod.end = "2024-03-30T11:01:00+05:00"

* extension[request-initiation-time].valueInstant = "2024-03-27T11:01:00+05:00"

* extension[planned-service-period].valuePeriod.start = "2024-04-27T10:00:00+05:00"
* extension[planned-service-period].valuePeriod.end = "2024-04-27T11:00:00+05:00"

* partOf = Reference(PCT-GFE-Coordination-Task-1)

* status = $HL7TaskStatus#received
//* statusReason from PCTCoordinationTaskStatusReasonCodes (extensible)
* intent = http://hl7.org/fhir/task-intent#order

* code = PCTGFERequestTaskCSTemporaryTrialUse#gfe-contributor-task
* requester = Reference(Submitter-Org-1)
* owner = Reference(org1002)

Instance: PCT-GFE-Information-Bundle-1
InstanceOf: PCTGFEInformationBundle
Description: "PCT GFE Information Bundle Example 1"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-2347384711"
* timestamp = "2024-03-27T11:01:00+05:00"
* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient1001"
* entry[patient].id = "patient1001"
* entry[patient].resource = patient1001
* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].id = "coverage1001"
* entry[coverage].resource = coverage1001
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].id = "org1001"
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





Instance: PCT-GFE-Collection-Bundle-1
InstanceOf: PCTGFECollectionBundle
Description: "PCT GFE Collection Bundle Example 1"
* identifier.system = "http://example.com/identifiers/bundle"
* identifier.value = "59688475-2324-3242-2347384711"
* timestamp = "2024-03-29T11:01:00+05:00"

* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient1001"
* entry[patient].id = "patient1001"
* entry[patient].resource = patient1001

* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].id = "coverage1001"
* entry[coverage].resource = coverage1001
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/Submitter-Org-1"
* entry[organization][=].id = "Submitter-Org-1"
* entry[organization][=].resource = Submitter-Org-1
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1001"
* entry[organization][=].id = "org1001"
* entry[organization][=].resource = org1001



* entry[gfe-bundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Bundle-Inst-1"
* entry[gfe-bundle][=].id = "PCT-GFE-Bundle-Inst-1"
* entry[gfe-bundle][=].resource = PCT-GFE-Bundle-Inst-1

* entry[gfe-bundle][+].fullUrl = "http://example.org/fhir/Bundle/PCT-GFE-Missing-Bundle-1"
* entry[gfe-bundle][=].id = "PCT-GFE-Missing-Bundle-1"
* entry[gfe-bundle][=].resource = PCT-GFE-Missing-Bundle-1





Instance: PCT-GFE-Missing-Bundle-1
InstanceOf: PCTGFEMissingBundle
Description: "PCT GFE Missing Bundle Example 1"

* timestamp = "2024-03-27T11:01:00+05:00"
* entry[organization][+].fullUrl = "http://example.org/fhir/Organization/org1002"
* entry[organization][=].id = "org1002"
* entry[organization][=].resource = org1002
* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient1001"
* entry[patient].id = "patient1001"
* entry[patient].resource = patient1001
* entry[coverage].fullUrl = "http://example.org/fhir/Coverage/coverage1001"
* entry[coverage].id = "coverage1001"
* entry[coverage].resource = coverage1001
* entry[requested-items-device].fullUrl = "http://example.org/fhir/DeviceRequest/PCT-DeviceRequest-1"
* entry[requested-items-device].id = "PCT-DeviceRequest-1"
* entry[requested-items-device].resource = PCT-DeviceRequest-1





Instance: PCT-ServiceRequest-1
InstanceOf: PCTServiceRequest
Description: "PCT ServiceRequest Example 1"

* status = #active
* intent = #proposal

* code = $CPT#73722 "Magnetic resonance (eg, proton) imaging, any joint of lower extremity; with contrast material(s)"

* subject = Reference(patient1001)


Instance: PCT-MedicationRequest-1
InstanceOf: PCTMedicationRequest
Description: "PCT MedicationRequest Example 1"

* status = #active
* intent = #proposal

* medicationCodeableConcept = $RXNORM#692620 "gadobenate"

* subject = Reference(patient1001)


Instance: PCT-DeviceRequest-1
InstanceOf: PCTDeviceRequest
Description: "PCT DeviceRequest Example 1"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"PCT-DeviceRequest-1\"> </a><a name=\"hcPCT-DeviceRequest-1\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource DeviceRequest &quot;PCT-DeviceRequest-1&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-devicerequest.html\">PCT GFE DeviceRequest</a></p></div><p><b>status</b>: active</p><p><b>intent</b>: proposal</p><p><b>code</b>: KNEE ORTHOSIS, ELASTIC WITH CONDYLAR PADS AND JOINTS, WITH OR WITHOUT PATELLAR CONTROL, PREFABRICATED, INCLUDES FITTING AND ADJUSTMENT <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (HCPCSReleaseCodeSets#L1820)</span></p><p><b>subject</b>: <a href=\"Patient-patient1001.html\">Patient/patient1001</a> &quot; BETTERHALF&quot;</p></div>"

* status = #active
* intent = #proposal

* codeCodeableConcept = $HCPCS#L1820 "KNEE ORTHOSIS, ELASTIC WITH CONDYLAR PADS AND JOINTS, WITH OR WITHOUT PATELLAR CONTROL, PREFABRICATED, INCLUDES FITTING AND ADJUSTMENT"

* subject = Reference(patient1001)


Instance: PCT-ServiceLocation-1
InstanceOf: PCTServiceLocation
Description: "PCT ServiceLocation Example 1"

* status = #active

* name = "Hospital"
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#HOSP "Hospital"
