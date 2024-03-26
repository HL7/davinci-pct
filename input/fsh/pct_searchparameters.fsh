Instance: task-requested-period
InstanceOf: SearchParameter
Title: "TaskRequestedPeriod"
Description: "Search for a task by when the task should be performed"
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension.valueCode = #trial-use
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/task-requested-period"
* version = "2.0.0"
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
* xpath = "f:Task/f:extension[url='http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPeriod']/f.value"
* xpathUsage = #normal


Instance: task-replaces
InstanceOf: SearchParameter
Title: "TaskReplaces"
Description: "Completed or terminated task(s) whose function is taken by this new task"
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension.valueCode = #trial-use
* url = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/task-replaces"
* version = "2.0.0"
* name = "TaskReplaces"
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
* code = #task-replaces
* base = #Task
* type = #reference
* expression = "Task.extension.where(url='http://hl7.org/fhir/StructureDefinition/task-replaces').value"
* xpath = "f:Task/f:extension[url='http://hl7.org/fhir/StructureDefinition/task-replaces']/f.value"
* xpathUsage = #normal
* target = #Task