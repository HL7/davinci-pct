This section of the implementation guide (IG) defines the specific conformance requirements for systems wishing to conform to this Patient Cost Transparency (PCT) IG. The bulk of it focuses on the GFE [$gfe-submit]( https://build.fhir.org/ig/HL7/davinci-pct/OperationDefinition-GFE-submit.html) and an Advanced Explanation of Benefits (AEOB) query, though it also provides guidance on privacy, security, and other implementation requirements.

### Context

#### Pre-reading
Before reading this formal specification, implementers should first familiarize themselves with two other key portions of the specification:

* The [Use Case](use_cases.html) page provides context for what this formal specification is trying to accomplish and will give a sense of both the business context and general process flow enabled by the formal specification below.

* The [Technical Background and Underlying Technologies]( underlying_technologies.html) page provides information about the underlying specifications and indicates what portions of them should be read and understood to have the necessary foundation to understand the constraints and usage guidance described here.

#### Conventions
This implementation guide uses specific terminology to flag statements that have relevance for the evaluation of conformance with the guide:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that are strongly recommended (and which may result in interoperability issues or sub-optimal behavior if not adhered to), but which do not, for this version of the specification, affect the determination of specification conformance.

* **MAY** describes optional behaviors that are free to consider but where there is no recommendation for or against adoption.

#### Systems

This implementation guide sets expectations for at least two types of systems:

* **Payer** systems adjudicate GFEs that have been submitted by a healthcare provider. These systems determine if a provider is in or out of network, verifies patient eligibility, applies contracted amounts (the provider’s network status needs to be confirmed), and applies member cost sharing amounts.

* **Intermediary** The payer or the provider may have the relationship with the intermediary.  Some payers do not contract with a clearinghouse; others do.  Providers can either contract with a Practice Management system who has the relationship with the clearinghouse or in some cases contracts directly with the clearinghouse through their Practice Management software.

#### System Actors

* **Client** systems are typically billing management systems, revenue cycle management systems, or other client systems responsible for requesting AEOBs.

* **Member** The health plan member / patient who is, or was, a member of a health plan.

* **Provider** The practitioner or clinician, or their representative, that initiates a data access request to retrieve member data from a health plan.

* **Third-Party Application** Health Plan Members / Patients have a right under the Health Insurance Portability and Accountability Act of 1996 (HIPAA) to direct the information held by a covered entity, such as a hospital or Health Plan to a third party of their choosing.

There are different terms used for an individual or patient in the Health Plan industry. Terms such as subscriber or member may be used. A subscriber and a member are not necessarily equivalent. For example, the subscriber may be the primary family member on a plan that covers the entire family. Therefore, the term Member will be used throughout this guide to identify the individual subject of the “member health history”.

#### Business Actors

* **Payer** – An organization that pays for administered medical services and products and can process provider cost estimations to calculate member specific cost sharing amounts, liabilities, payments, and expenses for use in member health care decision making.

* **Provider** – A practitioner, clinician, or organization providing healthcare related services or products to a member and submitting an estimation of charges (Good Faith Estimate) to a payer for processing and may access payer processed estimations.

* **Member** – A health plan member / patient who accesses a provider estimation and a payer processed estimation of costs for products or services they may receive in the future.

There are different terms used for individual actors involved in health plan coverage. Terms such as subscriber or member may be used. A subscriber and a member are not necessarily equivalent. For example, the subscriber may be the primary family member on a plan that covers the entire family. Therefore, the term Member will be used throughout this guide to identify the individual who will ultimately receive the care.

#### Technical Actors ####

* **Primary Participating Entity** – A business actor sending or receiving resources conforming to this implementation guide inclusive of all systems functionally acting on behalf of the actor, including intermediaries.

* **Sender** – A primary participating entity sending resources conforming to this guide.

* **Receiver** – A primary participating entity receiving resources conforming to this guide.

#### Must Support ####

The following rules regarding Must support elements apply to all Profiles in this guide. The Must Support definitions are not inherited from other implementation guides, including when a profile in this guide is derived from another guide.

Sender:
* The sender **SHALL** send the data element if the sender maintains the data element and is authorized to share it.
    * Data elements that the sender maintains includes data elements available in the systems under the sender’s control.

    * If the sender does not capture/store the data, the data is not available, or sharing of the data is not authorized, the system **SHOULD NOT** send the element if the element is not marked as mandatory (lower cardinality of 0).
 
Receiver:

* The receiver **SHALL** be capable of processing resource instances containing must-support data elements without generating an error or causing the application to fail.
* The receiver **SHOULD** be capable of displaying must support data elements for human use.
* The receiver **SHALL** be able to process resource instances containing must-support data elements asserting missing information (data absent reason extension).

This guide uses technical actors to define [Must Support](formal_specification.html#must-support) conformance requirements.

#### Profiles
This specification makes significant use of [FHIR profiles]({{site.data.fhir.path}}profiling.html) and terminology artifacts to describe the content to be shared as part of AEOB requests and responses.

The full set of profiles defined in this IG can be found by following the links on the [Artifacts](artifacts.html) page.

<blockquote class="stu-note">
<p>
This has been updated to reflect Jira ticket <a href="https://jira.hl7.org/browse/FHIR-34976">FHIR-34976</a> which is pending a block vote as of 2-28-2022.
</p>
</blockquote>

### Detailed Requirements

#### Summary
FHIR uses a pair of resources called [Claim](https://www.hl7.org/fhir/claim.html) and [EOB](http://www.hl7.org/fhir/explanationofbenefit.html) for multiple purposes - they are used for actual claim submission, but they are also used for managing prior authorizations and pre-determinations. These uses are distinguished by the Claim.use and ExplanationOfBenefit.use code. All references to Claim and EOB in this IG are using it for the Advanced Explanation of Benefits (AEOB) purpose.

#### Submitting a GFE and Polling for an AEOB

The primary interaction supported by this implementation guide is submitting an AEOB request and receiving an AEOB response. To perform this, a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resource is constructed by the client (e.g., Billing Management Software) system. The response is an [AEOB Bundle](StructureDefinition-davinci-pct-aeob-bundle.html).

The GFE Bundle will be sent as the sole payload of a [$gfe-submit]( https://build.fhir.org/ig/HL7/davinci-pct/OperationDefinition-GFE-submit.html) operation, which is based on the [Asynchronous Interaction Request Pattern](http://build.fhir.org/async-bundle.html). Please refer to that page for more details. Note: that page is part of the FHIR R5 current build, but uses no R5 resources, this guide is simply pre-adopting that HTTP request pattern. The response will be a URL in the Content-Location header for subsequent polling. 

The AEOB(s) will often not be complete and the calling client (or other interested systems - e.g., patient or convening provider system) will need to periodically poll the payer server in order to determine the status of the gfe-submit operation. Polling can generate the following responses:
  * If the response is in-progress, this request will return an HTTP status code of 202 Accepted, indicating that the provider should poll again later. The payer system should return a Retry-After header with each in-progress polling response, and the client should use this information to inform the timing of the next polling request. 
  * If the response is an error, this request will return an HTTP status code of 4XX or 5XX, and the body of the response will be an OperationOutcome detailing the error. 
  * If the response is successful, this request will return an HTTP status code of 200 OK, and the body of the request will be a Bundle resource of type batch-response. This batch-response bundle SHOULD contain the completed AEOB Bundle and MAY contain one or more OperationOutcome resources with additional information regarding GFE/AOEB processing. If the batch-response Bundle does not contain an AEOB Bundle, then it SHALL contain at least one OperationOutcome resource detailing the reason why the AEOB Bundle is not present (e.g. the AEOB was sent directly to the patient and will not be returned to the provider). 

#### Patient Access to AEOBs

> Note: Although technically possible, conveying the AEOB to the patient via FHIR API is optional and the workflow is contingent upon the payer opting to expose the API to the patient. The payer must return the completed AEOB to the patient, but this may be done in many ways such as via mail, the payer benefits portal, or via an API. The only method in scope for this guide is the FHIR-based API approach inspired by the Patient Access API defined in the [CARIN Consumer Directed Payer Data Exchange](https://build.fhir.org/ig/HL7/carin-bb/Use_Case.html#use-case---consumer-access-to-their-claims-data) guide. Note that use of an API is optional for the payer, and if the payer does implement both this API and the Patient Access API defined in the CARIN IG, it is up to the payer to decide if those APIs use the same or different endpoints. 

If the payer system supports access via an API, then a 3rd party app used by the patient authorizes/authenticates and receives an access token. The app requests the AEOB by using the access token using a GET request for ExplanationOfBenefit resources in the patient's compartment. For example, GET [base]/ExplanationOfBenefit?patient=[patient-id]. Payer systems SHALL implement appropriate access controls to ensure that AEOBs are only accessible by the the authenticated patient. 
  * If successful, the system will return 200 OK and the body will contain a Bundle resource of type searchset, containing zero or more ExplanationOfBenefit resources. Once the desired AEOB is found, the 3rd part app may use the same API to query for other resources referenced by the AEOB, such as Patient, Practitioner, Organization, and Coverage resources if those referenced resources are not contained in the AEOB itself. 3rd party apps should keep track of prior AEOBs, and alert the patient is new ones are found. New AEOBs would have a different identifier, and a created date later than previous AEOBs. 

#### GFE and AEOB Bundle Graphics
The below illustrates what is contained in the GFE and AEOB bundles. For full details see the PCT [FHIR Artifacts](artifacts.html#1). Of note is the <em>Bundle.identifier</em> which is used in the [AEOB query]( formal_specification.html#aeob-query). Note: For brevity not all bundle data elements are shown below.

![GFE Bundles](GFE_Bundle.png){:style="float: none;"}

**Figure 1: GFE Bundles**

![AEOB Bundle](AEOB_Bundle.png){:style="float: none;"}

**Figure 2: AEOB Bundle**

> Note: The AEOB bundle **SHALL** contain one or more AEOBs. Each AEOB **SHALL** contain a reference to the original GFE bundle.

#### AEOB Request
The [$gfe-submit]( https://build.fhir.org/ig/HL7/davinci-pct/OperationDefinition-GFE-submit.html) operation is executed by POSTing a GFE FHIR Bundle to the [$gfe-submit]( https://build.fhir.org/ig/HL7/davinci-pct/OperationDefinition-GFE-submit.html) endpoint. The server **SHALL** support JSON encoding and **MAY** support XML. The GFE FHIR Bundle will include one or more GFE resources for one patient. The GFE profiles used for the claim resources can be [found here](artifacts.html#structures-resource-profiles). Additional Bundle entries **SHALL** be populated with any resources referenced by the GFE resource (and any resources referenced by those resources, fully traversing all references, and complying with all identified profiles). Note that even if a given resource instance is referenced multiple times, it **SHALL** only appear in the Bundle once. E.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance is created - referenced from multiple places as appropriate.

Bundle.entry.fullUrl values **SHALL** be one of the following:
• the URL at which the resource is available from the Billing Management System if exposed via the client’s REST interface
• in the form “urn:uuid:[some guid]”

All GUIDs used **SHALL** be unique, including across independent GFE submissions - with the exception that the same resource instance being referenced in distinct AEOB request Bundles can have the same GUID.

In addition to these core elements, any “supporting information” resources needed to process the AEOB request must also be included in the Bundle. Relevant resources referenced by those “supporting information” resources **SHALL** also be included. Any such resource that has a US Core profile **SHALL** comply with the relevant US Core profiles. All “supporting information” resources included in the Bundle **SHALL** be pointed to by the GFE resource using the GFE.supportingInfo.valueReference element.

To attach PDFs, CDAs, JPGs, a DocumentReference instance should be used. The GFE.supportingInfo.sequence for each entry **SHALL** be unique within the GFE.

All resources **SHALL** comply with their respective profiles. FHIR elements not required (minimum cardinality of 1) or marked as ‘must support’ **MAY** be included in resources within the Bundle, but client systems should have no expectation of such elements being processed by the payer unless prior arrangements have been made. Systems that do not process such elements **SHALL** ignore unsupported elements unless they are ‘modifier’ elements, in which case the system **MAY** treat the presence of the element as an error.

This IG treats everything that happens beyond the defined operations endpoint receiving the FHIR bundle as a black box. This black box includes any business associate(s), clearinghouse(s), payers, contracted review entities, and other intermediaries that may be involved in the AEOB request and response. It is up to that black box to ensure that any other requirements are met and to perform all processing within the allowed timeframe.

#### AEOB response
Just like the AEOB request, additional Bundle entries must be present for all resources referenced by the AEOB Response or descendent references. When converting additional Bundle entries, the conversion process **SHALL** ensure that only one resource is created for a given combination of content. E.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate. When echoing back resources that are the same as were present in the AEOB request, the system **SHALL** ensure that the same fullUrl and resource identifiers are used in the response as appeared in the request.

It is possible that the incoming Bundle cannot be processed due to validation errors or other non-business-errors. In these instances, the receiving system **SHALL** return OperationOutcome instances that detail why the Bundle could not be processed and no AEOB Response will be returned.

#### AEOB Request / Response example

Example bundles can be found [here](use_cases.html#example)