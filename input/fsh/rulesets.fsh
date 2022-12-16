//// Rulesets

RuleSet: AdjudicationSlicing
* adjudication ^slicing.discriminator.type = #pattern
* adjudication ^slicing.discriminator.path = "category"
* adjudication ^slicing.rules = #open
* adjudication ^slicing.ordered = false   // can be omitted, since false is the default
* adjudication ^slicing.description = "Slice based on $this pattern"
* adjudication MS

RuleSet: ItemAdjudicationSlicing
* item.adjudication ^slicing.discriminator.type = #pattern
* item.adjudication ^slicing.discriminator.path = "category"
* item.adjudication ^slicing.rules = #open
* item.adjudication ^slicing.ordered = false   // can be omitted, since false is the default
* item.adjudication ^slicing.description = "Slice based on $this pattern"
* item.adjudication 1.. MS

RuleSet: SupportingInfoSlicing
* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "category"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.ordered = false   // can be omitted, since false is the default
* supportingInfo ^slicing.description = "Slice based on $this pattern"
* supportingInfo MS

RuleSet: DiagnosisSlicing
* diagnosis ^slicing.discriminator.type = #pattern
* diagnosis ^slicing.discriminator.path = "type"
* diagnosis ^slicing.rules = #open
* diagnosis ^slicing.ordered = false   // can be omitted, since false is the default
* diagnosis ^slicing.description = "Slice based on $this pattern"
* diagnosis MS

RuleSet: ProcedureSlicing
* procedure ^slicing.discriminator.type = #pattern
* procedure ^slicing.discriminator.path = "type"
* procedure ^slicing.rules = #open
* procedure ^slicing.ordered = false   // can be omitted, since false is the default
* procedure ^slicing.description = "Slice based on $this pattern"
* procedure MS

RuleSet: CareTeamSlicing
* careTeam ^slicing.discriminator.type = #pattern
* careTeam ^slicing.discriminator.path = "role"
* careTeam ^slicing.rules = #open
* careTeam ^slicing.ordered = false   // can be omitted, since false is the default
* careTeam ^slicing.description = "Slice based on $this pattern"
* careTeam MS

RuleSet: OrgContactSlicing
* contact ^slicing.discriminator.type = #pattern
* contact ^slicing.discriminator.path = "purpose"
* contact ^slicing.rules = #open
* contact ^slicing.ordered = false   // can be omitted, since false is the default
* contact ^slicing.description = "Slice based on $this pattern"
* contact MS

RuleSet: IdentfierSlicing
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.description = "Slice based on type pattern"

//// Invariants




//// NOTE: based on CARIN-BB IG -- see C4BBExplanationOfBenefit profile
//// Invariants

// Invariant:  EOB-insurance-focal
// Description: "EOB.insurance:  at most one with focal = true"
// Expression: "insurance.select (focal = true).count() < 2"
// Severity:   #error

// Invariant: EOB-inst-careTeam-practitioner // rewritten with input from Lee Surprenant FHIR-28530
// Description: "Institutional EOB: Careteam roles refer to a practitioner"
// Expression: "(
// role.where(coding.where(code in ('attending' | 'primary' | 'referring' | 'supervising')).exists()).exists() implies
// role.where(coding.where(code in ('attending' | 'primary' | 'referring' | 'supervising')).exists()).exists().provider.all(resolve() is Practitioner)
// )"
// Severity: #error

// Invariant: EOB-pharm-careTeam-practitioner
// Description: "Pharmacy EOB:  Careteam roles refer to a practitioner"
// Expression: "(
// role.where(coding.where(code in ('primary' | 'prescribing' )).exists()).exists() implies
// role.where(coding.where(code in ('primary' | 'prescribing' )).exists()).exists().provider.all(resolve() is Organization)
// )"

// Invariant: EOB-institutional-item-or-header-adjudication
// Description: "Institutional EOB:  Should have adjudication at the item or header level, but not both"
// Expression: "(adjudication.exists() != item.adjudication.exists())"
// Severity: #error
