### Da Vinci
Da Vinci is an HL7-sponsored project that brings together the U.S. payer, providers, and technology suppliers (including Billing Management System vendors)  to help payers and providers to positively impact clinical, quality, cost, and care management outcomes using FHIR-related technologies. The project organizes meetings (face-to-face and conference calls) as well as Connectathons to find ways to leverage FHIR technologies to support and integrate value-based care (VBC) data exchange across communities. Da Vinci identifies VBC use cases of interest to its member and the community as a whole.

The process that Da Vinci has adopted includes:
1. identify business, clinical, technical and testing requirements,
2. develop and ballot a FHIR based implementation guide (IG),
3. develop a reference implementation (RI) that is used to demonstrate that the concepts in the IG are possible to implement,
4. pilot the standard
5. support the production use of the IG to enable exchange of data to support interoperability for value-based care.

Additional information about Da Vinci, its members, the use cases and the implementation guides being developed can all be found on the [HL7 website](http://www.hl7.org/about/davinci). Meeting minutes and other materials can be found on the [Da Vinci Confluence page](https://confluence.hl7.org/display/DVP).

### FHIR
This IG uses terminology, notations and design principles that are specific to FHIR. It's important to be familiar with some of the basic principles of FHIR as well
as general guidance on how to read FHIR specifications. Readers who are unfamiliar with FHIR are encouraged to read the following prior to reading the rest of this IG.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html)
* (or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html)
* [Base resource]({{site.data.fhir.path}}resource.html)

#### FHIR Version
[FHIR R4 US Core](http://hl7.org/fhir/us/core/index.html) 

Implementers should also familiarize themselves with the FHIR resources used within this IG.

### US Core
Provider billing and payer claims adjudication systems for those profiles defined by US Core SHALL use the specification defined by [US Core](http://hl7.org/fhir/us/core/index.html) in exchanging information with payers. Implementers should be familiar with this specification. Claim, ExplanationOfBenefit and Coverage resource profiles are not defined by US Core.

Da Vinci PCT implementations SHALL conform to the US Core IG [Must Support](http://hl7.org/fhir/us/core/general-guidance.html#must-support) Guidance where US Core IG resources are used.

<blockquote class="stu-note">
<p>
This has been updated to reflect Jira ticket <a href="https://jira.hl7.org/browse/FHIR-34976">FHIR-34976</a> which is pending a block vote as of 2-28-2022.
</p>
</blockquote>
### Da Vinci HRex
Provider billing and payer systems SHALL use the specification defined by the Da Vinci HRex IG [Da Vinci HRex IG](http://hl7.org/fhir/us/davinci-hrex/2020Sep/) when exchanging information, as defined by [the Privacy and Security section of this IG](formal_specification.html#privacy--security-considerations). Implementers should be familiar with this specification.

