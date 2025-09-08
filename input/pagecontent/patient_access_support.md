### Patient Access to GFE from Provider 

 

Providers may need to make the GFE Packet available to the patient, in particular if the patient is uninsured or choosing to self-pay. This may need to be done as part of the coordination workflow with multiple providers or separately with a single provider. In either scenario, this could be handled by the provider directly or through an intermediary like the Coordination Platform using a FHIR query API or through FHIR subscriptions . Once  the GFE Packet is produced, either through the coordination workflow or directly by the provider, it can be made available to the patient through an API., The provider system may support notification of the availability of a new or updated GFE Packets to the patient or their authorized representative. The same mechanism can also be used to share the GFE Packet with other contributing providers, if applicable.   

For a more detailed overview, see GFE Packet Availability. For specifications on making the GFE available to patients, most common in the self-pay or uninsured scenario, see sections Requirements for GFE Packet Availability Subscriptions and Patient Access to GFEs. 

 

### Patient Access to AEOB from Payer 

 

A primary goal of this guide is to enable the patient to have access to AEOBs for expected future medical items or services. This IG provides requirements and guidance  using a FHIR query API or through FHIR subscriptions, where the  AEOB Packet should be made available to patients, and optionally to their providers. 

AEOB API: Upon completing the creation of the AEOB Packet, the payer may make the completed AEOB available to the patient in a number of ways such as via mail, the payer patient portal, mobile app, or other technology to connect to the AEOB API. The only channel in scope for this guide is the FHIR-based API approach inspired by the Patient Access API defined in the CARIN Consumer Directed Payer Data Exchange guide (CARIN IG for Blue Button). If the payer does implement both this API and the Patient Access API defined in the CARIN IG, it is up to the payer to determine if those APIs use the same or different endpoints. 

The AEOB Packet includes, at a minimum, the full estimation based on the GFE Packet received in the GFE submission/AEOB Request from the provider. If the payer or intermediary supports linking across submissions, the AEOB Packet may include estimates across linked GFE submissions (e.g. through a GFE Composition GFE Service Linking Info).  

Within the AEOB Packet, there is an AEOB Summary resource profile that contains the highest-level elements that a Patient needs in a cost estimate, including:  

* Total Submitted - the expected total amount submitted from the provider (charges) 

* Total Member liability - the expected amount the patient owes 

* Total Expected Payer’s payment amount – calculated by `total:eligible` minus `total:memberliability`

 

### Background on FHIR Subscriptions  

This IG utilizes the FHIR Subscriptions R5 Backport Implementation Guide as a basis to support FHIR subscriptions. Support for the FHIR Subscriptions framework is new in this version of the PCT Implementation Guide and is currently optional. However, FHIR Subscriptions are likely be required in a future version of this specification since it offers significant performance benefits. That guide references a resource called SubscriptionTopic to express topics, or events that other systems can search for and subscribe to notifications of. The SubscriptionTopic resource is not supported by FHIR R4 systems. Instead, Subscription Topics in R4 can be defined using a Basic resource with extensions that represent the elements of the FHIR R5 resource. Neither standards based subscription topic discovery with the support of SubscriptionTopic nor the equivalent Basic resource versions described in the Subscriptions R5 Backport IG is required by this guide to support subscriptions. Regardless of whether the SubscriptionTopic or R4 Basic resource equivalent is supported, a system wanting to support subscriptions can still use the canonical URL of the SubscriptionTopic defined in this IG as the basis to define the nature of the subscription and may use it as the Subscription.criteria. 

The subscriptions defined in this IG for both GFE Packet and AEOB Packet availability are for the DocumentReference resource. Note that Subscriptions are also defined in this IG to support GFE Coordination Task Notifications between providers that are contributing to one GFE Packet.   

 