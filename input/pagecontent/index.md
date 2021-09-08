### Overview
This implementation guide (IG) defines an exchange for providers to request and receive cost information from a payer regarding a service. This exchange will result in an Advanced Explanation of Benefits (AEOB) which will enable a clinician and patient cost conversation. Note: This exchange will be triggered via a “request” or “scheduled service”.

The goal of this IG is to support the request for cost information for specific services from the payer and return them in real-time to allow effective decision making by the patient in consultation with the 'ordering' provider.

The project team plans to work with existing FHIR artifacts where possible. If changes are necessary, the project team will work with the responsible Work Group to review and implement (via Jira items or new PSS) any necessary enhancements to base FHIR resources, extensions, and/or profiles.

This project will reference, where possible the 'standards' defined by the Health Record exchange (HRex) Library/Framework Implementation Guide and other FHIR IGs where applicable.

As this is a FHIR based use case and X12 is not required. X12 will only be used to inform the PCT APIs. In other words, the implementer will not be required to use X12.

![AEOB Interaction Diagram (draft)](AEOB-interaction.png){:style="float: none;"}

**AEOB Interaction Diagram Steps (draft)**

1.	A patient schedules a service which triggers the composition of a collection of GFEs. Note: The composition of the collection of GFEs is currently not in scope for this IG.

2.	The collection of GFEs in the form of a FHIR resource bundle is sent to the Get AEOB API endpoint hosted by the payer.

3.	The collection of GFEs is validated for correctness and completeness. Meaning the required data elements present and are they of the correct data type. 

4.	The payer would then process and adjudicate the collection of GFEs and produce an AEOB. During this process, the payer might convert the collection of GFEs to X12, but this is not mandatory to be conformant with this IG.

5.	Once the payer has completed the adjudication of the GFEs and the creation of the AEOB it will be sent back to the patient and provider. 

### Content and Organization
The IG is organized into the following sections:
* [Underlying Technologies](underlying_technologies.html) Describes the underlying technologies this specification builds upon.
* [Resources](artifacts.html) Introduces and provides links to the FHIR profiles, extensions, code systems, value sets, and examples.
* [Credits](credits.html) Identifies the individuals and organizations involved in developing this IG.

### Da Vinci PCT Glossary
<table border="1">
    <tr>
        <th><b>Term</b></th>
        <th><b>Proposed Definition</b></th>
    </tr>
    <tr>
        <td>Advanced EOB</td>
        <td>The No Surprises Act requires that group health plans and insurers provide advance cost estimates, called advanced explanations of benefits (advanced EOBs), for scheduled services.</td>
    </tr>
    <tr>
        <td>Allowed Amount</td>
        <td>The maximum amount a plan will pay for a covered health care service. May also be called “eligible expense,” “payment allowance,” “negotiated rate", "contractual amount", or "covered amount."</td>
    </tr>
    <tr>
        <td>BFE<br/>GFE</td>
        <td>Best Faith Estimate<br/>Good Faith Estimate</td>
    </tr>
    <tr>
        <td>CAA<br/>Consolidated Appropriations Act</td>
        <td>Also called "H.R. 133". <p>The CARES (Coronavirus Aid, Relief, and Economic Security) Act implemented a variety of programs to address issues related to the onset of the COVID-19 pandemic.</p>
            <p>The Consolidated Appropriations Act continued many of these programs by adding new phases, new allocations, and new guidance to address issues related to the continuation of the COVID-19 pandemic.</p>
            <p>The Consolidated Appropriations Act (2021) was passed by Congress on December 21, 2020 and signed into law on December 27, 2020.</p></td>
    </tr>
    <tr>
        <td>CDM<br/>Chargemaster</td>
        <td>Also called the Charge Description Master.<p>A comprehensive listing of items billable to a hospital patient or a patient's health insurance provider. ... The chargemaster typically serves as the starting point for negotiations with patients and health insurance providers of what amount of money will actually be paid to the hospital. It is described as "the central mechanism of the revenue cycle" of a hospital.</p></td>
    </tr>
    <tr>
        <td>Collection of Services</td>
        <td>The list of services expected to be performed as part of gathering the good faith estimate.<p>Note: Purposely not using loaded words like "grouper" or "episode"</p>
            <p>Note: this may span across Providers (NPIs)</p></td>
    </tr>
    <tr>
        <td>Coinsurance</td>
        <td>The percentage of costs of a covered health care service you pay (20%, for example) after a member has paid the deductible.</td>
    </tr>
    <tr>
        <td>Cost</td>
        <td>To providers: the expense incurred to deliver health care services to patients.<p>To payers: the amount they pay to providers for services rendered.</p>
            <p>To patients: the amount they pay out-of-pocket for health care services.</p></td>
    </tr>
    <tr>
        <td>Data Exchange Method</td>
        <td>The mechanism for sending and receiving the data (e.g. standard "transactions", APIs, fax, email).</td>
    </tr>
    <tr>
        <td>Data Payload</td>
        <td>The bundle of data or collection of the data elements being sent.</td>
    </tr>
    <tr>
        <td>De-identified minimum negotiated charge</td>
        <td>The lowest charge that a hospital has negotiated with all third-party payers for an item or service.</td>
    </tr>
    <tr>
        <td>De-identified maximum negotiated charge</td>
        <td>The highest charge that a hospital has negotiated with all third-party payers for an item or service.</td>
    </tr>
    <tr>
        <td>Discounted Cash Price</td>
        <td>The charge that applies to an individual who pays cash, or cash equivalent, for a hospital item or service.</td>
    </tr>
    <tr>
        <td>EOB<br/>Explanation of Benefits</td>
        <td>An EOB is a statement from a health insurance plan describing what costs it will cover for medical care or products received.</td>
    </tr>
    <tr>
        <td>Fee Schedule</td>
        <td>A complete listing of fees used by Medicare and commercial payers to pay doctors or other providers/suppliers. This comprehensive listing of fee maximums is used to reimburse a physician and/or other providers on a fee-for-service basis.</td>
    </tr>
    <tr>
        <td>Gross Charge</td>
        <td>The charge for an individual item or service that is reflected on a hospital's chargemaster absent any discounts.</td>
    </tr>
</table>

### Downloads
* The full [PCT Implementation Guide](full-ig.zip)
* [FHIR R4 PCT Resource Definitions](definitions.json.zip)
* [FHIR R4 PCT IG Validator Pack](validator-davinci-pct.pack)
