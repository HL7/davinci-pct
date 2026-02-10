Instance: aeob-date-of-service
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/aeob-date-of-service"
* version = "0.1.0"
* name = "AEOBDateOfService"
* status = #active
* date = "2022-12-15"
* publisher = "HL7 International - Patient Administration Work Group"
* description = "Select planned date of service"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* code = #aeob-date-of-service
* base = #ExplanationOfBenefit
* type = #date
//* expression = "ExplanationOfBenefit.serviced[x]"
* expression = "ExplanationOfBenefit.item.serviced"
* target = #ExplanationOfBenefit

Instance: task-requested-period
InstanceOf: SearchParameter
Title: "TaskRequestedPeriod"
Description: "Search for a task by when the task should be performed"
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension.valueCode = #trial-use
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/task-requested-period"
* version = "2.0.1"
* name = "TaskRequestedPeriod"
//* derivedFrom = "http://hl7.org/fhir/SearchParameter/Coverage-payor"
* status = #active
* experimental = false
* date = "2024-03-24T09:29:23+11:00"
* publisher = "HL7 Financial Management Working Group"
* contact.name = "HL7 Financial Management Working Group"
* contact.telecom[0].system = #url
* contact.telecom[=].value = "http://www.hl7.org/Special/committees/fm"
* contact.telecom[+].system = #email
* contact.telecom[=].value = "fm@lists.HL7.org"
* description = "Search for a task by when the task should be performed"
* jurisdiction = urn:iso:std:iso:3166#US
* code = #task-requested-period
* base = #Task
* type = #date
* expression = "Task.extension.where(url='http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPeriod').value"
* xpath = "f:Task/f:extension[url='http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPeriod']/f:value"
* xpathUsage = #normal


Instance: related-task
InstanceOf: SearchParameter
Title: "RelatedTask"
Description: "Completed or terminated task(s) whose function is taken by this new task"
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension.valueCode = #trial-use
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/related-task"
* version = "2.0.1"
* name = "RelatedTask"
* status = #active
* experimental = false
* date = "2024-03-24T09:29:23+11:00"
* publisher = "HL7 Financial Management Working Group"
* contact.name = "HL7 Financial Management Working Group"
* contact.telecom[0].system = #url
* contact.telecom[=].value = "http://www.hl7.org/Special/committees/fm"
* contact.telecom[+].system = #email
* contact.telecom[=].value = "fm@lists.HL7.org"
* description = "Completed or terminated task(s) whose function is taken by this new task"
* jurisdiction = urn:iso:std:iso:3166#US
* code = #related-task
* base = #Task
* type = #reference
* expression = "Task.extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeRelatedTask').extension.where(url='related').value"
* xpath = "f:Task/f:extension[url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeRelatedTask']/f:extension[url='related']/f:value"
* xpathUsage = #normal
* target = #Task



Instance: packet-request-initiation-time
InstanceOf: SearchParameter
Title: "Packet Estimate Request Initiation Time"
Description: "Instant from which the request originating request was being initiated."
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension.valueCode = #trial-use
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/packet-request-initiation-time"
* version = "2.0.1"
* name = "PacketRequestInitiationTime"
* status = #active
* experimental = false
* date = "2025-04-04T09:29:23+11:00"
* publisher = "HL7 Financial Management Working Group"
* contact.name = "HL7 Financial Management Working Group"
* contact.telecom[0].system = #url
* contact.telecom[=].value = "http://www.hl7.org/Special/committees/fm"
* contact.telecom[+].system = #email
* contact.telecom[=].value = "fm@lists.HL7.org"
* description = "Instant from which the request originating request was being initiated."
* jurisdiction = urn:iso:std:iso:3166#US
* code = #estimate-initiation-time
* base = #DocumentReference
* type = #date
* expression = "DocumentReference.extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/requestInitiationTime').value"
* xpath = "f:DocumentReference/f:extension[url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/requestInitiationTime']/f:value"
* xpathUsage = #normal
* target = #DocumentReference





Instance: packet-procedure-or-service
InstanceOf: SearchParameter
Title: "Packet Procedure or Service"
Description: "Significant Procedures and/or products involved in an estimate."
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension.valueCode = #trial-use
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/packet-procedure-or-service"
* version = "2.0.1"
* name = "PacketProcedureOrService"
* status = #active
* experimental = false
* date = "2025-04-04T09:29:23+11:00"
* publisher = "HL7 Financial Management Working Group"
* contact.name = "HL7 Financial Management Working Group"
* contact.telecom[0].system = #url
* contact.telecom[=].value = "http://www.hl7.org/Special/committees/fm"
* contact.telecom[+].system = #email
* contact.telecom[=].value = "fm@lists.HL7.org"
* description = "Significant Procedures and/or products involved in an estimate in the packet."
* jurisdiction = urn:iso:std:iso:3166#US
* code = #estimate-service
* base = #DocumentReference
* type = #token
* expression = "DocumentReference.extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/estimateProcedureOrService').value"
* xpath = "f:DocumentReference/f:extension[url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/estimateProcedureOrService']/f:value"
* xpathUsage = #normal
* target = #DocumentReference


Instance: packet-condition
InstanceOf: SearchParameter
Title: "Packet Condition"
Description: "Significant condition involved in an estimate."
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension.valueCode = #trial-use
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/packet-condition"
* version = "2.0.1"
* name = "PacketCondition"
* status = #active
* experimental = false
* date = "2025-04-04T09:29:23+11:00"
* publisher = "HL7 Financial Management Working Group"
* contact.name = "HL7 Financial Management Working Group"
* contact.telecom[0].system = #url
* contact.telecom[=].value = "http://www.hl7.org/Special/committees/fm"
* contact.telecom[+].system = #email
* contact.telecom[=].value = "fm@lists.HL7.org"
* description = "Significant condition involved in an estimate in the packet."
* jurisdiction = urn:iso:std:iso:3166#US
* code = #estimate-condition
* base = #DocumentReference
* type = #token
* expression = "DocumentReference.extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/estimateCondition').value"
* xpath = "f:DocumentReference/f:extension[url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/estimateCondition']/f:value"
* xpathUsage = #normal
* target = #DocumentReference











Instance: packet-linking-identifier
InstanceOf: SearchParameter
Title: "Packet Linking Identifier"
Description: "An identifier assigned to a particular service or series of services to enabling linking."
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension.valueCode = #trial-use
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/packet-linking-identifier"
* version = "2.0.1"
* name = "PacketLinkingIdentifier"
* status = #active
* experimental = false
* date = "2025-04-04T09:29:23+11:00"
* publisher = "HL7 Financial Management Working Group"
* contact.name = "HL7 Financial Management Working Group"
* contact.telecom[0].system = #url
* contact.telecom[=].value = "http://www.hl7.org/Special/committees/fm"
* contact.telecom[+].system = #email
* contact.telecom[=].value = "fm@lists.HL7.org"
* description = "An identifier assigned to a particular service or series of services to enabling linking."
* jurisdiction = urn:iso:std:iso:3166#US
* code = #linking-identifier
* base = #DocumentReference
* type = #token
* expression = "DocumentReference.extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo').extension.where(url='linkingIdentifier').value"
* xpath = "f:DocumentReference/f:extension[url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo']/f:extension[url='linkingIdentifier']/f:value"
* xpathUsage = #normal
* target = #DocumentReference



Instance: packet-PlannedPeriodOfService
InstanceOf: SearchParameter
Title: "Packet Planned Period Of Service"
Description: "Planned date(s) of a particular admission/service or a series of admissions/services."
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension.valueCode = #trial-use
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/packet-PlannedPeriodOfService"
* version = "2.0.1"
* name = "PacketPlannedPeriodOfService"
* status = #active
* experimental = false
* date = "2025-04-04T09:29:23+11:00"
* publisher = "HL7 Financial Management Working Group"
* contact.name = "HL7 Financial Management Working Group"
* contact.telecom[0].system = #url
* contact.telecom[=].value = "http://www.hl7.org/Special/committees/fm"
* contact.telecom[+].system = #email
* contact.telecom[=].value = "fm@lists.HL7.org"
* description = "Planned date(s) of a particular admission/service or a series of admissions/services."
* jurisdiction = urn:iso:std:iso:3166#US
* code = #planned-period
* base = #DocumentReference
* type = #date
* expression = "DocumentReference.extension.where(url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo').extension.where(url='plannedPeriodOfService').value"
* xpath = "f:DocumentReference/f:extension[url='http://hl7.org/fhir/us/davinci-pct/StructureDefinition/gfeServiceLinkingInfo']/f:extension[url='plannedPeriodOfService']/f:value"
* xpathUsage = #normal
* target = #DocumentReference


Instance: DocumentReference-doc-status
InstanceOf: SearchParameter
Title: "DocumentReference docStatus"
Description: "The status of the underlying document."
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension.valueCode = #trial-use
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/DocumentReference-doc-status"
* version = "2.0.1"
* name = "DocumentReferenceDocStatus"
* status = #active
* experimental = false
* date = "2025-08-11T21:47:23+11:00"
* publisher = "HL7 Financial Management Working Group"
* contact.name = "HL7 Financial Management Working Group"
* contact.telecom[0].system = #url
* contact.telecom[=].value = "http://www.hl7.org/Special/committees/fm"
* contact.telecom[+].system = #email
* contact.telecom[=].value = "fm@lists.HL7.org"
* description = "The status of the underlying document."
* jurisdiction = urn:iso:std:iso:3166#US
* code = #doc-status
* base = #DocumentReference
* type = #token
* expression = "DocumentReference.docStatus"
* xpath = "f:DocumentReference/f:docStatus"
* xpathUsage = #normal
* target = #DocumentReference
