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

The primary interaction supported by this implementation guide is submitting an AEOB request and receiving an AEOB response. To perform this, a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resource is constructed by the client (e.g., Billing Management Software) system. The response is an [AEOB Bundle](StructureDefinition-davinci-pct-aeob-bundle.html).

The GFE Bundle will be sent as the sole payload of a [$gfe-submit]( https://build.fhir.org/ig/HL7/davinci-pct/OperationDefinition-GFE-submit.html) operation. The response will be an AEOB Bundle which will contain a Bundle.identifier. The Bundle.identifier is important because the response will happen in an asynchronous fashion.

The AEOB(s) will often not be complete and the calling client (or other interested systems - e.g., patient or convening provider system) will need to periodically poll the payer server in order to determine if the AEOB(s) are complete. Below are the outcomes that **SHOULD** be used to determine if the AEOB(s) are complete.   

The AEOB bundle will contain one of these **outcomes** [queued | complete | error | partial
](https://build.fhir.org/ig/HL7/davinci-pct/StructureDefinition-davinci-pct-aeob-definitions.html#ExplanationOfBenefit.outcome).

The client (or other interested systems - e.g., patient or convening provider system) can now query the endpoint outcome status using the [polling mechanism](https://build.fhir.org/ig/HL7/davinci-pct/formal_specification.html#polling). 

Once all the AEOB(s) have an outcome equal to `complete`, the client (or other interested systems - e.g., patient or convening provider system) can perform a FHIR query to receive the completed AEOB bundle.  

> Note: Although technically possible, conveying the AEOB to the patient via FHIR API is optional and the workflow is contingent upon the payer opting to expose the API to the patient.

#### GFE and AEOB Bundle Graphics
The below illustrates what is contained in the GFE and AEOB bundles. For full details see the PCT [FHIR Artifacts](artifacts.html#1). Of note is the <em>Bundle.identifier</em> which is used in the [AEOB query]( formal_specification.html#aeob-query). Note: For brevity not all bundle data elements are shown below.

![GFE Bundles](GFE_Bundle.png){:style="float: none;"}

**Figure 1: GFE Bundles**

![AEOB Bundle](AEOB_Bundle.png){:style="float: none;"}

**Figure 2: AEOB Bundle**

> Note: The AEOB bundle **SHALL** contain one or more AEOBs. Each AEOB **SHALL** contain a reference to the original GFE bundle.

#### AEOB Request 
The [$gfe-submit]( https://build.fhir.org/ig/HL7/davinci-pct/OperationDefinition-GFE-submit.html) operation is executed by POSTing a GFE FHIR Bundle to the [$gfe-submit]( https://build.fhir.org/ig/HL7/davinci-pct/OperationDefinition-GFE-submit.html) endpoint. The Bundle **SHALL** be encoded in JSON. The GFE FHIR Bundle will include one or more GFE resources for one patient. The GFE profiles used for the claim resources can be [found here](artifacts.html#structures-resource-profiles). Additional Bundle entries **SHALL** be populated with any resources referenced by the GFE resource (and any resources referenced by those resources, fully traversing all references, and complying with all identified profiles). Note that even if a given resource instance is referenced multiple times, it **SHALL** only appear in the Bundle once. E.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance is created - referenced from multiple places as appropriate. 

Bundle.entry.fullUrl values **SHALL** be:<br>
• the URL at which the resource is available from the Billing Management System if exposed via the client’s REST interface;<br>
or<br>
• the form “urn:uuid:[some guid]”

All GUIDs used **SHALL** be unique, including across independent GFE submissions - with the exception that the same resource instance being referenced in distinct AEOB request Bundles can have the same GUID.

In addition to these core elements, any “supporting information” resources needed to process the AEOB request must also be included in the Bundle. Relevant resources referenced by those “supporting information” resources **SHALL** also be included. Any such resource that has a US Core profile **SHALL** comply with the relevant US Core profiles. All “supporting information” resources included in the Bundle **SHALL** be pointed to by the GFE resource using the GFE.supportingInfo.valueReference element.

To attach PDFs, CDAs, JPGs, a DocumentReference instance should be used. The GFE.supportingInfo.sequence for each entry **SHALL** be unique within the GFE.

All resources **SHALL** comply with their respective profiles. FHIR elements not marked as ‘must support’ **MAY** be included in resources within the Bundle, but client systems should have no expectation of such elements being processed by the payer unless prior arrangements have been made. Systems that do not process such elements **SHALL** ignore unsupported elements unless they are ‘modifier’ elements, in which case the system **MAY** treat the presence of the element as an error.
This IG treats everything that happens beyond the defined operations endpoint receiving the FHIR bundle as a black box. This black box includes any business associate(s), clearinghouse(s), payers, contracted review entities, and other intermediaries that may be involved in the AEOB request and response. It is up to that black box to ensure that any other requirements are met and to perform all processing within the allowed timeframe.

#### AEOB response
Just like the AEOB request, additional Bundle entries must be present for all resources referenced by the AEOB Response or descendent references. When converting additional Bundle entries, the conversion process **SHALL** ensure that only one resource is created for a given combination of content. E.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate. When echoing back resources that are the same as were present in the AEOB request, the system **SHALL** ensure that the same fullUrl and resource identifiers are used in the response as appeared in the request.

It is possible that the incoming Bundle cannot be processed due to validation errors or other non-business-errors. In these instances, the receiving system **SHALL** return OperationOutcome instances that detail why the Bundle could not be processed and no AEOB Response will be returned.

<blockquote class="stu-note">
<p>
The project is seeking feedback on what errors should be returned in the OperationOutcome.
</p>
</blockquote>

These errors are NOT the errors that are detected by the system processing the request and that can be conveyed in a AEOB Response via the error capability. The resulting AEOB Bundle is returned in the HTTP body of the POST response.

#### AEOB Query

This is done by performing GET [base]/Bundle?identifier=1234

Note: 1234 is the Bundle.identifier.

##### Polling
In this approach, the Client regularly queries the Server to see if the status of the AEOB bundle has changed.

This is done by performing the [AEOB query]( formal_specification.html#aeob-query) several times. The details are described below.

Clients **SHALL** perform this operation in an automated/background manner no more than every 5 minutes for the first 30 minutes and no more frequently than once every hour after that. They **SHOULD** perform this query at least once every 12 hours. Clients **SHALL** support manual invocation of the query by users. There are no constraints on frequency of manual queries.

<blockquote class="stu-note">
<p>
The project is seeking feedback on whether these maximum frequency requirements are acceptable.
</p>
</blockquote>

Note: The returned AEOB bundle **SHALL** include the current results for all submitted items and/or services.

#### AEOB Request / Response example

Example bundles can be found [here](use_cases.html#example)

### Privacy & Security Considerations
The sharing of information from provider to payer for determining an AEOB is subject to HIPAA's "minimum necessary" regulations (specifically 45 CFR 164.514(d)(3) and (d)(4)). Payers are responsible for ensuring that only information necessary to create an AEOB is solicited, and providers are responsible for ensuring that only data that is reasonably relevant to creating an AEOB is transmitted.

Some of the data shared as part of the AEOB process may have associated constraints on the use of that information for other purposes, including subsequent disclosure to other payers, practitioners, policyholders, etc. While HL7 FHIR supports conveying this information via security labels on transmitted resources, this information is not currently mappable (and thus findable) in the X12 837 transactions. Payers who do not view the FHIR version of the transmitted information should be aware of the possibility of these limitations and ensure they have policies that enforce appropriate sharing constraints on data.

In order to access information about an AEOB, the provider system will need to access the payer system. This will require that the provider system authenticates to the payer system or an intermediary. The specifics of how this authentication are covered is handled within the Da Vinci HRex Implementation guide. PCT Servers **SHOULD** support server-server OAuth and **MAY** support mutually authenticated TLS. In a future release of this guide, direction will limit the option to server-server OAuth. Every system claiming conformance to this IG **SHALL** meet the requirements defined in the [Security and Privacy section of the Da Vinci HRex IG](http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html). The FHIR implementer’s [Safety Checklist](http://hl7.org/fhir/R4/safety.html) helps implementers be sure that they have considered all the parts of FHIR that impact their system design regarding privacy, security, provenance, and safety.

Once the system authentication has occurred, the payer will perform any authorization required for the provider to see the current state of the AEOB.
