This section of the implementation guide defines the specific conformance requirements for systems wishing to conform to this Patient Cost Transparency (PCT) implementation guide. The bulk of it focuses on the GFE $submit operation and AEOB $query AEOB operations, though it also provides guidance on privacy, security, and other implementation requirements.

### Context

#### Pre-reading
Before reading this formal specification, implementers should first familiarize themselves with two other key portions of the specification:

* The [Use Case](usecases.html) page provides context for what this formal specification is trying to accomplish and will give a sense of both the business context and general process flow enabled by the formal specification below.

* The [Technical Background](background.html) page provides information about the underlying specifications and indicates what portions of them should be read and understood to have the necessary foundation to understand the constraints and usage guidance described here.

#### Conventions
This implementation guide uses specific terminology to flag statements that have relevance for the evaluation of conformance with the guide:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that are strongly recommended (and which may result in interoperability issues or sub-optimal behavior if not adhered to), but which do not, for this version of the specification, affect the determination of specification conformance.

* **MAY** describes optional behaviors that are free to consider but where the is no recommendation for or against adoption.

#### Systems

This implementation guide sets expectations for two types of systems:

* **Client** systems are electronic medical records, pharmacy systems (for drugs that are part of a medical benefit) and other clinical and administrative systems responsible for requesting AEOBs
* **Payer** systems are systems run by insurers, clearing houses and other organizations that are responsible for relaying or responding to requests for patient cost information

#### Profiles
This specification makes significant use of [FHIR profiles]({{site.data.fhir.path}}profiling.html) and terminology artifacts to describe the content to be shared as part of AEOB requests and responses.

The full set of profiles defined in this implementation guide can be found by following the links on the [Artifacts](artifacts.html) page.

#### Integration with other Implementation Guides
* Implementations of the PCT implementation guide SHALL support the [US Core R4 IG]({{site.data.fhir.ver.hl7_fhir_us_core}}) profiles for USCoreOrganizationProfile and USCorePatientProfile. They SHOULD support any other profiles relevant to the types of AEOBs they process. 
* Clients and Servers supporting this implementation guide SHOULD comply with the Security and Privacy page in the [Da Vinci HRex IG](http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html).
* Clients and Servers supporting this implementation guide SHOULD comply with some value sets that are referenced in this IG that are also used by the [CARIN for Blue Button® IG](https://build.fhir.org/ig/HL7/carin-bb/artifacts.html#terminology-value-sets). 

>Note: At this time the use of the CARIN for Blue Button® IG value sets are under discussion. It is possible and probable similar or equivalent value sets will be used instead and they will be hosted by another steward / author.    

### Detailed Requirements 

#### Summary
NOTE FHIR uses a pair of resources called Claim and EOB for multiple purposes - they are used for actual claim submission, but they are also used for managing prior authorizations and pre-determinations. These are distinguished by the Claim.use code. All references to Claim and EOB in this implementation guide are using it for the Advanced Explanation of Benefits (AEOB) purpose.

The primary interaction supported by this implementation guide is submitting a AEOB request and receiving back a response. To perform this, a [PCTBundle](StructureDefinition-davinci-pct-request-bundle.html) resource is constructed by the client (e.g., EHR) system. That Bundle will contain a [GFE](StructureDefinition-davinci-pct-gfe.html) resource (which FHIR uses to submit AEOB requests). 

TODO - PCT Bundle Content graphic

This Bundle will then be sent as the sole payload of a GFE/$submit operation. The response will be a FHIR Bundle containing an AEOB. If the AEOB cannot be created, and a final response returned within the required timeframe, a response in which one or more of the requested GFE items are ‘active’ will be returned. The client (or other interested systems - e.g., patient, caregiver or performing provider systems) can then query the endpoint for the final results using a polling mechanism. 

TODO - PCT Submission Interaction Diagram graphic

#### AEOB Request
The GFE/$submit operation is executed by POSTing a FHIR Bundle to the [base url]/GFE/$submit endpoint. The Bundle SHALL be encoded in JSON. The first entry in the Bundle SHALL be a GFE resource complying with the [GFE profile](StructureDefinition-davinci-pct-gfe.html)          
defined in this IG. Additional Bundle entries SHALL be populated with any resources referenced by the GFE resource (and any resources referenced by those resources, fully traversing all references, and complying with all identified profiles). Note that even if a given resource instance is referenced multiple times, it SHALL only appear in the Bundle once. E.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate. Bundle.entry.fullUrl values SHALL be:

• the URL at which the resource is available from the EHR if exposed via the client’s REST interface; or

• the form “urn:uuid:[some guid]”

All GUIDs used SHALL be unique, including across independent GFE submissions - with the exception that the same resource instance being referenced in distinct AEOB request Bundles can have the same GUID.

In addition to these core elements, any “supporting information” resources needed to process the AEOB request must also be included in the Bundle. Relevant resources referenced by those “supporting information” resources SHALL also be included. Any such resource that has a US Core profile SHALL comply with the relevant US Core profiles. All “supporting information” resources included in the Bundle SHALL be pointed to by the GFE resource using the GFE.supportingInfo.valueReference element. 

To attach PDFs, CDAs, JPGs, a DocumentReference instance should be used. The GFE.supportingInfo.sequence for each entry SHALL be unique within the GFE.

All resources SHALL comply with their respective profiles. FHIR elements not marked as ‘must support’ MAY be included in resources within the Bundle, but client systems should have no expectation of such elements being processed by the payer unless prior arrangements have been made. Systems that do not process such elements SHALL ignore unsupported elements unless they are ‘modifier’ elements, in which case the system MAY treat the presence of the element as an error.
This IG treats everything that happens beyond the defined operations endpoint receiving the FHIR bundle as a black box. This black box includes any business associate(s), clearinghouse(s), payers, contracted review entities, and other intermediaries that may be involved in the AEOB request and response. It is up to that black box to ensure that any other requirements are met and to perform all processing within the allowed timeframe.

#### AEOB response
Just like the AEOB request, additional Bundle entries must be present for all resources referenced by the AEOB Response or descendent references. When converting additional Bundle entries, the conversion process SHALL ensure that only one resource is created for a given combination of content. E.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate. When echoing back resources that are the same as were present in the AEOB request, the system SHALL ensure that the same fullUrl and resource identifiers are used in the response as appeared in the request.
It is possible that the incoming Bundle cannot be processed due to validation errors or other non-business-errors. In these instances, the receiving system SHALL return OperationOutcome instances that detail why the Bundle could not be processed and no AEOB Response will be returned. These errors are NOT the errors that are detected by the system processing the request and that can be conveyed in a AEOB Response via the error capability.
The resulting Bundle is returned as the HTTP body of the POST response.

#### AEOB Inquiry

This is done by performing a [AEOB inquiry operation](OperationDefinition-AEOB-inquiry.html)

##### Polling
In this approach, the Client regularly queries the Server to see if the status of the davinci-pct-aeob has changed. This is done by performing a [AEOB inquiry operation](OperationDefinition-AEOB-inquiry.html).

Clients SHALL perform this operation in an automated/background manner no more than every 5 minutes for the first 30 minutes and no more frequently than once every hour after that. They SHOULD perform this query at least once every 12 hours. Clients SHALL support manual invocation of the query by users. There are no constraints on frequency of manual queries.

<blockquote class="stu-note">
<p>
The project is seeking feedback on whether these maximum frequency requirements are acceptable.
</p>
</blockquote>

Notes:
* The returned davinci-pct-aeob SHALL include the current results for all submitted items. 

##### Full Request 

MRI Scenario

Assumptions: 
• Patient has single commercial insurance coverage and plans to use it 
• This is clinically appropriate (Clinical Decision Support (CDS) Score) 
• Service Location is known (e.g., Address) 
• All providers are in network - PCP, imaging facility, and reading radiologist 
• If required, Prior Authorization is indicated as a disclaimer 

1.  Eve Betterhalf sees Dr. Patricia Primary (PCP) at ABC Medical Group on Monday with a prolonged migraine headaches lasting over a 4-month period. Dr. Primary says let's do a brain MRI (CPT 70551.) 
2.  She walks to the PCP front desk, they enter the order into the EMR system, and direct the patient to ABC’s Radiology department. 
3.  Radiology reviews the order for completeness and accuracy and confirms all needed information is present. 
4.  The next day, Eve calls the radiology facility (Office of Dr. Christine Curie, NPI - 1234567893) to schedule her brain MRI, CPT 70551 and provide her coverage information, which she plans to use. 
5.  The MRI is scheduled for 9 days from today. This triggers the process for an Advanced EOB to be sent. 
6.  Optionally, Eve can also login to the Radiology’s site to download the information about her expected services, should she want to request an estimate separately. 
7.  The ABC’s Radiology Office Administrator enters the services and coverage information, initiates the process with other potential providers to generate the Good Faith Estimate for costs and services. 
8.  This information is sent to the payer. 
9.  The payer receives the good faith estimate, adjudicates it to determine patient costs and sends the Advanced EOB (including the GFE) securely to Eve. 
10. Optionally, the payer also sends a response to ABC’s Radiology Office Administrator with the same cost estimate information. 
11. Eve receives the Advanced EOB from her payer based on the information provided by ABC Radiology. 

###### Full Request Example - WIP
An example of a changed full request can be found at [MRI Scenario](Bundle-MRIScenarioExample.html).

### Privacy & Security Considerations
The profiles in this IG are defined to ensure sufficient information to properly populate the X12 specifications, though they also allow for additional data to be present. As well, the data elements in the X12 specifications are allowed to be omitted - what data is required by the payer to process an AEOB request is context and business-rule-specific. Implementers submitting AEOB requests are not required to use X12. X12 has only been used to inform the FHIR based data elements in this IG.

The sharing of information from provider to payer for determining an AEOB is not subject to HIPAA's "minimum necessary" regulations (specifically 45 CFR 164.514(d)(3) and (d)(4)). Payers are responsible for ensuring that only information necessary to create an AEOB is solicited, and providers are responsible for ensuring that only data that is reasonably relevant to creating an AEOB is transmitted.

Some of the data shared as part of the AEOB process may have associated constraints on the use of that information for other purposes, including subsequent disclosure to other payers, practitioners, policyholders, etc. While HL7 FHIR supports conveying this information via security labels on transmitted resources, this information is not currently mappable (and thus findable) in the X12 837 transactions. Payers who do not view the FHIR version of the transmitted information should be aware of the possibility of these limitations and ensure they have policies that enforce appropriate sharing constraints on data.

In order to access information about an AEOB, the provider system will need to access the payor system. This will require that the provider system authenticates to the payer system or an intermediary. The specifics of how this authentication are covered is handled within the Da Vinci HRex Implementation guide. PCT Servers SHOULD support server-server OAuth and MAY support mutually authenticated TLS. In a future release of this guide, direction will limit the option to server-server OAuth. Every system implementing the PCT guide will need to be aware of and follow the guidance in the FHIR Core Specification on [Clinical Safety](http://hl7.org/fhir/safety.html) and the [Security and Privacy page in the Da Vinci HRex guide](http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html).

Once the system authentication has occurred, the payer will perform any authorization required for the provider to see the current state of the AEOB.

### Testing Requirements
It is the intent of this implementation guide to provide specifications for the exchange of patient costs in a way that is conducive to developing test scripts and a reference implementation (RI) that can be used to validate/exercise the IG at Connectathons and during piloting and production deployment. It is also the intent of this guide that any test scripts will include testing of: 

1. resources and profiles defined in this guide
2. artifacts use from referenced IGs and
3. testing of conformance to the underlying FHIR standards for the associated release (e.g., FHIR R4). 

<!--### TODO

 Add missing graphics and artifacts

-->


