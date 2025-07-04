### Use Case Overview ###

This guide provides specifications enabling data exchange for Good Faith Estimate (GFE)s and Advanced Explanation of Benefit (AEOB)s. This IG breaks the process into two main parts: 

1. [Good Faith Estimate (GFE) Coordination](gfe_coordination_overview.html)

2. [Good Faith Estimate (GFE) Submission and AEOB](gfe_submission_and_aeob_overview.html)


### Actors ###
The US No Surprises Act, which lays out some of the legal requirements this IG is meant to address, identifies a number of business actors responsible for the collection and sharing of GFEs and AEOBs. For official statutory &amp; regulatory terms definitions, please see regulatory authorities. These are identified in the [Business Actors](#business-actors) section of the guide. This IG also defines a set of [Technical Actors](#technical-actors), which perform specific actions in their respective workflows. A business actor may perform zero or more technical actor actions defined in the workflows of this IG as they may decide to delegate the technical capabilities to third parties or may choose to perform additional technical components. In order to abstract legal roles and responsibilities from technical capabilities, this guide identifies the business actors from the law, the technical actors that perform each role in the technical workflows defined by this IG, and the common relationships between them. This guide uses the term provider to mean either an individual Practitioner, an Organization, or a Facility.

#### Business Actors ####

- **Patient** - An individual who accesses a provider estimation (GFE) of costs for products or services if they do not have insurance or are self pay, or who accesses a payer processed estimation of costs for products or services they may receive in the future (AEOB) if they are using insurance.

- **Convening Provider** - A Practitioner, Organization, or Facility that is responsible for the single, comprehensive good faith estimate GFE, which will include any items or services that may be reasonably expected to be provided in conjunction with the primary item or service such a request and collects GFEs from providers potentially providing services or items in conjunction with the request (co-providers). This provider is responsible for submitting the GFE to the patient for self-pay/uninsured. 

Note: the term "convening provider" is being used to be consistent with the language in the self-pay/uninsured patient GFE statute and regulation. In this IG, this role, in conjunction with the [GFE Coordination Workflow]( gfe_coordination_overview.html), is not required but may be applied to the creation of the GFE that gets submitted in the [GFE Submission Workflow]( gfe_submission_and_aeob_overview.html) for insured patients. Future regulation may define additional implementer requirements beyond what this IG currently defines.

- **Co-Provider** - A Practitioner, Organization, or Facility receives a request for a GFE from a convening provider involving services or items that relate to the fulfillment of the original request and submits the GFE to the Convening Provider in response to that request.

- **GFE Submitter** - Any provider and/or facility that sends a Good Faith Estimate (GFE) to a payer to facilitate the creation of an Advanced Explanation of Benefits (AEOB).|

- **Payer** - A group health plan, or a health insurance issuer offering group or individual health insurance coverage.


There are different terms used for an individual or patient in the Health Plan industry. Terms such as subscriber or member may be used. A subscriber and a member are not necessarily equivalent. For example, the subscriber may be the primary family member on a plan that covers the entire family. Therefore, the term Member will be used throughout this guide to identify the individual subject of the “member health history”.



#### Technical Actors ####

- **GFE Coordination Requester** - A provider and/or facility that initiates a request to coordinate on a multi-provider GFE across provider systems and retrieves the resulting GFE Bundles. The Convening Provider Business Actor often performs this role.

- **GFE Contributor** - A provider and/or facility that receives a request to contribute to a Good Faith Estimate (GFE) from a GFE Coordination Requester as part of an initial request for estimation of items and services. The Co-Provider Business Actor often performs this role. However, if the Convening Provider business actor also contributes an estimate to add to the collection, they too will be performing the GFE Contributor actor role.

- **Coordination Platform** - the system designated by the convening provider to coordinate the GFE collection across providers when multiple providers are engaged in a service. This system acts as the central location for enabling the communication and management of Tasks between the GFE Requester and GFE Contributors. This system is not necessarily associated with any business identified in the law. It may be implemented by a 3rd party, by the convening or contributing provider, or even by a payer.

- **Payer** - A system that adjudicates GFEs that have been submitted by a healthcare provider and generates an AEOB. These systems determine if a provider is in or out of network, verifies patient eligibility, applies contracted amounts (the provider’s network status needs to be confirmed), and applies member cost sharing amounts.  This is the same as the Payer Business Actor. For the purposes of this guide the business actor and technical actor are the same.

- **Client** - systems are typically billing management systems, revenue cycle management systems, or other client systems responsible for requesting AEOBs.

- **Intermediary** - The payer or the provider may have the relationship with the intermediary. Some payers do not contract with a clearinghouse; others do. Providers can either contract with a Practice Management system who has the relationship with the clearinghouse or in some cases contracts directly with the clearinghouse through their Practice Management software
