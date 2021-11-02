Instance: GFESubmitOperation
InstanceOf: OperationDefinition
Description: "This operation is used by an entity to submit one or multiple GFEs as a Bundle containing the GFE(s) and other referenced resources for processing. The only input parameter is the single Bundle resource with one or multiple GFE(s) - each of which is based on the Claim resource, (along with other referenced resources) and the only output is a single Bundle with the AEOB - which is based on the ExplanationOfBenefit resource, (and other referenced resources) or an OperationOutcome resource."
Usage: #definition

* id = "GFE-submit"
* url = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/GFE-submit"
* name = "GFESubmit"
* title = "Submit a GFE resource for the creation of an AEOB"
* status = #draft
* kind = #operation
* code = #gfe-submit
* base = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/GFE-submit"
* resource = #Claim
* system = false
* type = true
* instance = false
* parameter[0].name = #resource
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "A Bundle containing a single or multiple GFE resources plus referenced resources."
* parameter[0].type = #Bundle
* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].documentation = "A Bundle containing a single AEOB resource plus referenced resources."
* parameter[1].type = #Bundle

Instance: AEOBInquiryOperation
InstanceOf: OperationDefinition
Description: "This operation is used to make an inquiry for an AEOB as a Bundle containing the AEOB and other referenced resources. The only input parameter is the resource id of the Bundle returned when the GFESubmit operation was invoked successfully and the only output is a single Bundle with the AEOB - which is based on the ExplanationOfBenefit resource, (and other referenced resources) or an OperationOutcome resource."
Usage: #definition

* id = "AEOB-inquiry"
* url = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/AEOB-inquiry"
* name = "AEOBInquiry"
* title = "Inquiry for a Bundle containing a single AEOB resource plus referenced resources."
* status = #draft
* kind = #operation
* code = #aeob-inquiry
* base = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/AEOB-inquiry"
* resource = #Bundle
* system = false
* type = true
* instance = false
* parameter[0].name = #value
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "The resource id of the Bundle returned when the GFESubmit operation was invoked successfully for the creation of an AEOB."
* parameter[0].type = #id
* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].documentation = "A Bundle containing a single AEOB resource plus referenced resources."
* parameter[1].type = #Bundle