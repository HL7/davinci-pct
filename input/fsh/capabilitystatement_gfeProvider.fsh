Instance: davinci-pct-gfe-provider
InstanceOf: CapabilityStatement
Usage: #definition
* meta.versionId = "1"
* meta.lastUpdated = "2024-03-23T19:21:32.176+00:00"
* url = "http://hl7.org/fhir/us/davinci-pct/CapabilityStatement/davinci-pct-gfe-provider"
* name = "CoordinationRequesterPatientCostTransparencyCapabilityStatement"
* title = "Patient Cost Transparency Implementation Guide Provider Capability Statement"
* status = #active
* date = "2025-09-08T14:21:32-05:00"
* publisher = "HL7 International - Financial Management Work Group"
* contact[0].name = "HL7 International - Financial Management Work Group"
* contact[=].telecom[0].system = #url
* contact[=].telecom[=].value = "http://hl7.org/Special/committees/fm"
* contact[=].telecom[+].system = #email
* contact[=].telecom[=].value = "fmlists@lists.hl7.org"
* description = "Provider Capability Statement for the Da Vinci Patient Cost Transparency Implementation Guide, for sharing Good Faith Documents"
* jurisdiction = urn:iso:std:iso:3166#US
* copyright = "Used by permission of HL7 International, all rights reserved Creative Commons License"
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server|7.0.0"
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* format[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL
* format[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHOULD


* rest[0].mode = #server
* rest[=].resource[0].type = #DocumentReference
* rest[=].resource[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].extension.valueCode = #SHOULD
* rest[=].resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-aeob-documentreference"
* rest[=].resource[=].supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHALL
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-bundle"
* rest[=].resource[=].supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHOULD
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-packet"
* rest[=].resource[=].supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #vread
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #history-instance
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #history-type



* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-category"
* rest[=].resource[=].searchParam[=].documentation = "Categorization of document."
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].type = #token


* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-status"
* rest[=].resource[=].searchParam[=].documentation = "current | superseded | entered-in-error"
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].type = #token


* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/DocumentReference-doc-status"
* rest[=].resource[=].searchParam[=].documentation = "preliminary | final | amended | entered-in-error"
* rest[=].resource[=].searchParam[=].name = "doc-status"
* rest[=].resource[=].searchParam[=].type = #token

* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
* rest[=].resource[=].searchParam[=].documentation = "Kind of document"
* rest[=].resource[=].searchParam[=].name = "type"
* rest[=].resource[=].searchParam[=].type = #token


* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest[=].resource[=].searchParam[=].documentation = "Kind of document"
* rest[=].resource[=].searchParam[=].name = "date"
* rest[=].resource[=].searchParam[=].type = #date


* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].documentation = "Who/what is the subject of the document"
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference



* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/packet-request-initiation-time"
* rest[=].resource[=].searchParam[=].documentation = "Instant from which the request originating request was being initiated."
* rest[=].resource[=].searchParam[=].name = "estimate-initiation-time"
* rest[=].resource[=].searchParam[=].type = #date

* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/packet-procedure-or-service"
* rest[=].resource[=].searchParam[=].documentation = "Significant Procedures and/or products involved in an estimate in the packet."
* rest[=].resource[=].searchParam[=].name = "estimate-service"
* rest[=].resource[=].searchParam[=].type = #token

* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/packet-condition"
* rest[=].resource[=].searchParam[=].documentation = "Significant condition involved in an estimate in the packet."
* rest[=].resource[=].searchParam[=].name = "estimate-condition"
* rest[=].resource[=].searchParam[=].type = #token

* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/packet-linking-identifier"
* rest[=].resource[=].searchParam[=].documentation = "An identifier assigned to a particular service or series of services to enabling linking."
* rest[=].resource[=].searchParam[=].name = "linking-identifier"
* rest[=].resource[=].searchParam[=].type = #token


* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/davinci-pct/SearchParameter/packet-PlannedPeriodOfService"
* rest[=].resource[=].searchParam[=].documentation = "Planned date(s) of a particular admission/service or a series of admissions/services."
* rest[=].resource[=].searchParam[=].name = "planned-period"
* rest[=].resource[=].searchParam[=].type = #date


* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-author"
* rest[=].resource[=].searchParam[=].documentation = "All involved authoring parties, including payer all Good Faith Estimate (GFE) providers."
* rest[=].resource[=].searchParam[=].name = "author"
* rest[=].resource[=].searchParam[=].type = #reference


* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-relatesto"
* rest[=].resource[=].searchParam[=].documentation = "Target of the relationship."
* rest[=].resource[=].searchParam[=].name = "relatesto"
* rest[=].resource[=].searchParam[=].type = #reference



* rest.resource[+].type = #Bundle
* rest.resource[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension.valueCode = #SHOULD
* rest.resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/davinci-pct/StructureDefinition/davinci-pct-gfe-packet"
* rest.resource[=].supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension.valueCode = #SHOULD
* rest.resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #MAY
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHOULD
* rest.resource[=].interaction[=].code = #read
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #MAY
* rest.resource[=].interaction[=].code = #vread
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #MAY
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #MAY
* rest.resource[=].interaction[=].code = #patch
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #MAY
* rest.resource[=].interaction[=].code = #delete
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #MAY
* rest.resource[=].interaction[=].code = #history-instance
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #MAY
* rest.resource[=].interaction[=].code = #history-type
