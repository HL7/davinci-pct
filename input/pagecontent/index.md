<blockquote class="stu-note">
<p>
This specification is a proposed Standard for Trial Use. It is expected to continue to evolve and improve through connectathon testing and feedback from early adopters. 
Note: This is an early draft or "work in progress". Therefore, changes can be expected to happen quite often and without notice. 
</p>
<p>
Feedback is welcome and may be submitted through <a href="https://chat.fhir.org/#narrow/stream/301151-Da-Vinci.20PCT">PCT Zulip</a> indicating "US Da Vinci PCT" as the specification.
</p>
<p>
Individuals interested in participating in the Patient Cost Transparency project or other HL7 Da Vinci projects can find information about Da Vinci <a href="http://www.hl7.org/about/davinci">here</a>.
</p>
</blockquote>

### Overview
This implementation guide (IG) defines an exchange for providers to request and receive cost information from a payer regarding a service or item. This exchange will result in an Advanced Explanation of Benefits (AEOB) which will enable a clinician and patient cost conversation. Note: This exchange will be triggered via a “request” or “scheduled service”. Also, the AEOB will include the GFE(s) (Good Faith Estimate) used to inform AEOB generation.

The goal of this IG is to support the request for cost information for specific services and items from the payer and return them in near real-time to allow effective decision making by the patient in consultation with the 'ordering' provider.

The project team plans to work with existing FHIR artifacts where possible. If changes are necessary, the project team will work with the responsible Work Group to review and implement (via Jira items or new PSS) any necessary enhancements to base FHIR resources, extensions, and/or profiles.

This project will reference, where possible the 'standards' defined by the Health Record exchange (HRex) Library/Framework Implementation Guide and other FHIR IGs where applicable.

As this is a FHIR based use case and X12 is not required. X12 will only be used to inform the PCT APIs. In other words, the implementer is not required to use X12 as there is not an HIPAA mandate to do so.

At this time, there is no specific mandate dictating the Da Vinci Price Transparency IG work. Instead, this IG is informed by the No Surprises Act, which was enacted as part of the Consolidated Appropriations Act, 2021. 

The No Surprises Act specifically requires that providers share GFE(s) with a payer and that a payer make an AEOB available to a patient in advance of service. The initial scope of this IG was inspired by this general requirement. While rulemaking has not yet addressed how specifically this general requirement will need to be implemented, this IG is being developed to support the flow of the necessary information from providers, to the payer, to a patient. Subsequent iterations of this IG will take into consideration any relevant future regulation or legislation, as appropriate or upon request.

Acronyms used in this IG can be found [here](use_cases.html#terms-and-concepts). The reader of this IG should become familiar with these before reading this IG.

**AEOB Interaction Diagram Steps (High Level View)**

1. A patient schedules a service which triggers the composition of a collection of 1 or more GFEs. <em>Note: The composition of the collection of GFEs is currently not in scope for this IG. In other words, how the scheduling provider coordinates with other providers is currently not in scope for this IG. </em>

2. The collection of GFEs in the form of a FHIR resource bundle (GFE Bundle) is submitted (via the gfe-submit operation) to the payer’s intermediary or payer’s endpoint for AEOB creation.  

3. The payer’s intermediary (or payer) can translate the GFE Bundle to X12. The payer would then process, adjudicate, and produce the AEOB bundle. <em>Note: Translating the GFE bundle to X12 or any other format is not required to be conformant with this IG. </em> 

4. The patient can now request and receive the AEOB Bundle via FHIR query.
   
>Note: The patient below could be a third-party web portal or provider web portal.     

![AEOB Interaction Diagram](AEOB-interaction.drawio.png){:style="float: none;"}

### Downloads
* The full [FHIR PCT Implementation Guide](full-ig.zip)
* FHIR PCT Resource Definitions [(JSON)](definitions.json.zip) [(XML)](definitions.xml.zip) [(TTL)](definitions.ttl.zip)
* FHIR PCT IG Profile Examples [(JSON)](examples.json.zip) [(XML)](examples.xml.zip) [(TTL)](examples.ttl.zip)
* FHIR PCT IG [Validator Pack](validator-hl7.fhir.us.davinci-pct.pack)

#### Package File
The following package file includes an NPM package file used by many of the FHIR tools. It contains all the value sets, profiles, extensions, list of pages and urls in the IG, etc defined as part of this version of the Implementation Guides. This file should be the first choice whenever generating any implementation artifacts since it contains all of the rules about what makes the profiles valid. Implementers will still need to be familiar with the content of the specification and profiles that apply in order to make a conformant implementation. See the overview on validating <a href="http://hl7.org/fhir/R4/validation.html">FHIR profiles and resources</a>:

* [Package](package.tgz)


