### Use Case Overview

This guide provides specifications enabling a provider to submit a Good Faith Estimate (GFE) Bundle including [Good Faith Estimate resource profiles](https://build.fhir.org/ig/HL7/davinci-pct/artifacts.html#3) (Claim resources of type predetermination) along with supporting data (such as Patient, Coverage, etc.) to a payer. The payer can then use this information to generate an Advanced Explanation of Benefit (AEOB) Bundle including [Advanced Explanation of Benefits resource profiles](https://build.fhir.org/ig/HL7/davinci-pct/artifacts.html#3) (ExplanationOfBenefit resources of type predetermination) along with supporting data that the patient, and optionally the provider (GFE submitter on claim resources), can retrieve to get an estimation of costs for expected services as known at a specific point in time.  

The primary use case for this guide is to enable the patient to have access to AEOBs for expected future medical items or services. Sharing this information with the provider is also supported as an option. This enables the provider to have an informed conversation with the patient to support better patient decision making.  If this capability is supported by the implementer, the patient’s AEOB will be provided to the GFE submitting provider using the same profiles in this guide. In this way the provider would receive the same information made available to the patient. 

This guide does not currently specify a means for providers to update or cancel a GFE submission. Rather, if there is new information that may materially affect the estimation, the provider would submit a new GFE Bundle.

### Systems And Actors

This implementation guide sets expectations for at least two types of systems:

* **Payer** systems adjudicate GFEs that have been submitted by a healthcare provider. These systems determine if a provider is in or out of network, verifies patient eligibility, applies contracted amounts (the provider’s network status needs to be confirmed), and applies member cost sharing amounts.

* **Intermediary** The payer or the provider may have the relationship with the intermediary.  Some payers do not contract with a clearinghouse; others do.  Providers can either contract with a Practice Management system who has the relationship with the clearinghouse or in some cases contracts directly with the clearinghouse through their Practice Management software.

#### System Actors

* **Client** systems are typically billing management systems, revenue cycle management systems, or other client systems responsible for requesting AEOBs.

* **Member** The health plan member / patient who is, or was, a member of a health plan.

* **Provider** The practitioner or clinician, or their representative, that initiates a data access request to retrieve member data from a health plan.

* **Third-Party Application** Health Plan Members / Patients have a right under the Health Insurance Portability and Accountability Act of 1996 (HIPAA) to direct the information held by a covered entity, such as a hospital or Health Plan to a third party of their choosing.

There are different terms used for an individual or patient in the Health Plan industry. Terms such as subscriber or member may be used. A subscriber and a member are not necessarily equivalent. For example, the subscriber may be the primary family member on a plan that covers the entire family. Therefore, the term Member will be used throughout this guide to identify the individual subject of the “member health history”.

#### Business Actors

* **Payer** – An organization that pays for administered medical services and products and can process provider cost estimations to calculate member specific cost sharing amounts, liabilities, payments, and expenses for use in member health care decision making.

* **Provider** – A practitioner, clinician, or organization providing healthcare related services or products to a member and submitting an estimation of charges (Good Faith Estimate) to a payer for processing and may access payer processed estimations.

* **Member** – A health plan member / patient who accesses a provider estimation and a payer processed estimation of costs for products or services they may receive in the future.

There are different terms used for individual actors involved in health plan coverage. Terms such as subscriber or member may be used. A subscriber and a member are not necessarily equivalent. For example, the subscriber may be the primary family member on a plan that covers the entire family. Therefore, the term Member will be used throughout this guide to identify the individual who will ultimately receive the care.

#### Technical Actors ####

* **Primary Participating Entity** – A business actor sending or receiving resources conforming to this implementation guide inclusive of all systems functionally acting on behalf of the actor, including intermediaries.

* **Sender** – A primary participating entity sending resources conforming to this guide.

* **Receiver** – A primary participating entity receiving resources conforming to this guide.

### Payer Perspective: End-to-End Workflow

The workflow diagram below describes the process of receiving a GFE Bundle from the submitting provider and returning the completed AEOB asynchronously (or acknowledgement that the process was completed if the AEOB will not be returned to the provider), as well as the process for a patient app to query for and retrieve their completed AEOB.

![Payer Perspective](PCTWorkflowPayer.png){:style="float: none;"}

**Figure 1: Payer Perspective: End-to-End Workflow**

1. The provider uses the gfe-submit operation to submit the GFE bundle to the payer endpoint. This is a POST request that follows the [Asynchronous Interaction Request Pattern](http://build.fhir.org/async-bundle.html). Please refer to this link for more details. Note: This page is part of the FHIR R5 current build, but uses no R5 resources, this guide is simply pre-adopting that HTTP request pattern. 
  * If the payer's FHIR aware endpoint does not receive the request (i.e. system is down, incorrect URL used, etc.) an HTTP status code of 4XX or 5XX will be returned. 
  * If the gfe-submit operation is successfully invoked, the request will move to Step 2. 
2. The payer system validates the GFE bundle against the FHIR R4 core specification and the GFE Bundle profile and other appropriate profiles in this guide, using the core FHIR [validate](http://hl7.org/fhir/resource-operation-validate.html) operation. 
  * If any validation errors are received, an HTTP status code of 412 Precondition Failed is returned along with an OperationOutcome resource containing the result of the validate operation. 
  * If validation is successful, the request will move to Step 3. 
3. The payer system accepts the GFE bundle. An HTTP status code of 202 Accepted is returned, and the Content-Location header  contains a URL for subsequent polling. 
4. The payer system begins processing the GFE bundle asynchronously to produce the AEOB. Some payers may process GFEs in near real time, which this guide can support, but more likely this process will take a substantial amount of time, up to the limits allowed by regulation. 
5. GFE processing can result in success or failure. 
  * In case of failure, the payer system sets the status of the request (identified by the unique URL returned in Step 3) to error, and prepare an OperationOutcome resource with details and move to Step 7. The payer should also notify the patient that the estimate was unable to be produced leveraging similar existing EOB/Claims business processes, though this communication to the patient is out of scope for this guide. 
  * If successful, move to Step 6. 
6. GFE processing completes successfully and the payer produces an AEOB and related resources. 
  * The payer system sets the status of the request (identified by the URL returned in Step 3) to completed, prepares a batch-response Bundle resource, and moves to Step 7. 
  * If the payer system supports API access for the patient, the AEOB is made accessible per the Patient Perspective section below. 
7. The payer system provides an endpoint at the URL provided in Step 3 whereby the provider can poll for GFE processing status.   
  * If the response is in-progress, the endpoint returns an HTTP status code of 202 Accepted, indicating that the provider should poll again later. The payer system should return a Retry-After header with each in-progress polling response, and the client should use this information to inform the timing of the next polling request. 
  * If the response is an error, the endpoint returns an HTTP status code of 4XX or 5XX, and the body of the response is an OperationOutcome detailing the error. 
  * If the response is successful, the endpoint returns an HTTP status code of 200 OK, and the body of the request is a [Bundle resource of type batch-response](https://www.hl7.org/fhir/codesystem-bundle-type.html#bundle-type-batch-response). This batch-response bundle SHOULD contain the completed AEOB Bundle and MAY contain one or more OperationOutcome resources with additional information regarding GFE/AEOB processing. If the batch-response Bundle does not contain an AEOB Bundle, then it SHALL contain at least one OperationOutcome resource detailing the reason why the AEOB Bundle is not present (e.g. the AEOB was sent directly to the patient and will not be returned to the provider). 


The individual steps from the provider and patient perspective are detailed in the sections below. 

### Provider Perspective: Submitting a GFE and Polling for a Completed AEOB

A patient schedules a service and this triggers the composition of a collection of one or more GFEs, which the provider then submits to the payer for processing. Note: The composition of the collection of GFEs is currently not in scope for this guide.

![Provider Perspective](PCTWorkflowProvider.png){:style="float: none;"}

**Figure 2: Provider Perspective**

1. The provider uses the gfe-submit operation to submit the GFE bundle to the payer endpoint. This is a POST request that follows the [Asynchronous Interaction Request Pattern](http://build.fhir.org/async-bundle.html). Please refer to that page for more details. Note: that page is part of the FHIR R5 current build, but uses no R5 resources, this guide is simply pre-adopting that HTTP request pattern. 
  * If successful this request will return an HTTP status code of 202 Accepted with a Content-Location header containing the absolute URL of an endpoint for subsequent status requests (polling location). 
  * If the operation fails it will return an HTTP status code of 4XX or 5XX and an OperationOutcome resource containing the error details (such as a 412 Precondition Failed if the content of the POST was not a valid GFE Bundle), provided the operation was successfully invoked (i.e. if the POST was submitted to a non-existent URL, the submitter would likely receive a 404 Not Found status code with no OperationOutcome). 

2. If Step 1 resulted in a 202 Accepted return code and a valid URL in the Content-Location header, the provider may now poll for the status of the request. The AEOB Bundle is created asynchronously since GFE processing has not taken place yet. The url returned in Step 1 can now be used to check the status of the AEOB process. 
  * If the response is in-progress, this request will return an HTTP status code of 202 Accepted, indicating that the provider should poll again later. The payer system should return a Retry-After header with each in-progress polling response, and the client should use this information to inform the timing of the next polling request. 
  * If the response is an error, this request will return an HTTP status code of 4XX or 5XX, and the body of the response will be an OperationOutcome detailing the error. 
  * If the response is successful, this request will return an HTTP status code of 200 OK, and the body of the request will be a Bundle resource of type batch-response. This batch-response bundle SHOULD contain the completed AEOB Bundle and MAY contain one or more OperationOutcome resources with additional information regarding GFE/AEOB processing. If the batch-response Bundle does not contain an AEOB Bundle, then it SHALL contain at least one OperationOutcome resource detailing the reason why the AEOB Bundle is not present (e.g. the AEOB was sent directly to the patient and will not be returned to the provider). 

### Patient Perspective: Get Completed AEOB from Payer

The patient has scheduled the service(s) with the provider(s). The payer may return the completed AEOB to the patient in many ways such as via mail, the payer patient portal, mobile app, or other technology to connect to the AEOB API. The only method in scope for this guide is the FHIR-based API approach inspired by the Patient Access API defined in the [CARIN Consumer Directed Payer Data Exchange](https://build.fhir.org/ig/HL7/carin-bb/Use_Case.html#use-case---consumer-access-to-their-claims-data) guide (CARIN IG for Blue Button). If the payer does implement both this API and the Patient Access API defined in the CARIN IG, it is up to the payer to decide if those APIs use the same or different endpoints. 

![Patient Perspective](PCTWorkflowPatient.png){:style="float: none;"}

**Figure 3: Patient Perspective**

1. A third party app used by the patient authorizes/authenticates and receives an access token. The app requests the AEOB by using the access token using a GET request for ExplanationOfBenefit resources in the patient's compartment. For example, GET [base]/ExplanationOfBenefit?patient=[patient-id]. Payer systems SHALL implement appropriate access controls to ensure that AEOBs are only accessible by the authenticated patient. 
  * If successful, the system will return 200 OK and the body will contain a [Bundle resource of type searchset](https://www.hl7.org/fhir/codesystem-bundle-type.html#bundle-type-searchset), containing zero or more ExplanationOfBenefit resources. Once the desired AEOB is found, the third party app may use the same API to query for other resources referenced by the AEOB, such as Patient, Practitioner, Organization, and Coverage resources if those referenced resources are not contained in the AEOB itself. New AEOBs (either for new services or new updates to an existing AEOB) would have a different identifier, and a created date later than previous AEOBs. 
  
Note: If GFE processing fails, the payer may use existing business processes to notify the patient, but this is out of scope for this guide. 


#### Examples

**Waive NSA Rights Consent Example Scenario**

The diagram below shows examples of how a patient may provide or withhold consent for no surprises act protections, and how that could change the resulting AEOB from the payer.  

![Balance Billing](GFEbalanceBilling.png){:style="float: none;"}

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
