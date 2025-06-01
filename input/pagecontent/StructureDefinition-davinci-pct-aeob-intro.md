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
<li class="x_MsoNormal">.total.amount:  Eligible amount = submitted amount - the noncovered amount - discount.  The subscriber pays the member liability = deductible + coinsurance + copay + noncovered (if applicable). The eligible amount - the member liability is the potential payer's payment amount to the provider (paidtoprovider) or the subscriber (paidtopatient)</li>

<li class="x_MsoNormal">.benefitbalance: benefit.balance shows the estimated balance by benefit category as if the expected item(s) or service(s) included in this estimate were applied. The .allowed value would reflect current allowed total limits for the specific category, unit, and term (e.g. Physical Therapy, Individual, annual.) The .used and .remaining would reflect current known balance plus or minus, respectively, the current estimate's expected item(s) or service(s) impact on the patient's benefit balance.</li>

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

<li class="x_MsoNormal">extension:outOfNetworkProviderInfo: outOfNetworkProviderInfo is an extension to provide a payer link enabling the patient to find providers that are in-network for the requested services.</li>

<li class="x_MsoNormal">adjudication: billingnetworkstatus, renderingnetworkstatus, benefitpaymentstatus, and adjustmentreason work together to indicate if the item or service is considered in or out of network for purposes of creating the estimate and thus indicating as such for providing the patient with relevant .processnote and outofnetworkproviderinfo.</li>

</ul>

<h4 class="x_MsoNormal">Examples</h4>
<h5 class="x_MsoNormal">Example 1 – Estimation based on current benefit period</h5>
<ul>
<li class="x_MsoNormal">Situation:
<ul>
<li class="x_MsoNormal">A group health plan produces an advance cost estimate on July 2, 2023, for services scheduled on August 23, 2023. </li>
<li class="x_MsoNormal">The plan uses the state of the member’s current 2023 benefit period/plan year benefits and accumulators when calculating the estimate.</li>
<li class="x_MsoNormal">The plan’s deductible for the 2023 benefit period benefits is $1500.</li>
<li class="x_MsoNormal">At the time, the group health plan produces the estimate on July 2, 2023, the member has paid $1000 in eligible health care expenses against their $1500/2023 plan year deductible.</li>
</ul>
</li>

<li class="x_MsoNormal">Result:
<ul>
<li class="x_MsoNormal">The estimate is produced on July 2, 2023 (.created = “2023-07-02T13:28:17-05:00”). </li>
<li class="x_MsoNormal">The benefit period used as the basis for the estimation is the current 2023 benefit period/plan year (.benefitPeriod.start = “2023-01-01” & .benefitPeriod.end = “2023-12-31”).</li>
<li class="x_MsoNormal">The estimated cost to the member is based on the fact that as of July 2, 2023 13:28:17-05:00, they have only met $1000 of their $1500/2023 plan year deductible.</li> 
</ul>
</li>
</ul>


<h5 class="x_MsoNormal">Example 2 – Estimation based on a future benefit period</h5>
<ul>
<li class="x_MsoNormal">Situation:
<ul>
<li class="x_MsoNormal">The payer can support estimations based on a future benefit period. </li>
<li class="x_MsoNormal">A group health plan is producing an advance cost estimate on December 15, 2024, for services scheduled in 2025.</li>
<li class="x_MsoNormal">The plan uses the 2025 term of benefits (a.k.a. "plan year") when calculating the estimate.</li>
<li class="x_MsoNormal">The plan’s deductible for the 2025 term of benefits is $1500.</li>
<li class="x_MsoNormal">At the time, the group health plan produces the estimate on December 15, 2024, the member has incurred no claims against the 2025 term of benefits, and they have paid $0 in eligible health care expenses against their $1500/2025 plan year deductible.</li>
</ul>
</li>
<li class="x_MsoNormal">Result:
<ul>
<li class="x_MsoNormal">The estimate is produced on December 15, 2024 (.created = "2024-12-15T12:10:05-05:00"). </li>
<li class="x_MsoNormal">The benefit period used as the basis for the estimation is the 2025 plan year (.benefitPeriod.start = "2025-01-01" & .benefitPeriod.end = "2025-12-31").</li>
<li class="x_MsoNormal">The estimated cost to the member is based on the fact that as of December 15, 2024 12:10:05-05:00, they have not met any portion of their $1500/2025 plan year deductible.</li>
</ul>
</li>
</ul>
