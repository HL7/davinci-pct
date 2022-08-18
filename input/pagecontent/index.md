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
This IG provides detailed guidance for providers and payers to exchange data using FHIR-based standards to support sharing financial information for specific services and items. This exchange includes a provider submitting a Good Faith Estimate (GFE) to a payer and the payer generating an Advanced Explanation of Benefits (AEOB) for a patient, and optionally for a provider, to enable better decision making by the patient in consultation with the provider. Note: This exchange will be triggered via a “request” or “scheduled service”. The AEOB will also include the GFE used to inform the AEOB generation. 
This IG describes system interactions using the FHIR standard. This IG will reference where possible the “standards” defined by the Health Record exchange ([HRex](https://hl7.org/fhir/us/davinci-hrex/)) Library/Framework IG, other FHIR IGs, and other industry standards where applicable.

While HL7 and X12 have worked collaboratively to support implementers to align requirements with claim submission standards to ease the burden of implementation where possible, there is no requirement to use other administration/payment transmission standards and there is no HIPAA mandate to do so for this use case.

This IG is informed by the [No Surprises Act (see Division BB, Title I, Sections 111 and 112)](https://www.ftc.gov/legal-library/browse/statutes/no-surprises-act-2021-consolidated-appropriations-act), which was enacted as part of the Consolidated Appropriations Act, 2021. The No Surprises Act specifically requires that a provider share GFE(s) with a payer and that a payer make an AEOB available to a patient in advance of service. The initial scope of this IG was inspired by this general requirement.

To ensure the IG supports all potential flows of information, the IG supports an AEOB being sent from the payer to the provider, in addition to a FHIR-based approach for the required flow from the payer to the patient. In this way, the IG can support providers and payers as they work to develop and implement a flow of information that allows them to meet the legislative and future regulatory requirement as well as enable information sharing valuable to supporting patient care. The IG is thus meant to facilitate the necessary data sharing without limiting provider and payer implementation options. The law does not require the use of an API to share these data. This IG provides an option for how to meet the requirements of the law, but the method used to share the required information – an API, a portal, e-mail, etc. – is the decision of the parties engaged in the process. Should future rulemaking mandate a specific scenario, this IG can be revised IG accordingly. 

By using the FHIR standard and implementing this guide, providers and payers can enhance their existing technologies, where applicable, for estimating patient costs securely and efficiently using common open web technologies. The anticipated benefit of using FHIR APIs is to enable applications of the patients’ choice to give greater transparency into patient-specific estimated costs of expected healthcare services and items.

FHIR is being used for consumer access to healthcare related data at significant scale today, and there are regulatory requirements in the form of the CMS Patient Access API for FHIR support for the related use case of post adjudicated claims. Use of an industry standard would keep the barrier to stakeholder adoption relatively low.
Acronyms used in this IG can be found in the [Terms and Concepts](use_cases.html#terms-and-concepts). The reader of this IG should become familiar with these before reading this IG.


<blockquote class="stu-note">
<ul>  
    <li>We ask the reader to please review all data elements. Are all the data elements in this IG required to produce an AEOB? Note: This IG was not produced to handle claims, but it was informed by X12 837 data elements. We are soliciting feedback on this topic.</li>
    <li>During the develop of this IG the question arose on how related GFEs should be linked. Especially if they arrive at different times. If a linking ID is used at the GFE level, how should it be used? We are looking for feedback on this topic.</li>
</ul>
</blockquote>

Acronyms used in this IG can be found [here](use_cases.html#terms-and-concepts). The reader of this IG should become familiar with these before reading this IG.

**AEOB Interaction Diagram Steps (High Level View)**

1. A patient schedules a service which triggers the composition of a collection of 1 or more GFEs. <em>Note: The composition of the collection of GFEs is currently not in scope for this IG. In other words, how the scheduling provider coordinates with other providers is currently not in scope for this IG. </em>

2. The collection of GFEs in the form of a FHIR resource bundle (GFE Bundle) is submitted (via the [gfe-submit operation](OperationDefinition-GFE-submit.html) to the payer’s endpoint for AEOB creation.  

3. The payer would then process, adjudicate, and produce the AEOB bundle. 

4. The patient can now request and receive the AEOB Bundle via FHIR query.

>Note: The patient below could be a third-party web portal or provider web portal.     

![AEOB Interaction Diagram](AEOB-interaction.drawio.png){:style="float: none;"}

**Figure 1: Advanced EOB Interactions**
