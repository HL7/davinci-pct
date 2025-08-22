
Instance: coverage1001
InstanceOf: PCTCoverage
Description: "An instance of PCTCoverage"
Usage: #example

// * id = "49fd53a8-7eb7-4319-acc8-04bf8a3cb603"
// * text.status = #generated
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Coverage 49fd53a8-7eb7-4319-acc8-04bf8a3cb603</b></p><a name=\"49fd53a8-7eb7-4319-acc8-04bf8a3cb603\"> </a><a name=\"hc49fd53a8-7eb7-4319-acc8-04bf8a3cb603\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-coverage.html\">PCT Coverage</a></p></div><p><b>Extension Definition for Coverage.kind for Version 5.0</b>: insurance</p><p><b>status</b>: Active</p><p><b>subscriberId</b>: PFP123450000</p><p><b>beneficiary</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-9c05d948-b931-4bff-8766-18b99b0650d4\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><p><b>relationship</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/subscriber-relationship self}\">Self</span></p><p><b>period</b>: 2021-01-01 --&gt; 2022-01-01</p><p><b>payor</b>: <a href=\"Bundle-PCT-AEOB-Packet-1.html#urn-uuid-2ccf0ff7-2af1-4598-b667-6e35b79529df\">Bundle: identifier = http://example.com/identifiers/bundle#59688475-2324-3242-1234568; type = document; timestamp = 2025-01-10 11:01:00+0500</a></p><h3>Classes</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value</b></td><td><b>Name</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/coverage-class plan}\">Plan</span></td><td>Premim Family Plus</td><td>Premim Family Plus Plan</td></tr></table><h3>CostToBeneficiaries</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value[x]</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/coverage-copay-type copaypct}\">Copay Percentage</span></td><td>20</td></tr></table></div>"
* extension[coverage-kind].valueCode = #insurance
// * extension[self-pay-declared].valueBoolean = false
// * beneficiary.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* beneficiary = Reference(patient1001)

* relationship = RELATE#self "Self"
* status = #active
* class.name = "Premim Family Plus Plan"
* class.type = COVCLASS#plan "Plan"
* class.value = "Premim Family Plus"
* period.start = "2021-01-01"
* period.end = "2022-01-01"
// * payor.reference = "urn:uuid:2ccf0ff7-2af1-4598-b667-6e35b79529df" // = Reference(org1001)
* payor = Reference(org1001)
//* subscriber.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* subscriberId = "PFP123450000"
* costToBeneficiary.type = COPAYTYPE#copaypct "Copay Percentage"
* costToBeneficiary.valueQuantity.value = 20.00
//* costToBeneficiary.valueMoney.currency = #USD
//* contract = Reference(contract1001)



Instance: selfpaycoverage2001
InstanceOf: PCTCoverage
Description: "An instance of PCTCoverage"
Usage: #example

//* text.status = #additional
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><a name=\"coverage1001\"> </a><a name=\"hccoverage1001\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Coverage &quot;coverage1001&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-davinci-pct-coverage.html\">PCT Coverage</a></p></div><p><b>Extension Definition for Coverage.kind for Version 5.0</b>: insurance</p><p><b>status</b>: active</p><p><b>subscriberId</b>: PFP123450000</p><p><b>beneficiary</b>: <a href=\"Patient-patient1001.html\">Patient/patient1001</a> &quot; BETTERHALF&quot;</p><p><b>relationship</b>: Self <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-subscriber-relationship.html\">SubscriberPolicyholder Relationship Codes</a>#self)</span></p><p><b>period</b>: 2021-01-01 --&gt; 2022-01-01</p><p><b>payor</b>: <a href=\"Organization-org1001.html\">Organization/org1001</a> &quot;Umbrella Insurance Company&quot;</p><h3>Classes</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value</b></td><td><b>Name</b></td></tr><tr><td style=\"display: none\">*</td><td>Plan <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-coverage-class.html\">Coverage Class Codes</a>#plan)</span></td><td>Premim Family Plus</td><td>Premim Family Plus Plan</td></tr></table><h3>CostToBeneficiaries</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value[x]</b></td></tr><tr><td style=\"display: none\">*</td><td>Copay Percentage <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-coverage-copay-type.html\">Coverage Copay Type Codes</a>#copaypct)</span></td><td>20</td></tr></table></div>"
* extension[coverage-kind].valueCode = #self-pay
* extension[self-pay-declared].valueBoolean = true
// * beneficiary = Reference(patient1001) // "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
* beneficiary = Reference(patient1001) 

* relationship = RELATE#self "Self"
* subscriberId.extension[dataAbsentReason].valueCode = DataAbsentReason#not-applicable
* status = #active
// * payor.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(patient1001)
* payor = Reference(patient1001)
//* subscriber.reference = "urn:uuid:9c05d948-b931-4bff-8766-18b99b0650d4" // Reference(9c05d948-b931-4bff-8766-18b99b0650d4) // Reference(patient1001)
