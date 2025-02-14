Profile: PCTAdvancedEOBComposition
Parent: Composition
Id: davinci-pct-aeob-composition
Title: "PCT AEOB Composition"
Description: "PCT AEOB Composition that assembles the contents of an AEOB into a single logical package. This version fo the Bundle is a document type that will enable versioning, signing and being referenced by a DocumentReference for searching and subscription notifications."
* insert TrialUseArtifact1
* type = PCTDocumentType#aeob-document
* category = PCTDocumentCategory#estimate
* subject 1..1 MS
* subject only Reference(HRexPatientDemographics)


* date obeys pct-datetime-to-seconds

* author 2..*
* author only Reference(PCTOrganization or PCTPractitioner)
* author ^short = "All involved authoring parties, including payer all Good Faith Estimate (GFE) providers"


* title MS

// DISCUSS, do we want an attester requirement? - A participant who has attested to the accuracy of the composition/document.
// DISCUSS, do we want a custodian requirement? - Identifies the organization or group who is responsible for ongoing maintenance of and access to the composition/document information.

//* relatesTo MS
//* relatesTo ^short = "Relationship to other AEOB documents. Required if this estimate is replacing another." This does not work as it can only reference a composition. This needs to be done in a DocumentReference
* section ^short = "Sections for Advanced Explanation of Benefit (AEOB) Summary, Individual AEOBs, and associates Good Faith Estimates (GFEs)"

* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.description = "Slice different resources included in the bundle"

* section contains
    //patient 1..1 and
    //coverage 1..1 and
    //organization 0..1 and
    //practitioner 0..1 MS and
    aeob-summary 1..1 MS and
    aeob 1..1 MS and
    //gfeBundleAll 1..1 MS and
    gfeBundle 1..* MS 



* section[aeob-summary] ^short = "SHALL have a reference to one PCTAdvancedEOBSummary, contained within the document bundle"
* section[aeob-summary].code = PCTDocumentSection#aeob-summary-section
* section[aeob-summary].entry 1..1 MS
* section[aeob-summary].entry only Reference(PCTAdvancedEOBSummary)
* section[aeob-summary].entry ^type.aggregation = #bundled

* section[aeob] ^short = "SHALL have a reference to one or more PCTAdvancedEOB resource(s), all contained within the document bundle"
* section[aeob].code = PCTDocumentSection#aeob-section
* section[aeob].entry 1..* MS
* section[aeob].entry only Reference(PCTAdvancedEOB)
* section[aeob].entry ^type.aggregation = #bundled


* section[gfeBundle] ^short = "SHALL reference one PCTGFEBundle resource, which may be contained in the document bundle or may reference an external resource, and the associated author (GFE Contributor) contained in the document bundle."
* section[gfeBundle].code = PCTDocumentSection#gfe-section
* section[gfeBundle].author 1..1 MS
* section[gfeBundle].author ^short = "Associated GFE author (GFE Contributor) contained in the document bundle"
* section[gfeBundle].author only Reference(PCTPractitioner or PCTOrganization)
* section[gfeBundle].author ^type.aggregation = #bundled
* section[gfeBundle].entry 1..1 MS
* section[gfeBundle].entry only Reference(PCTGFEBundle)



Instance: PCT-AEOB-Composition-1
InstanceOf: PCTAdvancedEOBComposition
Description: "PCT AEOB Composition Example 1"
Usage: #inline
* status = #final
* type = PCTDocumentType#aeob-document "AEOB Document"
* category = PCTDocumentCategory#estimate
* subject = Reference(patient1001)


* date = "2025-01-10T11:01:00+05:00"

// TODO Discuss who the author is
* author[+] = Reference(org1001)
* author[+] = Reference(Submitter-Org-1)

* title = "Advanced Explanation of Benefit Document for Eve Betterhalf - 2025-01-10"

* section[aeob-summary].code = PCTDocumentSection#aeob-summary-section
* section[aeob-summary].entry = Reference(PCT-AEOB-Summary-1)

* section[aeob].code = PCTDocumentSection#aeob-section
* section[aeob].entry = Reference(PCT-AEOB-1)

* section[gfeBundle].code = PCTDocumentSection#gfe-section
* section[gfeBundle].author = Reference(Submitter-Org-1)
* section[gfeBundle].entry = Reference(PCT-GFE-Bundle-Inst-1)

