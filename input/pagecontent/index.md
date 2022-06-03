<blockquote class="stu-note">
<p>
This specification is a Standard for Trial Use. It is expected to continue to evolve and improve through connectathon testing and feedback from early adopters.
</p>
<p>
Feedback is welcome and may be submitted through the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> indicating "US Da Vinci PCT" as the specification.
</p>
<p>
This implementation guide is dependent on other specifications. Please submit any comments you have on these base specifications as follows:
</p>
<ul>  
  <li>Feedback on the FHIR core specification should be submitted to the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> with "FHIR Core" as the specification. </li>
  <li>Feedback on the US core profiles should be submitted to the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> with "US Core" as the specification. </li>
</ul>
<p>
Individuals interested in participating in the Patient Cost Transparency project or other HL7 Da Vinci projects can find information about Da Vinci <a href="http://www.hl7.org/about/davinci">here</a>.
</p>
</blockquote>

### Overview
This implementation guide (IG) defines an exchange mechanism for providers to request and receive cost information from a payer regarding a service or item. This exchange will result in an Advanced Explanation of Benefits (AEOB) which will help inform a clinician and patient cost conversation. Note: This exchange will be triggered via a “request” or “scheduled service”. The AEOB will also include the GFE(s) (Good Faith Estimate) used to inform the AEOB generation.

The goal of this IG is to support the request for cost information for specific services and items from the payer and return it to enable better decision making by the patient in consultation with the provider. The project team plans to work with existing FHIR artifacts where possible. If changes are necessary the project team will work with the responsible Work Group to review and implement (via Jira items or new PSS) any necessary enhancements to base FHIR resources, extensions, and/or profiles.

This project will reference where possible the ‘standards’ defined by the Health Record exchange ([HRex](http://hl7.org/fhir/us/davinci-hrex/2020Sep/)) Library/Framework Implementation Guide and other FHIR IGs where applicable.

Since this IG describes a series of FHIR based use cases the use of X12 standards is not required. X12 will only be used to inform the PCT APIs. An implementer is not required to use X12 and there is no HIPAA mandate to do so.

Currently, there is no specific mandate dictating the Da Vinci Patient Cost Transparency IG work. Instead, this IG is informed by the No Surprises Act, which was enacted as part of the Consolidated Appropriations Act, 2021. The No Surprises Act specifically requires that providers share GFE(s) with a payer and that a payer make an AEOB available to a patient in advance of service. The initial scope of this IG was inspired by this general requirement. While rulemaking has not yet addressed how specifically this general requirement will need to be implemented, this IG is being developed to support the flow of the necessary information from providers to the payer, to a patient. Subsequent iterations of this IG or other IGs will take into consideration any relevant future regulation or legislation, as appropriate or upon request. We welcome feedback on this topic.

<blockquote class="stu-note">
<ul>  
    <li>We ask the reader to please review all data elements. Are all the data elements in this IG required to produce an AEOB? Note: This IG was not produced to handle claims, but it was informed by X12 837 data elements. We are soliciting feedback on this topic.</li>
    <li>During the develop of this IG the question arose on how related GFEs should be linked. Especially if they arrive at different times. If a linking ID is used at the GFE level, how should it be used? We are looking for feedback on this topic.</li>
</ul>
</blockquote>

Acronyms used in this IG can be found [here](use_cases.html#terms-and-concepts). The reader of this IG should become familiar with these before reading this IG.

**AEOB Interaction Diagram Steps (High Level View)**

1. A patient schedules a service which triggers the composition of a collection of 1 or more GFEs. <em>Note: The composition of the collection of GFEs is currently not in scope for this IG. In other words, how the scheduling provider coordinates with other providers is currently not in scope for this IG. </em>

2. The collection of GFEs in the form of a FHIR resource bundle (GFE Bundle) is submitted (via the [gfe-submit operation](OperationDefinition-GFE-submit.html) to the payer’s intermediary or payer’s endpoint for AEOB creation.  

3. The payer’s intermediary (or payer) can translate the GFE Bundle to X12. The payer would then process, adjudicate, and produce the AEOB bundle. <em>Note: Translating the GFE bundle to X12 or any other format is not required to be conformant with this IG. </em>

4. The patient can now request and receive the AEOB Bundle via FHIR query.

>Note: The patient below could be a third-party web portal or provider web portal.     

![AEOB Interaction Diagram](AEOB-interaction.drawio.png){:style="float: none;"}

**Figure 1: Advanced EOB Interactions**
