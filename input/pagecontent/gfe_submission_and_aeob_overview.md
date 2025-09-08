
This section of the implementation guide (IG) focuses on enabling a provider to submit a [Good Faith Estimate (GFE) Packet](StructureDefinition-davinci-pct-gfe-packet.html) including [Good Faith Estimate resource profiles](artifacts.html#structures-gfe-resource-profiles) (Claim resources of type predetermination) along with supporting data (such as Patient, Coverage, etc.) to a payer. The payer can then use this information to generate an [Advanced Explanation of Benefit (AEOB) Packet](StructureDefinition-davinci-pct-aeob-packet.html) including [Advanced Explanation of Benefits resource profiles](artifacts.html#structures-aeob-resource-profiles) (ExplanationOfBenefit resources of type predetermination) along with supporting data that the patient, and optionally the provider (GFE submitter on claim resources), can retrieve to get an estimation of known costs for expected services at a specific point in time.

A primary goal of this guide is to enable the patient to have access to AEOBs for expected future medical items or services. Sharing this information with the provider is also supported as an option. This enables the provider to have an informed conversation with the patient to support better patient decision making. Payers sharing the same patient AEOB with Providers will support trust in the patient-provider relationship for more informed health decisions and thus improved health outcomes. Sharing the same AEOB with providers also reduces burden for all parties because everyone is working from the same information avoiding miscommunication, inaccuracies, and added stress. If this capability is supported by the implementer, the patient’s AEOB will be provided to the GFE submitting provider using the same profiles in this guide. In this way, the provider would receive the same information made available to the patient.
This guide does not currently specify a means for providers to update or cancel a GFE submission. Rather, if there is new information that may materially affect the estimation, the provider would submit a new [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html).


### Workflow at a Glance ###
![PCT GFE Submission and AEOB High Level Workflow](PCT_GFE_Submission_HighLevelWorkflow.png){:style="float: none;width: 800px;display: block;margin: auto;"}

Figure 1: The GFE submission and AEOB process. The dotted line indicates optional capabilities.

**GFE Submission and AEOB Diagram Steps (High Level View)**

1. A patient schedules a service which triggers the composition of a collection of one or more GFEs.

2. The collection of GFEs in the form of a FHIR resource bundle ([GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html)) is submitted (via the [gfe-submit operation](OperationDefinition-GFE-submit.html)) to the payer’s endpoint for AEOB creation.

3. The payer then processes, adjudicates, and produces the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html).

4. The patient and provider may receive a notification of availability of the AEOB Packet and can now request and receive the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) via FHIR query.

>Note: Communication to the patient could be through an app by a third-party or provider approved by the patient or directly to the patient by the payer.

>Note: The timeline that a payer is required to provide an AEOB is expected to depend on when the payer receives the GFE submission from provider/facility. For scheduled services, payers would determine if the request originated from a scheduled service from the [GFE Composition]( StructureDefinition-davinci-pct-gfe-composition.html) `Composition.extension[requestOriginationType].valueCodeableConcept` and use the service dates/time in the `Composition.extension[gfeServiceLinkingInfo].extension[plannedPeriodOfService].valueDate|valuePeriod` to determine the start of the service and the timeframe they have to provide an AEOB. It is allowed for a planned period of service to be provided for unscheduled services. This may be useful for situations where a service is not scheduled, but the time frame could affect the estimate (e.g. the service is planned in a different plan year).


### Multi-Provider Good Faith Estimates ###

This Implementation Guide defines two ways in which a set of GFE Claims from multiple providers can be assembled for the purpose of creating a single [AEOB Packet].
This Implementation Guide defines GFE Coordination workflow to enable providers and facilities to coordinate cost and planned service(s) or item(s) information for a patient’s period of care for which multi-provider Good Faith Estimates (GFE) are required, either to provide to the patient or, optionally, to submit to a payer (for patients using insurance.) Alternatively, there is another option for which separate GFEs from multiple providers for a single patient’s period of care can be identified for the purpose of creating a single AEOB Packet.  In Summary, the two options are:

1. The GFE Coordination workflow where the aggregation of a single [GFE Packet] is coordinated through a Task-based process involving multiple providers before submission to the payer through a single $gfe-submit operation
2. Linking and Assembling Separate GFE Submissions from multiple providers’ (each submitted via the $gfe-submit operation separately) then assembled by a payer or intermediary to produce a single  AEOB Packet.

Neither of these options is required by any actor defined in this Implementation Guide. Other methods not defined in this guide may be available.

#### The GFE Coordination Workflow ####

The GFE Coordination Workflow provides a means for GFE Coordination Requester (convening provider) to identify and notify all of the contributing providers (co-providers) needed and assign GFE Contributor Tasks asking for a GFE Bundle from each contributor through a Coordination Platform. Those contributors can attach their GFE Bundle and complete their Tasks to indicate it’s ready, rather than sending the GFE Bundle separately to the payer. The GFE Coordination Requester can then retrieve all the GFE Bundles from the Coordination Platform via a $gfe-retrieve operation in the form of a single GFE Packet. The GFE Packet  can then be submitted to a payer as a single submission containing all providers’ GFE Bundles for one patient’s period of care. This option is only available to providers with access to a platform that supports this function, which may be implemented by a 3rd party, by the convening or contributing provider, or even by a payer.

>Note: This technical approach option better facilitates coordination between providers prior to the submission of a consolidated GFE Packet, significantly increasing the likelihood of completeness.

#### Linking and Assembling Separate GFE Submissions ####

If the GFE Coordination Workflow is not an option for gathering all of the GFE Bundles from the contributing providers, this Implementation Guide provides a means for separate individual GFE Packet submissions to be linked for a payer to assemble. All providers submitting their individual GFE Packets related to one patient’s period of care need to provide the same GFEServiceLinkingInfo identifier (the GFE Packets GFE Composition `Composition.extension[gfeServiceLinkingInfo].extension[linkingIdentifier].valueIdentifier`). This identifier would likely be created, assigned, and sent by the provider that initiated the request to the other participating providers through a means not defined in this guide. The number of other providers expected to submit estimates may also be included. A payer or intermediary can then use this service linking information to assemble together a complete set of GFEs for which to create an AEOB Packet for. This option is only available to providers if the payer, or an intermediary, receiving the separate GFE submissions supports assembly after submission.

>Note: This option does not facilitate coordination providers prior to GFE Packet submission and therefore may lack completeness and reducing the likelihood for payers to accurately produce a complete Patient AEOB. This method does not provide a defined means for providers to directly indicate that they cannot participate. Additionally, since the GFEs are submitted individually, payers may not know when all of the GFEs have been received, what may be missing, when to start the time clock for compliance, and they may have to wait until the time limit is nearly expired before creating an AEOB Packet, possibly introducing unnecessary delays in providing the member with an estimate.




### Notifications for AEOB Packet Availability ###

Notifications may be handled using FHIR Subscriptions or other methods such as unsolicited notification or messaging. This IG provides requirements and guidance for the use of FHIR Subscriptions.

This IG uses the [FHIR Subscriptions R5 Backport Implementation Guide]({{site.data.fhir.ver.hl7_fhir_uv_subscriptions-backport}}) as a basis to support FHIR subscriptions. Support for the FHIR Subscriptions framework is new in this version of the PCT IG and is currently optional. However, FHIR Subscriptions will likely be required in a future version of this specification since it offers significant performance benefits. That guide references the SubscriptionTopic to express topics, or events that other systems can search for and subscribe to notifications of. The SubscriptionTopic resource is not supported by FHIR R4 systems. Instead, subscription topics in R4 can be defined using a Basic resource with extensions that represent the elements of the FHIR R5 resource. Neither standards based subscription topic discovery with the support of SubscriptionTopic nor the equivalent Basic resource versions described in the [Subscriptions R5 Backport IG]({{site.data.fhir.ver.hl7_fhir_uv_subscriptions-backport}}) are required by this guide to support subscriptions. Regardless of whether the SubscriptionTopic or R4 Basic resource equivalent is supported, a system wanting to support subscriptions can still use the canonical URL of the SubscriptionTopic resource defined in this IG as the basis to define the nature of the subscription and may use it as the `Subscription.criteria`.

Notifications of AEOB Packet availability should be sent to the intended recipient (patient or provider(s)). 
For the patients, this means the creation or update of a [AEOB Packet Document Reference](StructureDefinition-davinci-pct-aeob-documentreference.html) for which the patient is the `DocumentReference.subject`. This may be done by creating a compliant [Subscription - AEOB Available for Subject Notification](StructureDefinition-davinci-pct-aeob-available-subject-subscription.html) that references the [SubscriptionTopic - AEOB Available for Subject Notification](SubscriptionTopic-davinci-pct-aeob-available-subject-notification.html) canonical URL of `http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-aeob-available-subject-notification`.

For the Author(s) (Provider(s)), this means the creation or update of a [AEOB Packet Document Reference](StructureDefinition-davinci-pct-aeob-documentreference.html) for which the author (provider) is the `DocumentReference.author`. This may be done through creating a [Subscription - AEOB Available for Author Notification](StructureDefinition-davinci-pct-aeob-available-author-subscription.html) that references the [SubscriptionTopic - AEOB Available for Author Notification](SubscriptionTopic-davinci-pct-aeob-available-author-notification.html) canonical URL of `http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-aeob-available-author-notification`.

There may be one or more Authors for the AEOB and Notifications can be shared directly to all authors through this means or to one Author (Convening Provider/GFE Submitter) who can then share the Patient AEOB with other contributing/co-providers as needed.

The subscriptions defined for Packet availability defined in this IG are for the DocumentReference resource. Generally, an AEOB Packet should not be updated but should be replaced. However, if updates are supported and there is a separate Bundle for the AEOB Packet content that is updated, the associated DocumentReference should be updated to trigger a notification. 

### Data Structures ###

The figures below show the relationships between the profiles involved in this workflow.
> Note: For brevity, not all data elements are shown.


Figure 1 shows a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) submitted in the gfe-submit operation. It contains information about the patient, the payer and coverage information, and the [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html)s for processing.

![Figure 1. GFE Packet](GFE_Packet.png){:style="float: none;width: 800px;display: block;margin: auto;"}

Figure 1. [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html)



Figure 2 shows the components of the [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html). It contains the patient, coverage and payer if relevant, involved providers, and claims data with the estimated costs. If the GFE Coordination Workflow was used, this is the same [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) as the one provided by a GFE Contributor.
All resources (supporting info, etc.) needed to process the GFE and produce the AEOB will be included in the [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html). Relevant resources referenced by such resources will also be included.


![Figure 2. A GFE Bundle](GFE_Bundle.png){:style="float: none;width: 600px;display: block;margin: auto;"}

_Figure 2. A [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html)_



Figure 3 shows an [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) created by a payer in response to a GFE-submit operation.
The [AEOB Packet](StructureDefinition-davinci-pct-gfe-packet.html) will contain one or more AEOBs. Each AEOB will contain a reference to the original [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) (i.e., an exact copy of the originally submitted GFE).

The [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) includes, at a minimum, the full estimation based on the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) received in the GFE submission. If the payer or intermediary supports linking across submissions, the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) may include estimates across linked GFE submissions (e.g. through a [GFE Composition](StructureDefinition-davinci-pct-gfe-composition.html) [GFE Service Linking Info](StructureDefinition-gfeServiceLinkingInfo.html)).

![Figure 3. A AEOB Packet](AEOB_Packet.png){:style="float: none;width: 600px;display: block;margin: auto;"}

_Figure 3. A [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html)_

The [AEOB Summary](StructureDefinition-davinci-pct-aeob-summary.html) represents the full summary of the estimation including costs and benefits, of all of the AEOB data contained within an AEOB Bundle.


### Technical Workflows ###

#### Payer Perspective: End-to-End Workflow

<!-- TODO This visio workflow diagram needs to be updated, specifically the name of the bundle to "Packet". -->

The workflow diagram below describes the process of receiving a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) from the submitting provider and returning the completed AEOB asynchronously (or acknowledgement that the process was completed if the AEOB will not be returned to the provider), as well as the process for a patient app to query for and retrieve their completed AEOB.

![Payer Perspective](PCTWorkflowPayer.png){:style="float: none;width: 1000px;display: block;margin: auto;"}

**Figure 4: Payer Perspective: End-to-End Workflow**

1. The provider uses the gfe-submit operation to submit the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) to the payer endpoint. This is a POST request that follows the [Asynchronous Interaction Request Pattern](https://hl7.org/fhir/R5/async-bundle.html). Note: Asynchronous Interaction Request Pattern page is part of the FHIR R5 current build, but uses no R5 resources, this guide is simply pre-adopting that HTTP request pattern. 
  * If the payer’s FHIR-aware endpoint cannot handle the request (i.e. back-end system is down, etc.) an HTTP status code of 4XX or 5XX may be returned, or the GFE Submitter may receive no response at all if the web server is down or data were submitted to the wrong URL.
  * If the gfe-submit operation is successfully invoked, the request will move to Step 2. 
2. The payer system validates the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) against the FHIR R4 core specification and the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) profile and other appropriate profiles in this guide (e.g. using the core FHIR [validate](http://hl7.org/fhir/resource-operation-validate.html) operation). 
  * If any validation errors or other issues are encountered, an HTTP status code of 400 Bad Request is returned along with an OperationOutcome resource containing information about the encountered issues.
  * If successful, the request will move to Step 3. 
  > Note: The [OperationOutcome Resource]({{site.data.fhir.path}}operationoutcome.html) is a collection of error, warning, or information messages that result from a system action or operation like the one described here. More information about the purpose and use of the OperationOutcome resource can be found in the FHIR specification.
3. The Payer system may perform a quick preprocess of automated business rules to ensure the submission is processable
  * If any automated business rule issues are encountered that would prohibit further processing, an HTTP status code of `422 Unprocessable Entity` is returned along with an OperationOutcome resource containing information about the encountered issues.
  * If successful, the request will move to Step 4.
  > Note: This preprocessing step is synchronous to the submission request and must be automated and not substantially extend response time.

4. The payer system accepts the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html). An HTTP status code of `202 Accepted` is returned, and the Content-Location header  contains a URL for subsequent polling. 
5. The payer system begins processing the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) asynchronously to produce the AEOB. Some payers may process GFEs in near real time, which this guide can support, but more likely this process will take a substantial amount of time, up to the limits allowed by regulation. 
  * If a payer receives a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) with a `replaces` relatesTo identifier that matches a previous GFE Submission identifier by the same submitter and the AEOB is not yet complete, the payer may assume that an AEOB response is no longer needed for the previous request and process the new request instead.
  * If a payer receives a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) with a `replaces` relatesTo identifier that matches a previous GFE Submission identifier by the same submitter for which an AEOB Packet has been created, the payer should create a new AEOB Packet with Composition that has replaces relatesTo identifier of the previously created AEOB Composition and an [AEOB Packet DocumentReference](StructureDefinition-davinci-pct-aeob-documentreference.html) replaces relatesTo target that references the previously created [AEOB Packet DocumentReference](StructureDefinition-davinci-pct-aeob-documentreference.html).
6. GFE processing can result in success or failure. 
  * In case of failure, the payer system sets the status of the request (identified by the unique URL returned in Step 3) to error, and prepares an OperationOutcome resource with details and moves to Step 7. The payer should also notify the patient that the estimate was unable to be produced leveraging similar existing EOB/Claims business processes, though this communication to the patient is out of scope for this guide. 
  * If successful, move to Step 6. 
7. GFE processing completes successfully and the payer produces an AEOB and related resources. 
  * The payer system sets the status of the request (identified by the URL returned in Step 3) to completed, prepares a batch-response Bundle resource, and moves to Step 7. 
  * If the payer system supports API access for the patient, the AEOB is made accessible per the Patient Perspective section below. 
  * If the payer supports a patient subscription for AEOB availability (Subscription - AEOB Available for Subject Notification) the payer can notify the patient app accordingly.
8. The payer system provides an endpoint at the URL provided in Step 3 whereby the provider can poll for GFE processing status.   
  * If the response is in-progress, the endpoint returns an HTTP status code of `202 Accepted`, indicating that the provider should poll again later. The payer system should return a Retry-After header with each in-progress polling response, and the client should use this information to inform the timing of the next polling request. 
  * If the response is an error, the endpoint returns an HTTP status code of 4XX or 5XX, and the body of the response is an OperationOutcome detailing the error. 
  * If the response is successful, the endpoint returns an HTTP status code of `200 OK`, and the body of the request is a [Bundle resource of type batch-response](https://www.hl7.org/fhir/codesystem-bundle-type.html#bundle-type-batch-response). This batch-response bundle can contain the completed [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) and can contain one or more OperationOutcome resources with additional information regarding GFE/AEOB processing. If the batch-response Bundle does not contain an [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html), then it will contain at least one OperationOutcome resource detailing the reason why the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) is not present (e.g. the AEOB was sent directly to the patient and will not be returned to the provider). 
  * The AEOB Packet should be made available to patients and their providers. The AEOB Packet the provider receives should have the same information as the one the patient receives.
  * If the payer supports provider subscription for AEOB availability (Subscription - GFE Available for Subject Notification) the payer can notify the provider app accordingly.


The individual steps from the provider and patient perspective are detailed in the sections below. 

#### Provider Perspective: Submitting a GFE and Polling for a Completed AEOB

A patient schedules a service and this triggers the composition of a collection of one or more GFEs, which the provider then submits to the payer for processing.

![Provider Perspective](PCTWorkflowProvider.png){:style="float: none;width: 600px;display: block;margin: auto;"}

**Figure 5: Provider Perspective**

1. The provider uses the gfe-submit operation to submit the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) to the payer endpoint. This is a POST request that follows the [Asynchronous Interaction Request Pattern](https://hl7.org/fhir/R5/async-bundle.html). Note: The Asynchronous Interaction Request Pattern page is part of the FHIR R5 current build, but uses no R5 resources, this guide is simply pre-adopting that HTTP request pattern. 
  * If successful, this request will return an HTTP status code of `202 Accepted` with a Content-Location header containing the absolute URL of an endpoint for subsequent status requests (polling location). 
  * If the operation fails it will return an HTTP status code of 4XX or 5XX and an OperationOutcome resource containing the error details (such as a 412 Precondition Failed if the content of the POST was not a valid [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html)), provided the operation was successfully invoked (i.e., if the POST was submitted to a non-existent URL, the submitter would likely receive a 404 Not Found status code with no OperationOutcome). 

2. If Step 1 resulted in a `202 Accepted` return code and a valid URL in the Content-Location header, the provider may now poll for the status of the request. The [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) is created asynchronously since GFE processing has not taken place yet. The url returned in Step 1 can now be used to check the status of the AEOB process. 
  * If the response is in-progress, this request will return an HTTP status code of `202 Accepted`, indicating that the provider should poll again later. The payer system should return a Retry-After header with each in-progress polling response, and the client should use this information to inform the timing of the next polling request. 
  * If the response is an error, this request will return an HTTP status code of 4XX or 5XX, and the body of the response will be an OperationOutcome detailing the error. 
  * If the response is successful, this request will return an HTTP status code of `200 OK`, and the body of the request will be a Bundle resource of type batch-response. This batch-response bundle can contain the completed [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) and may contain one or more OperationOutcome resources with additional information regarding GFE/AEOB processing. If the batch-response Bundle does not contain an [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html), then it will contain at least one OperationOutcome resource detailing the reason why the [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html) is not present (e.g. the AEOB was sent directly to the patient and will not be returned to the provider). 

#### Patient Perspective: Get Completed AEOB from Payer

The patient has scheduled the service(s) with the provider(s). The payer may return the completed AEOB to the patient in many ways such as via mail, the payer patient portal, mobile app, or other technology to connect to the AEOB API. The only method in scope for this guide is the FHIR-based API approach inspired by the Patient Access API defined in the [CARIN Consumer Directed Payer Data Exchange](https://hl7.org/fhir/us/carin-bb/Use_Case.html#use-case---consumer-access-to-their-claims-data) guide (CARIN IG for Blue Button). If the payer does implement both this API and the Patient Access API defined in the CARIN IG, it is up to the payer to determine if those APIs use the same or different endpoints. 

![Patient Perspective](PCTWorkflowPatient.png){:style="float: none;width: 600px;display: block;margin: auto;"}

**Figure 6: Patient Perspective**

1. A third party app used by the patient authorizes/authenticates and receives an access token. The app requests the AEOB by using the access token using a GET request for ExplanationOfBenefit resources in the patient's compartment. For example, GET [base]/ExplanationOfBenefit?patient=[patient-id]. Payer systems need to implement appropriate access controls to ensure that AEOBs are only accessible by the authenticated patient. 
  * If successful, the system will return 200 OK, and the body will contain a [Bundle resource of type searchset]({{site.data.fhir.path}}codesystem-bundle-type.html#bundle-type-searchset), containing zero or more ExplanationOfBenefit resources. Once the desired AEOB is found, the third-party app may use the same API to query for other resources referenced by the AEOB, such as Patient, Practitioner, Organization, and Coverage resources if those referenced resources are not contained in the AEOB itself. New AEOBs (either for new services or new updates to an existing AEOB) would have a different identifier and a created date later than previous AEOBs. 
  
Note: If GFE processing fails, the payer may use existing business processes to notify the patient, but this is out of scope for this guide. 


#### Examples

**Waive NSA Rights Consent Example Scenario**

The diagram below  shows examples of how a patient may provide or withhold consent for No Surprises Act protections using the balanceBilling extension on the GFE and how that could change the resulting AEOB from the payer.  

![Balance Billing](GFEbalanceBilling.png){:style="float: none;width: 1000px;display: block;margin: auto;"}

**MRI Scenario**

1.  Eve Betterhalf sees Dr. Patricia Primary (PCP) at ABC Medical Group on Monday with a prolonged migraine headache lasting over a 4-month period. Dr. Primary recommends a brain MRI (CPT 70551).
2.  Eve walks to the PCP front desk; they  enter the order into the EMR system and direct the patient to ABC’s Radiology department.
3.  Radiology reviews the order for completeness and accuracy and confirms all needed information is present.
4.  The next day, Eve calls the radiology center (ABC Radiology, NPI - 1234567893) to schedule her brain MRI, CPT 70551, and provide her coverage information, which she plans to use.
5.  The MRI is scheduled for nine days from today. The GFE Submit and AEOB process is started if an estimate is wanted or needed.
6.  Optionally, Eve can also login to the Radiology’s site to download the information about her expected services, should she want to request an estimate separately.
7.  The ABC Radiology’s Office Administrator enters the services and coverage information, initiates the process with other potential providers to generate the GFE for the expected charges with the expected billing and diagnostic codes.
8.  This information is sent to the payer.
9.  The payer receives the GFE. Within one business day, the payer adjudicates it and sends the GFEs of cost, cost-sharing and progress towards meeting deductibles and out-of-pocket maximums, as well as whether a service is subject to medical management and relevant disclaimers of estimates as an AEOB securely to Eve.
10. Optionally, the payer also sends a response to ABC’s Radiology Office Administrator with the same cost estimate information.
11. Eve receives the AEOB from the payer based on the information provided by ABC Radiology.
12. Optionally, Eve or an authorized user could use their third-party app to query for the AEOB via API (if supported by their payer).

##### MRI Examples  

[GFE Professional](Claim-PCT-GFE-Professional-MRI.html)<br>
[GFE Institutional](Claim-PCT-GFE-Institutional-MRI.html)<br>
[AEOB](ExplanationOfBenefit-PCT-AEOB-1.html)
