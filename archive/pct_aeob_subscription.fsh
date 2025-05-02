RuleSet: BaseAEOBAvailableSubscriptionTopic
* meta.versionId = "1"
* meta.lastUpdated = "2025-01-21T17:56:45.645113+00:00"

//* extension[0].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.url"
//* extension[=].valueUri = "https://build.fhir.org/ig/HL7/davinci-pct/aeob-available"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.version"
* extension[=].valueString = "2.3.0-draft"

//* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.name"
//* extension[=].valueString = "Advanced Explanation Of Benefit (AEOB) Complete Subscription Topic"

//* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.title"
//* extension[=].valueString = "AEOB Available"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.date"
* extension[=].valueDateTime = "2025-01-21"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.description"
* extension[=].valueMarkdown = "Subscription Topic for when an Advanced Explanation of Benefit DocumentReference is created or updated (for FHIR R4). This represents that an AEOB Bundle, either contained in or referred to by the DocumentReference has been newly created and is available or has been updated, should updates be made."

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.resourceTrigger"
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueMarkdown = "Triggered when an AEOB DocumentReference is created or updated"
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "http://hl7.org/fhir/StructureDefinition/DocumentReference"
* extension[=].extension[+].url = "supportedInteraction"
* extension[=].extension[=].valueCode = #create
* extension[=].extension[+].url = "supportedInteraction"
* extension[=].extension[=].valueCode = #update


* extension[=].extension[+].url = "queryCriteria"
//* extension[=].extension[=].extension[0].url = "previous"
//* extension[=].extension[=].extension[=].valueString = "type=aeob-document"
* extension[=].extension[=].extension[+].url = "resultForCreate"
* extension[=].extension[=].extension[=].valueCode = #test-passes
* extension[=].extension[=].extension[+].url = "current"
* extension[=].extension[=].extension[=].valueString = "type=aeob-document"
* extension[=].extension[=].extension[+].url = "resultForDelete"
* extension[=].extension[=].extension[=].valueCode = #test-passes
* extension[=].extension[=].extension[+].url = "requireBoth"
* extension[=].extension[=].extension[=].valueBoolean = false

/*
* extension[=].extension[+].url = "queryCriteria"
* extension[=].extension[=].extension[0].url = "previous"
* extension[=].extension[=].extension[=].valueString = "status:not=current"
* extension[=].extension[=].extension[+].url = "resultForCreate"
* extension[=].extension[=].extension[=].valueCode = #test-passes
* extension[=].extension[=].extension[+].url = "current"
* extension[=].extension[=].extension[=].valueString = "status=current"
* extension[=].extension[=].extension[+].url = "resultForDelete"
* extension[=].extension[=].extension[=].valueCode = #test-fails
* extension[=].extension[=].extension[+].url = "requireBoth"
* extension[=].extension[=].extension[=].valueBoolean = true
*/

/*
* extension[=].extension[+].url = "fhirPathCriteria"
* extension[=].extension[=].valueString = "(%previous.id.empty() or (%previous.status != 'current')) and (%current.status = 'current')"
*/

/*
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.canFilterBy"
* extension[=].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "Filter based on the subject of a DocumentReference."
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "filterParameter"
* extension[=].extension[=].valueString = "subject"
*/

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.canFilterBy"
* extension[=].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "Filter based on the status (current | superseded | entered-in-error) of a DocumentReference."
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "filterParameter"
* extension[=].extension[=].valueString = "status"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.canFilterBy"
* extension[=].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "Filter based on the document status (registered | partial | preliminary | final | amended | corrected | appended | cancelled | entered-in-error | deprecated | unknown) of a DocumentReference."
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "filterParameter"
* extension[=].extension[=].valueString = "docStatus"

/* This does not seem to apply to a DocumentReference. _in is for collections like List, Group, CareTeam 
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.canFilterBy"
* extension[=].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "Filter based on the group membership of the subject of a DocumentReference."
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "filterParameter"
* extension[=].extension[=].valueString = "_in"
*/
/*
* extension[+].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "Filter based on related of a DocumentReference."
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "filterParameter"
* extension[=].extension[=].valueString = "relatesTo.target"
* extension[=].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.canFilterBy"
*/


* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.notificationShape"
* extension[=].extension[0].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "include"
* extension[=].extension[=].valueString = "DocumentReference:subject"

// TODO DISCUSS Inclusion of content?
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "include"
* extension[=].extension[=].valueString = "DocumentReference:content.attachment.url"


* modifierExtension.url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.status"
* modifierExtension.valueCode = #draft
* code = http://hl7.org/fhir/fhir-types#SubscriptionTopic




Instance: aeob-available-subject-subscription-topic
InstanceOf: Basic
Usage: #example
* insert BaseAEOBAvailableSubscriptionTopic

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.url"
* extension[=].valueUri = "https://build.fhir.org/ig/HL7/davinci-pct/aeob-available-subject"


* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.name"
* extension[=].valueString = "Advanced Explanation Of Benefit (AEOB) Available for Subject Subscription Topic"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.title"
* extension[=].valueString = "AEOB Available - Subject"


* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.canFilterBy"
* extension[=].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "Filter based on the subject (patient/member) of a DocumentReference."
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "filterParameter"
* extension[=].extension[=].valueString = "subject"




Instance: aeob-available-author-subscription-topic
InstanceOf: Basic
Usage: #example
* insert BaseAEOBAvailableSubscriptionTopic

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.url"
* extension[=].valueUri = "https://build.fhir.org/ig/HL7/davinci-pct/aeob-available-author"


* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.name"
* extension[=].valueString = "Advanced Explanation Of Benefit (AEOB) Available for Author Subscription Topic"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.title"
* extension[=].valueString = "AEOB Available - Author"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.canFilterBy"
* extension[=].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "Filter based on the authors of a DocumentReference."
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "filterParameter"
* extension[=].extension[=].valueString = "author"






/*

Instance: aeob-complete-subscription-topic
InstanceOf: Basic
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2024-09-10T17:56:45.645113+00:00"
* extension[0].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.url"
* extension[=].valueUri = "http://example.org/FHIR/SubscriptionTopic/aeob-complete"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.version"
* extension[=].valueString = "1.0.0-fhir.r4"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.name"
* extension[=].valueString = "AEOB Complete Topic"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.status"
* extension[=].valueCode = #active

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.title"
* extension[=].valueString = "aeob-complete"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.date"
* extension[=].valueDateTime = "2025-01-15"

* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.description"
* extension[=].valueMarkdown = "Subscription topic for completed AEOBs"

* extension[+].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "An AEOB has been completed"
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "http://hl7.org/fhir/StructureDefinition/DocumentReference"
* extension[=].extension[+].url = "supportedInteraction"
* extension[=].extension[=].valueCode = #create
* extension[=].extension[+].url = "supportedInteraction"
* extension[=].extension[=].valueCode = #update
* extension[=].extension[+].extension[0].url = "previous"
* extension[=].extension[=].extension[=].valueString = "status:not=current"
* extension[=].extension[=].extension[+].url = "resultForCreate"
* extension[=].extension[=].extension[=].valueCode = #test-passes
* extension[=].extension[=].extension[+].url = "current"
* extension[=].extension[=].extension[=].valueString = "status=current"
* extension[=].extension[=].extension[+].url = "resultForDelete"
* extension[=].extension[=].extension[=].valueCode = #test-fails
* extension[=].extension[=].extension[+].url = "requireBoth"
* extension[=].extension[=].extension[=].valueBoolean = true
* extension[=].extension[=].url = "queryCriteria"
* extension[=].extension[+].url = "fhirPathCriteria"
* extension[=].extension[=].valueString = "(%previous.id.empty() or (%previous.status != 'current')) and (%current.status = 'current')"
* extension[=].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.resourceTrigger"

* extension[+].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "Filter based on the subject of a DocumentReference."
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "filterParameter"
* extension[=].extension[=].valueString = "subject"
* extension[=].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.canFilterBy"

* extension[+].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "Filter based on the type of a DocumentReference."
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "filterParameter"
* extension[=].extension[=].valueString = "type"
* extension[=].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.canFilterBy"

* extension[+].extension[0].url = "description"
* extension[=].extension[=].valueMarkdown = "Filter based on the authors of a DocumentReference."
* extension[=].extension[+].url = "resource"
* extension[=].extension[=].valueUri = "DocumentReference"
* extension[=].extension[+].url = "filterParameter"
* extension[=].extension[=].valueString = "author"
* extension[=].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.canFilterBy"

*
*

* modifierExtension.url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SubscriptionTopic.status"
* modifierExtension.valueCode = #draft
* code = http://hl7.org/fhir/fhir-types#SubscriptionTopic

*/


// TODO, how do we create a subscription for a subject or author

Instance: aeob-available-subject-subscription
InstanceOf: Subscription
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2025-01-15T10:50:28.4906421-05:00"
* status = #requested
* meta.lastUpdated = "2030-01-15T00:00:00-05:00"
* reason = "Notification for available AEOBs for members"
* criteria.extension.url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria"
* criteria.extension.valueString = "DocumentReference?type=aeob-document"
* criteria = "http://example.org/FHIR/SubscriptionTopic/aeob-available-subject"
* channel.extension.url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-heartbeat-period"
* channel.extension.valueInteger = 120
* channel.type = #rest-hook
* channel.endpoint = "https://subscriptions.argo.run/fhir/r4/$subscription-hook"
* channel.payload.extension.url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content"
* channel.payload.extension.valueCode = #id-only
* channel.payload = #application/fhir+json


Instance: aeob-available-author-subscription
InstanceOf: Subscription
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2025-01-15T10:50:28.4906421-05:00"
* status = #requested
* meta.lastUpdated = "2030-01-15T00:00:00-05:00"
* reason = "Notification for available AEOBs for authors"
* criteria.extension.url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria"
* criteria.extension.valueString = "DocumentReference?type=aeob-document"
* criteria = "http://example.org/FHIR/SubscriptionTopic/aeob-available-author"
* channel.extension.url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-heartbeat-period"
* channel.extension.valueInteger = 120
* channel.type = #rest-hook
* channel.endpoint = "https://subscriptions.argo.run/fhir/r4/$subscription-hook"
* channel.payload.extension.url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content"
* channel.payload.extension.valueCode = #id-only
* channel.payload = #application/fhir+json


/*


to present
current: type=aeob-packet

Create a profile for Subscription topic


Items to discuss

resultForCreate: test-passes
resultForDelete: test-passes


*

*/