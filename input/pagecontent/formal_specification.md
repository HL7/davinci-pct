This section of the implementation guide (IG) defines the specific conformance requirements for systems wishing to conform to this Patient Cost Transparency (PCT) IG. The bulk of it focuses on Good Faith Estimate (GFE) submission [$gfe-submit](OperationDefinition-GFE-submit.html) and an Advanced Explanation of Benefits (AEOB) query, though it also provides guidance on privacy, security, and other implementation requirements.

## Context

### Pre-reading
Before reading this formal specification, implementers should first familiarize themselves with two other key portions of the specification:

* The [Use Case](use_cases.html) page provides context for the intent and general process flow of this formal specification.

* The [Reading This IG](reading_this_ig.html) page provides information about the underlying structure and specifications and indicates what portions should be read and understood to have the necessary foundation for the constraints and usage guidance described here.



### Conventions and conformance language

This implementation guide uses specific terminology such as **SHALL**, **SHOULD**, **MAY** to flag statements that have relevance for the evaluation of conformance with the guide.  As well, profiles in this implementation guide make use of the [mustSupport]({{site.data.fhir.path}}profiling.html#mustsupport) requirement.  Base expectations for the interpretation of these terms are set in the [FHIR core specification]({{site.data.fhir.path}}conformance-rules.html#conflang) and general Da Vinci-wide expectations are [defined in HRex]({{site.data.fhir.ver.hrex}}/conformance.html).

This implementation guide (IG) uses specific terminology to flag statements that have relevance for the evaluation of conformance with the guide:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that are strongly recommended (and which may result in interoperability issues or sub-optimal behavior if not adhered to), but which do not, for this version of the specification, affect the determination of specification conformance.

* **MAY** describes optional behaviors that are free to consider but are not a recommendation for or against adoption.


### MustSupport ###

The following rules regarding Must Support  elements apply to all Profiles in this guide. The Must Support definitions are not inherited from other IGs, even for profiles in this guide derived from another guide.

Sender:
* The sender **SHALL** send the data element if the sender maintains the data element and is authorized to share it.
    * Data elements that the sender maintains includes data elements available in the systems under the sender’s control.

    * If the sender does not capture/store the data, the data is not available, or sharing of the data is not authorized, the system **SHOULD NOT** send the element if the element is not marked as mandatory (lower cardinality of 0).
 
Receiver:

* The receiver **SHALL** be capable of processing resource instances containing must-support data elements without generating an error or causing the application to fail.
* The receiver **SHOULD** be capable of displaying must support data elements for human use.
* The receiver **SHALL** be able to process resource instances containing must-support data elements asserting missing information (data absent reason extension).

This guide uses technical actors to define Must Support conformance requirements.

Also see the mustSupport rules for the [HRex]({{site.data.fhir.ver.hrex}}/conformance.html#mustsupport) and [US Core]({{site.data.fhir.ver.uscore}}/must-support.html) implementation guides, which apply to content adhering to data elements profiled in those guides.

### CapabilityStatement Requirements ###
In order to conform to this implementation guide, in addition to adhering to any relevant 'SHALL' statements, a system **SHALL** conform to at least one of the CapabilityStatements based on their role(s) listed here:

* [PCT Coordination Platform](CapabilityStatement-davinci-pct-coordination-platform.html) - Coordination Platform Capability Statement for the Da Vinci Patient Cost Transparency Implementation Guide
* [PCT Coordination Requester](CapabilityStatement-davinci-pct-coordination-requester.html) - Coordination Requester Capability Statement for the Da Vinci Patient Cost Transparency Implementation Guide
* [PCT GFE Contributor](CapabilityStatement-davinci-pct-gfe-contributor.html) - GFE Contributor Capability Statement for the Da Vinci Patient Cost Transparency Implementation Guide
* [PCT Payer](CapabilityStatement-davinci-pct.html) - Payer capability statement for the Da Vinci Patient Cost Transparency Implementation Guide


Additionally, any servers claiming conformance to this guide **SHALL** include provide CapabilityStatement at `/metadata` that has a `CapabilityStatement.instantiates` with one or more Canonical values of the associated CapabilityStatement canonical, according to the role or roles it is supporting along with the version (e.g. `http://hl7.org/fhir/us/davinci-pct/CapabilityStatement/davinci-pct-coordination-platform|2.0.0`). 



Note: this may be used by clients to determine what services the server and versions of the capabilities the server supports.

### Ongoing Data Retention and Access ####
This IG does not provide specific requirements for data retention and access except for where it directly ties to the primary workflow and use case. Details for continued retention and access after the workflow has concluded are not defined in this guide. Implementers should recognize that the data covered in this guide is likely to be considered part of the patient's medical record and as such would be subject to the same retention and access requirements as any other information in the patient's medical record.


### Profiles
This specification makes significant use of [FHIR profiles]({{site.data.fhir.path}}profiling.html) and terminology artifacts to describe the content to be shared as part of AEOB requests and responses.

The full set of profiles defined in this IG can be found by following the links on the [Artifacts](artifacts.html) page.

## Workflow Specific Specifications

Additional specifications for the two workflows in this guide can be found on the following pages:

- [GFE Coordination Specification](gfe_coordination_specification.html) -  Requirements to support the ability for a provider to request and collect one or more GFEs from other providers that may participate in a set of procedures related to patient’s period of care for which a GFE is required, either to provide to the patient and/or to submit to a payer.

- [GFE Submission and AEOB Specification](gfe_submission_and_aeob_specification.html) - Requirements to support the ability for a provider to submit a collection of one or more GFEs to a payer for them to process and produce an [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) to the patient and optionally to the provider.
