
### Summary
{% include draft_content_note.md content="page" %}

This section of the implementation guide (IG) defines the specific conformance requirements for systems wishing to conform to this Patient Cost Transparency (PCT) IG for GFE Coordination. It focuses on the Good Faith Estimate (GFE) Coordination Task, though it also provides guidance on privacy, security, and other implementation requirements.

The GFE Coordination workflow uses the Task resource. This resource is used to define, assign, and track activities across individuals, systems and organizations. The type of Tasks is distinguished by the `Task.code`. This guide defines the code `gfe-contributor-task` to be used as the type for each Task assigned to a single provider (Practitioner, PractitionerRole, or Organization) that contributes a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html). Each of these [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources are part of a single set of requests and share an association through the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) with a `Task.code` of `gfe-coordinating-task` and is referenced by each [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resource by `Task.partOf`. All of the tasks are created by the GFE Coordination Requester are posted to the Coordination Platform where they will be managed throughout the rest of the workflow culminating in the GFE Coordination Requester making the [$gfe-retrieve operation](OperationDefinition-GFE-retrieve.html) to collect all available [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resources posted by the of the GFE Contributor(s) into one PCT [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html)


In addition to the requirements specified in this section, GFE Coordination Requesters, Coordination Platforms, and GFE Contributors **SHALL** meet the requirements as specified in their respective requirements CapabilityStatements and sections defined in this IG.




### Task Workflow Requirements

This section describes the minimal workflow requirements and task transitions for both the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html). Except were specifically stated, this IG does not disallow other states or transitions. However, implementers should not expect other systems to recognize or understand variances from this process without prior agreement.

#### The Coordination Task Workflow

![Figure 1: PCT GFE Coordination Task Workflow](Task_flowChart-Coordinator.png){:style="float: none;width: 600px;display: block;margin: auto;"}

_Figure 1: PCT GFE Coordination Task Workflow Diagram_

1. **Start** - This workflow starts with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html), and relevant [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) created by the Coordination Requester, all with the same `status`.
2. **Draft** (Optional) - The Coordination and associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html), **MAY** optionally be placed in a `draft` `status`.
    a. Tasks in `draft` `status` **SHOULD NOT** trigger a notification.
    b. [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) does not start the Contributor Task Workflow while in `draft` `status`.
    c. The [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) **MAY** be updated by the Coordination Requester to a `status` of `ready` (3), `entered-in-error` (6), or `cancelled` (7).
3. **Ready** – The GFE Coordination Requester **SHALL** set the `status` of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) to `ready` to initiate the GFE coordination process.
    a. The Coordination Platform **SHALL** automatically change the associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `status` to `requested` and the individual Contributor Task Workflow begins.
    b. The [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) **MAY** be updated by the Coordination Requester to a `status` of `entered-in-error` (6) or `cancelled` (7).
    c. The Coordination Platform **MAY** change the `status` to `failed` (8) in the event of a process of system failure or `in-progress` (4) when at least one of the associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) changes to a `status` of `accepted`.
4. **In Progress** – Coordination Platform **SHALL** automatically change the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) `status` to `in-progress` when at least one of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html)’s associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) has a `status` change from `received` to `accepted`.
    a. The [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) **MAY** be updated by the Coordination Requester to a `status` of `completed` (5), `entered-in-error` (6) or `cancelled` (7).
    b. The Coordination Platform **MAY** change the `status` to `failed` (8) in the event of a process of system failure.
5. **Completed** – The Coordination Requester **SHOULD** change the `status` of `in-progress` [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) to `completed` when the necessary GFE information is collected, or the time limit is reached and the Task needs to be closed.
    a. The Coordination Requester **SHALL** provide a `statusReason` in the update to the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html).
    b. The Coordination Platform **SHALL** automatically update the `businessStatus` of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and all associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to `closed`.
    c. The [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) **SHALL** automatically update all associated open [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html), where the `status` is not `complete`, with a `status` of `failed` and provide a `statusReason` matching the `statusReason` the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) (that was the `statusReason` provided by the Coordination Requester).
6. **Entered In Error** – The Coordination Requester **MAY** change the `status` of any open [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) to `entered-in-error`.
    a. The Coordination Platform **SHALL** automatically update the `businessStatus` of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and all associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)s to `closed`.
    b. The [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) **SHALL** automatically update all associated open [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `status`, where the `status` is not `complete`, to `entered-in-error`.
7. **Cancelled** - The Coordination Requester **MAY** change the `status` of any open [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) to `cancelled`.
    a. The Coordination Requester **SHALL** provide a `statusReason` in the update to the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html).
    b. The Coordination Platform **SHALL** automatically update the `businessStatus` of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and all associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to `closed`.
    c. The [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) **SHALL** automatically update all associated open [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `status`, where the `status` is not `complete`, to `cancelled`.
8. **Failed** – The Coordination Platform **MAY** change the `status` of [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) with `status` of `ready` or `in-progress` to `failed` in the event of a system or process issue.
    a. The Coordination Platform **SHALL** provide a `statusReason` provided with an explanation of the failure with a useful description in the `statusReason.text`.
    b. The Coordination Platform **SHALL** automatically update the `businessStatus` of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and all associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to `closed`.
    c. The [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) **SHALL** automatically update all associated open [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `status` to `failed`.

#### The Contributor Task Workflow

![Figure 2: PCT GFE Coordination Task Workflow](Task_flowChart-Contributor.png){:style="float: none;width: 600px;display: block;margin: auto;"}

_Figure 2: PCT GFE Coordination Task Workflow Diagram_

1. **Optional Precondition** – _(not in diagram)_ Prior to the start of this workflow a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) **MAY** exist with a `draft` `status`.
    a. Creation and editing of a `draft` `status` [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) **SHOULD NOT** trigger a notification to the GFE Contributor it is assigned to.
    b. The GFE Contributor **SHALL NOT** have write access to a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) with a `draft` `status`.
    c. A `draft` `status` [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) **MAY** be discoverable (searchable) by the assigned GFE Contributor (`Task.owner`), depending on business workflow needs.
2. **Start** - This workflow starts with the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) being created or updated with a `status` of `requested`.
3. **Requested** – The [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) **SHALL** automatically be updated by the Coordination Platform with a `status` of `requested` based on the events in the GFE Coordination Workflow.
    a. The assigned GFE Contributor (`Task.owner`) **SHALL** now have read access to the Task.
    b. Upon retrieval of the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) by the GFE Contributor (`Task.owner`), either through a read or a search, the Coordination Platform **SHALL** automatically update the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `status` to `received`.
    c. The [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) **SHALL** be automatically updated by the Coordination Platform to a `status` of `entered-in-error` (7), `failed` (8), or `cancelled` (9) based on the events in the GFE Coordination Workflow.
4. **Received** – The Coordination Platform **SHALL** automatically update the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `status` to `received` upon first retrieval, either through read or search.
    a. The assigned GFE Contributor (`Task.owner`) **SHALL** now have write access to update the Task.
    b. The [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) **MAY** be updated by the assigned GFE Contributor to a `status` of `accepted` (4) or `rejected` (5).
    c. The [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) **SHALL** be automatically updated by the Coordination Platform to a `status` of `entered-in-error` (7), `failed` (8), or `cancelled` (9) based on the events in the GFE Coordination Workflow.
5. **Accepted** – The GFE Contributor **SHALL** update the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to a `status` of `accepted` when they decide to participate in the GFE coordination process for the request and plan on providing a GFE Bundle.
    a. The [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) **MAY** be updated by the assigned GFE Contributor (Task.owner) to a `status` of `rejected` (5), `completed` (6), or `failed` (7).
    b. The [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) **SHALL** be automatically updated by the Coordination Platform to a `status` of `entered-in-error` (7), `failed` (8), or `cancelled` (9) based on the events in the GFE Coordination Workflow.
6. **Rejected** – The GFE Contributor **SHALL** update the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to a `status` of `rejected` if they will not participate in the GFE coordination process for the request and will take no further action on the request.
    a. The GFE Contributor **SHOULD** provide a `statusReason` for rejecting the Task.
    b. The Coordination Platform **SHALL** automatically update the `businessStatus` of the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to `closed`.
7. **Completed** – The GFE Contributor **SHALL** update the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to a `status` of `completed` when they attach the GFE bundle and it is ready to be made available to the GFE Coordinator (via gfe-retrieve operation). This is usually done after there is a sufficient level of confidence in the GFE Bundle they had attached to the Task.
    s. The GFE Contributor **MAY** continue to update the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)’s attached GFE Bundle if the Task’s `businessStatus` is not set to a value of `closed`.
    b. The GFE Contributor **MAY** update the `businessStatus` of the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to `closed` if there will be no further changes made.
    c. The Coordination Platform **MAY** automatically update the `businessStatus` of the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to `closed` if there will be no further changes made based on the events in the GFE Coordination Workflow.
    d. The Coordination Platform **SHALL** only include GFE Bundles that are appropriately attached to GFE Contributor Tasks with a `status` of `completed`.
8. **Entered in Error** – The Coordination Platform **SHALL** set a GFE [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `status` to `entered-in-error` based on the events in the GFE Coordination Workflow.
    a. The Coordination Platform **SHALL** automatically update the `businessStatus` of the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to `closed`.
9. **Failed** – Either the GFE Contributor **MAY** set the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `status` to `failed` if they were unable to complete the task or the Coordination Platform **SHALL** set a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `status` to `failed` based on the events in the GFE Coordination Workflow.
    a. [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)s updated with a `status` of `failure` **SHALL** have a `statusReason` provided with an explanation of the failure with a useful description in the `statusReason.text`.
    b. The Coordination Platform **SHALL** automatically update the `businessStatus` of the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) to `closed`.
10. **Cancelled** – The Coordination Platform **SHALL** set a GFE [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `status` to `cancelled` based on the events in the GFE Coordination Workflow.
    a. The Coordination Platform **SHALL** automatically update the `businessStatus` of the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) Tasks to `closed`.
    b. The Coordination Requester **MAY** change the `status` of any open [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) to `cancelled` if the `status` is not already `rejected` and **SHOULD** update the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) `statusReason`. 
    c. The Coordination Requester **SHALL NOT** change the `status` of a [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) to `cancelled` if the `status` is `rejected`, and **SHALL NOT** update the `statusReason` of such a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html).

#### Closed Tasks

All Tasks with a `businessStatus` of `closed` **SHALL** not be updatable by the GFE Coordination Requester or GFE Contributors.



### Coordination Workflow Requirements and Details

This section describes several requirements involved in the Coordination Workflow detailing some of the actions necessary for each step of the process as well as providing guidance on activities that should or may take place.

#### Identifying all GFE Coordination Participants
The Coordination Platform is the system enabling all interactions between collaborating parties. As such, the Coordination Platform will need to manage all of the resources relating to all potentially participating parties along with their contact information and a means to notify each of Task assignments and changes in Task status. 

After the GFE Coordination Requester, expectedly a Convening provider, determines that GFE collection needs to be coordinated across providers and determines the set of services and providers necessary, they will search the Coordination Platform for the references (FHIR IDs) for the providers to coordinate with. This lookup is generally done with a National Provider Identifier (NPI), Tax ID or other identifying methods as supported by the Coordination Platform. For the purposes of this IG, the Coordination Platform provides a sort of “White Pages” phonebook lookup of providers. It is expected that providers largely maintain their own networks of potential care team members or have other means to find providers to work with. The “phonebook” lookup provided by the Coordination Platform is not expected to serve as a means to lookup providers by services offered or their service locations.

The Coordination Platform **SHALL** manage a current set of [PCT Organization](StructureDefinition-davinci-pct-organization.html), [PCT Practitioner](StructureDefinition-davinci-pct-practitioner.html), and [US Core PractitionerRole]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-practitionerrole.html) resources as identified in this guide with enough data and searching capabilities to support GFE Coordination Requesters to identify and retrieve the FHIR IDs of GFE Contributors.


#### Creating and Submitting a GFE Coordination Request

##### References to Participants and Bundles #####
The GFE Coordination Requester **SHALL** use the FHIR resource IDs in all references to providers in both the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resource(s). These references include the `Task.requester` and the assigned `Task.owner`
When creating new Tasks, GFE Coordination Requesters **SHALL** reference only Coordination Participants where active=`true`.
If the GFE Coordination Requester must also contribute a GFE, they **SHALL** also create a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) assigned to themselves for that purpose. This is done to enable a full set of GFEs to be made available for the Coordination Platform to put together into a complete [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html).

**Associating Request Information Bundles to Tasks**
Once the GFE Coordination Requester has collected sufficient enough information necessary for GFE Contributors to provide an accurate estimate; and places the information into one or more [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) resources, the information bundles **SHALL** be associated with the appropriate Task through the `Task.input` element.
The [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) resources **SHALL** be fully contained, meaning all references **SHALL** resolve within the bundle.
The information that applies to all of the tasks **SHALL** be identified in the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html). 
There **SHALL** be at least one information bundle associated in the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html).
A GFE Coordination Requester **MAY** create GFE Contributor specific information bundles which **SHALL** be associated to the appropriate [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html). This can be done to provide specific providers  only the information they need to see.
To associate an information bundle with a Task in the `Task.input`, the GFE Contributor **SHOULD** encode the bundle as an attachment in `Task.input.valueAttachment`, though they **MAY** associate it through a reference in `Task.input.valueReference`.
A [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated to a Task through a reference **SHALL** exist on the Coordination Platform and the Task **SHALL** have the `Task.input.valueReference` reference the instance on the Coordination Platform.
Since the information bundle is fully self-contained and its relevance only extends to the Task in which it is associated, there is no need for the bundle to be written directly to the Coordination Platform. This can simplify the management of the data and has the advantage of not enabling the bundle to be modified outside of the Task. 
A potential disadvantage of having the information bundle contained in the Task is the size of the resource. An organization that has to manage and search through many [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources may have a notable increase in traffic volume. This may be mitigated by Coordination Platforms that support the `_summary` search parameter,

##### GFE Coordination Request Submission #####

A Coordination Platform **SHALL** support the ability for GFE Coordination Requesters to create a request in a single [$gfe-coordination-request operation](OperationDefinition-GFE-coordination-request.html) with a [GFE Coordination Bundle](StructureDefinition-davinci-pct-gfe-coordination-bundle.html). If any of the Tasks are unable to be written, the operation **SHALL** fail, no resources **SHALL** be written, and an OperationOutcome **SHALL** be returned indicating the nature of the error(s) if the nature of the problem is FHIR operation related (as opposed to a base HTTP issue like a Bad Request).

The GFE Coordination workflow is designed to allow participation of GFE Contributors that may not support this FHIR IG directly, or support FHIR at all. The Coordination Platform may provide another means to contribute data for [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resources, such as through a delegate system or a portal. To support this, GFE Coordination Requesters **SHOULD** create [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources for all of GFE Contributors  that a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) is needed from if they have an active Coordination Participant Resource (Organization/Practitioner/PractitionerRole) on the Coordination Platform.


#### Notifications of New and Updated Tasks ####

##### General Requirements for Notifications of New and Updated Tasks #####
Notifications may take the form of FHIR Subscription (as defined in this IG), unsolicited notification, messaging or other method.

Coordination Platforms **SHALL** be able to notify GFE Contributors when a new [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) is assigned to them or is marked as `cancelled`.
Coordination Platforms **SHALL** be able to notify GFE Coordination Requesters when a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) they created has had their `status` updated to `rejected`, `accepted`, or `completed`.

Implementers **MAY** support the R4 Subscriptions referenced in the [FHIR Subscriptions R5 Backport Implementation Guide]({{site.data.fhir.ver.subs}}).


This IG defines the following minimal requirements for the support of subscriptions for systems conforming to this IG that choose to support subscriptions:
* Servers supporting subscriptions **SHALL** expose this as part of the Server's CapabilityStatement
* Support for subscription topic discovery is not required; however, the subscription topic canonical urls that show up in the `Subscription.criteria` for the subscription topics supported **SHALL** be used. Other types of Subscriptions are allowed.
* Servers **SHOULD** support rest-hook and **MAY** support websocket, email, sms, message or other channels
* Servers **SHALL** support both JSON and XML and clients SHALL support at least one of these.
* Client and server **SHALL** support `id-only`, though they can also support other content approaches. 
>Note: The `id-only` approach means that the ID of the Task that was updated will be provided. The client will then perform a read or a query to retrieve the identified record(s) specified in the subscription notification.



##### Requirements for GFE Coordination Task Subscriptions #####
The Coordination Requester subscription **SHALL** conform to the [Subscription - GFE Coordination Task Update Notification](StructureDefinition-davinci-pct-gfe-task-update-subscription.html) and meet the following requirements:
* **SHALL** have the `Subscription.criteria` = `http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-coordination-task-subscriptiontopic`
* **SHALL** have the `Subscription.criteria.extension[filterCriteria].valueString` = `Task?requester=[FHIR-ID]` where `[FHIR-ID]` is the FHIR logical identifier for the Coordination Requester.

The GFE Contributor subscription **SHALL** conform to the [Subscription - GFE Coordination Task Update Notification](StructureDefinition-davinci-pct-gfe-task-update-subscription.html) and meet the following requirements:
* **SHALL** have the `Subscription.criteria` = `http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-coordination-task-subscriptiontopic`
* **SHALL** have one of the following, but not both (contributors should have a subscription for each)
    * **SHALL** have a `Subscription.criteria.extension[filterCriteria].valueString` = `Task?owner=[FHIR-ID]` where `[FHIR-ID]` is the FHIR logical identifier for the GFE Contributor.
    * **SHALL** have a `Subscription.criteria.extension[filterCriteria].valueString` = `Task?_has:Task:part-of:owner=[FHIR-ID]` where `[FHIR-ID]` is the FHIR logical identifier for the Coordination Contributor.
    >Note: This will enable the notification when the Coordination Task that is parent to the Contributor Task, is updated.


##### Requirements for GFE Packet Availability Subscriptions #####
For notifications to patients (GFE Packet subject) the GFE Packet subscription **SHALL** conform to the [Subscription - GFE Available for Subject Notification](StructureDefinition-davinci-pct-gfe-available-subject-subscription.html) and meet the following requirements:
* **SHALL** have a `Subscription.criteria.extension[filterCriteria].valueString` = `DocumentReference?subject=[FHIR-ID]` where `[FHIR-ID]` is the FHIR logical identifier for the patient.
* Updates to the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) **SHALL** result in an update to the [GFE Packet DocumentReference](StructureDefinition-davinci-pct-gfe-documentreference.html) in order to trigger a notification. 

For notifications to authors (GFE Contributors) the GFE Packet subscription **SHALL** conform to the [Subscription - GFE Available for Author Notification](StructureDefinition-davinci-pct-gfe-available-author-subscription.html) and meet the following requirements:
* **SHALL** have a `Subscription.criteria.extension[filterCriteria].valueString` = `DocumentReference?author=[FHIR-ID]` where `[FHIR-ID]` is the FHIR logical identifier for the GFE Contributor.
* Updates to the [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) **SHALL** result in an update to the [GFE Packet DocumentReference](StructureDefinition-davinci-pct-gfe-documentreference.html) in order to trigger a notification. 

To support the access and ability to provide notifications appropriately, a GFE Packet DocumentReference and PCT GFE Composition **SHALL NOT** have their `documentReference.type` and `Composition.type` elements, respectively, modified. If either of these elements was entered in error, the GFE Packet DocumentReference `documentReference.status` and PCT GFE Composition `Composition.status` **SHALL** be set to `entered-in-error`.

#### Searching for and Retrieving Tasks
Both GFE Coordination Requesters and GFE Contributors need to be able to search for Tasks related to their role in the GFE Coordination workflow. Searching requirements are detailed in the CapabilityStatements in this guide and **SHALL** be followed for a system to claim conformance to this guide.


#### GFE Contributor Actions

GFE Contributors **SHOULD NOT** reject a Task because there is insufficient information to provide a GFE. Instead, the GFE Contributor **SHOULD** request the necessary information from the GFE Requester (the means of this communication is not defined by this specification). GFE Contributors **MAY** reject a Task if they are still unable to receive the necessary information after attempting to do so.

When submitting a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html), GFE Contributors **SHALL** update the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)  with the [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) contained in `Task.output.valueAttachment` and **SHALL** set that `Task.status` to `completed` when the Task is considered complete.
The GFE Contributor **MAY** include other types of data in output.valueAttachment, but such data **SHALL** be in a FHIR Resource format and fully contained with no external references that can’t be resolved internally.


#### Replacing Coordination Tasks or Contributor Tasks

##### Replacing a GFE Contributor Task

If a schedule change occurs, a change to the items or services for which a GFE is being requested, or the context of which has changed such that it may materially affect the GFE of a GFE Contributor, the GFE Coordinator **SHOULD** cancel the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and create a new one.
This new replacement [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) **SHOULD** contain the `task-replaces` extension with a reference to the `cancelled` [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) that the new one replaces. This will enable GFE Contributors to refer back to any previous [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resources in the case it may assist them in addressing the new task.

The cancellation and creation of a new task, instead of updating tasks, is recommended because there is limited time to provide an estimate and the intent is to provide the best possible estimate at time of the request. There could be any number of modifications during this process that will be difficult to track during this limited time. Closing and opening a new request provides some closure/finality to the interaction that should be easier to track, particularly without requiring systems, both server and client, to support FHIR resource versioning. Modifications of existing tasks would require each GFE contributor to be notified of the change, some of which may have already closed out their task, potentially causing additional disruption, avoidable re-work, and errors. 

Replacing a GFE contributor does not present the same sort of coordination challenges and is being provided as a means to reduce burden of the other GFE Contributors that are participating by not requiring them to resubmit.


##### Replacing a GFE Contributor
GFE Coordination Requesters **SHALL** be able to replace GFE Contributors regardless of the state of the status of the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) as long as the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) does not have a status of `cancelled`, `failed`, `completed`, or `entered-in-error`.

When replacing a GFE Contributor the GFE Coordination Requester **SHALL** change the target [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) status to `cancelled` if the `status` is not already `rejected` and **SHOULD** update the `Task.statusReason`. If the `status` = `rejected`, it **SHALL** remain so and the statusReason **SHALL** remain unchanged. 

When replacing a GFE Contributor, the GFE Coordination Requester **SHALL** write new [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resource(s) for the GFE Contributor(s) replacing the previous GFE Contributor(s). The other existing Tasks **SHALL** remain intact (i.e., only replace the Tasks that need replacing as opposed to recreating all tasks). 
If more than a simple replacement GFE Contributors is required, such as a change in scheduled date or services, the GFE Coordinating Requester **SHOULD** cancel the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and create a new one.


#### Retrieving the GFE Packet and Closing the Coordination Task
Retrieval of the collection of contributed GFEs is done through the [$gfe-retrieve](OperationDefinition-GFE-retrieve.html) operation. This operation collects the contributed [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resources attached to the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources as well as any [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) resources for any [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources that do not have an attached [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html). A Task **SHALL** have an appropriately attached [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) and a `status` of `completed` in order to be included in the GFE Packet returned through the $gfe-retrieve operation. [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) resources support indication that the GFE may be missing a portion that will contribute to their overall cost. These bundles are a technical requirement in the event the GFE must be sent without all contributor estimates included. 


##### GFE Packet Retrieval

Retrieval of a [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) **SHALL** be available to the GFE Coordination Requester that created the associated [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and **SHALL** be retrieved using the FHIR ID of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html).

The [$gfe-retrieve operation](OperationDefinition-GFE-retrieve.html) **SHALL** return a single [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) when executed on a valid [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) instance for which the requester has access.

The [GFE Packet](StructureDefinition-davinci-pct-gfe-packet.html) **SHALL** consist of:

- The [GFE Composition]( StructureDefinition-davinci-pct-gfe-composition.html) as the first resource:
    - If there is a date in [Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) `Task.extension[planned-service-period]`, this date/time **SHALL** be placed into the [GFE Composition]( StructureDefinition-davinci-pct-gfe-composition.html) `Composition.extension[gfeServiceLinkingInfo].extension[plannedPeriodOfService].valuePeriod`
    - The code in the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) `Task.reasonCode` **SHALL** be placed into the [GFE  Composition]( StructureDefinition-davinci-pct-gfe-composition.html) `Composition.extension[requestOriginationType].valueCodeableConcept`

- The Patient Resource extracted from the [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html)

- The Coverage Resource extracted from the [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html), if present.

- The Organization Resource (for payer) extracted from the [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html), if present.

- The Organization, Practitioner, PractitionerRole Resource (for providers) extracted from the [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html), if present.

- All of the FHIR Resources in .output.valueAttachment of the associated (that have a `Task.partOf` that references the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html)) [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) where the status is `completed` (NOTE: that each Contributor Task may have multiple output.valueAttachment iterations).

- For each associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) that does not have a `status` or `completed` and does not have a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) in output.valueAttachment and a status of `completed`, there **SHALL** be a [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html).  (This means there will be a [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) for each task that has not been marked as `rejected` or `cancelled` and does not have a status of completed and an attached [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html)).

- Each [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) **SHALL** contain:
  - The Patient and Coverage (if applicable) resource from the associated [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html)
  - All of the requested items and services from the [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html)
  - All, if any, of the requested items and services from the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) for which the [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) is being created


##### Completing or Cancelling the Coordination Task

When deemed appropriate, the GFE Coordination Requester **SHALL** close the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) by updating the status to `completed`, `cancelled`, or `failed` and **SHALL** include a `statusReason` to close the request when no new GFE Contributions will be needed or accepted.


#### Access and Authorization

##### Actor based access
Coordination Participants (GFE Coordination Requesters and GFE Contributors) **SHALL** be able to read and update all of the Task resources they created or are assigned to (via Task.owner) while the Task does not have a `status` of `draft` and does not have a `businessStatus` of `closed` and **SHOULD** retain read access regardless of `status` or `businessStatus`. 
GFE Contributors **SHALL** have read access to [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) resources referenced by [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources assigned to and **SHALL NOT** have access to modify those [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) resources unless they are also the GFE Coordination Requester. 
GFE Contributors **MAY** access the Tasks of other participants whose assigned Task references the same [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) if the Coordination Platform allows it.


##### Task status based access
[GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)s **SHALL NOT** be able to be modified by a GFE Contributor if the `status` is `cancelled`, `rejected`, `entered-in-error`, or `completed`. 
Tasks marked as `completed`, `rejected`, or `entered-in-error` **SHOULD NOT** be able to be modified by GFE Contributors.


#### Patient Access to GFEs

Providers **MAY** make GFE information available to the patient, regardless of whether there is a need or intent to send it to a payer for an insured patient estimate (AEOB). 

> Note:  Providers may provide GFE information in a number of ways, such as via mail, the patient portal, or via an API specified in this IG. This specification does not currently address requirements for sharing GFE information with patients through an API.