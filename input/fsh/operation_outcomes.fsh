Profile: AEOBComplete
Parent: OperationOutcome
Id: davinci-pct-aeob-complete
Title: "PCT AEOB Complete"
Description: "OperationOutcome returned from the gfeSubmit operation when the AEOB process is complete but no AEOB will be returned to the submitter (i.e. it was sent only to the patient)"

* issue.severity = #information
* issue.code = #processing
* issue.diagnostics = "AEOB processing is complete, the AEOB will be sent directly to the patient. No AEOB will be returned to the submitter."

Profile: AEOBAdjudicationError
Parent: OperationOutcome
Id: davinci-pct-aeob-adjudication-error
Title: "PCT AEOB Adjudication Error"
Description: "OperationOutcome returned from the gfeSubmit operation when there are adjudication errors during AEOB processing"

* issue.severity = #error
* issue.code = #processing
* issue.diagnostics 1..1

Profile: GFRValidationError
Parent: OperationOutcome
Id: davinci-pct-gfe-validation-error
Title: "PCT GFE Validation Error"
Description: "OperationOutcome returned from the gfeSubmit operation when the GFE Bundle fails FHIR validation"

* issue.severity = #error
* issue.code = #processing