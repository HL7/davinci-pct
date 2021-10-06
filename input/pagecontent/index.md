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

As this is a FHIR based use case and X12 is not required. X12 will only be used to inform the PCT APIs. In other words, the implementer is not required to use X12 as there is not HIPPA mandate to do so.

**AEOB Interaction Diagram Steps (draft)**

1.  A patient schedules a service which triggers the composition of a collection of 1 or more GFEs. <em>Note: The composition of the collection of GFEs is currently not in scope for this IG. </em>

2.  The collection of GFEs in the form of a FHIR resource bundle (GFE Bundle) is sent to the create AEOB API endpoint hosted by the payer after being validated.

3.  The GFE Bundle is validated. <em>Note: During this process, the payer might convert the collection of GFEs to X12, but this is not required to be conformant with this IG.</em> 

4.  The payer would then process, adjudicate, and produce the AEOB. 

5.  Once the payer has completed the adjudication of the GFEs and the creation of the AEOB. The patient and provider can be notified that the AEOB is ready. The payer can then deliver the AEOB to the patient and provider via a delivery mechanism of choice (e.g., mail, email, web portal). Also, the AEOB can be received via API in a FHIR based format. <em>Note: The delivery mechanisms mentioned above are not in scope for this IG, only the API used to retrieve the AEOB bundle.</em>      

![AEOB Interaction Diagram (draft)](AEOB-interaction.png){:style="float: none;"}

### Downloads
* The full [FHIR PCT Implementation Guide](full-ig.zip)
* [FHIR PCT Resource Definitions (JSON)](definitions.json.zip)
* [FHIR PCT IG Profile Examples (JSON)](examples.json.zip)
* [FHIR PCT IG Validator Pack](validator-hl7.fhir.us.davinci-pct.pack)
