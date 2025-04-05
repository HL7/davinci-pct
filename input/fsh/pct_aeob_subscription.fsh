
// TODO, how do we create a subscription for a subject or author
/*
Instance: aeob-available-subject-subscription
InstanceOf: Subscription
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2025-01-15T10:50:28.4906421-05:00"
* status = #requested
* meta.lastUpdated = "2030-01-15T00:00:00-05:00"
* reason = "Notification for available AEOBs for members"
* criteria.extension.url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria"
* criteria.extension.valueString = "DocumentReference?type=aeob-packet"
* criteria = "http://example.org/FHIR/SubscriptionTopic/aeob-available-subject"
* channel.extension.url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-heartbeat-period"
* channel.extension.valueUnsignedInt = 120
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
* criteria.extension.valueString = "DocumentReference?type=aeob-packet"
* criteria = "http://example.org/FHIR/SubscriptionTopic/aeob-available-author"
* channel.extension.url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-heartbeat-period"
* channel.extension.valueUnsignedInt = 120
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