Profile: AEOBCompleteOperationOutcome
Parent: OperationOutcome
Id: davinci-pct-aeob-complete
Title: "PCT AEOB Complete Operation Outcome"
Description: "OperationOutcome returned from the gfeSubmit operation when the AEOB process is complete but no AEOB will be returned to the submitter (i.e. it was sent only to the patient)"

* issue.severity = #information
* issue.code = #processing
* issue.diagnostics = "AEOB processing is complete, the AEOB will be sent directly to the patient. No AEOB will be returned to the submitter."