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
* expression = "ExplanationOfBenefit.serviced"
* target = #ExplanationOfBenefit