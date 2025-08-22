
Instance: Submitter-Org-1
InstanceOf: PCTOrganization
Description: "Institutional GFE Submitter 1"
Usage: #example

// * id = "e7c36e30-edb8-4a0a-8208-c92085663b00"
// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"Submitter-Org-1\"> </a><a name=\"hcSubmitter-Org-1\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Organization &quot;Submitter-Org-1&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-organization.html\">PCT Organization</a></p></div><p><b>identifier</b>: Electronic Transmitter Identification Number/ETIN-10010301</p><p><b>active</b>: true</p><p><b>type</b>: Non-Healthcare Business or Corporation <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-organization-type.html\">Organization type</a>#bus)</span></p><p><b>name</b>: GFE Service Help INC.</p><h3>Contacts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Purpose</b></td><td><b>Name</b></td><td><b>Telecom</b></td></tr><tr><td style=\"display: none\">*</td><td>GFE-related <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"CodeSystem-PCTOrgContactPurposeType.html\">PCT Organization Contact Purpose Type Code System</a>#GFERELATED)</span></td><td>Clara Sender</td><td>ph: 781-632-3209(WORK), <a href=\"mailto:csender@GFEServiceHelp.com\">csender@GFEServiceHelp.com</a></td></tr></table></div>"
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

// * id = "2ccf0ff7-2af1-4598-b667-6e35b79529df"
// * text.status = #generated
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Organization 2ccf0ff7-2af1-4598-b667-6e35b79529df</b></p><a name=\"2ccf0ff7-2af1-4598-b667-6e35b79529df\"> </a><a name=\"hc2ccf0ff7-2af1-4598-b667-6e35b79529df\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-organization.html\">PCT Organization</a></p></div><p><b>identifier</b>: Electronic Transmitter Identification Number/ETIN-3200002</p><p><b>active</b>: true</p><p><b>type</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/organization-type pay}\">Payer</span></p><p><b>name</b>: Umbrella Insurance Company</p><p><b>telecom</b>: ph: 860-547-5001(Work)</p><p><b>address</b>: 680 Asylum Street Hartford CT 06155 US </p></div>"
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
//* address.extension[countrySubdivisionCode].valueCoding = $ISO3166-P2-CSC#US-CT

Instance: org1002
InstanceOf: PCTOrganization
Description: "An instance of PCTOrganization as a healthcare provider"
Usage: #example

// * id = "646ce5de-3216-4098-ae71-c96d5f02b088"
// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"org1002\"> </a><a name=\"hcorg1002\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Organization &quot;org1002&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-organization.html\">PCT Organization</a></p></div><p><b>identifier</b>: National provider identifier/1234568095, Tax ID number/TAX-3211001</p><p><b>active</b>: true</p><p><b>type</b>: Healthcare Provider <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-organization-type.html\">Organization type</a>#prov)</span></p><p><b>name</b>: Boston Radiology Center</p><p><b>telecom</b>: ph: 781-232-3200(WORK)</p><p><b>address</b>: 32 Fruit Street Boston MA 02114 US </p></div>"
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
//* address.extension[countrySubdivisionCode].valueCoding = $ISO3166-P2-CSC#US-MA