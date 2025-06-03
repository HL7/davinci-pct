<h4 class="x_MsoNormal">Notes on Fields</h4>
<ul>
<li class="x_MsoNormal">The estimated service date, when available at the header level, is placed in Claim.billablePeriod. If the estimated date of service is available at the line level is placed in Claim.item.serviced[x]. </li>

<li class="x_MsoNormal"><b>diagnosis:principal</b> - If Diagnosis code(s) is known, it is important that it be shared in the GFE through the Claim.diagnosis:principal or additional diagnosis data elements particularly when the GFE is being sent to a payer for an insured patient. Payers very often need the diagnosis to be able to provide an estimate. Without the diagnosis, payers may assume the service is diagnostic and thus the patient responsibility may be higher or not covered at all than the diagnosis, such as for preventative services, would otherwise indicate. It is understood that in certain situations, such as scheduled services or GFE requests prior to orders, diagnosis is not needed or may not yet be known. However, when it is known, it is important that this information be shared to ensure the best possible estimate is provided to the patient.</li>
</ul>


<h4 class="x_MsoNormal">Examples of .providerEventMethodology usage examples below:</h4>
<h5 class="x_MsoNormal">Example 1 –  A provider is offering both a surgical and a drug therapy-based option to the patient. The provider can add text such as "Surgical care option" and "Drug therapy option" to the Good Faith Estimate (GFE) so that the patient could easily understand the options without having to understand different CPT codes.</h5>
<ul>


<h5 class="x_MsoNormal">Example 2 – A provider added services to a previously submitted GFE. They would be able to add "Added physical therapist on Sep 18, ignore estimates submitted on Sep 17".</h5>
