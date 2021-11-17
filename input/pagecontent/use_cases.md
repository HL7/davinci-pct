### Use Case

The below describes the process of initiating the creation of an AEOB and the process of receiving or retrieving an AEOB. Note: An AEOB includes all GFEs as well as other required information. 

#### Submit AEOB Request to Payer

![Submit AEOB Request to Payer](SubmitAEOB.drawio.png){:style="float: none;"}

1. A patient schedules a service which triggers the composition of a collection of 1 or more GFEs. <em>Note: The composition of the collection of GFEs is currently not in scope for this IG. In other words, how the scheduling provider coordinates with other providers is currently not in scope for this IG. </em>

2. The provider uses the gfe-submit operation to submit the GFE bundle to the payer or payer intermediary endpoint. This is a POST request. 

3. The AEOB bundle is created asynchronously. Meaning the AEOB bundle has not been created at this point. This is because the GFE processing and adjudication has not taken place yet. The gfe-submit response has an ExplanationOfBenefit.outcome of NOT 'complete'. The gfe-submit response will also contain an AEOB Bundle.identifier.
     
4. The AEOB Bundle.identifier can now be used to run a AEOB FHIR query to check the AEOB ExplanationOfBenefit.outcome and receive the completed bundle. The AEOB bundle is complete when ExplanationOfBenefit.outcome is equal to ‘complete’. This process is explained in more detail in [Get completed AEOB from payer](use_cases.html#get-completed-aeob-from-payer) section.   

Note: The translation from FHIR to X12 and back to FHIR is not required to be conformant with this IG.  
 
#### Get completed AEOB from payer

![Get completed AEOB from payer](GetAEOB.drawio.png){:style="float: none;"}

1. The patient receives a notification that the AEOB is complete along with an AEOB Bundle.identifier which identifies their AEOB. 

2. The patient authorizes/authenticates and receives an access token.

3. The patient requests the AEOB by using the access token and AEOB Bundle.identifier. The patient receives the AEOB Bundle.
   
>Note: The patient above could be a third-party portal or provider portal.   

#### Example

**MRI Scenario**

Assumptions:<br> 
• Patient has single commercial insurance coverage and plans to use it<br> 
• This is clinically appropriate (Clinical Decision Support (CDS) Score) <br> 
• Service Location is known (e.g., Address) <br> 
• All providers are in network - PCP, imaging facility, and reading radiologist<br> 
• If required, Prior Authorization is indicated as a disclaimer 

1.  Eve Betterhalf sees Dr. Patricia Primary (PCP) at ABC Medical Group on Monday with a prolonged migraine headache lasting over a 4-month period. Dr. Primary says let's do a brain MRI (CPT 70551). 
2.  She walks to the PCP front desk, they enter the order into the EMR system, and direct the patient to ABC’s Radiology department. 
3.  Radiology reviews the order for completeness and accuracy and confirms all needed information is present. 
4.  The next day, Eve calls the radiology facility (Office of Dr. Christine Curie, NPI - 1234567893) to schedule her brain MRI, CPT 70551 and provide her coverage information, which she plans to use. 
5.  The MRI is scheduled for 9 days from today. This triggers the process for an Advanced EOB (AEOB) to be created. 
6.  Optionally, Eve can also login to the Radiology’s site to download the information about her expected services, should she want to request an estimate separately. 
7.  The ABC’s Radiology Office Administrator enters the services and coverage information, initiates the process with other potential providers to generate the Good Faith Estimate (GFE) for costs and services. 
8.  This information is sent to the payer. 
9.  The payer receives the GFE, adjudicates it to determine patient costs and sends the AEOB (including the GFE) securely to Eve. 
10. Optionally, the payer also sends a response to ABC’s Radiology Office Administrator with the same cost estimate information. 
11. Eve receives the AEOB from her payer based on the information provided by ABC Radiology. 
12. Optionally, Eve or any interested party could query for the AEOB using the Bundle.identifier and auth token. 

##### MRI Examples  

[GFE Professional](Claim-PCT-GFE-Professional-1.json.html)<br> 
[GFE Institutional](Claim-PCT-GFE-Institutional-1.json.html)<br> 

[AEOB](ExplanationOfBenefit-PCT-AEOB-1.json.html)

### Terms and Concepts
<table border="1">
    <tr>
        <th><b>Term</b></th>
        <th><b>Proposed Definition</b></th>
    </tr>
    <tr>
        <td>AEOB</td>
        <td>The No Surprises Act requires that group health plans and insurers provide advance cost estimates, called Advanced Explanations of Benefits (AEOBs), for scheduled services. </td>
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
        <td>The charge for an individual item or service that is reflected on a hospital's chargemaster absent any discounts.</td>
    </tr>
    <tr>
        <td>GFE Submitter</td>
        <td>The provider that is the submitter of the Good Faith Estimate (GFE) bundle to the Payer.</td>
    </tr>
    <tr>
        <td>HIPAA</td>
        <td>The Health Insurance Portability and Accountability Act of 1996 (HIPAA) is a federal law that required the creation of national standards to protect sensitive patient health information from being disclosed without the patient’s consent or knowledge. The US Department of Health and Human Services (HHS) issued the HIPAA Privacy Rule to implement the requirements of HIPAA. The HIPAA Security Rule protects a subset of information covered by the Privacy Rule.</td>
    </tr>
</table>

