{% include draft_content_note.md content="page" %}

This section of the implementation guide (IG) defines the specific conformance requirements for systems wishing to conform to this Patient Cost Transparency (PCT) IG for GFE Coordination. It focuses on the Good Faith Estimate (GFE) Coordination Task, though it also provides guidance on privacy, security, and other implementation requirements.

#### Summary
The GFE Coordination workflow uses the Task resource. This resource is used to define, assign, and track activities across individuals, systems and organizations. The type of Tasks is distinguished by the Task.code. This guide defines the code `gfe-contributor-task` to be used as the type for each Task that is assigned to a single provider (Practitioner, PractitionerRole, or Organization) that is to contribute a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html). Each of these [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources are part of a single set of requests and share an association through the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) with a `Task.code` of `gfe-coordinating-task` and is referenced by each [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resource by `Task.partOf`. All of the tasks are created by the GFE Coordination Requester are posted to the Coordination Platform where they will be managed throughout the rest of the workflow culminating in the GFE Coordination Requester making the [$gfe-retrieve operation](OperationDefinition-GFE-retrieve.html) to collect all available [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resources posted by the of the GFE Contributor(s) into one PCT [GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html)


In addition to the requirements specified in this section, GFE Coordination Requesters, Coordination Platforms, and GFE Contributors **SHALL** meet the requirements as specified in their respective requirements CapabilityStatements and sections defined in this IG.

### Detailed Requirements


#### Identifying all GFE Coordination Participants
The Coordination Platform is the system enabling all interactions between collaborating parties. As such, the Coordination Platform will need to manage all of the resources relating to all potentially participating parties along with their contact information and a means to notify each of Task assignments and changes in Task status. 

After the GFE Coordination Requester, expectedly a Convening provider, determines that GFE collection needs to be coordinated across providers and determines the set of services and providers necessary, they will search the Coordination Platform for the references (FHIR IDs) for the providers to coordinate with. This lookup is generally done with an NPI, Tax ID or other identifying methods as supported by the Coordination Platform. For the purposes of this IG, the Coordination Platform provides a sort of “White Pages” phonebook lookup of providers. It is expected that providers largely maintain their own networks of potential care team members or have other means to find providers to work with. The “phonebook” lookup provided by the Coordination Platform is not expected to serve as a means to lookup providers by services offered or their service locations.

The Coordination Platform **SHALL** manage a current set of [PCT Organization](StructureDefinition-davinci-pct-organization.html), [PCT Practitioner](StructureDefinition-davinci-pct-practitioner.html), and [HRex PractitionerRole](https://hl7.org/fhir/us/davinci-hrex/STU1/StructureDefinition-hrex-practitionerrole.html) resources as identified in this guide with enough data and searching capabilities to support GFE Coordination Requesters to identify and retrieve the FHIR IDs of GFE Contributors.


#### Creating and Submitting a GFE Coordination Request
**References to Participants**
The GFE Coordination Requester **SHALL** use the FHIR resource IDs in all references to providers in both the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resource(s). These references include the `Task.requester` and the assigned `Task.owner`
When creating new Tasks, GFE Coordination Requesters **SHALL** reference only Coordination Participants where active=`true`.
If the GFE Coordination Requester must also contribute a GFE, they **SHALL** also create a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) assigned to themselves for that purpose. This is done to enable a full set of GFEs to be made available for the Coordination Platform to put together into a complete [GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html).

**Associating Request Information Bundles to Tasks**
Once the GFE Coordination Requester has collected sufficient enough information necessary for GFE Contributors to be able to provide an accurate estimate, and places the information into one or more [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) resources, the information bundles **SHALL** be associated with the appropriate Task through the `Task.input` element.
The [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) resources **SHALL** be fully contained, meaning all references **SHALL** resolve within the bundle.
The information that applies to all of the tasks **SHALL** be identified in the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html). 
There **SHALL** be at least one information bundle associated in the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html).
A GFE Coordination Requester **MAY** create GFE Contributor specific information bundles which **SHALL** be associated to the appropriate [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html).This can be done to provide specific providers  only the information they need to see.
To associate an information bundle with a Task in the `Task.input`, the GFE Contributor SHOULD encode the bundle as an attachment in `Task.input.valueAttachment`, though they **MAY** associate it through a reference in `Task.input.valueReference`.
A [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated to a Task through a reference **SHALL** exist on the Coordination Platform and the Task **SHALL** have the `Task.input.valueReference` reference the instance on the Coordination Platform.
Since the information bundle is fully self-contained and its relevance only extends to the Task in which it is associated, there is no need for the bundle to be written directly to the Coordination Platform. This can simplify the management of the data and has the advantage of not enabling the bundle to be modified outside of the Task. 
A potential disadvantage of having the information bundle contained in the Task is the size of the resource. An organization that has to manage and search through many [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources may have a notable increase in traffic volume. This may be mitigated by Coordination Platforms that support the `_summary` search parameter

**GFE Coordination request submission**
No special operations are defined for the submission of GFE Coordination requests and are instead performed through a standard RESTful FHIR interface.

A Coordination Platform **SHALL** support the ability for GFE Coordination Requesters to POST a request in a single transaction through a [GFE Coordination Bundle](StructureDefinition-davinci-pct-gfe-coordination-bundle.html) and **MAY** support the ability for individual resource POSTing.. 

GFE Coordination Requesters SHOULD POST a GFE Coordination request though a single [GFE Coordination Bundle](StructureDefinition-davinci-pct-gfe-coordination-bundle.html), as opposed to posting Tasks and other resources individually. This enables the transactions to be written as a whole and rollback happens automatically if there is an issue that does not allow the transaction to be completed as a unit.

The GFE Coordination workflow is designed to allow participation of GFE Contributors that may not support this FHIR IG directly, or support FHIR at all. The Coordination Platform may provide another means to contribute data for [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resources, such as through a delegate system or a portal. To support this, GFE Coordination Requesters SHOULD create [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources for all of GFE Contributors  that a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) is needed from if they have an active Coordination Participant Resource (Organization/Practitioner/PractitionerRole) on the Coordination Platform.


#### Notifications of New and Updated Tasks
Methods of notification are not defined in this IG, but may take the form of FHIR Subscription (potentially using [Notified Pull](https://hl7.org/fhir/uv/subscriptions-backport/2024Jan/notifications.html#notified-pull)), unsolicited notification, messaging or other method. Other Out of Band (OOB) transactions are also allowed.

Coordination Platforms **SHALL** be able to notify GFE Contributors when a new [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) is assigned to them or is marked as `cancelled`.
Coordination Platforms **SHALL** be able to notify GFE Coordination Requesters when a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) they created has had their status updated to rejected, accepted, or completed.

#### Searching for and Retrieving Tasks
Both GFE Coordination Requesters and GFE Contributors need to be able to search for Tasks related to their role in the GFE Coordination workflow. Searching requirements are detailed the CapabilityStatements in this guide and **SHALL** be followed for a system to claim conformance to this guide.


#### GFE Contributor Actions
GFE Contributors **SHALL** be able to accept a GFE Contributing Task by updating a Task they are assigned with a Task.status code of `accepted`

GFE Contributors **SHALL** be able to decline a GFE Contributing Task by updating a Task they are assigned to with a Task.status code of `rejected`

GFE Contributors **SHOULD NOT** reject a Task because there is insufficient information to provide a GFE. Instead, the GFE Contributor **SHOULD** request the necessary information from the GFE Requester (the means of this communication is not defined by this specification). GFE Contributors **MAY** reject a Task if they are still unable to receive the necessary information after attempting to do so.

When submitting a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html), GFE Contributors **SHALL** update the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)  with the [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) contained in `Task.output.valueAttachement` and **SHALL** set that Task.status to `completed` when the Task is considered complete.
The GFE Contributor **MAY** include other types of data in output.valueAttachment, but such data **SHALL** be in a FHIR Resource format and fully contained with no external references that can’t be resolved internally.


#### Replacing Coordination Tasks or Contributor Tasks
**Replacing a [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)**

If there is a schedule change, a change to the items or services for which a GFE is being requested, or the context of which has changed such that it may materially affect the GFE of a GFE Contributor, the GFE Coordinator SHOULD cancel the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and create a new one.
This new replacement [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) SHOULD contain the `task-replaces` extension with a reference to the `cancelled` [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) that the new one replaces. This will enable GFE Contributors to refer back to any previous [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resources in the case it may assist them in addressing the new task.

The cancellation and creation of a new task, instead of updating tasks, is recommended because there is limited time to provide an estimate and the intent is to provide the best possible estimate at time of the request. There could be any number of modifications during this process that will be difficult to track during this limited time. Closing and opening a new request provides some closure/finality to the interaction that should be easier to track, particularly without requiring systems, both server and client, to support FHIR resource versioning. Modifications of existing tasks would require each GFE contributor be notified of the change, some of which may have already closed out their task, potentially causing additional disruption, avoidable re-work, and errors. 

Replacing a GFE contributor, does not present the same sort of coordination challenges and is being provided as a means to reduce burden of the other GFE Contributors that are participating by not requiring them to resubmit.


**Replacing a GFE Contributor**
GFE Coordination Requesters **SHALL** be able to replace GFE Contributors regardless of the state of the status of the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) as long as the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) does not have a status of `cancelled`, `failed`, `completed`, or `entered-in-error`.

When replacing a GFE Contributor the GFE Coordination Requester **SHALL** change the target [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) status to `cancelled` if the status is not already `rejected` and SHOULD update the `Task.statusReason`. If the `status` = `rejected` it **SHALL** remain so and the statusReason **SHALL** remain unchanged. 

When replacing a GFE Contributor, the GFE Coordination Requester **SHALL** write new [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resource(s) for the GFE Contributor(s) that are replacing the previous GFE Contributor(s). The other existing Tasks **SHALL** remain intact (i.e., only replace the Tasks that need replacing as opposed to recreating all tasks). 
If more than a simple replacement GFE Contributors is required, such as a change in scheduled date or services, the GFE Coordinating Requester SHOULD cancel the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and create a new one.


#### Retrieving the [GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html) and Closing the Coordination Task
Retrieval of the collection of contributed GFEs is done through the [$gfe-retrieve operation](OperationDefinition-GFE-retrieve.html). This operation collects the contributed [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) resources attached to the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources as well as any [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) resources for any [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources that do not have an attached [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html). [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) resources support indication that the GFE may be missing a portion that will contribute to their overall cost. These bundles are a technical requirement in the event the GFE must be sent without all contributor estimates included. 


**GFE Collection Retrieval**
Retrieval of a [GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html) **SHALL** be available to the GFE Coordination Requester that created the associated [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) and **SHALL** be retrieved using the FHIR ID of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html).

The [$gfe-retrieve operation](OperationDefinition-GFE-retrieve.html) **SHALL** return a single [GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html) when a valid [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) FHIR ID was provided and for which the requester has access.

The [GFE Collection Bundle](StructureDefinition-davinci-pct-gfe-collection-bundle.html) **SHALL** consist of:

- The Patient Resource extracted from the [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html)

- The Coverage Resource extracted from the [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html), if present.

- The Organization Resource (for payer) extracted from the [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html), if present.

- The Organization, Practitioner, PractitionerRole Resource (for providers) extracted from the [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html), if present.

- All of the FHIR Resources in .output.valueAttachment of the associated (that have a Task.partOf that references the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html)) [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) where the status is not `rejected` or `cancelled` (NOTE: that each Contributor Task may have multiple output.valueAttachment iterations.

- For each associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) that does not have a status of `rejected` or cancelled` and does not have a [GFE Bundle](StructureDefinition-davinci-pct-gfe-bundle.html) in output.valueAttachment, there **SHALL** be a [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html).

- Each [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) **SHALL** contain:
  - The Patient and Coverage (if applicable) resource from the associated [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html).
  - All of the requested items and services from the [GFE Information Bundle](StructureDefinition-davinci-pct-gfe-information-bundle.html) associated with the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html)
  - All, if any, of the requested items and services from the [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) for which the [GFE Missing Bundle](StructureDefinition-davinci-pct-gfe-missing-bundle.html) is being created.


**Task Status**
When deemed appropriate, the GFE Coordination Requester **SHALL** close the Task by updating the status to `completed` or `cancelled` (the choice of which depends on the intent of the requester)
When the status of the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) is updated, the Coordination Platform **SHALL** update the associated [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) statuses to match, except for those that have a status of `cancelled`, rejected`, `entered-in-error`, `failed`, or `completed`.

The GFE Coordination Requester **SHALL** update the [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html).status to `completed` to close the request when no new GFE Contributions will be needed or accepted.

GFE Contributors **SHALL** only be able to set their assigned Task.status to `received`, `accepted`, `rejected`, or `completed`.



#### Access and Authorization
**Actor based access**
Coordination Participants (GFE Coordination Requesters and GFE Contributors) **SHALL** be able to read and update all of the Task resources they created or are assigned to (via Task.owner) while the Task does not have a status of `draft` and does not have a businessStatus of `closed` and **SHOULD** retain read access regardless of status or businessStatus. 
GFE Contributors **SHALL** have read access to [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) resources that are referenced by [GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html) resources that are assigned to and **SHALL NOT** have access to modify those [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) resources unless they are also the GFE Coordination Requester. 
GFE Contributors **MAY** access the Tasks of other participants whose assigned Task references the same [GFE Coordination Task](StructureDefinition-davinci-pct-gfe-coordination-task.html) if the Coordination Platform allows it.


**Task status based access**
[GFE Contributor Task](StructureDefinition-davinci-pct-gfe-contributor-task.html)s **SHALL NOT** be able to be modified by a GFE Contributor if the status is `cancelled, `rejected`, `entered-in-error, or `completed`
Tasks marked as `completed`, `rejected`, or `entered-in-error` **SHOULD NOT** be able to be modified by GFE Contributors..


#### Patient Access to GFEs

> Note: Although technically possible, conveying the GFE Collection to the patient via FHIR API is optional and the workflow is contingent upon the Coordination Requester opting to expose the API to the patient. For the self-pay or uninsured patients, the GFEs must be provided to the patient, but this may be done in many ways such as via mail, the patient portal, or via an API. This specification does not currently address requirements for sharing GFE information with patients through an API.