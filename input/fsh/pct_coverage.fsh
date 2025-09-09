Profile: PCTCoverage
Parent: USCoreCoverageProfile|7.0.0
Id: davinci-pct-coverage
Title: "PCT Coverage"
Description: "PCT Coverage is a profile for capturing data that reflect a payer's coverage that was effective as of the proposed date of service or the date of admission of the GFE."
* insert TrialUseArtifact
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-coverage|7.0.0"

* obeys pct-coverage-1 and pct-coverage-2

* extension contains
    $R5CoverageKind named coverage-kind 1..1 MS and
    SelfPayDeclared named self-pay-declared 0..1 MS

* extension[coverage-kind]
  * valueCode 1..1
//  * valueCode from http://hl7.org/fhir/ValueSet/coverage-kind
//  * valueCode ^short = "insurance only"

* type ^short = "Coverage category such as medical or accident. A coverage.type of `81` (Self-pay) MAY be used to imply that the patient has no coverage or that an individual or organization other than an insurer is taking responsibility for payment for a portion of the health care costs."

* subscriber
* subscriber ^short = "Required if subscriber is a person that is not the beneficiary. When date of birth or gender are not known, omit Patient.birthDate and set Patient.gender to unknown."
* subscriber.display ^short = "Provide the name of the subscriber in Coverage.subscriber.display concatenating the subscriber's prefix, given name, family name and suffix (in this order), each separated by a single space. If discrete name parts are required, a Patient resource SHALL be pointed to in Coverage.subscriber.reference."
//* subscriber.display 1..1
* subscriberId 1..1

* subscriberId.extension contains
    $DARExtensionUrl named dataAbsentReason 0..1

* subscriberId.extension[dataAbsentReason]
  * valueCode 1..1
  * valueCode = DataAbsentReason#not-applicable
  * valueCode ^short = "Use Data Absent Reason (DAR) extension with a value of 'not-applicable' for self-pay or uninsured"


* payor only Reference (PCTOrganization or USCorePatientProfile|7.0.0 or USCoreRelatedPersonProfile|7.0.0)
* payor ^short = "Issuer of the policy. For Self-pay or uninsured this should be a reference to a patient or related person resource"

* class 0..*
* class.name 1..1


//* period 1..1
* beneficiary ^short = "Patient or Plan Beneficiary"

* costToBeneficiary
* costToBeneficiary.type from http://terminology.hl7.org/ValueSet/coverage-copay-type (required)


Invariant: pct-coverage-1
Description: "Coverage: class element SHALL be present if coverage-0kind is insurance"
Expression: "extension.where(url='http://hl7.org/fhir/5.0/StructureDefinition/extension-Coverage.kind'and value = 'insurance').exists() implies class.exists()"
Severity: #error



Invariant: pct-coverage-2
Description: "Coverage: period element SHALL be present if coverage-0kind is insurance"
Expression: "extension.where(url='http://hl7.org/fhir/5.0/StructureDefinition/extension-Coverage.kind'and value = 'insurance').exists() implies period.exists()"
Severity: #error

/*


Profile: PCTSelfPayCoverage
Parent: Coverage
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

*/
