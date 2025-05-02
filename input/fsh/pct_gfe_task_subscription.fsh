Profile: PCTGFETaskUpdateSubscription
Parent: Subscription
Id: davinci-pct-gfe-task-update-subscription
Title: "Subscription - GFE Coordination Task Update Notification"
Description: "Profile for a Subscription to provide a notification to an Provider involved in GFE Coordination effort (either as a GFE Coordination Requester or a GFE Coordinator) whenever a Task is created, updated, or deleted (for FHIR R4). For the GFE Coordination requester this will trigger for a change on a Coordination or Contributor Task for which they are the requester. For a GFE Contributor this will trigger on a change to a Contributor Task for which they are the owner or on a change to an associated Coordination Task. This will be triggered on the creation, update, or deletion of Coordination (gfe-coordination-task) or Contributor Task (gfe-contributor-task) codes."
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-coordination-task-notification"
* criteria.extension contains http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria named filterCriteria 1..* MS
* status = #active

* channel.extension contains 
    http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-heartbeat-period named heartbeatPeriod 0..1 and
    http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-timeout named timeout 0..1 and
    http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-max-count named maxCount 0..1

//* channel.type = #rest-hook
* channel.payload.extension contains http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content named payloadContent 1..1 MS
//* channel.payload.extension[payloadContent].valueCode = #full-resource


Instance: example-gfe-task-subscription
InstanceOf: davinci-pct-gfe-task-update-subscription
Description: "An example instance of the davinci-pct-gfe-task-update-subscription Profile"
Usage: #example
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-coordination-task-notification"
* criteria.extension[filterCriteria][+].valueString = "Task?requester=Organization/Submitter-Org-1"
* status = #active
* end = "2025-05-20T03:33:12.7238087+00:00"
* reason = "Test of PCT Subscriptions"
* channel.type = #rest-hook
* channel.endpoint = "https://example.com/fhir/r4/$subscription-hook"
* channel.payload = #application/fhir+json
* channel.payload.extension[payloadContent].valueCode = #full-resource


Instance: example-gfe-task-subscription-partof
InstanceOf: davinci-pct-gfe-task-update-subscription
Description: "An example instance of the davinci-pct-gfe-task-update-subscription Profile"
Usage: #example
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-coordination-task-notification"
* criteria.extension[filterCriteria][+].valueString = "Task?_has:Task:part-of:owner=Organization/Submitter-Org-1"
* status = #active
* end = "2025-05-20T03:33:12.7238087+00:00"
* reason = "Test of PCT Subscriptions"
* channel.type = #rest-hook
* channel.endpoint = "https://example.com/fhir/r4/$subscription-hook"
* channel.payload = #application/fhir+json
* channel.payload.extension[payloadContent].valueCode = #full-resource
/*
Instance: example-gfe-task-subscription-partOf
InstanceOf: davinci-pct-gfe-task-update-subscription
Description: "An example instance of the davinci-pct-gfe-task-update-subscription Profile that is part of another task"
Usage: #example
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-coordination-task-notification"
//* criteria.extension[filterCriteria][+].valueString = "Task?requester=Organization/Submitter-Org-1"
* criteria.extension[filterCriteria][+].valueString = "Task?_has:Task:part-of:owner=Organization/Submitter-Org-1"
* status = #active
* end = "2025-05-20T03:33:12.7238087+00:00"
* reason = "Test of PCT Subscriptions"
* channel.type = #rest-hook
* channel.endpoint = "https://example.com/fhir/r4/$subscription-hook"
* channel.payload = #application/fhir+json
* channel.payload.extension[payloadContent].valueCode = #full-resource
*/


