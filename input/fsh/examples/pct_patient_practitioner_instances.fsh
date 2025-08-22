
Instance: patient1001
Description: "An instance of Patient"
InstanceOf: USCorePatientProfile|7.0.0
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient|7.0.0"
// * id = "9c05d948-b931-4bff-8766-18b99b0650d4"
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

// * id = "2e4341dc-70b8-4709-9fa9-0b6d64cf21bb"
// * text.status = #generated
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Practitioner 2e4341dc-70b8-4709-9fa9-0b6d64cf21bb</b></p><a name=\"2e4341dc-70b8-4709-9fa9-0b6d64cf21bb\"> </a><a name=\"hc2e4341dc-70b8-4709-9fa9-0b6d64cf21bb\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-practitioner.html\">PCT Practitioner</a></p></div><p><b>identifier</b>: <a href=\"http://terminology.hl7.org/6.5.0/NamingSystem-npi.html\" title=\"National Provider Identifier\">United States National Provider Identifier</a>/9941339100, Electronic Transmitter Identification Number/ETIN-20020001</p><p><b>active</b>: true</p><p><b>name</b>: Nora Ologist</p><p><b>telecom</b>: ph: 860-547-3301(Work), <a href=\"mailto:csender@GFEServiceHelp.com\">csender@GFEServiceHelp.com</a></p></div>"

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

