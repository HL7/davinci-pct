<a name="conformance-verbs"></a>
### Conformance Verbs
<p>The conformance verbs - <strong>SHALL, SHOULD, MAY</strong> - used in this guide are defined in <a style="font-size: 14px;" href="http://hl7.org/fhir/R4/conformance-rules.html">FHIR Conformance Rules.</a></p>
<a name="must-support"></a>
### Must Support
<p>For profiles defined in other IGs, the meaning of Must Support is established in the defining IG. Note that the Must Support requirements for this IG are modeled after the US Core implementation guide, with the requirements for PCT Server APIs modeled on those for US Core Responders, and the requirements for PCT Consumer Apps modeled on those for US Core Requestors.&nbsp; When querying and reading PCT IG Profiles, *Must Support* on any profile data element <strong>SHALL</strong> be interpreted as follows:&nbsp;</p>

<p>NOTE: Readers are advised to understand <a href="http://hl7.org/fhir/R4/terminologies.html">FHIR Terminology</a> requirements, <a href="http://hl7.org/fhir/R4/http.html">FHIR RESTful API</a> based on the HTTP protocol, along with <a href="http://hl7.org/fhir/R4/datatypes.html">FHIR Data Types</a>, <a href="http://hl7.org/fhir/R4/search.html">FHIR Search</a> and <a href="http://hl7.org/fhir/R4/resource.html">FHIR Resource</a> formats before implementing PCT IG requirements.</p>
<a name="missing-data"></a>
### Missing Data

<p>If the source system does not have data for a *Must Support* data element with minimum cardinality = 0, the data element is omitted from the resource. If the source system does not have data for a required data element (in other words, where the minimum cardinality is &gt; 0), follow guidance defined in the core FHIR specification and summarized in the&nbsp;<a href="http://hl7.org/fhir/us/core/general-guidance.html#missing-data">US Core.</a></p>
### Conformance to US Core Profiles
<p>Any actor acting as a Health Plan API actor in this IG <strong>SHALL</strong>:</p>
<ul>
<li>Be able to populate all profile data elements that have a minimum cardinality &gt;= 1 and/or flagged as *Must Support* as defined by that profiles StructureDefinition.</li>
<li>Conform to the US Core Server Capability Statement expectations for that profile's type.</li>
</ul>
<p>Any actor acting a FHIR Client in this IG <strong>SHALL</strong>:</p>
<ul>
<li>Be able to process and retain all profile data elements that have a minimum cardinality &gt;= 1 and/or flagged as Must Support as defined by that profiles StructureDefinition.</li>
<li>Conform to the US Core Client Capability Statement expectations for that profiles type.</li>
</ul>
<a name="common-clinical-data-set"></a>

### U.S. Core Data for Interoperability and 2015 Edition Common Clinical Data Set

<p>The US Core Profiles were originally designed to meet the 2015 Edition certification criterion for Patient Selection 170.315(g)(7), and Application Access - Data Category Request 170.315(g)(8). They were created for each item in the&nbsp;<a href="https://www.healthit.gov/sites/default/files/ccds_reference_document_v1_1.pdf">2015 Edition Common Clinical Data Set (CCDS).&nbsp;</a>The 3.1.0 version of the US Core Profiles IG includes new requirements from the latest proposed ONC&nbsp;<a href="https://www.healthit.gov/topic/laws-regulation-and-policy/notice-proposed-rulemaking-improve-interoperability-health">U.S. Core Data for Interoperability(USCDI)&nbsp;</a>and includes all the&nbsp;<a href="https://www.healthit.gov/isa/api-resource-collection-health-arch">API Resource Collection in Health (ARCH)</a>resources.</p>
