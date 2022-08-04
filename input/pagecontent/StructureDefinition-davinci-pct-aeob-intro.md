<h4 class="x_MsoNormal">Notes on Fields</h4>
<ul>
<li class="x_MsoNormal">.created: .created values convey the date and time the estimate was calculated, based on what was known about the state of the member’s benefits and accumulators for a given benefit period/plan year at that point in time (the .created date and time). </li>
<li>.benefitPeriod: .benefitPeriod values convey the term of benefits (a.k.a. ‘plan year’) that the benefits used to calculate the estimate were based on.

<ul>
<li>If included, the estimate was based on the member’s benefits and accumulators for the benefit period/plan year explicitly conveyed in .benefitPeriod, as of the .created date and time. </li>
<li>If not included, it is understood that the estimate was based on the member’s benefits and accumulators for the current benefit period/plan year, as of the .created date and time.
</li>
</ul>

<li class="x_MsoNormal">Working together .created values and .benefitPeriod values explicitly convey the temporal context for the state of benefits and accumulators that were used to calculate the estimate communicated in an advanced EOB.
 The state of a member’s benefits and accumulators for a given benefit period or the benefit period in effect may change between the date that an estimate is generated (.created) and when the services being estimated are actually rendered (e.g., the actual date of service), resulting in a difference between the estimated vs. actual cost to the member.
 </li>

<h4 class="x_MsoNormal">Examples</h4>
<h5 class="x_MsoNormal">Example 1 – Estimation based on current plan year</h5>
<ul>
<li class="x_MsoNormal">Situation:
<ul>
<li class="x_MsoNormal">A group health plan produces an advance cost estimate on July 2, 2023, for services scheduled on August 23, 2023. </li>
<li class="x_MsoNormal">The plan uses the state of the member’s current 2023 benefit period/plan year benefits and accumulators when calculating the estimate.</li>
<li class="x_MsoNormal">TThe plan’s deductible for the 2023 benefit period benefits is $1500.</li>
<li class="x_MsoNormal">At the time the group health plan produces the estimate on July 2, 2023, the member has paid $1000 in eligible health care expenses against their $1500/2023 plan year deductible.</li>
</ul>
</li>

<li class="x_MsoNormal">Result:
<ul>
<li class="x_MsoNormal">The estimate is produced on July 2, 2023 (.created = “2023-07-02T13:28:17-05:00”). </li>
<li class="x_MsoNormal">TThe benefit period used as the basis for the estimation is the current 2023 benefit period/plan year (.benefitPeriod.start = “2023-01-01” & .benefitPeriod.end = “2023-12-31”).</li>
<li class="x_MsoNormal">The estimated cost to the member is based on the fact that as of July 2, 2023 13:28:17-05:00, they have only met $1000 of their $1500/2023 plan year deductible.</li>
</ul>
</li>
</ul>


<h5 class="x_MsoNormal">Example 2 – Estimation based on a future plan year</h5>
<ul>
<li class="x_MsoNormal">Situation:
<ul>
<li class="x_MsoNormal">The payer can support estimations based on a future benefit period. </li>
<li class="x_MsoNormal">A group health plan is producing an advance cost estimate on December 15, 2024, for services scheduled in 2025.</li>
<li class="x_MsoNormal">The plan uses the 2025 term of benefits (a.k.a. ‘plan year’) when calculating the estimate.</li>
<li class="x_MsoNormal">The plan’s deductible for the 2025 term of benefits is $1500.</li>
<li class="x_MsoNormal">At the time the group health plan produces the estimate on December 15, 2024, the member has incurred no claims against the 2025 term of benefits, and they have paid $0 in eligible health care expenses against their $1500/2025 plan year deductible.</li>
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