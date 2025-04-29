Profile: PCTAEOBAvailableAuthorSubscription
Parent: Subscription
Id: davinci-pct-aeob-available-author-subscription
Title: "AEOB Available, Author - Subscription"
Description: "An author focused Subscription when an Advanced Explanation of Benefit (AEOB) Packet DocumentReference is created or updated (for FHIR R4). This represents that an AEOB Bundle, either contained in or referred to by the DocumentReference has been newly created and is available or has been updated, should updates be made."
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-aeob-available-author-subscriptiontopic"
* criteria.extension contains http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria named filterCriteria 1..* MS
* status = #active
* channel.type = #rest-hook
* channel.payload.extension contains http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content named payloadContent 1..1 MS
//* channel.payload.extension[payloadContent].valueCode = #full-resource

Profile: PCTAEOBAvailableSubjectSubscription
Parent: Subscription
Id: davinci-pct-aeob-available-subject-subscription
Title: "AEOB Available, Subject - Subscription"
Description: "A subject focused Subscription when an Advanced Explanation of Benefit (AEOB) Packet DocumentReference is created or updated (for FHIR R4). This represents that an AEOB Bundle, either contained in or referred to by the DocumentReference has been newly created and is available or has been updated, should updates be made."
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-aeob-available-subject-subscriptiontopic"
* criteria.extension contains http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria named filterCriteria 1..* MS
* status = #active
* channel.type = #rest-hook
* channel.payload.extension contains http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content named payloadContent 1..1 MS
//* channel.payload.extension[payloadContent].valueCode = #full-resource



Instance: example-aeob-available-author-subscription-full
InstanceOf: davinci-pct-aeob-available-author-subscription
Description: "An example instance of the davinci-pct-aeob-available-author-subscription Profile returning the full DocumentReference resource"
Usage: #example
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-aeob-available-author-subscriptiontopic"
* criteria.extension[filterCriteria].valueString = "DocumentReference?author=Practitioner/123456789"
* status = #active
* end = "2025-04-20T03:33:12.7238087+00:00"
* reason = "Test of PCT Subscriptions"
* channel.type = #rest-hook
* channel.endpoint = "https://example.com/fhir/r4/$subscription-hook"
* channel.payload = #application/fhir+json
* channel.payload.extension[payloadContent].valueCode = #full-resource


Instance: example-aeob-available-author-subscription-id-only
InstanceOf: davinci-pct-aeob-available-author-subscription
Description: "An example instance of the davinci-pct-aeob-available-author-subscription Profile returning only the id of the DocumentReference resource"
Usage: #example
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-aeob-available-author-subscriptiontopic"
* criteria.extension[filterCriteria].valueString = "DocumentReference?author=Practitioner/123456789"
* status = #active
* end = "2025-04-20T03:33:12.7238087+00:00"
* reason = "Test of PCT Subscriptions"
* channel.type = #rest-hook
* channel.endpoint = "https://example.com/fhir/r4/$subscription-hook"
* channel.payload = #application/fhir+json
* channel.payload.extension[payloadContent].valueCode = #id-only

// TODO, how do we create a subscription for a subject or author

// TODO add heartPeriod MS (for the server) beat Must Support
//  Does the server need to support either id or full resource. Min binding for saying everyone has to support both
//Also look at other extensions https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription.html

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