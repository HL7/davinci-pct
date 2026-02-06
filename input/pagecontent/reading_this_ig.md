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


| Resource | Relevance |
|---|---|---|
| [Bundle]({{site.data.fhir.path}}bundle.html) | Used when delivering collections of resources in several API calls |
| [CapabilityStatement]({{site.data.fhir.path}}capabilitystatement.html) | Used to define conformance expectations for this guide |
| [Claim]({{site.data.fhir.path}}claim.html) | The resource type used by a providers to provide a Good Faith Estimate of services or products |
| [CodeSystem]({{site.data.fhir.path}}codesystem.html) | Used to define custom codes specific to this guide |
| [Composition]({{site.data.fhir.path}}composition.html)[Composition] | Used in document bundles to provide a single coherent statement of meaning of what is in the document and the relationship of top-level resources in the bundle |
| [Coverage]({{site.data.fhir.path}}coverage.html) | Used to identify the member and the relevant insurance coverage to a payer |
| [DeviceRequest]({{site.data.fhir.path}}devicerequest.html) | One of the resources that may be used in a request to contribute a GFE explaining what services or products are needed |
| [DocumentReference]({{site.data.fhir.path}}documentreference.html) | A reference to estimate documents that provides metadata about the document so that the document can be discovered, managed, and notifications can be subscribed to |
| [ExplanationOfBenefit]({{site.data.fhir.path}}explanationofbenefit.html) | The resource type used by a payer to provide the Advanced Explanation Of Benefit for insured members |
| [Location]({{site.data.fhir.path}}location.html) | Supporting information used to identify a proposed location for services or products to be performed or delivered |
| [Organization]({{site.data.fhir.path}}organization.html) | Used when identifying organizational providers or facilities in GFE Coordination Tasks and involved in the services or products listed in the GFEs, and payers for which an AEOB is being requested |
| [Medication]({{site.data.fhir.path}}medication.html) | Supporting information for medication requests |
| [MedicationRequest]({{site.data.fhir.path}}medicationrequest.html) | One of the resources that may be used in a request to contribute a GFE explaining what services or products are needed |
| [NutritionOrder]({{site.data.fhir.path}}nutritionorder.html) | One of the resources that may be used in a request to contribute a GFE explaining what services or products are needed |
| [OperationDefinition]({{site.data.fhir.path}}operationdefinition.html) | Defines the parameters and requirements for an operation. THis guide defined a few use case specific operations |
| [OperationOutcome]({{site.data.fhir.path}}operationoutcome.html) | Provides sets of error, warning and information messages that provide detailed information about the outcome of an attempted system operation. |
| [Patient]({{site.data.fhir.path}}patient.html) | Demographic information relevant to all requests |
| [Practitioner]({{site.data.fhir.path}}practitioner.html) | Used when identifying individual practitioner providers or facilities in GFE Coordination Tasks and involved in the services or products listed in the GFEs |
| [PractitionerRole]({{site.data.fhir.path}}practitionerrole.html) | Used when identifying practitioner provider roles in GFE Coordination Tasks |
| [SearchParameter]({{site.data.fhir.path}}searchparameter.html) | Defines the a searchable element defined by this IG used for searching and subscriptions |
| [ServiceRequest]({{site.data.fhir.path}}servicerequest.html) | One of the resources that may be used in a request to contribute a GFE explaining what services or products are needed |
| [StructureDefinition]({{site.data.fhir.path}}structuredefinition.html) | Used when profiling resources and defining extensions |
| [Subscription]({{site.data.fhir.path}}subscription.html) | A resource used to define a push-based subscription from a server to another system. |
| [SubscriptionTopic](https://hl7.org/fhir/R5/subscriptiontopic.html) | A resource used define a set of events that a client can subscribe to. This resource is defined in FHIR 4B and later versions. Be aware that this resource is not supported by FHIR R4 systems. Subscription Topics in R4 can be defined using a Basic profile resource with extensions. |
| [Task]({{site.data.fhir.path}}task.html) | Used to manage dispatching to GFE contributing providers |
| [ValueSet]({{site.data.fhir.path}}valueset.html) | Used to define collections of codes used by PCT profiles |
| [VisionPrescription]({{site.data.fhir.path}}visionprescription.html) | One of the resources that may be used in a request to contribute a GFE explaining what services or products are needed |


## Relationship to Other Implementation Guides

### Good Faith Estimate Coordination Relationships

{% include gfe_coordination.svg %}

### Good Faith Estimate Relationships

{% include gfe.svg %}

### Advanced Explanation Of Benefit Relationships

{% include aeob.svg %}

### US Core
<span class="fhir-conformance">Provider billing and payer claims adjudication systems for those profiles defined by US Core **SHALL** use the specification defined by [US Core]({{site.data.fhir.ver.hl7_fhir_us_core}}/index.html) in exchanging information with payers</span>. Implementers must be familiar with this specification. Claim, ExplanationOfBenefit and Coverage resource profiles are not defined by US Core.

<span class="fhir-conformance">Da Vinci PCT implementations **SHALL** conform to the US Core IG [General Guidance]({{site.data.fhir.ver.uscore}}/general-guidance.html) requirements where US Core IG resources are used</span>.


### Da Vinci HRex
<span class="fhir-conformance">Provider billing and payer systems **SHALL** use the specification defined by the Da Vinci HRex IG [Da Vinci HRex IG]({{site.data.fhir.ver.hl7_fhir_us_davinci_hrex}}/index.html) when exchanging information, as defined by [the Privacy and Security section of this IG](security.html)</span>. Implementers must be familiar with this specification.

