### Underlying Technologies
This guide is based on the [HL7 FHIR]({{site.data.fhir.path}}index.html) standard. This architecture is intended to maximize the number of provider and payer systems that conform to this guide, as well as to allow for easy growth and extensibility of system capabilities in the future.

Implementers of this specification therefore need to understand some basic information about these referenced specifications.

#### FHIR

This implementation guide uses terminology, notations and design principles that are specific to FHIR. Before reading this implementation guide, it's important to be familiar with some of the basic principles of FHIR as well as general guidance on how to read FHIR specifications. Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following prior to reading the rest of this implementation guide.

* [FHIR Overview]({{site.data.fhir.path}}overview.html)
* [Developer's Introduction]({{site.data.fhir.path}}overview-dev.html) (or [Clinical Introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR Data Types]({{site.data.fhir.path}}datatypes.html)
* [Using Codes]({{site.data.fhir.path}}terminologies.html)
* [References Between Resources]({{site.data.fhir.path}}references.html)
* [How to Read Resource & Profile Definitions]({{site.data.fhir.path}}formats.html) and additional [IG reading guidance](https://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html)
* [Base Resource]({{site.data.fhir.path}}resource.html)


This implementation guide supports the [R4]({{site.data.fhir.path}}index.html) version of the FHIR standard and builds on the US Core [3.1.1 (USCDI v1)]({{site.data.fhir.ver.uscore3}}), [6.1 (USCDI v3)]({{site.data.fhir.ver.uscore6}}) and [7.0 (USCDI v4)]({{site.data.fhir.ver.uscore}}) implementation guides and implementers need to familiarize themselves with the profiles in those guides. The profiles in this IG conform with all three releases of US Core. 

This IG also draws on content from the [Da Vinci Health Record Exchange (HRex)]({{site.data.fhir.ver.hrex}})  and [Subscriptions R5 Backport]({{site.data.fhir.ver.subs}}) implementation guides.

Implementers should also familiarize themselves with the FHIR resources used within the guide:

<table vlass="grid">
  <thead>
    <tr>
      <th>Resource</th>
      <th>Relevance</th>
    </tr>
  </thead>
  <tbody>
    <tr><td><a href="{{site.data.fhir.path}}bundle.html">Bundle</a></td><td>Used when delivering collections of resources in several API calls</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}capabilitystatement.html">CapabilityStatement</a></td><td>Used to define conformance expectations for this guide</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}claim.html">Claim</a></td><td>The resource type used by a providers to provide a Good Faith Estimate of services or products</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}codesystem.html">CodeSystem</a></td><td>Used to define custom codes specific to this guide</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}composition.html">Composition</a></td><td>Used in document bundles to provide a single coherent statement of meaning of what is in the document and the relationship of top-level resources in the bundle</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}coverage.html">Coverage</a></td><td>Used to identify the member and the relevant insurance coverage to a payer</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}devicerequest.html">DeviceRequest</a></td><td>One of the resources that may be used in a request to contribute a GFE explaining what services or products are needed</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}documentreference.html">DocumentReference</a></td><td>A reference to estimate documents that provides metadata about the document so that the document can be discovered, managed, and notifications can be subscribed to</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}explanationofbenefit.html">ExplanationOfBenefit</a></td><td>The resource type used by a payer to provide the Advanced Explanation Of Benefit for insured members</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}location.html">Location</a></td><td>Supporting information used to identify a proposed location for services or products to be performed or delivered</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}organization.html">Organization</a></td><td>Used when identifying organizational providers or facilities in GFE Coordination Tasks and involved in the services or products listed in the GFEs, and payers for which an AEOB is being requested</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}medication.html">Medication</a></td><td>Supporting information for medication requests</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}medicationrequest.html">MedicationRequest</a></td><td>One of the resources that may be used in a request to contribute a GFE explaining what services or products are needed</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}nutritionorder.html">NutritionOrder</a></td><td>One of the resources that may be used in a request to contribute a GFE explaining what services or products are needed</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}operationdefinition.html">OperationDefinition</a></td><td>Defines the parameters and requirements for an operation. THis guide defined a few use case specific operations</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}operationoutcome.html">OperationOutcome</a></td><td>Provides sets of error, warning and information messages that provide detailed information about the outcome of an attempted system operation.</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}patient.html">Patient</a></td><td>Demographic information relevant to all requests</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}practitioner.html">Practitioner</a></td><td>Used when identifying individual practitioner providers or facilities in GFE Coordination Tasks and involved in the services or products listed in the GFEs</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}practitionerrole.html">PractitionerRole</a></td><td>Used when identifying practitioner provider roles in GFE Coordination Tasks</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}searchparameter.html">SearchParameter</a></td><td>Defines the a searchable element defined by this IG used for searching and subscriptions</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}servicerequest.html">ServiceRequest</a></td><td>One of the resources that may be used in a request to contribute a GFE explaining what services or products are needed</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}structuredefinition.html">StructureDefinition</a></td><td>Used when profiling resources and defining extensions</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}subscription.html">Subscription</a></td><td>A resource used to define a push-based subscription from a server to another system.</td></tr>
    <tr><td><a href="https://hl7.org/fhir/R5/subscriptiontopic.html">SubscriptionTopic</a></td><td>A resource used define a set of events that a client can subscribe to. This resource is defined in FHIR 4B and later versions. Be aware that this resource is not supported by FHIR R4 systems. Subscription Topics in R4 can be defined using a Basic profile resource with extensions.</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}task.html">Task</a></td><td>Used to manage dispatching to GFE contributing providers</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}valueset.html">ValueSet</a></td><td>Used to define collections of codes used by PCT profiles</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}visionprescription.html">VisionPrescription</a></td><td>One of the resources that may be used in a request to contribute a GFE explaining what services or products are needed</td></tr>
  </tbody>
</table>


## Relationship to Other Implementation Guides

### Good Faith Estimate Coordination Relationships

<figure>
{% include gfe_coordination.svg %}
</figure>

### Good Faith Estimate Relationships

<figure>
{% include gfe.svg %}
</figure>

### Advanced Explanation Of Benefit Relationships

<figure>
{% include aeob.svg %}
</figure>

### US Core
Provider billing and payer claims adjudication systems for those profiles defined by US Core **SHALL** use the specification defined by [US Core]({{site.data.fhir.ver.hl7_fhir_us_core}}/index.html) in exchanging information with payers. Implementers should be familiar with this specification. Claim, ExplanationOfBenefit and Coverage resource profiles are not defined by US Core.

Da Vinci PCT implementations **SHALL** conform to the US Core IG [General Guidance]({{site.data.fhir.ver.uscore}}/general-guidance.html) requirements where US Core IG resources are used.


### Da Vinci HRex
Provider billing and payer systems **SHALL** use the specification defined by the Da Vinci HRex IG [Da Vinci HRex IG]({{site.data.fhir.ver.hl7_fhir_us_davinci_hrex}}/index.html) when exchanging information, as defined by [the Privacy and Security section of this IG](security.html). Implementers should be familiar with this specification.

