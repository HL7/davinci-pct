### Use Case

This guide provides specifications enabling a provider to submit a Good Faith Estimate (GFE) Bundle including one or more Good Faith Estimates (Claim resources of type predetermination) along with supporting data (such as Patient, Coverage, etc.) to a payer. The payer can then use this information to generate an Advanced Explanation of Benefit Bundle including one or more Advanced Explanation of Benefits (ExplanationOfBenefit resources of type predetermination) along with supporting data that the patient, and possibly the GFE Bundle submitting provider, can retrieve to get an estimation of costs.  

The primary use case for this guide is to enable the patient to have access to AEOBs for potential future medical services or items. Sharing this information with the original submitting provider may also be useful in facilitating conversations between patients and providers about their care and options. If this capability is supported by the implementer, the patient’s AEOB will be provided to the submitting provider using the same profiles in this guide. 

This guide does not currently specify a means for providers to update or cancel a GFE submission. Rather, if there is new information that may materially affect the estimation, the provider would submit a new GFE Bundle.

The below describes the process of initiating the creation of an AEOB, through submitting a GFE Bundle, and the process of retrieving an AEOB. 

#### Submit AEOB Request to Payer

![Submit AEOB Request to Payer](SubmitAEOB.drawio.png){:style="float: none;"}

**Figure 1: Submit AEOB Request**

1. A patient schedules a service which triggers the composition of a collection of 1 or more GFEs. <em>Note: The composition of the collection of GFEs is currently not in scope for this IG. In other words, how the scheduling provider coordinates with other providers is currently not in scope for this IG. </em>

2. The provider uses the gfe-submit operation to submit the GFE bundle to the payer endpoint. This is a POST request.

3. The AEOB bundle is created asynchronously. Because of this the AEOB bundle is not complete at this point. This is because the GFE processing and adjudication has not taken place yet. Therefore, each AEOB instance in the bundle should now contain one of these `ExplanationOfBenefit.outcome`: `queued`, `error`, or `partial`. The gfe-submit response will also contain a Bundle.identifier.

4. The Bundle.identifier can now be used to run a AEOB FHIR query to check the AEOB `ExplanationOfBenefit.outcome`(s) and receive the completed bundle. The AEOB is complete when `ExplanationOfBenefit.outcome` is equal to `complete`. This process is explained in more detail in the [Get completed AEOB from payer](use_cases.html#get-completed-aeob-from-payer) section.      

#### Get completed AEOB from payer

![Get completed AEOB from payer](GetAEOB.drawio.png){:style="float: none;"}

**Figure 2: Get Completed AEOB from Payer**

1. The patient receives a notification that the AEOB is complete along with an Bundle.identifier which identifies their AEOB.

2. The patient authorizes/authenticates and receives an access token.

3. The patient requests the AEOB by using the access token and Bundle.identifier. The patient receives the AEOB Bundle.

>Note: The AEOB could be accessed via a web portal, mobile app, or other technology that is authorized to connect to the AEOB API.

#### Example

**MRI Scenario**

Assumptions:<br>
• Patient has single commercial insurance coverage and plans to use it<br>
• This is clinically appropriate (Clinical Decision Support (CDS) Score) <br>
• Service Location is known (e.g., Address) <br>
• All providers are in network - PCP, imaging facility, and reading radiologist<br>
• While medical management techniques (such as prior auth) will be included as a disclaimer when applicable in the AEOB returned to the member, the actual process of meeting medical management requirements is separate from the process of creating an AEOB. For details see the Terms and Concepts section of this IG.

1.  Eve Betterhalf sees Dr. Patricia Primary (PCP) at ABC Medical Group on Monday with a prolonged migraine headache lasting over a 4-month period. Dr. Primary says let's do a brain MRI (CPT 70551).
2.  She walks to the PCP front desk, they enter the order into the EMR system, and direct the patient to ABC’s Radiology department.
3.  Radiology reviews the order for completeness and accuracy and confirms all needed information is present.
4.  The next day, Eve calls the radiology center (ABC Radiology, NPI - 1234567893) to schedule her brain MRI, CPT 70551 and provide her coverage information, which she plans to use.
5.  The MRI is scheduled for 9 days from today. This triggers the process for an Advanced EOB (AEOB) to be created.
6.  Optionally, Eve can also login to the Radiology’s site to download the information about her expected services, should she want to request an estimate separately.
7.  The ABC Radiology’s Office Administrator enters the services and coverage information, initiates the process with other potential providers to generate the Good Faith Estimate (GFE) for the expected charges with the expected billing and diagnostic codes.
8.  This information is sent to the payer.
9.  The payer receives the GFE. Within one business day the payer adjudicates it and sends the Good Faith Estimates of cost, cost-sharing and progress towards meeting deductibles and out-of-pocket maximums, as well as whether a service is subject to medical management and relevant disclaimers of estimates as an AEOB securely to Eve.
10. Optionally, the payer also sends a response to ABC’s Radiology Office Administrator with the same cost estimate information.
11. Eve receives the AEOB from her payer based on the information provided by ABC Radiology.
12. Optionally, Eve or an authorized user could use their 3rd party app to query for the AEOB via API (if supported by their payer).

##### MRI Examples  

[GFE Professional](Claim-PCT-GFE-Professional-MRI.json.html)<br>
[GFE Institutional](Claim-PCT-GFE-Institutional-MRI.json.html)<br>

[AEOB](ExplanationOfBenefit-PCT-AEOB-1.json.html)

### Terms and Concepts

| Term | Definition |
| --- | --- |
| AEOB | The Consolidated Appropriations Act includes provisions whereby group health plans and health insurance issuers, based on charges, billing and diagnostic codes provided by the provider(s), provide an Advanced EOB for scheduled services or upon request to give patients transparency into their estimated healthcare costs. AEOBs need to include which providers are expected to provide treatment, the network status of providers, good faith estimates of cost, cost-sharing and progress towards meeting deductibles and out-of-pocket maximums, as well as whether a service is subject to medical management and relevant disclaimers of estimates; for example a disclaimer that the information provided in the notification is only an estimate based on the items and services reasonably expected, at the time of scheduling (or requesting) and is subject to change. For a complete breakdown of what needs to be included in the AEOB see 42 U.S. Code 300gg-111(f)(1)(A) through (H).|
| Allowed Amount | The maximum amount a plan will pay for a covered health care service. May also be called “eligible expense,” “payment allowance,” “negotiated rate", "contractual amount", or "covered amount."|
| CAA <br> Consolidated Appropriations Act | Also called ["H.R. 133".](https://www.ftc.gov/legal-library/browse/statutes/no-surprises-act-2021-consolidated-appropriations-act)<br>The CARES (Coronavirus Aid, Relief, and Economic Security) Act implemented a variety of programs to address issues related to the onset of the COVID-19 pandemic. <br><br> The Consolidated Appropriations Act continued many of these programs by adding new phases, new allocations, and new guidance to address issues related to the continuation of the COVID-19 pandemic. Title I (the No Surprises Act) of Division BB of the Consolidated Appropriations Act, 2021 establishes new protections from surprise billing and excessive cost sharing for consumers receiving health care items/services. <br><br>The Consolidated Appropriations Act (2021) was passed by Congress on December 21, 2020 and signed into law on December 27, 2020. |
| Coinsurance | The percentage of costs of a covered health care service that is paid (20%, for example) after a member has paid the deductible.|
| Collection of Services | The list of services expected to be performed during the period of care as part of gathering the Good Faith Estimate for the expected charges, billing and diagnostic codes for one or multiple providers. |
| Collection of Services | The list of services expected to be performed during the period of care as part of gathering the Good Faith Estimate for the expected charges, billing and diagnostic codes for one or multiple providers. |
| Copayment | A fixed amount (\$20, for example) that is paid for a covered health care service after the deductible has been paid. For example, a health insurance plan's allowable cost for a doctor's office visit is \$100 and the copayment for a doctor visit is \$20. |
| Cost | To providers: the expense incurred to deliver health care services to patients. <br> To payers: the amount they pay to providers for services rendered. <br> To patients: the amount they pay out-of-pocket for health care services.|
| Data Exchange Method | The mechanism for sending and receiving the data (e.g. standard "transactions", APIs, fax, email).|
| Data Payload | The bundle of data or collection of the data elements being sent. |
| Deductible | The amount that is paid for covered health care services before the insurance plan starts to pay. With a \$2,000 deductible, for example, the first \$2,000 of covered services is paid by the member out-of-pocket. After the deductible is paid, the member usually pays only a copayment or coinsurance for covered services. |
| EOB <br> Explanation of Benefits | An EOB is a statement from a health insurance plan describing what costs it will cover for medical care or products received. |
| GFE | The Good Faith Estimate is a notification of reasonably expected charges and billing codes for a scheduled or requested item or service. For a complete breakdown of what needs to be included in the GFE see [42 U.S. Code 300gg-136](#https://www.law.cornell.edu/uscode/text/42/300gg-136)|
| GFE Submitter | Any provider and/or facility that sends a Good Faith Estimate (GFE) to a payer to facilitate the creation of an advanced Explanation of Benefits (AEOB).|
| Gross Charge | The charge for an individual item or service that is reflected on a hospital's chargemaster absent any discounts.|
| HIPAA |The Health Insurance Portability and Accountability Act of 1996 (HIPAA) is a federal law that required the creation of national standards to protect sensitive patient health information from being disclosed without the patient’s consent or knowledge. The US Department of Health and Human Services (HHS) issued the HIPAA Privacy Rule to implement the requirements of HIPAA. The HIPAA Security Rule protects a subset of information covered by the Privacy Rule. |
{: .grid }
