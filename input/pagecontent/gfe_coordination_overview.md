{% include draft_content_note.md content="page" %}

This section of the implementation guide (IG) focuses on enabling providers and facilities to coordinate cost and planned service(s) or item(s) information for a patient’s period of care for which multi-provider GFE are required, either to provide to the patient or, optionally, to submit to a payer (for patients using insurance.)

This guide supports the:

- Ability for a convening provider, acting as a coordination requester, to notify co-providers, acting as contributors, and request data to inform GFE for expected items and services.

- Ability for contributors to respond to a request for data back to a coordination requester with cost and planned items and services information.

- Ability for a coordination platform to communicate a GFE to payer (leveraging an existing PCT IG workflow) and to other providers in the care team, prior to scheduled a service or upon request.

- The role a provider plays in this collaboration will change from case to case. In some cases, a provider will be a GFE Coordination Requester because the patient’s care is starting with them - the service was scheduled with this provider. If this provider is also providing items and services to be included in the GFE, they will also play the role of a GFE Contributor. For other patients, the same provider may be a co-provider supporting a different provider or facility with a patient’s period of care, in which case they will only act as a GFE Contributor. In either role, the IG provides tools to support the collaboration effort and the production of a single GFE. Certain state regulations may also inform which role a provider plays. 

The coordination platform is introduced in this guide to act as the system designated by the convening provider to aggregate the GFE information across providers when multiple providers are engaged in a service. This allows for variability in the role of “convening” providers and data for the GFE. Some examples of systems that could serve as GFE coordination platforms include a: practice management system, electronic health record (EHR) system, cost estimator, clearinghouse, billing services, or payer system. 

Additionally, see the [Terms and Concepts](index.html#terms-and-concepts) and [Systems and Actors](use_cases.html#actors) for more detail on acronyms and new terms.  


### Workflow at a Glance ###
![PCT GFE Coordination High Level Workflow](PCT_GFE_Coordination_HighLevelWorkflow.png){:style="float: none;width: 600px;display: block;margin: auto;"}

**GFE Coordination Diagram Steps (High Level View)**
> Pre-step: A patient schedules a service or requests an estimate for a service which triggers the collection of one or more GFEs. 
> Note: This workflow is used as a standard means of coordinating a GFE with multiple providers.


1. A GFE Coordination Requester identifies all of the co-providers and retrieves their FHIR identifiers from the Coordination Platform.

2. The GFE Coordination Requester creates a set of Tasks (a single Coordinating [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and one or more [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)(s)) that contain the information necessary to create an estimate on the Coordination Platform. 
    >Note: If the GFE Coordination Requester needs to provide a GFE Bundle as part of this request, they will also need to serve in the GFE Contributor role by creating a GFE Contributor task for themselves and carry out the requirements of that role.

3. GFE Contributors are notified of a new task assignment.

4. The GFE Contributor retrieves the Task and request information (GFE Information Bundle)
   The GFE Contributor can then decide to accept or reject the request and update the task appropriately.
    >Note: GFE Contributors should not reject a Task because of insufficient information to produce a GFE and instead should contact the GFE requester for the necessary information.

5. The GFE Collaboration Requester is notified of status updates to the tasks they created.

6. When notified of a reject status, the GFE Coordination Requester can create a new [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) for a new contributor if they would like.

7. If the GFE Contributor accepts the request, they will collect the requested estimate(s), place them into a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html), attach it to the task and mark completed. Only GFE Contributor Tasks with a `status` of `completed` and appropriately attached GFE Bundles will have those GFE Bundles included in the GFE Packet provided to the GFE Coordination Requester when they call the `$gfe-retrieve` operation.

8. The GFE Coordination Requester can retrieve a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) (made up of attached GFE Bundles and information about [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html)s) at any time through a gfe-retrieve operation. 

9. The GFE Coordination Requester can close the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) by updating the status as `completed`, `cancelled`, `failed`, or `entered-in-error` when the GFE collection is to be concluded and no more changes, updates, or GFE Bundles will be accepted. The requester can add a `statusReason` indicating why the Task has been concluded (e.g. the task has been fulfilled, the time limit has been reached, the service has been cancelled, etc.)

>Note: Providers use the [Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) Scheduled Date/GFE Request - `Task.extension[request-initiation-time]` to determine the date of scheduling or request.  For scheduled services, providers would use the Service Dates/Times - `Task.extension[planned-service-period]` to determine the start of the service period. If there is no Service Date/time provided, then the notification is considered to be for an unscheduled estimation request.

### Notifications ###

Notifications may be handled using FHIR Subscriptions or other methods such as unsolicited notification or messaging. This IG provides requirements and guidance for the use of FHIR Subscriptions.
This IG uses the [FHIR Subscriptions R5 Backport Implementation Guide]({{site.data.fhir.ver.hl7_fhir_uv_subscriptions-backport}}) as a basis to support FHIR subscriptions. Support for the FHIR Subscriptions framework is new in this version of the PCT IG and is currently optional. However, FHIR Subscriptions will likely be required in a future version of this specification since it offers significant performance benefits. That guide references the SubscriptionTopic resource to express topics; or events that other systems can search for and subscribe to notifications of. The SubscriptionTopic resource is not supported by FHIR R4 systems. Instead, Subscription Topics in R4 can be defined using a Basic resource with extensions that represent the elements of the FHIR R5 resource. Neither standards-based subscription topic discovery with the support of SubscriptionTopic nor the equivalent Basic resource versions described in the [Subscriptions R5 Backport IG]({{site.data.fhir.ver.hl7_fhir_uv_subscriptions-backport}}) is required by this guide to support subscriptions. Regardless of whether the SubscriptionTopic or R4 Basic resource equivalent is supported, a system wanting to support subscriptions can still use the canonical URL of the SubscriptionTopic defined in this IG as the basis to define the nature of the subscription and may use it as the `Subcription.criteria`. 


#### Task Creation and Updates ####
Notifications should be sent to participants whenever a change is made that the participant may need to act upon. For the Coordination Requester, this means any updates to (or the creation of) the Coordination Task or Contributor Tasks for which they are the `requester`. For the Contributor, this means any updates to (or the creation of) a non-draft Contributor Task for which they are the `owner` as well as any updates to a Coordination Task of which such Contributor Tasks are `partOf`. This may be done by creating a compliant [Subscription - GFE Coordination Task Update Notification](StructureDefinition-davinci-pct-gfe-task-update-subscription.html) that references the [SubscriptionTopic - GFE Coordination Task Notification](SubscriptionTopic-davinci-pct-gfe-coordination-task-notification.html) canonical URL. 

#### GFE Packet Availability ####
Providers may need to make the GFE Packet available to the patient or other contributing providers. This may need to be done as part of the coordination workflow with multiple providers or separately with a single provider. In either scenario, this could be handled by the provider directly or through an intermediary such as the Coordination Platform. Notifications of the availability of a new or updated GFE Packet should be sent to the patient, their authorized representative, or other providers. 

For the patients, this means the creation or update of a [GFE Packet DocumentReference](StructureDefinition-davinci-pct-gfe-documentreference.html) for which the patient is the `DocumentReference.subject`. This may be done through creating a compliant [Subscription - GFE Available for Subject Notification](StructureDefinition-davinci-pct-gfe-available-subject-subscription.html) that references the [SubscriptionTopic - GFE Available for Subject Notification](SubscriptionTopic-davinci-pct-gfe-available-subject-notification.html) canonical URL of `http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-available-subject-notification`. 

For the Authors (Contributing Providers), this means the creation or update of a [GFE Packet DocumentReference](StructureDefinition-davinci-pct-gfe-documentreference.html) for which the author (provider) is the `DocumentReference.author`. This may be done through creating a compliant [Subscription - GFE Available for Author Notification](StructureDefinition-davinci-pct-gfe-available-author-subscription.html) that references the [SubscriptionTopic - GFE Available for Subject Notification](SubscriptionTopic-davinci-pct-gfe-available-author-notification.html) canonical URL of `http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-available-author-notification`.

The subscriptions defined for Packet availability defined in this IG are for the DocumentReference resource. Generally, there should not be updates to an GFE Packet (should be replaced). However, if updates are supported and  a separate Bundle for the GFE Packet content that is updated exists, the associated DocumentReference should be updated to trigger a notification. 



### Data Structures ###

Below are illustrations showing the relationships between the profiles involved in this workflow.
> Note: For brevity, not all data elements are shown.

Figure 1 shows a GFE Coordination Bundle which is a transaction Bundle is used by a GFE Coordination Requester to submit all resources involved in a GFE coordination request through the [$gfe-coordination-request operation](OperationDefinition-GFE-coordination-request.html). It includes a single [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html), and one or more [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)s. The [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) must have a GFE Information Bundle associated to it. This information bundle is used to express all of the generally applicable information needed for GFE Contributors to make their estimates. Optionally, the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)s may also have a GFE Information Bundle associated to them to convey any provider specific information, such as specific services or to share specific contextual clinical information.A GFE Information Bundle is preferably associated to its respective Task resource by encoding it in the `Task.input.valueAttachment`. 
The Task references to Practitioner and Organization must point to the instances on the Coordination Platform.

![Figure 1. GFE Coordination Bundle as created by the GFE Coordination Requester](GFE_Coordination_Bundle.png){:style="float: none;width: 600px;display: block;margin: auto;"}

_Figure 1. GFE Coordination Bundle as created by the GFE Coordination Requester_


Figure 2 shows the relationships of the resources involved in GFE coordination request as they exist on the Coordination Platform whether they be written individually or through the GFE Coordination Bundle transaction. If the GFE Information Bundles are not contained in the Task, they would exist as Bundle resources that would be individually retrievable from the Coordination Platform.

![Figure 2. GFE Coordination Bundle content as stored on the Coordination Platform](GFE_Coordination_Platform_Resources.png){:style="float: none;width: 600px;display: block;margin: auto;"}

_Figure 2. GFE Coordination Bundle content as stored on the Coordination Platform_


Figure 3 shows the GFE Information Bundle is created by the GFE Coordination Requester and is meant to contain the information needed for GFE Contributors to make their estimate. This includes the Patient, Coverage and Payer if applicable, specific providers or roles being asked for (not the same as those on the Coordination Platform), requested items (including items and services), and any additional documentation. Additional resources that provide important contextual information that could affect needed items, services, or costs, such as Conditions or Observations, are also allowed.


![Figure 3. GFE Information Bundle created by the GFE Coordination Requester](GFE_Information_Bundle.png){:style="float: none;width: 600px;display: block;margin: auto;"}

_Figure 3. GFE Information Bundle created by the GFE Coordination Requester_


Figure 4 shows the [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) which is created by the GFE Contributor and attached to their [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html). It contains the Patient, Coverage and Payer if relevant, involved providers, and Claims data with the estimated costs.

![Figure 4. A GFE Bundle created by the GFE Contributor](GFE_Bundle.png){:style="float: none;width: 400px;display: block;margin: auto;"}

_Figure 4. A [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) created by the GFE Contributor_


Figure 5 shows the [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) which is used to convey that a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) did not have a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) attached when a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) was compiled. The purpose of this bundle is to provide an indication that a GFE collection is incomplete and what is missing, including the GFE Contributor and the items and services that an estimate requested for. 

![Figure 5. A GFE Missing bundle created by the Coordination Platform](GFE_Missing_Bundle.png){:style="float: none;width: 400px;display: block;margin: auto;"}

_Figure 5. A [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) created by the Coordination Platform_


Figure 6 shows the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) created by the Coordination Platform when the GFE Coordination Requester calls the `gfe-retrieve` operation. In response to the `gre-retrieve` operation the provider (Practitioner or Organization). As part of the [GFE Submission and AEOB Workflow](gfe_submission_and_aeob_overview.html), this represents the GFE submitter (which can be changed before the submission if necessary).


![Figure 6. GFE Packet created by the Coordination Platform](GFE_Packet.png){:style="float: none;width: 600px;display: block;margin: auto;"}

_Figure 6. [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) created by the Coordination Platform_



### Technical Workflows ###

#### Full GFE Coordination: End-to-End Workflow

<!--TODO Make sure that the workflow is updated per the changes on the Task workflow, Specifically status transitions and what actions are performed by which actors

TODO This visio workflow diagram needs to be updated, specifically for "closing" and possibly other places. and update the names of the resources/bundles e.g. as "packets"
-->
![GFE Coordination Technical Workflow](PCTCoordinationWorkflow.png){:style="float: none;width: 1000px;display: block;margin: auto;"}

_Figure 7. GFE Coordination Technical Workflow_


1. GFE Coordinating Requester performs a FHIR search for [Practitioner](StructureDefinition-davinci-pct-practitioner.html), [PractitionerRole]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-practitionerrole.html), or [Organization](StructureDefinition-davinci-pct-organization.html) resources. If successful (200 OK), the search will return 0 or more resources.
    * If 1 or more resources are returned, the GFE Coordination Requestor processes those resources, extracting the resource IDs for use in step 2.
    * If 0 resources are returned, or an error occurs, the requester should reformulate their search and try again.
    <!--TODO Still need a fail early mechanism, App ack in initial communication-->
    
2. GFE Coordinating Requester creates a [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and 1 or more [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources, creates and attaches one or more [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) resources and includes them in a [GFE Coordination Bundle](StructureDefinition-davinci-pct-gfe-coordination-bundle.html), then uses [$gfe-coordination-request operation](OperationDefinition-GFE-coordination-request.html) of the Coordination Platform’s FHIR server.
    * If successful, the content of the bundle will be stored as separate resources on the FHIR server, and notifications will be sent to all GFE Contributors referenced in the Tasks per step 3. The notifications may be sent via FHIR subscriptions, which can be triggered by a create operation, or they may be out of band notifications using whatever mechanism the coordination platform chooses.
    * If the [$gfe-coordination-request operation](OperationDefinition-GFE-coordination-request.html) fails, the entire transaction is rolled back, an OperationOutcome resource will be returned indicating the nature of the error(s), and no resources will be stored on the Coordination Platform. The requester must address any errors and resubmit.

3. Notifications will be sent to all GFE Contributors referenced in the Task resources submitted in step 2.
    * The notifications may be sent via FHIR subscriptions, which can be triggered by a create operation, or they may be out of band notifications using whatever mechanism the Coordination Platform chooses.

4. Each GFE Contributor retrieves their respective [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) from the Coordination Platform, reviews the contents, and responds by updating the `Task.status` appropriately and using a FHIR PUT operation to update the Task on the Coordination Platform FHIR endpoint.
    * If the contributor accepts the task, `Task.status` shall be changed to `accepted`.
    * If the contributor declines the task, `Task.status` shall be changed to `rejected` and the reason for the rejection should be placed in `Task.statusReason`.

5. After each GFE Contributor has updated their respective [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html), the GFE Coordination Requester is notified of the changes (same process as step 3) and reviews the updates. If a GFE Contributor has rejected, the GFE Coordination Requester may choose to replace the contributor or cancel the entire request depending on the reason if one is provided in `Task.statusReason` (e.g. if a key participant is unable to participate due to a proposed date of service, the GFE Coordination Requester may wish to cancel the entire request and make a new request with a time that works for that participant). If the Coordination Requester creates a new set of Tasks that replaces this cancelled set, they may add a GFE Related Task extension to one or more of the new Tasks that references the appropriate cancelled tasks and has a code of replaces. (This may aid GFE Contributors in developing a new GFE Bundle as well as record keeping)

6. After accepting a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html), each GFE Contributor creates a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) with their good faith estimate (consisting of one or more GFE Claim resources) and any supporting resources. They then attach that bundle to their [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html), sets the status to `completed` and does an HTTP PUT operation to update the task.

7. At any time after the initial creation of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) on the Coordination Platform the GFE Coordination Requester may retrieve the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) by calling the [$gfe-retrieve operation](OperationDefinition-GFE-retrieve.html). This is often done after verifying the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) for each contributor has been set to `completed`. To create the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) triggered by the call to the [$gfe-retrieve operation](OperationDefinition-GFE-retrieve.html), the Coordination Platform will:
    * Retrieve all [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resources attached to associated Tasks with status of `completed`.
    * Create [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html)s for each incomplete task
    * Create a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) containing all [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) and [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) resources, and return it in the body of the operation
    * If there is a date in [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) `Task.extension[planned-service-period]`, this date/time is placed into the [GFE Composition](StructureDefinition-davinci-pct-gfe-composition.html)  `Composition.extension[gfeServiceLinkingInfo].extension[plannedPeriodOfService].valuePeriod`
    * The code in the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) `Task.reasonCode` is placed into the [GFE Composition]( StructureDefinition-davinci-pct-gfe-composition.html) `Composition.extension[requestOriginationType].valueCodeableConcept`

8. GFE Coordination Requestor provides the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) to the patient directly, or optionally for insured patients, proceeds to the [GFE Submission and AEOB Workflow]( gfe_submission_and_aeob_overview.html) and submits the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) to the Payer. (If a Coordination Platform submits a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) to a payer, it takes on the role of a GFE Submitter acting on behalf of the provider)

    Note: This IG does not require GFE coordination to take place in order for providers to submit GFEs to payers, nor does it require the output of the GFE coordination be submitted to a payer.

    Note: This [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) should be provided to either the patient or submitted to the payer with the same resources as it was received from the Coordination Platform, including the [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html)s. This is important so that the patient can be made aware of any missing estimates when they receive the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) or [AEOB Packet](StructureDefinition-davinci-pct-aeob-packet.html).

9. The GFE Coordination Requester updates the status of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) to `completed` and sets a statusReason using an HTTP Put operation on the Coordination Platform's FHIR Server.

    Notes: [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html)s should be marked as completed and should not be marked as cancelled if the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) is being delivered to the patient or payer.

    GFE Contributors may receive notifications on task status changes which could be used as an indication that a coordination activity has been completed though they may not have completed their task by providing a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html).

    Additionally GFE Coordination Requesters may want to notify GFE Requesters when their [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) has been passed on the patient or payer and include an indication as to whether they had a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) included in the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html).

    NOTE: The GFE Coordination Workflow, including the use of the Coordination Platform, does not assume or require that each system providing information that will ultimately be included in the GFE Bundle is leveraging FHIR. It is possible and expected that a certain amount of communication and coordination throughout this process will be out of band.

    Providers engaged in contributing the GFE bundle may need to discuss care planning for the patient pre-service, or they may need to discuss the patient’s case in detail to best estimate the care that will be needed as part of the service in question. Provider staff may already have established communication methods for scheduling and staffing specific services and procedures. These out of band activities can continue and the information generated from these interactions can then be supplied to the Coordination Platform, or specifically to the convening provider, via non-FHIR mechanisms.

    The expectation is that regardless of how this information is compiled and estimates are developed, the information can be included in the GFE Bundle and ultimately be part of a FHIR-based process that will facilitate the creation of an AEOB. The GFE Coordination Workflow does not preclude out of band activities but provides an opportunity to include out of band information gathering in the FHIR-based payload ultimately shared as part of the GFE Bundle.

10. The Coordination Platform updates the status of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and each associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `Task.businessStatus` to `closed`.

11. In the event that a new set of GFEs are required (for example when a sufficient amount of time has passed to warrant a refreshed estimate or where slight modifications to the services or products from a previously completed estimate was required) the Coordination Requester may create a new set of Tasks that is noted to succeed this previous completed set. This can be done by adding the GFE Related Task extension to one or more of the new Tasks that references the appropriate previous Tasks and a code of previous. (This may aid GFE Contributors in developing a new GFE Bundle as well as record keeping).
Note: This is a replacement of the Task not the GFE or GFE Bundles.

#### Examples

**Timeline Example Scenario**
The diagram below demonstrates use of the available date elements to meet turnaround times to provide Good Faith Estimates (GFE)

![Request Timeline Example](Timeline_Example.png){:style="float: none;width: 800px;display: block;margin: auto;"}
_Figure 8. Request Timeline Example_


> Note: This is one example scenario. Providers and facilities will determine what role they play. Providers and facilities may need to be prepared to play the convening provider or co-provider, depending on their role in the patient’s service and in accordance with federal, state, and local regulations.

Assumptions:
* Patient does not have health insurance and will self-pay for the expected services.
* This is clinically appropriate (Clinical Decision Support [CDS] Score).
* Service location is known (e.g., address).
* Surgeon is external to Hospital
* Providers all respond with their data in a timely manner


1. On Monday, Adam Everyman is seen by Dr. Carla Cutter, a surgeon, and is advised a surgical procedure is needed. Adam Everyman presents as self-pay for the surgery and associated services in the period of care. 

2. Dr. Carla Cutter requests a surgical case time from Good Health Hospital (Convening Facility) 

3. On Tuesday, Good Health Hospital (Convening Facility) confirms and schedules the surgery, booking the OR for 8 days from today (clock starts here)

4. Good Health Hospital (Convening Facility) identifies the co-providers needed for the procedure and triggers a request for price estimate from the ordering surgeon, Dr. Carla Cutter (co-provider 1), Sleeper Anesthesiologist Group (co-provider 2), through their designated Coordination Platform. 

5. Dr. Carla Cutter’s office and Sleeper Anesthesiologist Group (Co-Providers) each review the procedure(s), relevant clinical data and respond to the GFE coordination request with procedures, pricing, including patient responsibility via the designated Coordination Platform. 

6. Good Health Hospital (Convening Facility) also submits an estimate for the OR time and facility charges that will be included in the GFE through the Coordination Platform, in this way also contributing to the estimate as a GFE Contributor.

7. Good Health Hospital’s assigned Coordination Platform aggregates all convening and co-provider estimates into a single GFE, with the summary total for the surgery across providers as well as the details per provider and the associated facility charges.

7. GFE is posted to API available to the Patient by Tuesday (within one business day from time of scheduling)


### Multi-Provider Coordination Workflow Alternative ###

If the GFE Coordination Workflow is not an option for gathering all of the GFE Bundles from the contributing providers, this Implementation Guide provides a means for separate individual GFE Packet submissions to be assembled via use of linking identifiers. See the section [Multi-Provider Good Faith Estimates](gfe_submission_and_aeob_overview.html#multi-provider-good-faith-estimates) for more details.