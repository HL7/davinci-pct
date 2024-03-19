This section of the implementation guide (IG) defines the specific conformance requirements for systems wishing to conform to this Patient Cost Transparency (PCT) IG GFE Request Workflow. It focuses on Good Faith Estimate (GFE) Request [$gfe-request]( https://build.fhir.org/ig/HL7/davinci-pct/OperationDefinition-GFE-request.html) and an GFE Request Task workflow, though it also provides guidance on privacy, security, and other implementation requirements.

### Detailed Requirements

#### Summary
** Things that need to be addressed **
- Coordination Platform as a phone book
- Notifications (subscriptions, direct notifications, etc)
- support for out of band capabilities (Task still needs to exist, but a delegate can complete)
- replacing contributing provider
- Not on request changes. - If changes would require any providers to make changes to their estimations (including anticipated/scheduled service date, or changes of service) would result in a cancellation of the Coordinating task and all contributing provider tasks with new new coordinating tsk issued with the replaces-task pointing to the original coordinating task.
- Need workflow diagrams with each step numbered and described including a statement of each Task status type. Make sure each task status is covered
- A contributing Provider Task needs to be created for each provider that needs to submit a GFE. This includes the submitting/convening provider where applicable.
- A note about creation either being each individual task and request information bundle or through the request bundle 


#### Requesting GFEs from Contributing Providers


#### Patient Access to GFEs

Needs re-writing
> Note: Although technically possible, conveying the AEOB to the patient via FHIR API is optional and the workflow is contingent upon the payer opting to expose the API to the patient. The payer must return the completed AEOB to the patient, but this may be done in many ways such as via mail, the payer benefits portal, or via an API. The only method in scope for this guide is the FHIR-based API approach inspired by the Patient Access API defined in the [CARIN Consumer Directed Payer Data Exchange](https://build.fhir.org/ig/HL7/carin-bb/Use_Case.html#use-case---consumer-access-to-their-claims-data) guide. Note that use of an API is optional for the payer, and if the payer does implement both this API and the Patient Access API defined in the CARIN IG, it is up to the payer to determine if those APIs use the same or different endpoints. 

If the payer system supports access via an API, then a third-party app used by the patient authorizes/authenticates  and receives an access token. The app requests the AEOB by using the access token using a GET request for ExplanationOfBenefit resources in the patient's compartment. For example, GET [base]/ExplanationOfBenefit?patient=[patient-id]. Payer systems SHALL implement appropriate access controls to ensure that AEOBs are only accessible by the authenticated patient. 
  * If successful, the system will return 200 OK, and the body will contain a Bundle resource of type searchset, containing zero or more ExplanationOfBenefit resources. Once the desired AEOB is found, the third-party app may use the same API to query for other resources referenced by the AEOB, such as Patient, Practitioner, Organization, and Coverage resources if those referenced resources are not contained in the AEOB itself. Third-party apps should keep track of prior AEOBs and alert the patient if new ones are found. New AEOBs would have a different identifier and a created date later than previous AEOBs. 

#### GFE Bundle Graphics

#### GFE Request


#### GFE Response

#### GFE Request / Response example

Example bundles can be found [here](use_cases.html#examples)
