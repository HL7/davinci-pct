// TODO JIRA FHIR-45001 - Pre-adopt Coverage.kind into PCT Coverage profile and add declaration
// TODO  Check to make sure the descriptions are in the differential


Profile: PCTCoverage
Parent: USCoreCoverageProfile
Id: davinci-pct-coverage
Title: "PCT Coverage"
Description: "PCT Coverage is a profile for capturing data that reflect a payer's coverage that was effective as of the proposed date of service or the date of admission of the GFE."
* insert TrialUseArtifact
* extension contains
    $R5CoverageKind named coverage-kind 1..1

* extension[coverage-kind]
  * valueCode 1..1
  * valueCode = http://hl7.org/fhir/coverage-kind#insurance
  * valueCode ^short = "insurance only"

* subscriber
* subscriber ^short = "Required if subscriber is a person that is not the beneficiary. When date of birth or gender are not known, omit Patient.birthDate and set Patient.gender to unknown."
* subscriber.display ^short = "Provide the name of the subscriber in Coverage.subscriber.display concatenating the subscriber's prefix, given name, family name and suffix (in this order), each separated by a single space. If discrete name parts are required, a Patient resource SHALL be pointed to in Coverage.subscriber.reference."
* subscriber.display 1..1
* subscriberId 1..1


* payor only Reference (PCTOrganization)

* class 1..*
* class.name 1..1


* period 1..1

* costToBeneficiary
* costToBeneficiary.type from http://terminology.hl7.org/ValueSet/coverage-copay-type (required)



Profile: PCTSelfPayCoverage
Parent: USCoreCoverageProfile
Id: davinci-pct-self-pay-coverage
Title: "PCT Self-Pay Coverage"
Description: "PCT Self-Pay Coverage is a profile for capturing that an estimate is to be be based  on a self-pay or uninsured patient."
* insert TrialUseArtifact
* extension contains
    $R5CoverageKind named coverage-kind 1..1 and
    SelfPayDeclared named self-pay-declared 0..1 MS

* extension[coverage-kind]
  * valueCode 1..1
  * valueCode = http://hl7.org/fhir/coverage-kind#self-pay
  * valueCode ^short = "self-pay only"

* payor only Reference (USCorePatientProfile or USCoreRelatedPersonProfile)

* beneficiary only Reference (USCorePatientProfile)


