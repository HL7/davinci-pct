### Use Case

The below describes the process of initiating the creation of an AEOB and the process of receiving of an AEOB. Note: An AEOB includes all GFEs as well as other required information. 

### Submit AEOB Request to Payer

![Submit AEOB Request to Payer (draft)](SubmitAEOB.drawio.png){:style="float: none;"}

1. A patient schedules a service which triggers the composition of a collection of 1 or more GFEs. <em>Note: The composition of the collection of GFEs is currently not in scope for this IG. In other words, the means by which the scheduling provider coordinates with other providers is currently not in scope for this IG. </em>

2. The provider uses the submit operation to submit the GFE bundle to the payer or payer intermediary endpoint.
   
3. The payer begins processing the GFE Bundle asynchronously and immediately returns the AEOBBundleID to the calling client. This AEOBBundleID can now be used to get the AEOB which is described below. Note: The AEOBBundleID can also be used to get the AEOB status. Also, the translation from FHIR to X12 is not required to be conformant with this IG.  
 
#### Get completed AEOB from payer

The recipient/client (e.g., patient) is notified (e.g., via email, text, or other) that the AEOB is ready with a message that contains a URL and the AEOBBundleID. The recipient authenticates, and then accesses the AEOB via the URL, access token, and AEOBBundleID.

 ![Get completed AEOB from payer (draft)](GetAEOB.drawio.png){:style="float: none;"}

1. The recipient/client receives a notification that the AEOB is complete along with a AEOBBundleID which identifies their AEOB. 

2. The recipient/client authorizes/authenticates and receives an access token.

3. The recipient/client requests the AEOB by using the access token and AEOBBundleID. The recipient/client receives the AEOB Bundle.
>Note: The recipient/client above could be a third-party portal or the provider.   

#### Example

**MRI Scenario**

Assumptions:<br> 
• Patient has single commercial insurance coverage and plans to use it<br> 
• This is clinically appropriate (Clinical Decision Support (CDS) Score)<br> 
• Service Location is known (e.g., Address)<br> 
• All providers are in network - PCP, imaging facility, and reading radiologist<br> 
• If required, Prior Authorization is indicated as a disclaimer 

1.  Eve Betterhalf sees Dr. Patricia Primary (PCP) at ABC Medical Group on Monday with a prolonged migraine headaches lasting over a 4-month period. Dr. Primary says let's do a brain MRI (CPT 70551). 
2.  She walks to the PCP front desk, they enter the order into the EMR system, and direct the patient to ABC’s Radiology department. 
3.  Radiology reviews the order for completeness and accuracy and confirms all needed information is present. 
4.  The next day, Eve calls the radiology facility (Office of Dr. Christine Curie, NPI - 1234567893) to schedule her brain MRI, CPT 70551 and provide her coverage information, which she plans to use. 
5.  The MRI is scheduled for 9 days from today. This triggers the process for an Advanced EOB to be sent. 
6.  Optionally, Eve can also login to the Radiology’s site to download the information about her expected services, should she want to request an estimate separately. 
7.  The ABC’s Radiology Office Administrator enters the services and coverage information, initiates the process with other potential providers to generate the Good Faith Estimate for costs and services. 
8.  This information is sent to the payer. 
9.  The payer receives the good faith estimate, adjudicates it to determine patient costs and sends the Advanced EOB (including the GFE) securely to Eve. 
10. Optionally, the payer also sends a response to ABC’s Radiology Office Administrator with the same cost estimate information. 
11. Eve receives the Advanced EOB from her payer based on the information provided by ABC Radiology. 

##### Example Bundles – TODO use new GFE and AEOB bundle
 
Example bundles for the MRI scenario can be found here: 

[GFE Bundle](Claim-PCT-Good-Faith-Estimate-1.json.html)<br> 
[AEOB Bundle](ExplanationOfBenefit-PCT-AEOB-1.json.html)

#### System Actors

#### Payers
A Payer is an entity who pays for the service of providers. The majority of payers here are also referred to as health insurance companies.

#### Payer Intermediary 
The payer intermediary can assist a payer and respond to PCT queries in order to perform functionality such as x12 transformations.

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
        <td>The No Surprises Act requires that group health plans and insurers provide advance cost estimates, called advanced explanations of benefits (advanced EOBs), for scheduled services. </td>
    </tr>
    <tr>
        <td>Allowed Amount</td>
        <td>The maximum amount a plan will pay for a covered health care service. May also be called “eligible expense,” “payment allowance,” “negotiated rate", "contractual amount", or "covered amount."</td>
    </tr>
    <tr>
        <td>GFE</td>
        <td>Good Faith Estimate</td>
    </tr>
    <tr>
        <td>CAA<br/>Consolidated Appropriations Act</td>
        <td>Also called "H.R. 133". <p>The CARES (Coronavirus Aid, Relief, and Economic Security) Act implemented a variety of programs to address issues related to the onset of the COVID-19 pandemic. </p>
            <p>The Consolidated Appropriations Act continued many of these programs by adding new phases, new allocations, and new guidance to address issues related to the continuation of the COVID-19 pandemic. </p>
            <p>The Consolidated Appropriations Act (2021) was passed by Congress on December 21, 2020 and signed into law on December 27, 2020. </p></td>
    </tr>
    <tr>
        <td>CDM<br/>Chargemaster</td>
        <td>Also called the Charge Description Master. <p>A comprehensive listing of items billable to a hospital patient or a patient's health insurance provider. ... The chargemaster typically serves as the starting point for negotiations with patients and health insurance providers of what amount of money will actually be paid to the hospital. It is described as "the central mechanism of the revenue cycle" of a hospital. </p></td>
    </tr>
    <tr>
        <td>Collection of Services</td>
        <td>The list of services expected to be performed as part of gathering the good faith estimate. <p>Note: Purposely not using loaded words like "grouper" or "episode"</p>
            <p>Note: this may span across Providers (NPIs)</p></td>
    </tr>
    <tr>
        <td>Coinsurance</td>
        <td>The percentage of costs of a covered health care service you pay (20%, for example) after a member has paid the deductible. </td>
    </tr>
     <tr>
        <td>Copayment</td>
        <td>A fixed amount ($20, for example) you pay for a covered health care service after you've paid your deductible. Let's say your health insurance plan's allowable cost for a doctor's office visit is $100. Your copayment for a doctor visit is $20. </td>
    </tr>
     <tr>
        <td>Deductible</td>
        <td>The amount you pay for covered health care services before your insurance plan starts to pay. With a $2,000 deductible, for example, you pay the first $2,000 of covered services yourself. After you pay your deductible, you usually pay only a copayment or coinsurance for covered services. </td>
    </tr>
    <tr>
        <td>Cost</td>
        <td>To providers: the expense incurred to deliver health care services to patients. <p>To payers: the amount they pay to providers for services rendered.</p>
            <p>To patients: the amount they pay out-of-pocket for health care services. </p></td>
    </tr>
    <tr>
        <td>Data Exchange Method</td>
        <td>The mechanism for sending and receiving the data (e.g. standard "transactions", APIs, fax, email). </td>
    </tr>
    <tr>
        <td>Data Payload</td>
        <td>The bundle of data or collection of the data elements being sent. </td>
    </tr>
    <tr>
        <td>De-identified minimum negotiated charge</td>
        <td>The lowest charge that a hospital has negotiated with all third-party payers for an item or service. </td>
    </tr>
    <tr>
        <td>De-identified maximum negotiated charge</td>
        <td>The highest charge that a hospital has negotiated with all third-party payers for an item or service. </td>
    </tr>    
    <tr>
        <td>EOB<br/>Explanation of Benefits</td>
        <td>An EOB is a statement from a health insurance plan describing what costs it will cover for medical care or products received. </td>
    </tr>
    <tr>
        <td>Fee Schedule</td>
        <td>A complete listing of fees used by Medicare and commercial payers to pay doctors or other providers/suppliers. This comprehensive listing of fee maximums is used to reimburse a physician and/or other providers on a fee-for-service basis. </td>
    </tr>
    <tr>
        <td>Gross Charge</td>
        <td>The charge for an individual item or service that is reflected on a hospital's chargemaster absent any discounts. </td>
    </tr>
</table>

