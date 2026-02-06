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
* description = "This operation is used by an entity to submit one or multiple GFEs as a Bundle containing the GFE(s) and other referenced resources for processing. The only input parameter is the single Bundle resource with one or multiple GFE(s) - each of which is based on the Claim resource (along with other referenced resources). The output is a url in the Content-Location header for subsequent polling and optionally an OperationOutcome resource per [async pattern](https://hl7.org/fhir/R5/async-bundle.html). If after polling the response is complete, then the result will either be a single Bundle with the AEOB - which is based on the ExplanationOfBenefit resource, (and other referenced resources) or an OperationOutcome resource indicating the AEOB will be sent directly to the patient."
* code = #gfe-submit
//* base = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/GFE-submit"
* resource = #Claim
* system = false
* type = true
* instance = false
//* inputProfile = Canonical(PCTGFEPacket)
* parameter[0].name = #resource
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].targetProfile = Canonical(PCTGFEPacket)
* parameter[0].documentation = "A Bundle containing a single or multiple GFE resources plus referenced resources."
* parameter[0].type = #Bundle
* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 0
* parameter[1].max = "1"

* parameter[1].documentation = "When successful, this will return operationOutcome with the; When there is an error calling $gfe-submit (4xx, 5xx HTTP code) then an OperationOutcome must be returned per the [async pattern](https://hl7.org/fhir/R5/async-bundle.html)."
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
Description: "This operation is used by an entity to retrieve a GFE Packet containing the GFE Bundle(s) and other referenced resources based on a GFE Coordination Task. There are no input parameters and the only output is a GFE Packet. If the context task is to a Coordinating Task, this will return the GFE Packet. If the context task is for a GFE Contributor Task, it returns the GFE Bundle, if present. If a GFE Bundle does not exist for an associated Contributor Task, in place of a GFE Bundle, a GFE Missing Bundle is provided (either directly in a response if the referenced task was a Contributor Task or inside the GFE Packet if the referenced task was a Coordinating Task.). This operation will only return GFE Bundles for GFE Contributor Tasks that have an appropriately attached GFE Bundle and a status of `completed`. All other Contributor Tasks that otherwise do not have a status of `rejected` or `cancelled` will have a GFE Missing Bundle included instead."
Usage: #definition

* id = "GFE-retrieve"
* url = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/GFE-retrieve"
* name = "GFERetrieve"
* title = "Retrieve GFE Packet"
* status = #active
* kind = #operation
* description = "This operation is used by an entity to retrieve a GFE Packet containing the GFE Bundle(s) and other referenced resources based on a GFE Coordination Task. There are no input parameters and the only output is a GFE Packet."
* code = #gfe-retrieve
//* base = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/GFE-retrieve"
* resource = #Task
* system = false
* type = false
* instance = true
//* inputProfile = Canonical(PCTGFECoordinationTask)
//* outputProfile = Canonical(PCTGFEPacket)
/* parameter[0].name = #request
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].targetProfile = Canonical(PCTGFECoordinationTask)
* parameter[0].documentation = "A reference to a GFE Coordination Task."
* parameter[0].type = #Reference
*/
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].targetProfile = Canonical(PCTGFEPacket)
* parameter[=].documentation = "A GFE Packet containing the GFE Bundles of the submitted GFE Bundles by the GFE Contributors for GFE Contributor Tasks marked as `completed`, and GFE Missing Bundles for incomplete Tasks."
* parameter[=].type = #Bundle


Instance: GFECoordinationRequest
InstanceOf: OperationDefinition
Description: "This operation is used by an entity to start the GFE Coordination Workflow to request GFE Bundles from GFE Contributors. The input is a GFE Coordination Bundle containing a Coordination Task and one or more Contributor Tasks. The output may be a transaction-bundle providing information about the success of the operation or an OperationOutcome detailing any issues with the operation."
Usage: #definition

* id = "GFE-coordination-request"
* url = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/GFE-coordination-request"
* name = "GFECoordinationRequest"
* title = "Good Faith Estimate Coordination Request"
* status = #active
* kind = #operation
* description = "This operation is used by an entity to start the GFE Coordination Workflow to request GFE Bundles from GFE Contributors. The input is a GFE Coordination Bundle containing a Coordination Task and one or more Contributor Tasks. The output may be a transaction-bundle providing information about the success of the operation or an OperationOutcome detailing any issues with the operation."
* code = #gfe-coordination-request
//* base = "http://hl7.org/fhir/us/davinci-pct/OperationDefinition/GFE-coordination-request"
//* resource = #Claim
* system = true
* type = false
* instance = false
//* inputProfile = Canonical(PCTGFECoordinationBundle)
* parameter[+].name = #resource
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].targetProfile = Canonical(PCTGFECoordinationBundle)
* parameter[=].documentation = "A request Bundle that contains necessary resources for GFE  to request GFEs from one or multiple GFE contributing providers."
* parameter[=].type = #Bundle

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A transaction-response Bundle including information about the successful operation of the request."
* parameter[=].type = #Bundle

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "If the operation failed, returns an OperationOutcome detailing the nature of the issues with the operation."
* parameter[=].type = #OperationOutcome