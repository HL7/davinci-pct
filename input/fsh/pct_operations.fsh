Instance: GFESubmitOperation
InstanceOf: OperationDefinition
Description: "This operation is used by an entity to submit one or multiple GFEs as a Bundle containing the GFE(s) and other referenced resources for processing. The only input parameter is the single Bundle resource with one or multiple GFE(s) - each of which is based on the Claim resource (along with other referenced resources). The only output is a url for subsequent polling per [async pattern](https://hl7.org/fhir/R5/async-bundle.html). If after polling the response is complete, then the result will either be a single Bundle with the AEOB - which is based on the ExplanationOfBenefit resource, (and other referenced resources) or an OperationOutcome resource indicating the AEOB will be sent directly to the patient and not to the provider."
Usage: #definition

* id = "GFE-submit"
* url = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/GFE-submit"
* name = "GFESubmit"
* title = "Submit a GFE resource for the creation of an AEOB"
* status = #active
* kind = #operation
* description = "This operation is used by an entity to submit one or multiple GFEs as a Bundle containing the GFE(s) and other referenced resources for processing. The only input parameter is the single Bundle resource with one or multiple GFE(s) - each of which is based on the Claim resource (along with other referenced resources). The output is a url in the Content-Location header for subsequent polling and optionally an OperationOutcome resource per [async pattern](http://build.fhir.org/async-bundle.html). If after polling the response is complete, then the result will either be a single Bundle with the AEOB - which is based on the ExplanationOfBenefit resource, (and other referenced resources) or an OperationOutcome resource indicating the AEOB will be sent directly to the patient."
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
//* parameter[0].targetProfile = Canonical(PCTGFECollectionBundle)
* parameter[0].documentation = "A Bundle containing a single or multiple GFE resources plus referenced resources."
* parameter[0].type = #Bundle
* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 0
* parameter[1].max = "1"
* parameter[1].documentation = "An optional OperationOutcome per the [async pattern](https://hl7.org/fhir/R5/async-bundle.html)."
* parameter[1].type = #OperationOutcome

// Note: This is no longer needed. We will use FHIR queries instead. LD
//
// Instance: AEOBInquiryOperation
// InstanceOf: OperationDefinition
// Description: "This operation is used to make an inquiry for an AEOB as a Bundle containing the AEOB and other referenced resources. The only input parameter is the resource id of the Bundle returned when the GFESubmit operation was invoked successfully and the only output is a single Bundle with the AEOB - which is based on the ExplanationOfBenefit resource, (and other referenced resources) or an OperationOutcome resource."
// Usage: #definition

// * id = "AEOB-inquiry"
// * url = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/AEOB-inquiry"
// * name = "AEOBInquiry"
// * title = "Inquiry for a Bundle containing a single AEOB resource plus referenced resources."
// * status = #draft
// * kind = #operation
// * code = #aeob-inquiry
// * base = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/AEOB-inquiry"
// * resource = #Bundle
// * system = false
// * type = true
// * instance = false
// * parameter[0].name = #value
// * parameter[0].use = #in
// * parameter[0].min = 1
// * parameter[0].max = "1"
// * parameter[0].documentation = "The resource id of the Bundle returned when the GFESubmit operation was invoked successfully for the creation of an AEOB."
// * parameter[0].type = #id
// * parameter[1].name = #return
// * parameter[1].use = #out
// * parameter[1].min = 1
// * parameter[1].max = "1"
// * parameter[1].documentation = "A Bundle containing a single AEOB resource plus referenced resources."
// * parameter[1].type = #Bundle


Instance: GFERetrieveOperation
InstanceOf: OperationDefinition
Description: "This operation is used by an entity to retrieve a GFE Collection Bundle containing the GFE Bundle(s) and other referenced resources based on a GFE Coordinating Request Task. The only input parameter is the single reference to the coordinating task resource. The only output is a GFE Collection Bundle. If the task reference is to a Coordinating Task, this will return the GFE Collection Bundle. If this task reference is for a GFE Request Contributing Provider Task, it returns the GFE Bundle, if present. If the Task reference points to a Task resource that is neither a Coordinating Task or a GFE Request Contributing Provider Task, the response is an HTTP error `400 - Bad Request`. If a Task is not found, the response is an HTTP error `400 - Bad Request`. If a GFE Bundle does not exist for an associated Contributing Provider Task, in place of a GFE Bundle, a GFE Missing Bundle is provided in its place (either directly ina response if the referenced task was a Contributing Provider Task or inside the GFE Collection Bundle if the referenced task was a Coordinating Task.)"
Usage: #definition

* id = "GFE-retrieve"
* url = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/GFE-retrieve"
* name = "GFERetrieve"
* title = "Retrieve GFE Collection Bundle"
* status = #active
* kind = #operation
* description = "This operation is used by an entity to retrieve a GFE Collection Bundle containing the GFE Bundle(s) and other referenced resources based on a GFE Coordinating Request Task. The only input parameter is the single reference to the coordinating task resource. The only output is a GFE Collection Bundle."
* code = #gfe-retrieve
* base = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/GFE-retrieve"
//* resource = #Claim
* system = false
* type = true
* instance = false
* parameter[0].name = #request
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].targetProfile = Canonical(PCTCoordinatingGFERequestTask)
* parameter[0].documentation = "A reference to a coordinating GFE Request Task."
* parameter[0].type = #Reference
* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
//* parameter[0].targetProfile = Reference(PCTGFECollectionBundle)
* parameter[1].documentation = "A GFE Request Collection Bundle containing the GFE Bundles of the submitted GFE Bundles by the GFE Request Contributing Providers."
* parameter[1].type = #Bundle

