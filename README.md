OBI-01: Sales & Territory Performance Intelligence

An End-to-End Commercial Operations Analytics Project

"OPEN THE LIVE INTERACTIVE DASHBOARD" (https://salesterritoryperformance.netlify.app)

---

1. Project Overview

Sales performance is not determined by revenue figures alone. For a distribution business operating across multiple territories, effective commercial decision-making requires visibility into target attainment, customer purchasing behaviour, product concentration, sales representative performance and financial control exceptions.

This project develops a commercial performance intelligence framework for a simulated Nigerian lubricant distribution business.

Using a 24-month operational dataset, the analysis examines how sales, customer, product, territory, target and returns data can be integrated to identify performance gaps, highlight commercial risks and support more informed management decisions.

The project combines SQL Server data management and analytical querying with a management-oriented interactive dashboard.

Central Business Question

How can a lubricant distribution business use sales, customer, product and territory data to identify performance gaps, improve target attainment and make better commercial decisions?

Project ID: OBI-01
Industry: Lubricant Distribution / Commercial Operations
Analysis Period: November 2024 – October 2026
Geographical Context: Nigeria
Data Classification: Realistic synthetic operational data
Database: OBI_01_Sales_Territory_Intelligence

«Data disclosure: All companies, customers, products, transactions, territories and personnel represented in this project are synthetic. The dataset is designed to reflect realistic distribution operations and does not represent the confidential records or actual financial performance of any company.»

---

2. Business Problems Investigated

The project investigates five connected commercial and operational questions:

1. Territory Performance: Which territories are achieving their assigned sales targets, and where are the largest performance gaps?
2. Sales Force Effectiveness: How do sales outcomes vary across representatives, and what additional context is required before drawing conclusions about individual performance?
3. Product Concentration: Which product categories and SKUs contribute most to recognised sales, and what concentration risks should management monitor?
4. Customer Intelligence: How concentrated is revenue among major customers, and what does customer purchasing activity reveal?
5. Returns and Commercial Controls: Are returns records, approval statuses and credit-note resolutions consistent enough to support reliable financial reporting?

---

3. Dataset Architecture

The analytical database contains nine curated tables and 16,638 records.

Table| Records| Purpose
Dim_Customer| 400| Customer master records
Dim_Territory| 33| Territory reference data
Dim_Sales_Representative| 32| Sales representative records
Dim_Product| 15| Product and SKU reference data
Fact_Sales_Order_Header| 2,500| Sales order header transactions
Fact_Sales_Order_Lines| 7,046| Product-level order details
Fact_Monthly_Sales_Targets| 792| Monthly territory sales targets
Fact_Customer_Sales_Activities| 5,500| Customer engagement and sales activities
Fact_Returns_Transactions| 320| Product returns and resolution records
Total| 16,638| 

The dataset covers:

- 8 Nigerian states.
- 33 sales territories.
- 32 sales representatives.
- 400 customers.
- 15 products.
- 24 months of monthly territory targets.

The database separates descriptive business entities from transactional facts to support structured analysis and controlled aggregation.

---

4. Technology Stack

Technology| Application
Microsoft SQL Server| Relational database environment and analytical data processing
SQL| Data validation, aggregation, joins, business logic and performance analysis
HTML, CSS and JavaScript| Interactive dashboard presentation
Chart.js| Dashboard chart visualisation
GitHub| Technical documentation and project versioning
Netlify| Dashboard deployment and public access

Power BI: A separate Power BI implementation is part of the broader project delivery. The deployed HTML dashboard should not be mistaken for a Power BI report or a live SQL-connected dashboard.

---

5. Data Quality and Validation

Before interpreting commercial performance, the source tables were subjected to structured validation.

The validation process covered 25 checks, including:

- Primary-key duplicate checks.
- Foreign-key orphan checks.
- Transactional arithmetic reconciliation.
- Customer and territory mapping consistency.
- Sales order and territory mapping consistency.
- Target data integrity.
- Analytical cohort validation.

Validation results:

Validation Area| Result
Validation checks completed| 25
Primary-key duplicate exceptions| 0
Foreign-key orphan exceptions| 0
Foreign-key orphan checks| 16
Order-line financial arithmetic checks| 7,046 reconciled

The validation results support the integrity of the curated dataset for the defined analytical scope. They do not establish that the synthetic records represent audited business transactions.

---

6. Revenue Recognition Methodology

To avoid overstating sales performance, the primary sales analysis uses a defined recognition cohort.

A sales order is included only where:

- "Order_Status = 'Delivered'"
- "Delivery_Status = 'Delivered'"

This produces the following analytical cohort:

Metric| Result
Recognised orders| 2,128
Recognised order lines| 6,351
Recognised units| 27,339
Recognised net sales| ₦1,798,298,346
Recorded gross profit| ₦393,777,446
Recorded gross margin| 21.90%
Recorded discounts| ₦22,059,154

The Delivered + Delivered condition is an analytical recognition proxy for this project. It is not a substitute for an organisation's approved accounting policy or audited revenue recognition procedure.

Gross profit and gross margin are presented before return-cost adjustment.

---

7. Territory Performance Analysis

Territory performance was calculated by aggregating recognised sales and monthly targets independently at the Territory-Month level before joining the results.

This approach prevents fact-to-fact join fan-out and avoids overstating sales or targets.

Portfolio-wide results:

Metric| Result
Recognised sales| ₦1,798,298,346
Assigned sales targets| ₦7,111,550,240
Target achievement| 25.29%
Sales variance| -₦5,313,251,894
Territories analysed| 33
Territories achieving assigned targets| 0

Territory Achievement Distribution

Achievement Band| Number of Territories
Below 15%| 5
15% to below 30%| 19
30% and above| 9
Total| 33

Five Lowest-Achieving Territories

Territory| Sales| Target| Achievement
Aba South| ₦15,704,912| ₦239,004,120| 6.57%
Nnewi| ₦22,587,648| ₦204,386,821| 11.05%
Rumuodara| ₦29,119,657| ₦212,163,947| 13.73%
Mile 3| ₦31,786,228| ₦226,146,701| 14.06%
Auchi| ₦29,847,154| ₦205,746,202| 14.51%

The results reveal widespread underachievement against assigned targets. However, the analysis does not independently establish whether the underlying causes are target calibration, market potential, product availability, logistics constraints, competitive pressure or sales execution.

These factors require further investigation using internal operational evidence.

---

8. Product Performance and Revenue Concentration

The analysis identifies a significant concentration of recognised sales within a limited product portfolio.

Product Measure| Result
Diesel Oil category sales| ₦1,210,572,060
Diesel Oil category contribution| Approximately 67.3%
FleetGuard Heavy Duty 200 Litre Drum sales| ₦1,037,417,000
FleetGuard Heavy Duty 200 Litre Drum contribution| Approximately 57.7%

The findings indicate material product concentration.

Management should investigate the commercial implications of this concentration, including demand sustainability, supply continuity, customer dependency and opportunities for portfolio diversification.

---

9. Customer Intelligence

The customer analysis examined purchasing participation and revenue concentration.

Key findings:

- 399 customers recorded purchases.
- 1 customer recorded no purchases.
- The top 10 customers accounted for approximately 16.81% of recognised sales.

The analysis provides a starting point for customer retention, account development and purchasing-pattern reviews.

The absence of a purchase does not, on its own, establish that a customer is inactive or commercially unviable. Further review of customer status and engagement history is required.

---

10. Sales Representative Performance

The analysis compared recognised sales and order activity across representatives.

Illustrative findings:

Representative| Recognised Sales
Emeka Danlami| ₦120,806,085
Uche Musa| ₦17,036,848

The highest-to-lowest raw sales range is approximately 7.1 times.

However, raw sales rankings should not be treated as definitive measures of individual effectiveness. Territory potential, customer portfolio, product availability, account mix, order frequency and assigned targets should be considered before drawing performance conclusions.

The analysis also identified representatives with relatively high order counts but lower average order values, creating an opportunity for more detailed account-mix and basket-size investigation.

---

11. Returns and Commercial Control Exceptions

The returns dataset contains 320 records.

Return Status| Records
Approved| 224
Pending| 62
Rejected| 34
Total| 320

A notable control exception was identified:

96 Pending/Rejected return records carried a resolution value of "Credit Note Issued".

This represents a workflow inconsistency requiring investigation.

The associated "Approved_Refund_Amount" field totals ₦14,428,500 across these 96 records. This amount is a potential reconciliation exposure, not confirmed cash refunds, confirmed credit notes or proven financial loss.

Additional analysis estimated a quantity-based approved-return benchmark of ₦28,763,807 across 209 approved-return lines linked to the recognised sales cohort.

This benchmark is calculated by allocating the original order-line net value proportionally to the approved return quantity, capped at the original line value.

The project does not calculate return-adjusted gross profit because returned-goods cost and inventory recovery policies are not available.

Recommended control action: Reconcile return approval status, credit-note issuance, financial ledger postings, refund evidence and inventory disposition.

---

12. Customer Activity Analysis

The dataset contains 5,500 customer sales activity records.

Activity Measure| Result
Total customer activities| 5,500
Activities recorded as Order Placed| 1,884
Order Placed share| 34.3%

The activity records do not contain a reliable "Linked_Order_ID" for validating the relationship between an activity and a corresponding sales order.

Consequently, the 34.3% figure is an activity-outcome share, not a verified customer-to-order conversion rate.

A unique activity-to-order reference would improve conversion measurement and sales pipeline accountability.

---

13. Management Recommendations

The findings support five management workstreams.

1. Commercial Planning and Target Governance

Review monthly target-setting methodology against historical performance, territory potential, customer coverage and operating constraints.

2. Portfolio and Customer Growth

Assess product concentration, customer contribution, purchasing frequency and cross-selling opportunities.

3. Sales Force Effectiveness

Introduce context-adjusted performance reviews that consider territory potential, customer mix, product access and order characteristics.

4. Financial and Returns Controls

Investigate the 96 returns workflow contradictions and reconcile credit-note records against financial and inventory evidence.

5. Business Intelligence Governance

Establish standard metric definitions, activity-to-order linkage, validation logs, reporting ownership and exception monitoring.

---

14. Dashboard

"EXPLORE THE LIVE INTERACTIVE DASHBOARD" (https://salesterritoryperformance.netlify.app)

The dashboard contains seven analytical sections:

1. Executive Overview
2. Territory Performance
3. Sales Representatives
4. Product Performance
5. Customer Intelligence
6. Returns & Commercial Controls
7. Methodology

Documented dashboard capabilities include:

- Global state, territory and period filters.
- Returns status filtering.
- Searchable analytical tables.
- CSV export.
- Territory-level monthly sales-versus-target drilldown.
- Filter reset functionality.

The dashboard is a deployed HTML-based analytical presentation using embedded data and Chart.js. It is a static analytical snapshot, not a live SQL Server connection.

---

15. Project Limitations

The analysis is subject to the following boundaries:

- The dataset is synthetic and cannot establish actual company performance.
- Delivered + Delivered is a project-defined sales recognition proxy.
- Gross profit is not adjusted for returned-goods cost.
- Return resolution inconsistencies require ledger and inventory verification.
- Customer activity records cannot support verified activity-to-order conversion.
- Physical delivery completion cannot be assessed because delivered quantities are not available.
- Target underachievement does not independently establish the root cause.
- Representative rankings are not adjusted for territory or customer portfolio differences.
- The deployed dashboard is not a live database-connected reporting system.

These limitations are documented to distinguish measured results from hypotheses requiring additional evidence.

---

16. Repository Structure

The repository is organised to separate technical implementation, documentation, validation evidence and presentation assets.

OBI-01-Sales-Territory-Performance-Intelligence/
│
├── README.md
│
├── docs/
│   ├── project_overview.md
│   ├── technical_documentation.md
│   ├── business_solution_report.md
│   └── methodology_and_limitations.md
│
├── sql/
│   ├── data_validation/
│   ├── sales_analysis/
│   ├── territory_performance/
│   ├── product_analysis/
│   ├── customer_analysis/
│   └── returns_analysis/
│
├── data_dictionary/
│
├── validation/
│
├── powerbi/
│
├── dashboard/
│
└── assets/
    ├── screenshots/
    └── infographics/

Repository folders should contain the corresponding verified project files. Files that have not yet been implemented or validated should not be presented as completed deliverables.

---

17. Project Status

OBI-01 is an end-to-end commercial operations analytics case study with completed SQL-based analytical validation, documented business findings and a deployed interactive HTML dashboard.

The separate Power BI implementation and any additional browser-level functional testing should be identified according to their actual completion status.

The project demonstrates how structured operational data can be transformed into commercial performance insights, control exceptions and management recommendations.

---

18. Final Business Perspective

The central value of commercial analytics is not the production of more reports. It is the ability to identify where performance is falling short, understand what the available evidence can establish, isolate unresolved questions and direct management attention towards the next decision.

This project applies that approach to territory performance, product concentration, customer intelligence, sales activity and returns governance.

The next question for management:

Which territory, product category or commercial control issue would you investigate first if this were your organisation's actual distribution performance data?
