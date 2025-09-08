<h4 class="x_MsoNormal">Notes on Fields</h4>
<ul>
<li class="x_MsoNormal">.created: .created values convey the date and time the estimate was calculated, based on what was known about the state of the member’s benefits and accumulators for a given benefit period/plan year at that point in time (the .created date and time). </li>
<li class="x_MsoNormal">The gfeReference Extension is used to point to the GFE Bundle for which the originating GFE is contained. This along with the .claim.identifier can be used to identify the originating GFE this AEOB addresses. Note that it is common for there to be a one-to-one relationship between an AEOB and a GFE, however, this is not always the case.</li>

<li>.benefitPeriod: .benefitPeriod values convey the term of benefits (a.k.a. "plan year") that the benefits used to calculate the estimate were based on. </li>

<ul>
<li>If included, the estimate was based on the member’s benefits and accumulators for the benefit period/plan year explicitly conveyed in .benefitPeriod, as of the .created date and time. </li>
<li>If not included, it is understood that the estimate was based on the member’s benefits and accumulators for the current benefit period/plan year, as of the .created date and time.
</li>
</ul>

<li class="x_MsoNormal">.total.amount:  Eligible amount = submitted amount - the noncovered amount - discount.  The subscriber pays the member liability = deductible + coinsurance + copay + noncovered (if applicable). The eligible amount - the member liability is the potential payer's payment amount to the provider or the subscriber.</li>

<li class="x_MsoNormal">.total.amount and .benefitbalance work together to reflect the expected member’s costs across all the Advanced EOB resources in this AEOB Packet(s). This means that all accumulations to deductible, out-of-pocket maximum, and other limits are collectively reflective of all GFEs in the GFE Packet(s), giving the Patient a comprehensive estimate for all expected service(s) or item(s) from one or more providers.</li>

<li class="x_MsoNormal">.benefitbalance: benefit.balance shows the estimated balance by benefit category as if the expected item(s) or service(s) included in this estimate were applied. The .allowed value would reflect current allowed total limits for the specific category, unit, and term (e.g. Physical Therapy, Individual, annual.) The .used and .remaining would reflect current known balance plus or minus, respectively, the current estimate's expected item(s) or service(s) impact on the patient's benefit balance.</li>

<li class="x_MsoNormal">total:submitted, total:memberliability, and total:eligible work together to communicate the high level summary to a patient. total:submitted is used to indicate the expected total amount submitted from the provider (charges). total:memberliability is used to indicate the expected amount the patient owes, and as stated above, the total:eligible - total:memberliability is the expected payer's payment amount.</li>


<li class="x_MsoNormal">Working together .created values and .benefitPeriod values explicitly convey the temporal context for the state of benefits and accumulators that were used to calculate the estimate communicated in an advanced EOB.
 The state of a member’s benefits and accumulators for a given benefit period or the benefit period in effect may change between the date that an estimate is generated (.created) and when the services being estimated are actually rendered (e.g., the actual date of service), resulting in a difference between the estimated vs. actual cost to the member.
 </li>

<li class="x_MsoNormal">The .processnote data element is used to communicate disclaimers and specific information for this estimate to the patient. Processnote should include notes to meet legislative, legal, or otherwise required disclaimers. Notes should be clear and as specific to the situation at hand as possible including any additional assumptions and requirements. Examples of the types of information payers can use the processnote for include:
<ul>
<li>Disclaimer that the information provided in the notification is only an estimate based on the items and services reasonably expected, at the time of scheduling (or requesting) and is subject to change.</li>

<li>Disclaimer that that coverage for such item or service is subject to a medical management technique, like prior authorization.</li>

<li>Additional information about Prior Authorization, any assumptions made such as that the estimate is calculated assuming any applicable prior auth is approved and that the estimate may be higher if approval conditions are not met. If available, Payers could include Coverage Requirements Discovery (CRD) response information for improved patient transparency and information sharing.</li>

<li>Unique assumptions about diagnosis code(s) impact on estimate accuracy, e.g. Diagnosis code was not specified. This estimate is based on assumption that this service is diagnostic and thus the patient responsibility may be higher than if the diagnosis was for preventative services.</li>

<li>Additional information indicating that the AEOB contains one or more out of network providers and thus patient responsibility may be higher than if an in-network provider was chosen.</li>
</ul>
