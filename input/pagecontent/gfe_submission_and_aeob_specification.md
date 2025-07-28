This section of the implementation guide (IG) defines the specific conformance requirements for systems wishing to conform to this Patient Cost Transparency (PCT) IG GFE Submit Workflow. It focuses on Good Faith Estimate (GFE) submission [$gfe-submit](OperationDefinition-GFE-submit.html) and an Advanced Explanation of Benefits (AEOB) query, though it also provides guidance on privacy, security, and other implementation requirements.

## Detailed Requirements

### Summary
FHIR uses a pair of resources called [Claim](https://www.hl7.org/fhir/claim.html) and [EOB](http://www.hl7.org/fhir/explanationofbenefit.html) for multiple purposes - they are used for actual claim submission, but they are also used for managing prior authorizations and pre-determinations. These uses are distinguished by the Claim.use and ExplanationOfBenefit.use code. This guide requires `predetermination` for both Claim.use and ExplanationOfBenefits.use. All references to Claim and EOB in this IG are referring to the AEOB.

In addition to the requirements specified in this section, GFE Submitters, and Payers **SHALL** meet the requirements as specified in their respective requirements CapabilityStatements and sections defined in this IG.


### Submitting a GFE and Polling for an AEOB

One of the primary interaction supported by this IG is submitting a GFE and receiving an AEOB in response. To perform this, a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) resource is constructed by the client (e.g., Billing Management Software) system. The response is an [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html).


For scheduled services the submitting provider **SHALL** include the following in the[GFE  Composition]( StructureDefinition-davinci-pct-gfe-composition.html):

Service dates/time in the `Composition.extension[gfeServiceLinkingInfo].extension[plannedPeriodOfService].valueDate|valuePeriod`.
The `Composition.extension[requestOriginationType].valueCodeableConcept` with a code representing a `scheduled-request`.
>Note: This value may already be present if the GFE Packet was created through the [GFE Coordination Workflow](gfe_coordination_overview.html), and the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) was provided a `Task.extension[planned-service-period]` value. If not, the submitting provider is expected to add the appropriate values for a scheduled service.
 

To the GFE Composition Profile:
to the `Composition.extension[gfeServiceLinkingInfo]` description add a requirement that scheduled services **SHALL** have `extension[plannedPeriodOfService].valueDate|valuePeriod` populated
Add an error severity Invariant that requires a where `extension[plannedPeriodOfService].valueDate|valuePeriod` populated exists if `Composition.extension[requestOriginationType].valueCodeableConcept` has a code representing a `scheduled-request`


The [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) will be sent as the sole payload of a [$gfe-submit](OperationDefinition-GFE-submit.html) operation, which is based on the [Asynchronous Interaction Request Pattern](https://hl7.org/fhir/R5/async-bundle.html) (please refer to that page for more details). 
>Note: that page is part of the FHIR R5 current build, but uses no R5 resources; this guide is pre-adopting that HTTP request pattern. The response will be a URL in the Content-Location header for subsequent polling. 

AEOBs will often not be complete and the calling client (or other interested systems - e.g., patient or submitting provider system) will need to periodically poll the payer server to determine the status of the gfe-submit operation. Polling can generate the following responses:

  * If the response is in-progress, this request will return an HTTP status code of 202 Accepted, indicating that the provider should poll again later. The payer system should return a Retry-After header with each in-progress polling response, and the client should use this information to inform the timing of the next polling request. 
  * If the response is an error, this request will return an HTTP status code of 4XX or 5XX, and the body of the response will be an OperationOutcome detailing the error. 
  * If the response is successful, this request will return an HTTP status code of 200 OK, and the body of the request will be a Bundle resource of type batch-response. This batch-response bundle SHOULD contain the completed [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) and MAY contain one or more OperationOutcome resources with additional information regarding GFE/AOEB processing. If the batch-response Bundle does not contain an [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html), then it **SHALL** contain at least one OperationOutcome resource detailing the reason why the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) is not present (e.g., the AEOB was sent directly to the patient and will not be returned to the provider). 
  * The AEOB Packet **SHOULD** be made available to patients and their providers through an API. The AEOB Packet the provider receives **SHOULD** have the same information as the one the patient receives.


#### AEOB Request
The [$gfe-submit](OperationDefinition-GFE-submit.html) operation is executed by POSTing a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) to the [$gfe-submit](OperationDefinition-GFE-submit.html) endpoint. The server **SHALL** support JSON encoding and **MAY** support XML. The [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) will include one or more [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resources for one patient. The GFE profiles used for the claim resources can be [found here](artifacts.html#structures-gfe-resource-profiles). Additional Bundle entries **SHALL** be populated with any resources referenced by the GFE resource (and any resources referenced by those resources, fully traversing all references, and complying with all identified profiles). Note that even if a given resource instance is referenced multiple times, it **SHALL** only appear in the Bundle once, e.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance is created - referenced from multiple places as appropriate.

The submitted [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) **SHALL** have a unique identifier (by combination of the system and value) in the `Composition.identifier` which uniquely identifies the document. If the submitted [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) is meant to replace a previously submitted [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) (for the same patient and intended purpose), the submitted [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) **SHALL** have a `Composition.relatesTo` with a `replaces` code and the `targetIdentifier` matching the `Composition.identifier` of the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) it is replacing. If a payer receives a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) with the `relatesTo[replaces].identifier` matching a previous GFE submission (`Composition.identifier`) by the same submitter for which an AEOB is not yet complete, it **MAY** assume that an AEOB response is no longer needed for the previous request and process the new request instead.

Bundle.entry.fullUrl values **SHALL** be one of the following:
• the URL at which the resource is available from the Billing Management System if exposed via the client's REST interface 
• in the form “urn:uuid:[some guid]” 

All GUIDs used **SHALL** be unique, including across independent GFE submissions - with the exception that the same resource instance being referenced in distinct AEOB request Bundles can have the same GUID.

In addition to these core elements, any "supporting information" resources needed to process the AEOB request must also be included in the Bundle. Relevant resources referenced by those “supporting information” resources **SHALL** also be included. Any such resource that has a US Core profile **SHALL** comply with the relevant US Core profiles. All “supporting information” resources included in the Bundle **SHALL** be pointed to by the GFE resource using the GFE.supportingInfo.valueReference element.

Whenever possible, the AEOB should default to elements in the GFE (i.e., not include/repeat) unless there is a business reason to do so to reduce complexity for app developers or for patient clarifications. This is why many elements in the GFE profiles are not repeated in the AEOB profiles, since the original GFE **SHALL** be referenced from the AEOB. 

To attach PDFs, CDAs, JPGs, a DocumentReference instance should be used. The GFE.supportingInfo.sequence for each entry **SHALL** be unique within the GFE.

All resources **SHALL** comply with their respective profiles. FHIR elements not required (minimum cardinality of 1) or marked as "must support" **MAY** be included in resources within the Bundle, but client systems should have no expectation of such elements being processed by the payer unless prior arrangements have been made. Systems that do not process such elements **SHALL** ignore unsupported elements unless they are "modifier" elements, in which case the system **MAY** treat the presence of the element as an error.

This IG treats everything that happens beyond the defined operations endpoint receiving the FHIR bundle as a black box. This black box includes any business associates, clearinghouses, payers, contracted review entities, and other intermediaries that may be involved in the AEOB request and response. The black box ensures that any other requirements are met and to perform all processing within the allowed time frame.

#### AEOB Response

The [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) **SHALL** include, at a minimum, the full estimation based on the GFE Packet received in the GFE submission. Optionally, it may include estimates across linked GFE submissions (e.g. through a [GFE Composition](StructureDefinition-davinci-pct-gfe-composition.html) [GFE Service Linking Info](StructureDefinition-gfeServiceLinkingInfo.html) if the payer or intermediary supports linking across submissions).

Just like the AEOB request, additional Bundle entries must be present for all resources referenced by the AEOB response or descendent references. When converting additional Bundle entries, the conversion process **SHALL** ensure that only one resource is created for a given combination of content, e.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate. When echoing back resources that are in the AEOB request, the system **SHALL** ensure that the same fullUrl and resource identifiers are used in the response as appeared in the request.

It is possible that the incoming Bundle cannot be processed due to validation errors or other non-business-errors. In these instances, the receiving system **SHALL** return OperationOutcome instances that detail why the Bundle could not be processed and no AEOB response will be returned.


### Notifications of AEOB Availability ###

#### General Requirements for Notifications of AEOB Availability ####
Notifications may take the form of FHIR Subscription (as defined in this IG), unsolicited notification, messaging or other method.
Payers **SHALL** be able to notify patients when an [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) is made available. Payers **MAY** be able to notify related GFE author(s) when an [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) is made available.

Implementers **MAY** support the R4 Subscriptions referenced in the Subscriptions for R5 Backport Implementation Guide. 
This IG defines the following minimal requirements for the support of subscriptions for systems conforming to this IG that choose to support subscriptions:
* Servers supporting subscriptions **SHALL** expose this as part of the Server's CapabilityStatement
* Support for subscription topic discovery is not required, however, the subscription topic canonical urls that show up in the `Subscription.criteria` for the subscription topics supported **SHALL** be used. Other types of Subscriptions are allowed.
* Servers **SHOULD** support rest-hook and **MAY** support websocket, email, sms, message or other channels
* Servers **SHALL** support both JSON and XML and clients **SHALL** support at least one of these.
* Client and server **SHALL** support `id-only`, though they can also support other content approaches. 
>Note: The `id-only` approach means that the id of the Task that was updated will be provided. The client will then perform a read or a query to retrieve the identified record(s) specified in the subscription notification.


To support the access and ability to provide notifications appropriately, an AEOB Packet Document Reference and PCT AEOB Composition **SHALL NOT** have their `documentReference.type` and `Composition.type` elements, respectively, modified. If either of these elements was entered in error, the AEOB Packet Document Reference `documentReferece.status` and PCT AEOB Composition `Composition.status` **SHALL** be set to `entered-in-error`

#### Requirements for AEOB Packet Availability Subscriptions ####
For notifications to patients (AEOB Packet `subject`) the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) subscription **SHALL** conform to the [Subscription - AEOB Available for Subject Notification](StructureDefinition-davinci-pct-aeob-available-subject-subscription) and meet the following requirements:
* **SHALL** have a `Subscription.criteria.extension[filterCriteria].valueString` = `DocumentReference?subject=[FHIR-ID]` where `[FHIR-ID]` is the FHIR logical identifier for the patient.
* Updates to the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) **SHALL** result in an update to the [AEOB Packet Document Reference](StructureDefinition-davinci-pct-aeob-documentreference.html) in order to trigger a notification. 

For notifications to author(s) (providers) the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) subscription **SHALL** conform to the [Subscription - AEOB Available for Author Notification](StructureDefinition-davinci-pct-aeob-available-author-subscription) and meet the following requirements:
* **SHALL** have a `Subscription.criteria.extension[filterCriteria].valueString` = `DocumentReference?author=[FHIR-ID]` where `[FHIR-ID]` is the FHIR logical identifier for the provider.
* Updates to the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) **SHALL** result in an update to the [AEOB Packet Document Reference](StructureDefinition-davinci-pct-aeob-documentreference.html) in order to trigger a notification. 


### Patient Access to AEOBs

> Note: Although technically possible, conveying the AEOB to the patient via FHIR API is optional and the workflow is contingent upon the payer opting to expose the API to the patient. The payer must return the completed AEOB to the patient, but this may be done in many ways such as via mail, the payer benefits portal, or via an API. The only method in scope for this guide is the FHIR-based API approach inspired by the Patient Access API defined in the [CARIN Consumer Directed Payer Data Exchange](https://build.fhir.org/ig/HL7/carin-bb/Use_Case.html#use-case---consumer-access-to-their-claims-data) guide. Note that use of an API is optional for the payer, and if the payer does implement both this API and the Patient Access API defined in the CARIN IG, it is up to the payer to determine if those APIs use the same or different endpoints. 

If the payer system supports access via an API, then a third-party app used by the patient authorizes/authenticates and receives an access token. The app requests the AEOB by using the access token using a GET request for ExplanationOfBenefit resources in the patient's compartment. For example, `GET [base]/ExplanationOfBenefit?patient=[patient-id]`. Payer systems SHALL implement appropriate access controls to ensure that AEOBs are only accessible by the authenticated patient. 
  * If successful, the system will return 200 OK, and the body will contain a Bundle resource of type searchset, containing zero or more ExplanationOfBenefit resources. Once the desired AEOB is found, the third-party app may use the same API to query for other resources referenced by the AEOB, such as Patient, Practitioner, Organization, and Coverage resources if those referenced resources are not contained in the AEOB itself. Third-party apps should keep track of prior AEOBs and alert the patient if new ones are found. New AEOBs would have a different identifier and a created date later than previous AEOBs. 

