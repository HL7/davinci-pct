Profile: PCTGFESummary
Parent: Claim
Id: davinci-pct-gfe-summary
Title: "PCT Good Faith Estimate  Summary"
//Description: "This profile is used for exchanging a summary of Explanation of Benefit (EoB) information, including costs and benefits, of all of the Advanced EoB data contained within an Advance EoB Bundle."
Description: "PCT Good Faith Estimate Summary is a profile for summarizing costs associated with a set of Good Faith Estimate Claims for a single Period of Care."

* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.description = "Slice based on $this pattern"
* identifier contains
   INTER 0..*
* identifier[INTER].type = PCTIdentifierType#INTER "Intermediary System Identifier"
* identifier[INTER] ^short = "Intermediary System Identifier"

* extension contains GFEDisclaimer named gfeDisclaimer 0..* MS and
                     ServiceDescription named serviceDescription 0..1 MS
* extension[gfeDisclaimer].value[x] only string
* extension[gfeDisclaimer] ^short = "Disclaimers the patient should be made aware of regarding the estimate"

* billablePeriod MS
* billablePeriod ^short = "The full Period of Care for all services or products included in the estimate from the first event to the last event."


* type = PCTEstimateTypeSummaryCS#estimate-summary
* subType 0..0
* use = $CLAIMUSECS#predetermination "predetermination"


* patient only Reference(HRexPatientDemographics)

* enterer 0..0

* insurer MS
* insurer only Reference(PCTOrganization)

// Multiple providers. 
* provider.reference 0..0
* provider.type 0..0
* provider.identifier 0..0
* provider.display 0..0
* provider.extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named dataAbsentReason 1..1
* provider.extension[dataAbsentReason].valueCode = #not-applicable

* priority from $PROCPRIORITYVS (required)

* fundsReserve 0..0

* prescription 0..0
* originalPrescription 0..0
* payee 0..0
* referral 0..0

* facility 0..0

* insurance.coverage only Reference(PCTCoverage)
* insurance.preAuthRef 0..0

* accident.location[x] only Address
* accident.location[x].country from $ISO3166-P1-ALPHA2-VS (required)

* insert DiagnosisSlicing
* diagnosis 1..*
//* diagnosis.diagnosis[x] MS
//* diagnosis.diagnosis[x] only CodeableConcept
//* diagnosis.diagnosis[x] from http://hl7.org/fhir/ValueSet/icd-10 (required)
* diagnosis.type MS
* diagnosis.type from PCTDiagnosisTypeVS
* diagnosis contains
   principal 1..1 and
   admitting 0..1 MS and
   patientReasonForVisit 0..3 MS and
   externalcauseofinjury 0..12 MS and
   other 0..24 MS
* diagnosis[principal].type 1..1
* diagnosis[principal].type = $DIAGTYPECS#principal
* diagnosis[principal].sequence = 1
* diagnosis[principal].diagnosis[x]
* diagnosis[principal].diagnosis[x] only CodeableConcept
* diagnosis[principal].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[admitting].type 1..1
* diagnosis[admitting].type = $DIAGTYPECS#admitting
* diagnosis[admitting].diagnosis[x]
* diagnosis[admitting].diagnosis[x] only CodeableConcept
* diagnosis[admitting].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[patientReasonForVisit].type 1..1
* diagnosis[patientReasonForVisit].type = PCTDiagnosisType#patientReasonForVisit
* diagnosis[patientReasonForVisit].diagnosis[x]
* diagnosis[patientReasonForVisit].diagnosis[x] only CodeableConcept
* diagnosis[patientReasonForVisit].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[externalcauseofinjury].type 1..1
* diagnosis[externalcauseofinjury].type = PCTDiagnosisType#externalCauseOfInjury
* diagnosis[externalcauseofinjury].diagnosis[x]
* diagnosis[externalcauseofinjury].diagnosis[x] only CodeableConcept
* diagnosis[externalcauseofinjury].diagnosis[x] from PCTDiagnosticCodes (required)
* diagnosis[other].type 1..1
* diagnosis[other].type = PCTDiagnosisType#other
* diagnosis[other].diagnosis[x] MS
* diagnosis[other].diagnosis[x] only CodeableConcept
* diagnosis[other].diagnosis[x] from PCTDiagnosticCodes (required)

* insert ProcedureSlicing
//* procedure.procedure[x] MS
//* procedure.procedure[x] only CodeableConcept
* procedure.type MS
* procedure.type from PCTProcedureTypeVS

* procedure.extension contains ServiceDescription named serviceDescription 1..1
* procedure contains
   principal 0..1 MS and
   other 0..24 MS
* procedure[principal].type 1..1
* procedure[principal].type = PCTProcedureType#principal
* procedure[principal].sequence = 1
* procedure[principal].procedure[x]
* procedure[principal].procedure[x] only CodeableConcept
* procedure[principal].procedure[x] from ICD10ProcedureCodes (required)
* procedure[principal] ^short = "Principal clinical procedure performed"
* procedure[other].type 1..1
* procedure[other].type = PCTProcedureType#other
* procedure[other].procedure[x]
* procedure[other].procedure[x] only CodeableConcept
* procedure[other].procedure[x] from PCTProcedureSurgicalCodes

* insert CareTeamSlicing
//* careTeam 0..* MS
* careTeam.provider 1..1
// ISSUE: does the qualification code give the taxonomy code? If so, no need to have PractitionerRole??
* careTeam.provider only Reference(PCTPractitioner or PCTOrganization)
//* careTeam.provider ^short = ""
* careTeam.role 1..1
* careTeam.role from PCTCareTeamRoleVS
* careTeam.qualification from $USCPROCROLE (required)
* careTeam contains
   attending 0..1 MS and
   operating 0..2 MS and
   rendering 0..1 MS and
   referring 0..1 MS
* careTeam[attending].role = PCTCareTeamRole#attending
//* careTeam[attending] ^short = "May be used for the Institutional case only"
* careTeam[attending].provider only Reference(PCTPractitioner)
* careTeam[attending].qualification 1..1 
* careTeam[operating].role = PCTCareTeamRole#operating
* careTeam[operating].provider only Reference(PCTPractitioner)
//* careTeam[operating] ^short = "May be used for the Institutional case only"
* careTeam[rendering].role = PCTCareTeamRole#rendering
* careTeam[rendering].provider only Reference(PCTPractitioner)
//* careTeam[rendering] ^short = "May be used for the Institutional/Professional case"
* careTeam[referring].role = PCTCareTeamRole#referring
// * careTeam[referring] ^short = "May be used for the Institutional/Professional case"


* supportingInfo 0..0


* item 0..0

* total 1..1
* total ^short = "Total GFE Charges"




