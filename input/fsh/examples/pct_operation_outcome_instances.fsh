Instance: PCT-AEOB-Adjudication-Error-Example-1
InstanceOf: AEOBAdjudicationError
Description: "PCT AEOB Adjudication Error Example 1"
Usage: #example

* issue.severity = #error
* issue.code = #processing
* issue.diagnostics = "Some adjudication error"


Instance: PCT-AEOB-Complete-Example-1
InstanceOf: AEOBComplete
Description: "PCT AEOB Complete Example 1"
Usage: #example

* issue.severity = #information
* issue.code = #processing
* issue.diagnostics = "AEOB processing is complete, the AEOB will be sent directly to the patient. No AEOB will be returned to the submitter."


Instance: PCT-GFE-Validation-Error-Example-1
InstanceOf: GFEValidationError
Description: "PCT GFE Validation Error Example 1"
Usage: #example

* issue.severity = #error
* issue.code = #processing
* issue.diagnostics = "Claim.priority has minimum cardinality 1 but occurs 0 time(s)."
