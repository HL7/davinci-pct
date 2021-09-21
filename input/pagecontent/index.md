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
This implementation guide (IG) defines an exchange for providers to request and receive cost information from a payer regarding a service or item. This exchange will result in an Advanced Explanation of Benefits (AEOB) which will enable a clinician and patient cost conversation. Note: This exchange will be triggered via a “request” or “scheduled service”. Also, the AEOB will include the GFE (Good Faith Estimate) used to inform the AEOB generation.

The goal of this IG is to support the request for cost information for specific services and items from the payer and return them in near real-time to allow effective decision making by the patient in consultation with the 'ordering' provider.

The project team plans to work with existing FHIR artifacts where possible. If changes are necessary, the project team will work with the responsible Work Group to review and implement (via Jira items or new PSS) any necessary enhancements to base FHIR resources, extensions, and/or profiles.

This project will reference, where possible the 'standards' defined by the Health Record exchange (HRex) Library/Framework Implementation Guide and other FHIR IGs where applicable.

As this is a FHIR based use case and X12 is not required. X12 will only be used to inform the PCT APIs. In other words, the implementer will not be required to use X12.

**AEOB Interaction Diagram Steps (draft)**

1.	A patient schedules a service which triggers the composition of a collection of GFEs. <em>Note: The composition of the collection of GFEs is currently not in scope for this IG.</em>

2.	The collection of GFEs in the form of a FHIR resource bundle is sent to the Get AEOB API endpoint hosted by the payer.

3.	The collection of GFEs is validated for correctness and completeness. Meaning are the required data elements present and are they of the correct data type? 

4.	The payer would then process and adjudicate the collection of GFEs and produce an AEOB. <em>Note: During this process, the payer might convert the collection of GFEs to X12, but this is not mandatory to be conformant with this IG.</em>

5.	Once the payer has completed the adjudication of the GFEs and the creation of the AEOB. The Patient can be notified that the AEOB is ready to be retieved via a FHIR based operation. 

![AEOB Interaction Diagram (draft)](AEOB-interaction.png){:style="float: none;"}

### Content and Organization
The IG is organized into the following sections:
* [Background](background.html) Describes how this IG relates to other IGs.
* [Use Cases](use_case.html) Describes the use cases for this IG.
* [Guidance](general_guidance.html) Descibes general guidance, the underlying technologies this specification builds upon, and Terminology Licensure.  
* [FHIR Artifacts](artifacts.html) Introduces and provides links to the FHIR profiles, extensions, code systems, value sets, and examples. 
* [Security](authorization_authentication_and_registration.html) Discussses authorization, authentication, and registration for the PCT APIs. 
* [Credits](credits.html) Identifies the individuals and organizations involved in developing this IG.

### Downloads
* The full [PCT Implementation Guide](full-ig.zip)
* [FHIR R4 PCT Resource Definitions](definitions.json.zip)
* [FHIR R4 PCT IG Validator Pack](validator-davinci-pct.pack)
