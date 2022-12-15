<blockquote class="stu-note">
<p>
This specification is a Standard for Trial Use. It is expected to continue to evolve and improve through connectathon testing and feedback from early adopters. 
</p>
<p>Criteria regarding what payers must verify in a good faith estimate (GFE) will be evaluated during the next phase of the project after the project stakeholders receive feedback on error handling during testing and implementation.</p>
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

<blockquote class="stu-note">
<ul>  
    <li>We ask the reader to please review all data elements. Are all the data elements in this IG required to produce an AEOB? Note: This IG was not produced to handle claims, but it was informed by X12 837 data elements. We are soliciting feedback on this topic.</li>
    <li>During the develop of this IG the question arose on how related GFEs should be linked. Especially if they arrive at different times. If a linking ID is used at the GFE level, how should it be used? We are looking for feedback on this topic.</li>
</ul>
</blockquote>

By using the FHIR standard and implementing this guide, providers and payers can enhance their existing technologies, where applicable, for estimating patient costs securely and efficiently using common open web technologies. The anticipated benefit of using FHIR APIs is to enable applications of the Patients’ choice to give greater transparency into patient-specific estimated costs of expected healthcare services and items.
 FHIR is being used for consumer access to healthcare related data at significant scale today, and there are regulatory requirements in the form of the CMS Patient Access API for FHIR support for the related use case of post adjudicated claims. Use of an aligned FHIR standard would keep the barrier to consumer adoption relatively low.

Acronyms used in this IG can be found [here](use_cases.html#terms-and-concepts). The reader of this IG should become familiar with these before reading this IG.

**AEOB Interaction Diagram Steps (High Level View)**

1. A patient schedules a service which triggers the composition of a collection of 1 or more GFEs. <em>Note: The composition of the collection of GFEs is currently not in scope for this IG.</em>

2. The collection of GFEs in the form of a FHIR resource bundle (GFE Bundle) is submitted (via the [gfe-submit operation](OperationDefinition-GFE-submit.html) to the payer’s endpoint for AEOB creation.  

3. The payer would then process, adjudicate, and produce the AEOB bundle. 

4. The patient can now request and receive the AEOB Bundle via FHIR query.

>Note: The patient below could be a third-party web portal or provider web portal.     

![AEOB Interaction Diagram](AEOB-interaction.png){:style="float: none;"}

**Figure 1: Advanced EOB Interactions**

### Credits
<br>
**Primary Authors:**
*	Corey Spears (The MITRE Corporation)
*	Larry Decelles (The MITRE Corporation)
*   Gary Gryan (The MITRE Corporation)
*	Caleb Wan (The MITRE Corporation)
*	Rick Geimer (Lantana Consulting Group)

**Technical Editing:**
*	Yolanda Liu (The MITRE Corporation)
*	Joe Minieri (The MITRE Corporation)

**Da Vinci Project coordination and core team:**
*	Viet Nguyen (Stratametrics, LLC)
*	Jocelyn Keegan (Point-of-Care Partners)
*	Robert Dieterle (EnableCare, LLC)
*	Vanessa Candelora (Point-of-Care Partners)
*	Phung Matthews (Point-of-Care Partners)
*	Mary Kay McDaniel (Markam)
*	Denise St. Clair (Acumen, LLC)

**Da Vinci Member leadership provided by:**
*	Alice O'Carroll (Florida Blue)
*	Jacob Woodford (Epic)
*	Luke Rockenbach (Providence St. Joseph)

**This IG was developed under the auspices of the Financial Management work group.**

Special thanks go to the numerous Da Vinci members and community who have participated on conference calls, provided reviews and feedback, supported sample data gathering, reference implementation development, and testing including, but not limited to:
*	Blue Cross Blue Shield Association (Patricia B Taylor, Samuel Undine, Michael Gould, Gail Kocher)
*	Smile CDR Inc. (Cait O'Donnell, Joseph Quinn, and Sophie Tekeste)
*	The MITRE Corporation (FHIR Shorthand Team) 
*	Cambia Health Solutions (Hong Huang, Pat Waller)
*	Weill Cornell Medicine (Jill Vincente, Jarrett Cox)
*	Aegis (Carie Hammond)

>If you are interested in participating in the PCT project: information about our calls, minutes of past discussions, and other information can be found [here](https://confluence.hl7.org/display/DVP/Patient+Cost+Transparency) on our HL7 Confluence page.

The scope of this guide does not include coordination of benefits or more than one coverage. This does not serve as a replacement for eligibility, prior authorization or other financial and administrative use cases.


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
