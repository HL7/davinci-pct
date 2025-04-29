Profile: PCTGFEAvailableAuthorSubscription
Parent: Subscription
Id: davinci-pct-gfe-available-author-subscription
Title: "GFE Available, Author - Subscription"
Description: "An author focused Subscription when a Good Faith Estimate (GFE) Packet DocumentReference is created or updated (for FHIR R4). This represents that a GFE Bundle, either contained in or referred to by the DocumentReference has been newly created and is available or has been updated, should updates be made."
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-available-author-subscriptiontopic"
* criteria.extension contains http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria named filterCriteria 1..* MS
* status = #active
//* channel.type = #rest-hook
* channel.payload.extension contains http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content named payloadContent 1..1 MS
//* channel.payload.extension[payloadContent].valueCode = #full-resource

Profile: PCTGFEAvailableSubjectSubscription
Parent: Subscription
Id: davinci-pct-gfe-available-subject-subscription
Title: "GFE Available, Subject - Subscription"
Description: "A subject focused Subscription when a Good Faith Estimate (GFE) Packet DocumentReference is created or updated (for FHIR R4). This represents that a GFE Bundle, either contained in or referred to by the DocumentReference has been newly created and is available or has been updated, should updates be made."
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-available-subject-subscriptiontopic"
* criteria.extension contains http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria named filterCriteria 1..* MS
* status = #active
//* channel.type = #rest-hook
* channel.payload.extension contains http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content named payloadContent 1..1 MS
//* channel.payload.extension[payloadContent].valueCode = #full-resource


Instance: example-gfe-available-author-subscription-full
InstanceOf: davinci-pct-gfe-available-author-subscription
Description: "An example instance of the davinci-pct-gfe-available-author-subscription Profile returning the full DocumentReference resource"
Usage: #example
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-available-author-subscriptiontopic"
* criteria.extension[filterCriteria].valueString = "DocumentReference?author=Practitioner/Submitter-Practitioner-1"
* status = #active
* end = "2025-04-20T03:33:12.7238087+00:00"
* reason = "Test of PCT Subscriptions"
* channel.type = #rest-hook
* channel.endpoint = "https://example.com/fhir/r4/$subscription-hook"
* channel.payload = #application/fhir+json
* channel.payload.extension[payloadContent].valueCode = #full-resource


Instance: example-gfe-available-author-subscription-id-only
InstanceOf: davinci-pct-gfe-available-author-subscription
Description: "An example instance of the davinci-pct-gfe-available-author-subscription Profile returning only the id of the DocumentReference resource"
Usage: #example
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-available-author-subscriptiontopic"
* criteria.extension[filterCriteria].valueString = "DocumentReference?author=Practitioner/Submitter-Practitioner-1"
* status = #active
* end = "2025-04-20T03:33:12.7238087+00:00"
* reason = "Test of PCT Subscriptions"
* channel.type = #rest-hook
* channel.endpoint = "https://example.com/fhir/r4/$subscription-hook"
* channel.payload = #application/fhir+json
* channel.payload.extension[payloadContent].valueCode = #id-only




Instance: example-gfe-available-subject-subscription-full
InstanceOf: davinci-pct-gfe-available-subject-subscription
Description: "An example instance of the davinci-pct-gfe-available-subject-subscription Profile returning the full DocumentReference resource"
Usage: #example
* criteria = "http://hl7.org/fhir/us/davinci-pct/SubscriptionTopic/davinci-pct-gfe-available-subject-subscriptiontopic"
* criteria.extension[filterCriteria].valueString = "DocumentReference?subject=Patient/patient1001"
* status = #active
* end = "2025-04-20T03:33:12.7238087+00:00"
* reason = "Test of PCT Subscriptions"
* channel.type = #rest-hook
* channel.endpoint = "https://example.com/fhir/r4/$subscription-hook"
* channel.payload = #application/fhir+json
* channel.payload.extension[payloadContent].valueCode = #full-resource



/*
                "channel": {
                    "extension": [
                        {
                            "url": "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-heartbeat-period",
                            "valueInteger": 120
                        }
                    ],
                    *
                    "type": "rest-hook",
                    "endpoint": "https://subscriptions.argo.run/fhir/r4/$subscription-hook",
                    "payload": "application/fhir+json",
                    "_payload": {
                        "extension": [
                            {
                                "url": "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content",
                                "valueCode": "id-only"
                            }
                        ]
                    }
                }
                */