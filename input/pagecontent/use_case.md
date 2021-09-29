### Use Case

The below describes the process of initiating the creation of an AEOB and the receiving of an AEOB. Note: An AEOB includes all GFEs as well as other required information. 

### Submit AEOB Request to Payer

![Submit AEOB Request to Payer (draft)](SubmitAEOB.drawio.png){:style="float: none;"}

The provider submits an AEOB Request based on a request or scheduled service. The payer AEOB Processor returns an AEOBResponseID which is the unique identifier that can be used to check the AEOB status.

The process begins with an AEOB Request Template. The AEOB RequestTemplate is FHIR based and does not include patient specific data. The AEOB Request Template is a bundle that contains all the GFEs needed to provide the set of services or items, including relevant codes, addresses, and contact information for providers, identifiers for the providers, as well as other status information.   

The provider customizes the AEOB Request Template by editing the template and adding the specific information for this patient, including the dates and location of the services. The client software generates an GFE Bundle and submits it to the Validation Service.

The Validation Service does a syntactic and semantic check on the GFEBundle. This includes verifying the identifiers for the providers, Tax IDs, and other information. If the validation checks fail, the Validation Service returns a list of error messages, otherwise it returns the bundle with an outcome of success. 

The provider submits the GFE Bundle to the payer endpoint (Payer AEOB Processor).

The Payer AEOB Processor validates the bundle against its own rules (including eligibility and coverage) and in case of errors returns a list of errors to the provider along with the GFE Bundle.
If the validation succeeds, the payer submits the GFE Bundle to the ID Generator.

The ID Generator generates unique IDs for the GFE Bundle and returns the GFE Bundle with those IDs.   

The payer begins processing the GFE Bundle asynchronously and immediately returns the AEOBResponseID to the calling client. Clients can now poll the payer endpoint for status updates.

>Note: At this time the AEOB Request Template and Validation Service decribed above are not required to be conformant with this IG. 

#### Get completed AEOB from payer

The recipient (e.g., patient) is notified (e.g., via email or text) that the AEOB is ready with a message that contains the URL and the AEOBResponseID. The recipient authenticates, and then accesses the AEOB via the URL, access token, and AEOBResponseID.

 ![Get completed AEOB from payer (draft)](GetAEOB.drawio.png){:style="float: none;"}

 1. The recipient/client (e.g., patient or provider) receives a notification that AEOB is complete along with the AEOBResponseID which identifies the AEOB. 

2. The recipient/client authorizes/authenticates and receives an access token

3. The recipient/client requests the AEOB by using the access token and AEOBResponseID.

4. The recipient/client is now able to receive the AEOB Bundle via API  

#### System Actors

#### Payers
A Payer is an entity who pays for the service of providers. The majority of payers here are also referred to as health insurance companies.

#### Payer IT System
The payer IT system SHALL be the primary system responding to PCT queries.

#### Healthcare Provider Organization
A healthcare provider organization contains medical providers such as hospitals, doctors, etc.

### Terms and Concepts
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