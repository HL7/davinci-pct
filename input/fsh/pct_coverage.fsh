// TODO JIRA FHIR-45001 - Pre-adopt Coverage.kind into PCT Coverage profile and add declaration
// TODO  Check to make sure the descriptions are in the differential


Profile: PCTCoverage
Parent: HRexCoverage
Id: davinci-pct-coverage
Title: "PCT Coverage"
Description: "PCT Coverage is a profile for capturing data that reflect a payer’s coverage that was effective as of the proposed date of service or the date of admission of the GFE."
* insert TrialUseArtifact
* extension contains
    $R5CoverageKind named coverage-kind 1..1 and
    SelfPayDeclared named self-pay-declared 0..1 MS

* extension[coverage-kind]
  * valueCode 1..1
  * valueCode from http://hl7.org/fhir/coverage-kind (required)
  * valueCode ^short = "insurance | self-pay | other"

* subscriber
* subscriber ^short = "Required if subscriber is a person that is not the beneficiary. When date of birth or gender are not known, omit Patient.birthDate and set Patient.gender to unknown."
* subscriber.display ^short = "Provide the name of the subscriber in Coverage.subscriber.display concatenating the subscriber’s prefix, given name, family name and suffix (in this order), each separated by a single space. If discrete name parts are required, a Patient resource SHALL be pointed to in Coverage.subscriber.reference."
* subscriber.display 1..1
* subscriberId 1..1

* relationship 1..1
//* relationship from $SubscriberRelationiship (required)

* payor 1..1
* payor only Reference (PCTOrganization)

* class 1..*
* class.name 1..1
* class ^slicing.discriminator.type = #pattern
* class ^slicing.discriminator.path = "type"
* class ^slicing.rules = #open
* class ^slicing.ordered = false   // can be omitted, since false is the default
* class ^slicing.description = "Slice based on value pattern"
* class contains
    plan 0..1 MS
	
* class[plan].type.coding 1..*
* class[plan].type = COVCLASS#plan
* class[plan].value 1..1

* period 1..1

* costToBeneficiary
* costToBeneficiary.type from http://terminology.hl7.org/ValueSet/coverage-copay-type (required)

//* contract 1..* MS

// * meta.lastUpdated ^comment = "Defines the date the coverage that was effective as of the date of service or admission (163). The Coverage Reference Resource SHALL be returned with data that was effective as of the date of service or admission of the claim"
// * meta.profile ^comment = "meta.profile is required as a matter of convenience of receiving systems. The meta.profile should be used by the Server to hint/assert/declare that this instance conforms to one (or more) stated profiles (with business versions). meta.profile does not capture any business logic, processing directives, or semantics (for example, inpatient or outpatient). Clients should not assume that the Server will exhaustively indicate all profiles with all versions that this instance conforms to. Clients can (and should) perform their own validation of conformance to the indicated profile(s) and to any other profiles of interest. CPCDS data element (190)"
// * status ^comment = "Identfies the status of the coverage information (default: active) (133)"
// * type ^comment = "Identifies if the coverage is PPO, HMO, POS, etc. (3)"
// * subscriberId  ^comment = "The identifier assigned by the Payer on the subscriber's ID card (132)"
// * beneficiary ^comment = "Identifier for a member assigned by the Payer.  If members receive ID cards, that is the identifier that should be provided (1).  This is the party who receives treatment for which the costs are reimbursed under the coverage. alternate path:  EOB.patient(Patient).identifier"
// * relationship ^comment = "Relationship of the member to the person insured (subscriber). (72)"
// * period ^comment = "Date that the contract became effective (74) and Date that the contract was terminated or coverage changed (75)"
// * payor ^comment = "Issuer of the Policy (2)"
// * class[group].value ^comment = "Employer account identifier (134)"
// * class[group].name ^comment = "Name of the Employer Account (135)"
// * class[plan].value ^comment = "Business concept used by a health plan to describe its benefit offerings (154)"
// * class[plan].name ^comment = "Name of the health plan benefit offering assigned to the Plan Identfier (155)"


