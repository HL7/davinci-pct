<blockquote class="stu-note">
<p>
This specification is a Standard for Trial Use. It is expected to continue to evolve and improve through HL7® FHIR® Connectathon testing and feedback from early adopters. 
</p>
<p>Criteria regarding what payers must verify in a good faith estimate (GFE) will be evaluated during the next phase of the project after the project stakeholders receive feedback on error handling during testing and implementation.</p>
<p>
Feedback is welcome and may be submitted through the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> indicating "US Da Vinci PCT" as the specification.
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
This IG  provides detailed guidance to support providers and payers exchanging financial information for specific services and items using FHIR-based standards. This exchange involves a provider submitting a Good Faith Estimate (GFE) to a payer, and the payer generating an Advanced Explanation of Benefits (AEOB) for a patient (which may optionally be returned to the submitting provider). This information about the cost of healthcare items or services may enable better decision making by the patient in consultation with the provider.  Note: This exchange will be triggered via a “request” or “scheduled service”. The AEOB will also include the GFE used to inform the AEOB generation. 
This IG describes system interactions using the FHIR standard. This IG will reference where possible the “standards” defined by the Health Record exchange ([HRex](https://hl7.org/fhir/us/davinci-hrex/)) Library/Framework IG, other FHIR IGs, and other industry standards where applicable.

There is no requirement or HIPAA mandate to use administration/payment transmission standards. However, HL7 and X12 work collaboratively to support implementers to align requirements with claim submission standards to ease the burden of implementation where possible.  

This IG is informed by the [No Surprises Act (see Division BB, Title I, Sections 111 and 112)](https://www.ftc.gov/legal-library/browse/statutes/no-surprises-act-2021-consolidated-appropriations-act), which was enacted as part of the Consolidated Appropriations Act, 2021. The No Surprises Act specifically requires that a provider share GFEs with a payer and that a payer make an AEOB available to a patient in advance of service. The initial scope of this IG was inspired by this general requirement.

The IG supports different methods of information sharing between payers and providers and  payers and patients. In this way, the IG can support providers and payers as they work to meet the legislative and future regulatory requirement as well as enable information sharing valuable to supporting patient care.  Since the law does not require an API to share these data, the method used to share the required information – an API, a portal, email, etc. – is the decision of the parties engaged in the process. Should future rulemaking mandate a specific scenario, this IG can be revised IG accordingly. 

By using the FHIR standard  and implementing this guide, providers and payers can enhance their existing technologies, where applicable, for estimating patient costs securely and efficiently using common open web technologies. The anticipated benefit of using FHIR APIs is to enable applications of the patients’ choice to give greater transparency into patient-specific estimated costs of expected healthcare services and items.

FHIR is being used for consumer access to healthcare related data at significant scale today, and there are regulatory requirements in the form of the CMS Patient Access API for FHIR support for the related use case of post adjudicated claims. Use of an industry standard would keep the barrier to stakeholder adoption relatively low. 


Acronyms used in this IG can be found [here](#terms-and-concepts). The reader of this IG should become familiar with these before reading this IG. 

### General Workflow ###
This IG defines two main workflows in support of the patient cost transparency use case. 
1. [GFE Request and Collection Workflow ](#gfe-request-and-collection-workflow) - Supports the ability for a provider to request and collect one or more GFEs from other providers that may participate in a set of procedures related to patient's period of care for which a Good Faith Estimate is required, either to provide to the patient and/or to submit to a payer.
2. [GFE Submit Workflow ](#gfe-submit-workflow) - Supports the ability for a provider to submit a collection of one or more GFEs to a payer for them to process and produce a bundle of AEOB to the patient an optionally to the provider. This submission may include GFEs from multiple providers that were gathered in the [GFE Request Workflow ](#gfe-request-workflow).

#### Actors ####
The US No Surprises Act, which lays out some of the legal requirements this IG is meant to address, identifies a number of business actors responsible for the collection and sharing of GFEs and AEOBs. These are identified in the [Business Actors](#business-actors) section of the guide. This IG also defines a set of [Technical Actors](#technical-actors), which perform specific actions in their respective workflows. A business actor may perform zero or more technical actor actions defined in the workflows of this IG as they may decide to delegate the technical capabilities to third parties or may choose perform additional technical components. In order to abstract legal roles and responsibilities from technical capabilities, this guide identifies the business actors from the law, the technical actors that perform each role in the technical workflows defined by this IG, and the common relationships between them. This guide uses the term provider to mean either an individual Practitioner, an Organization, or a Facility.

##### Business Actors #####

- **Patient** - An individual requesting an estimate either when scheduling a service or asking for an estimation without scheduling a service. From the payer perspective this is the same individual they call the "member".

- **Convening Provider** - A Practitioner, Organization, or Facility that receives an initial request for a GFE, which will include any items or services that may be reasonably expected to be provided in conjunction with such a request, collects GFEs from providers potentially providing services or items in conjunction with the request (co-providers), and provides the full estimate to the patient or a payer. 

- **Co-Provider** - A Practitioner, Organization, or Facility receives a request for a GFE from a convening provider involving services or items that relate to the fulfillment of the original request and submits the GFE to the Convening Provider in response to that request.

- **Payer** - A group health plan, or a health insurance issuer offering group or individual health insurance coverage.

##### Technical Actors #####

- **GFE Requester** -  A provider and/or facility that initiates a request to collect GFEs across disparate individuals providers or provider organizations and retrieves the resulting GFE Bundles. The Convening Provider Business Actor often performs this role. 

- **GFE Contributor** - A provider and/or facility that receives a request to contribute a Good Faith Estimate (GFE) from a GFE Requester as part of an initial request for estimation of services and items. The Co-provider Business actor often performs this role. However, if the Convening Provider business actor also contributes an estimate to add to the collection, they too will be performing the GFE Contributor actor role. 

- **Coordination Platform** - A system receives that acts as the central location for enabling the communication and management of Tasks between the GFE Requester and GFE Contributors. This system is not necessarily associated with any business identified in the law. It may be implemented by a 3rd party, by the convening or contributing provider, or even by a payer.

- **GFE Submitter** - A provider and/or facility that sends a Good Faith Estimate (GFE) to a payer to facilitate the creation of an Advanced Explanation of Benefits (AEOB).

- **Payer** - A group health plan, or a health insurance issuer offering group or individual health insurance coverage and generates and AEOB when a GFE collection is submitted for a member. This is the same as the Payer Business Actor. For he purposes of this guide the business actor and technical actor are the same.



#### GFE Request and Collection Workflow ####
**GFE Request Diagram Steps (High Level View)**  


1. A patient schedules a service or requests an estimate for a service which triggers the composition of a collection of one or more GFEs. <em>Note: This workflow is used when there is need for a standard means of collecting GFEs from multiple providers.</em>


2. A GFE requester identifies all of the co-providers that will need to provide services and/or items that would be reasonably expected to be provided in conjunction with the service the request is being asked for. The associated Practitioner and Organizations resources are searched for on the Coordination Platform and the FHIR Resource identifiers retrieved.

3. The GFE Requester creates a single [Coordinating GFE Request Task](StructureDefinition-davinci-pct-coordinating-gfe-request-task.html) and one or more [GFE Contributing Provider Request Task](StructureDefinition-davinci-pct-gfe-provider-request-task.html) that contain the information necessary to create an estimate. These Tasks will contain or reference a [GFE Request Information Bundle](StructureDefinition-davinci-pct-gfe-request-information-bundle.html) which contains information about the patient, service(s) and/or item(s) a request is being made about, and any other information necessary to make an estimate.  A GFE Contributing Provider Request Task is created for each and every provider from which an estimate is being requested, including the convening provider if applicable as well as any providers for which non-FHIR out of band communications/submissions are being utilized (e.g. submission through a portal).

3. All GFE Contributors are notified of a new task assignment. The means of which are not proscribed by this guide, but this could be FHIR subscriptions based, Unsolicited Notifications, another FHIR process, or some other out of bands method (e.g. secure email).

4. The GFE Contributor retrieves the [GFE Contributing Provider Request Task](StructureDefinition-davinci-pct-gfe-provider-request-task.html) and any non-contained [GFE Request Information Bundle](StructureDefinition-davinci-pct-gfe-request-information-bundle.html) for information about the patient, service(s) and/or item(s) a request is being made about, and any other information necessary to make an estimate.

5. The GFE Contributor can then decide to accept or reject the request the [GFE Contributing Provider Request Task](StructureDefinition-davinci-pct-gfe-provider-request-task.html) and update it appropriately on the Coordination Platform. If the Task is rejected, no other updates are made to this Task and there are not more actions for this contributing provider to perform in relation to the original [Coordinating GFE Request Task](StructureDefinition-davinci-pct-coordinating-gfe-request-task.html).

6. The GFE Requester is notified of relevant status updates through the same sort of notification mechanisms made available to GFE Contributors. A Coordination Platform may choose to enable or disable notifications on certain types of task updates, but it is expected that any accept, reject, or completed status updates would result in a notification.

7. When notified of a reject status, the GFE Requester can create a new [GFE Contributing Provider Request Task](StructureDefinition-davinci-pct-gfe-provider-request-task.html) for a different GFE Contributor. Alternatively, the requesting provider can choose to cancel the entire request (The Coordinating Task and all associated Contributor Tasks), and choose to, if appropriate, create a new Coordinating Task and associated Contributor Tasks. This may be done in cases where the rejecting Contributing Provider indicated their reason for rejection was something like a scheduling conflict.

7. If the GFE Contributor accepts the request, they will collect the requested estimate(s), place them into a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html), attach it to the Contributor Task and mark the Task as completed. 

8. At any point after the collection of the [Coordinating GFE Request Task](StructureDefinition-davinci-pct-coordinating-gfe-request-task.html), the GFE Requester can retrieve a full [GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html) for the Task from the Coordination Platform through a [GFE-retrieve operation](OperationDefinition-GFE-retrieve.html). This GFE Collection Bundle will contain all of the GFE Bundles submitted by the GFE Contributors and attached to the respective [GFE Contributing Provider Request Task](StructureDefinition-davinci-pct-gfe-provider-request-task.html) thus far. For any [GFE Contributing Provider Request Task](StructureDefinition-davinci-pct-gfe-provider-request-task.html) that does not have a GFE Bundle attached, a [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) containing information about the request services/items and the provider from whom they were requested will be included in the GFE Bundles stead.

9. The GFE Requester may choose to "close" the request when they are satisfied or if the time-frame for collection of the GFEs has concluded by marking the Coordinating Task as Completed. 

10. Optionally, the Coordination Platform could provide an option to allow the GFE Requester to enable the delivery of the GFE Collection bundle to its intended destination (patient or payer) on their behalf. This would be done through a process not specified in this IG.

**GFE Request and Collection Diagram here**

#### GFE Submit Workflow ####
**AEOB Interaction Diagram Steps (High Level View)**  

1. A patient schedules a service or requests an estimate for a service which triggers the composition of a collection of one or more GFEs. <em>Note: The composition of the collection of GFEs can be done through the [GFE Request and Collection Workflow](#gfe-request-workflow) or another means not defined in this IG.</em>

2. A collection of GFEs in the form of a FHIR resource bundle ([GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html)) is submitted (via the [gfe-submit operation](OperationDefinition-GFE-submit.html)) to the payer’s endpoint for AEOB creation.  

3. The payer would then process, adjudicate, and produce the AEOB bundle. 

4. The patient can now request and receive the AEOB Bundle via FHIR query.

>Note: Communication to the patient below could be through an app by a third-party or provider approved by the patient or directly to the patient by the payer. 

![AEOB Interaction Diagram](AEOB-interaction.png){:style="float: none;"}

**Figure 1: Advanced EOB Interactions** 

### Credits  
<br>
**Primary Authors:**
*	Corey Spears (Lantana Consulting Group)
*	Larry Decelles (The MITRE Corporation)
*	Gary Gryan (The MITRE Corporation)
*	Caleb Wan (The MITRE Corporation)
*	Rick Geimer (Lantana Consulting Group)

**Technical Editing:**
*	Yolanda Liu (The MITRE Corporation)
*	Joe Minieri (The MITRE Corporation)
*	Kristin Schrock (Lantana Consulting Group) 

**Da Vinci Project Coordination and Core Team:**
*	Viet Nguyen (Stratametrics, LLC)
*	Jocelyn Keegan (Point-of-Care Partners)
*	Robert Dieterle (EnableCare, LLC)
*	Vanessa Candelora (Point-of-Care Partners)
*	Phung Matthews (Point-of-Care Partners)
*	Mary Kay McDaniel (Markam)
*	Denise St. Clair (Acumen, LLC)

**Da Vinci Member Leadership Provided By:**
*	Alice O'Carroll (Florida Blue)
*	Jacob Woodford (Epic)
*	Luke Rockenbach (Providence St. Joseph)

**This IG was developed under the auspices of the Financial Management Work Group.**

Special thanks go to the numerous Da Vinci members and community   who have participated on conference calls, provided reviews and feedback, supported sample data gathering, reference implementation development, and testing including, but not limited to:
*	Blue Cross Blue Shield Association (Patricia B Taylor, Samuel Undine, Michael Gould, Gail Kocher)
*	Smile CDR Inc. (Cait O'Donnell, Joseph Quinn, and Sophie Tekeste)
*	The MITRE Corporation (FHIR Shorthand Team) 
*	Cambia Health Solutions (Hong Huang, Pat Waller)
*	Weill Cornell Medicine (Jill Vincente, Jarrett Cox)
*	Aegis (Carie Hammond)

>If you are interested in participating in the PCT project, information about our calls, minutes of past discussions, and other information can be found [here](https://confluence.hl7.org/display/DVP/Patient+Cost+Transparency) on our HL7 Confluence page.

The scope of this guide does not include coordination of benefits or more than one coverage. This does not serve as a replacement for eligibility, prior authorization or other financial and administrative use cases. 


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
