<blockquote class="stu-note">
<p>
This specification is a Standard for Trial Use. It is expected to continue to evolve and improve through HL7® FHIR® Connectathon testing and feedback from early adopters. 
</p>
<p>STU1 focused on a payer receiving a good faith estimate (GFE) from a provider and returning an Advanced Explanation of Benefits (AEOB) to a patient. With STU2, this specification includes guidance on how multiple providers can work together to provide one collective GFE, GFE Summary and AEOB Summary for easier patient understanding of their overall estimated cost, as well as other valuable updates. See [Change Log](change_log.html) for additional information.
The IG STU2 content relating to the GFE Coordination is marked as DRAFT throughout this guide. The Da Vinci PCT open community of providers, payers, health IT including EHRs, revenue cycle experts, billing specialists, cost estimator experts and others that have provided requirements and vetted design decisions, recognize that the GFE coordination process is not happening today. Balloting this content provides the opportunity to gain feedback broadly and enable better insights for testing of the technology as the business process evolves to ready a standard for trial use.
</p>
<p>
Feedback is welcome and may be submitted through the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> indicating "US Da Vinci Patient Cost Transparency (PCT)(FHIR)" as the specification.
</p>
<p>
This implementation guide (IG) is dependent on other specifications. Please submit any comments you have on these base specifications as follows:
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

This IG provides detailed guidance to support providers and payers exchanging financial information for specific items and services using FHIR-based standards. This exchange involves a provider or group of providers  submitting a Good Faith Estimate (GFE) to a patient (if self-pay or uninsured) or a payer. A payer can then generate an Advanced Explanation of Benefits (AEOB) for a patient (which may optionally be returned to the submitting provider). 

When there are multiple providers involved in a patient’s service, these providers may need to coordinate in order to produce one comprehensive GFE. This IG provides guidance on how this collaborative GFE creation process can leverage FHIR. Information about the cost of healthcare items or services may enable better decision making by the patient in consultation with the provider. 

Note: This exchange will be triggered via a “request” or “scheduled service”. When the patient has insurance they chose to use, the GFE will be sent from a provider to a payer. The payer will produce an AEOB, which will also include the GFE used to inform the AEOB generation. This IG describes system interactions using the FHIR standard. 


This IG will reference where possible the “standards” defined by the Health Record exchange ([HRex](https://hl7.org/fhir/us/davinci-hrex/)) Library/Framework IG, other FHIR IGs, and other industry standards where applicable.


This IG is informed by the [No Surprises Act (see Division BB, Title I, Sections 111 and 112)](https://www.ftc.gov/legal-library/browse/statutes/no-surprises-act-2021-consolidated-appropriations-act), which was enacted as part of the Consolidated Appropriations Act, 2021. The No Surprises Act specifically requires that a provider or providers share a GFE with a patient when the patient is self-pay/uninsured or with a payer for insured patients when the patient schedules a service or requests an estimate. When the payer receives a GFE, the payer must make an AEOB available to a patient in advance of the service.

Understanding the need for multiple providers to be able to work together to produce a single GFE in support of the law, this IG provides guidance on how to create this GFE using FHIR. This IG introduces a GFE coordination workflow that leverages a Coordinating Platform. The Coordinating Platform could be any number of systems - a practice management system, an EHR, a portal, a third party system, etc. When a patient contacts a provider to schedule a service or request an estimate for a service, the provider or facility who schedules the service or receives the request is the convening provider or convening facility per current CMS regulation for uninsured/self-pay patients.


The role a provider plays in this collaboration will change from case to case. In some cases, a provider will be a GFE Coordination Requester because the patient’s care is starting with them - the service was scheduled with this provider. If this provider is also providing items and services to be included in the GFE, they will also play the role of a GFE Contributor. For other patients, the same provider may be a co-provider supporting a different provider or facility with a patient’s period of care, in which case they will only act as a GFE Contributor. In either role, the IG provides tools to support the collaboration effort and the production of a single GFE. Certain state regulations may also inform which role a provider plays.

> NOTE: At this time, the Departments have exercised enforcement discretion allowing providers to send separate GFEs to a patient or payer. Further federal regulation on this is anticipated. This IG can support this process, helping patients get the best, most usable information to make informed decisions about their care. If specific guidance is issued that requires adjustments to this IG, the IG will be updated.


The IG supports different methods of information sharing between payers and providers and payers and patients. In this way, the IG can support providers and payers as they work to meet the legislative and future regulatory requirement as well as enable information sharing valuable to supporting patient care. Since the law does not require an API to share these data, the method used to share the required information – an API, a portal, email, etc. – is the decision of the parties engaged in the process. Should future rulemaking mandate a specific scenario, this IG can be revised accordingly.


By using the FHIR standard and implementing this guide, providers and payers can enhance their existing technologies, where applicable, for estimating patient costs securely and efficiently using common open web technologies. The anticipated benefit of using FHIR APIs is to streamline the process of creating a single comprehensive GFE for self-pay/uninsured patients and a single AEOB for insured and to enable applications of the patients’ choice to give greater transparency into patient-specific estimated costs of expected healthcare items and services.

FHIR is being used for consumer access to healthcare related data at significant scale today, and there are regulatory requirements in the form of the CMS Patient Access API for FHIR support for the related use case of post adjudicated claims. Use of an industry standard would keep the barrier to stakeholder adoption relatively low.

Acronyms used in this IG can be found [here](#terms-and-concepts). The reader of this IG should become familiar with these before reading this IG. 

### General Workflow ###

This guide breaks the process into two main parts in support of the patient cost transparency use case: 
1. [GFE Coordination Workflow ](gfe_coordination_overview.html) -  Supports the ability for a provider to request and collect one or more GFEs from other providers that may participate in a set of procedures related to patient’s period of care for which a GFE is required, either to provide to the patient and/or to submit to a payer.

2. [GFE Submission and AEOB Workflow ](gfe_submission_and_aeob_overview.html) - Supports the ability for a provider to submit a collection of one or more GFEs to a payer for them to process and produce an [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) to the patient and optionally to the provider. This submission may include GFEs from multiple providers or a consolidated GFE that were gathered in the [GFE Coordination Workflow ](gfe_coordination_overview.html).


**Good Faith Estimate and Advanced Explanation of Benefit High Level Workflow**
![PCT High Level Workflow](PCT_HighLevelWorkflow.png){:style="float: none;width: 800px;display: block;margin: auto;"}


#### GFE Submit Workflow ####

**AEOB Interaction Diagram Steps (High Level View)**
1. A patient schedules a service or requests an estimate for a service which triggers the composition of a collection of one or more GFEs. 

2. The Providers involved in the service coordinate on their individual charges and services for the Good Faith Estimate through the [GFE Coordination Workflow](gfe_coordination_overview.html), if applicable. For self-pay or uninsured patients, the GFE can be made available to the patient at this step. _(This would be through another means not defined in this IG.)_

3. For insured patients, one or more GFEs in a FHIR Bundle resource ([GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html)) is submitted (via the [gfe-submit operation](https://build.fhir.org/ig/HL7/davinci-pct/OperationDefinition-GFE-submit.html)) to the payer’s endpoint for AEOB creation. 

4. The payer would then process, adjudicate, and produce the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html).

5. The patient and provider can now request and receive the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) via FHIR query.

> Note: Communication to the patient could be direct from the provider or the payer or through a third-party app via an API.


### Credits  
<br>
**Primary Authors:**
*	Corey Spears (Lantana Consulting Group)
*	Rick Geimer (Lantana Consulting Group)
*	Larry Decelles (The MITRE Corporation)
*	Gary Gryan (The MITRE Corporation)
*	Caleb Wan (The MITRE Corporation)

**Technical Editing:**
*	Yolanda Liu (The MITRE Corporation)
*	Joe Minieri (The MITRE Corporation)
*	Kristin Schrock (Lantana Consulting Group) 

**Da Vinci Project Coordination and Core Team:**
*	Vanessa Candelora (Point-of-Care Partners)
*	Viet Nguyen (Stratametrics, LLC)
*	Jocelyn Keegan (Point-of-Care Partners)
*	Robert Dieterle (EnableCare, LLC)
*	Phung Matthews (Point-of-Care Partners)
*	Mary Kay McDaniel (Markam)
* Lloyd McKenzie (Dogwood Health Consulting)
*	Denise St. Clair (Global Alliant, Inc.)
* Crystal Kallem (Point-of-Care Partners)

**Test Lead:**
* Ryan Moehrke (AEGIS)

**Da Vinci Member Leadership Provided By:**
*	Alice O'Carroll (Florida Blue)
*	Jacob Woodford (Epic)
*	Luke Rockenbach (Providence)
* Zackery Welch (Providence) 
* Tina Mintyala (Providence) 
* Jill Elder  (Providence) 


**This IG was developed under the auspices of the Financial Management Work Group.**

Special thanks go to the numerous Da Vinci members and community   who have participated on conference calls, provided reviews and feedback, supported sample data gathering, reference implementation development, and testing including, but not limited to:
*	Blue Cross Blue Shield Association (Patricia B Taylor, Samuel Undine, Michael Gould, Gail Kocher)
*	Smile CDR Inc. (Cait O'Donnell, Joseph Quinn, and Sophie Tekeste)
*	The MITRE Corporation (FHIR Shorthand Team) 
*	Cambia Health Solutions (Hong Huang, Pat Waller)
*	Weill Cornell Medicine (Jill Vincente, Jarrett Cox)
*	Aegis (Carie Hammond)

> If you are interested in participating in the PCT project, information about our calls, minutes of past discussions, and other information can be found [here](https://confluence.hl7.org/pages/viewpage.action?pageId=116460399) on our HL7 Confluence page.

The scope of this guide does not include coordination of benefits or more than one coverage. This does not serve as a replacement for eligibility, scheduling, prior authorization or other financial and administrative use cases. 


### Terms and Concepts

| Term | Definition |
| --- | --- |
| AEOB | The Consolidated Appropriations Act includes provisions whereby group health plans and health insurance issuers, based on charges, billing and diagnostic codes provided by the provider(s), provide an Advanced Explanation of Benefits  for scheduled services or upon request to give patients transparency into their estimated healthcare costs. AEOBs need to include which providers are expected to provide treatment, the network status of providers, good faith estimates of cost, cost-sharing and progress towards meeting deductibles and out-of-pocket maximums, as well as whether a service is subject to medical management and relevant disclaimers of estimates; for example, the disclaimer might state that the information provided in the notification is only an estimate based on the items and services reasonably expected, at the time of scheduling (or requesting) and is subject to change. For a complete breakdown of what needs to be included in the AEOB see 42 U.S. Code 300gg-111(f)(1)(A) through (H).|
| Allowed Amount | The maximum amount a plan will pay for a covered healthcare service. May also be called “eligible expense,” “payment allowance,” “negotiated rate", "contractual amount", or "covered amount."|
| CAA <br> Consolidated Appropriations Act | Also called ["H.R. 133".](https://www.ftc.gov/legal-library/browse/statutes/no-surprises-act-2021-consolidated-appropriations-act)<br>The CARES (Coronavirus Aid, Relief, and Economic Security) Act implemented a variety of programs to address issues related to the onset of the COVID-19 pandemic. <br><br> The Consolidated Appropriations Act continued many of these programs by adding new phases, new allocations, and new guidance to address issues related to the continuation of the COVID-19 pandemic. Title I (the No Surprises Act) of Division BB of the Consolidated Appropriations Act, 2021 establishes new protections from surprise billing and excessive cost sharing for consumers receiving healthcare items/services. <br><br>The Consolidated Appropriations Act (2021) was passed by Congress on December 21, 2020 and signed into law on December 27, 2020. |
| Coinsurance | The percentage of costs of a covered healthcare service that is paid (20%, for example) after a member has paid the deductible.|
| Collection of Services | The list of services expected to be performed during the period of care as part of gathering the Good Faith Estimate for the expected charges, billing and diagnostic codes for one or multiple providers. |
| Copayment | A fixed amount (\$20, for example) that is paid for a covered healthcare service after the deductible has been paid. For example, a health insurance plan's allowable cost for a doctor's office visit is \$100 and the copayment for a doctor visit is \$20. |
| Cost | To providers: the expense incurred to deliver healthcare services to patients. <br> To payers: the amount they pay to providers for services rendered. <br> To patients: the amount they pay out-of-pocket for healthcare services.|
| Data Exchange Method | The mechanism for sending and receiving the data (e.g. standard "transactions", APIs, fax, email).|
| Data Payload | The bundle of data or collection of the data elements being sent. |
| Deductible | The amount that is paid for covered healthcare services before the insurance plan starts to pay. With a \$2,000 deductible, for example, the first \$2,000 of covered services is paid by the member out-of-pocket. After the deductible is paid, the member usually pays only a copayment or coinsurance for covered services. |
| EOB <br> Explanation of Benefits | An EOB is a statement from a health insurance plan describing what costs it will cover for medical care or products received. |
| GFE | The Good Faith Estimate is a notification of reasonably expected charges and billing codes for a scheduled or requested item or service. For a complete breakdown of what needs to be included in the GFE see [42 U.S. Code 300gg-136](https://www.law.cornell.edu/uscode/text/42/300gg-136)|
| GFE Submitter | Any provider and/or facility that sends a Good Faith Estimate (GFE) to a payer to facilitate the creation of an Advanced Explanation of Benefits (AEOB).|
| Gross Charge | The charge for an individual item or service that is reflected on a hospital's chargemaster absent any discounts.|
| HIPAA |The Health Insurance Portability and Accountability Act of 1996 (HIPAA) is a federal law that required the creation of national standards to protect sensitive patient health information from being disclosed without the patient’s consent or knowledge. The US Department of Health and Human Services (HHS) issued the HIPAA Privacy Rule to implement the requirements of HIPAA. The HIPAA Security Rule protects a subset of information covered by the Privacy Rule. |
{: .grid }
