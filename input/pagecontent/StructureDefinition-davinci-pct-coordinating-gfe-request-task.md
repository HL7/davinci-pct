<h4 class="x_MsoNormal">Reource Usage Notes</h4>
<ul>
<li class="x_MsoNormal">Note on Contained Resource versus reference for input- TBD Need to include benefits of contained being that the data can't change outside the scope of the Task. Also not the issue with COntained is potential size. Could add a note on supporting summary</li>
</ul>

<h4 class="x_MsoNormal">Examples - TBD</h4>
<!--
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
-->