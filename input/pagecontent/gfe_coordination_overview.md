{% include draft_content_note.md content="page" %}

This section of the Implementation Guide focuses on enabling providers and facilities to coordinate cost and planned service(s) or item(s) information for a patient’s period of care for which multi-provider Good Faith Estimates (GFE) are required, either to provide to the patient or to submit to a payer (for patients using insurance.)

This guide supports the:

- Ability for a convening provider, acting as a coordination requester, to notify co-providers, acting as contributors, and request data to inform Good Faith Estimates (GFEs) for expected items and services.

- Ability for contributors to respond to a request for data back to a coordination requester with cost and planned items and services information.

- Ability for a Coordination Platform to communicate a GFE to payer (leveraging an existing PCT IG workflow) and to other providers in the care team, prior to scheduled a service or upon request.

The Coordination Platform is introduced in this guide to act as the system designated by the convening provider to aggregate the GFE information across providers when multiple providers are engaged in a service. This allows for variability in the role of “convening” providers and data for the GFE. Some examples of systems that could serve as GFE coordination platforms include a: practice management system, electronic health record (EHR) system, cost estimator, clearinghouse, billing services, or payer system. 

Additionally, see the Terms and Concepts (link) and Systems and Actors (link) for more detail on acronyms and new terms.  

Good Faith Estimate (GFE) Bundle including [Good Faith Estimate resource profiles](artifacts.html#structures-gfe-resource-profiles) (Claim resources of type predetermination) along with supporting data (such as Patient, Coverage, etc.) to a payer. The payer can then use this information to generate an Advanced Explanation of Benefit (AEOB) Bundle including [Advanced Explanation of Benefits resource profiles](artifacts.html#structures-aeob-resource-profiles) (ExplanationOfBenefit resources of type predetermination) along with supporting data that the patient, and optionally the provider (GFE submitter on claim resources), can retrieve to get an estimation of costs for expected services as known at a specific point in time.

### Workflow at a Glance ###
![PCT GFE Coordination High Level Workflow](PCT_GFE_Coordination_HighLevelWorkflow.png){:style="float: none;"}

**GFE Coordination Diagram Steps (High Level View)**
> Pre-Step: A patient schedules a service or requests an estimate for a service which triggers the collection of one or more GFEs. 
> Note: This workflow is used when there is need for a standard means of coordinating on a GFE with multiple providers.


1. A GFE Coordination Requester identifies all of the co-providers and retrieves their FHIR identifiers from the Coordination Platform.

2. The GFE Coordination Requester creates a set of Tasks (a single Coordinating GFE Coordination Task and one or more GFE Contributor Task(s)) that contain the information necessary to create an estimate on the Coordination Platform. 

3. GFE Contributors are notified of a new task assignment.

4. The GFE Contributor retrieves the task and request information (GFE Information Bundle)
   The GFE Contributor can then decide to accept or reject the request and update the task appropriately.

5. The GFE Collaboration Requester is notified of status updates to the tasks they created.

6. When notified of a reject status, the GFE Coordination Requester can create a new GFE Contributor Task for a new contributor if they would like.

7. If the GFE Contributor accepts the request, they will collect the requested estimate(s), place them into a GFE Bundle, attach it to the task and mark completed.

8. The GFE Coordination Requester can retrieve a GFE Collection Bundle (made up of attached GFE Bundles  and information about GFE Missing Bundles) at any time through a gfe-retrieve operation. They could also choose to ‘close’ the Coordination Task by marking it as completed.

### Data Structures ###

Below are illustrations showing the relationships between the profiles involved in this workflow.
> Note: For brevity, not all data elements are shown.

Figure 1 shows a GFE Coordination Bundle which is a transaction Bundle that can be used by a GFE Coordination Requester to submit all resources involved in a GFE coordination request in a single POST transaction. It includes a single GFE Coordination Task, and one or more GFE Contributor Tasks. The GFE Coordination Task must have a GFE Information Bundle associated to it. This information bundle is used to express all of the generally applicable information needed for GFE Contributors to make their estimates. Optionally, the GFE Contributor Tasks may also have a GFE Information Bundle associated to them to convey any provider specific information, such as specific services or to share specific contextual clinical information.A GFE Information Bundle is preferably associated to its respective Task resource by encoding it in the `Task.input.valueAttachment`. Alternatively a GFE Information Bundle may be referenced by the `Task.input.valueReference`and be written to the Coordination Platform as a separate Bundle.
The Task references to to Practitioner and Organization references in must point to the instances on the Coordination Platform.

![Figure 1. GFE Coordination Bundle as created by the GFE Coordination Requester](GFE_Coordination_Bundle.png){:style="float: none;"}

_Figure 1. GFE Coordination Bundle as created by the GFE Coordination Requester_


Figure 2 shows the relationships of the resources involved in GFE coordination request as they exist on the Coordination Platform whether they be written individually or through the GFE Coordination Bundle transaction. If the GFE Information Bundles are not contained in the Task, they would exist as Bundle resources that would be individually retrievable from the Coordination Platform.

![Figure 2. GFE Coordination Bundle content as stored on the Coordination Platform](GFE_Coordination_Platform_Resources.png){:style="float: none;"}

_Figure 2. GFE Coordination Bundle content as stored on the Coordination Platform_


Figure 3 shows the GFE Information Bundle is created by the GFE Coordination Requester and is meant to contain the information needed for GFE Contributors to make their estimate. This includes the Patient, Coverage and Payer if applicable, specific providers or roles being asked for (not the same as those on the Coordination Platform), requested items (including items and services), and any additional documentation. Additional resources that provide important contextual information that could affect needed items, services, or costs, such as Conditions or Observations, are also allowed.


![Figure 3. GFE Information Bundle created by the GFE Coordination Requester](GFE_Information_Bundle.png){:style="float: none;"}

_Figure 3. GFE Information Bundle created by the GFE Coordination Requester_


Figure 4 shows the GFE Bundle which is created by the GFE Contributor and attached to their GFE Contributor Task. It contains the Patient, Coverage and Payer if relevant, involved providers, and Claims data with the estimated costs.

![Figure 4. A GFE Bundle created by the GFE Contributor](GFE_Bundle.png){:style="float: none;"}

_Figure 4. A GFE Bundle created by the GFE Contributor_


Figure 5 shows the GFE Missing Bundle which is used to convey that a GFE Contributor Task did not have a GFE Bundle attached when a GFE Collection Bundle was compiled. The purpose of this bundle is to provide an indication that aGFE collection is incomplete and what is missing, including the GFE Contributor and the items and services that an estimate requested for. 

![Figure 5. A GFE Missing bundle created by the Coordination Platform](GFE_Missing_Bundle.png){:style="float: none;"}

_Figure 5. A GFE Missing bundle created by the Coordination Platform_


Figure 6 shows the GFE Collection bundle created by the Coordination Platform when the GFE Coordination Requester calls the GFE-retrieve operation. In response to the gre-retrieve operation the provider (Practitioner or Organization). As part of the [GFE Submission and AEOB Workflow](gfe_submission_and_aeob_overview.html), this represents the GFE submitter (which can be changed before the submission if necessary).


![Figure 6. GFE Collection Bundle created by the Coordination Platform](GFE_Collection_Bundle.png){:style="float: none;"}

_Figure 6. GFE Collection Bundle created by the Coordination Platform_

### Technical Workflows ###

#### Full GFE Coordination: End-to-End Workflow

![GFE Coordination Technical Workflow](PCTCoordinationWorkflow.png){:style="float: none;"}

_Figure 7. GFE Coordination Technical Workflow_


1. GFE Coordinating Requester performs a FHIR search for [Practitioner](StructureDefinition-davinci-pct-practitioner.html), [PractitionerRole](https://hl7.org/fhir/us/davinci-hrex/STU1/StructureDefinition-hrex-practitionerrole.html), or [Organization](StructureDefinition-davinci-pct-organization.html) resources. If successful (200 OK), the search will return 0 or more resources.
    * If 1 or more resources are returned, the GFE Coordination Requestor processes those resources, extracting the resource IDs for use in step 2.
    * If 0 resources are returned, or an error occurs, the requester should reformulate their search and try again.

2. GFE Coordinating Requester creates a [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and 1 or more [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources, creates and associates one or more [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) resources and includes them in a [GFE Coordination Bundle](StructureDefinition-davinci-pct-gfe-coordination-bundle.html), then uses a FHIR POST to the transaction endpoint of the Coordination Platform’s FHIR server.
    * If successful, the content of the bundle will be stored as separate resources on the FHIR server, and notifications will be sent to all GFE Contributors referenced in the Tasks per step 3. The notifications may be sent via FHIR subscriptions, which can be triggered by a create operation, or they may be out of band notifications using whatever mechanism the coordination platform chooses.
    * If the POST fails, the entire transaction is rolled back and no resources will be stored on the Coordination Platform. The requestor must address any errors and resubmit.

3. Notifications will be sent to all GFE Contributors referenced in the Task resources submitted in step 2.
    * The notifications may be sent via FHIR subscriptions, which can be triggered by a create operation, or they may be out of band notifications using whatever mechanism the Coordination Platform chooses.

4. Each GFE Contributor retrieves their respective [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) from the Coordination Platform, reviews the contents, and responds by updating the Task status appropriately and using a FHIR PUT operation to update the Task on the Coordination Platform FHIR endpoint.
    * If the contributor accepts the task, Task.status shall be changed to `accepted`.
    * If the contributor declines the task, Task.status shall be changed to `rejected`.

5. After each GFE Contributor has updated their respective [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html), the GFE Coordination Requester is notified of the changes (same process as step 3) and reviews the updates. If a GFE Contributor has rejected, the GFE Coordination Requester may choose to replace the contributor or cancel the entire request depending on the reason if one is provided in `Task.statusReason` (e.g. if a key participant is unable to participate due to a proposed date of service, the GFE Coordination Requester may wish to cancel the entire request and make a new request with a time that works for that participant).

6. After accepting a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html), each GFE Contributor creates a GFE Bundle with their good faith estimate and any supporting resources. They then attach that bundle to their [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html), sets the status to “completed” and does an HTTP PUT operation to update the task.

7. At any time after the initial creation of the GFE Coordination Task on the Coordination Platform the GFE Coordination Requester may retrieve the [GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html) by calling the [$gfe-retrieve operation](OperationDefinition-GFE-retrieve.html). This is often done after verifying the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) for each contributor has been set to completed or a time limit has been reached. To create the [GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html) triggered by the call to the [$gfe-retrieve operation](OperationDefinition-GFE-retrieve.html), the Coordination Platform will:
    * Retrieve all GFE Bundle resources for each completed task
    * Create GFE Missing Bundles for each incomplete task
    * Create a GFE Collection Bundle containing all GFE Bundle and GFE Missing Bundle resources, and return it in the body of the operation

8. GFE Coordination Requestor provides the GFE Bundle to the patient directly, or proceeds to the [GFE Submission and AEOB Workflow]( gfe_submission_and_aeob_overview.html) and submits the [GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html) to the Payer.

9. GFE Coordination Requestor updates the status of each [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to `closed` and uses an HTTP PUT to update the task on the Coordination Platform’s FHIR server.  


#### Examples

**Timeline Example Scenario**
The diagram below demonstrates use of the available date elements to meet turnaround times to provide Good Faith Estimates (GFE)

![Request Timeline Example](Timeline_Example.png){:style="float: none;"}
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

6. Good Health Hospital’s assigned Coordination Platform aggregates all convening and co-provider estimates into a single GFE, with the summary total for the surgery across providers as well as the details per provider.

7. GFE is posted to API available to the Patient by Tuesday (within one business day from time of scheduling)
