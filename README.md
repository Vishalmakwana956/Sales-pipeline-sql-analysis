# Sales-pipeline-sql-analysis
SQL Analysis of a B2B CRM dataset exploring win rates, deal-drop-off, and sales team performance across 8,800 opportunities.

## Executive Summary
**Business Problem:** Sales team closing 48% of deals with high discount rates (68% below list price) and only 5.7% of total opportunities in prospecting stage.

### Key Findings:
- 48.2% overall win rate (4,238/8,800 deals)
- Gap in Prospecting: Only 500 deals in prospecting stage (5.7% of pipeline)
- Deal won take 10 days longer to close than lost deals on average (51.8 days vs 41.5 days)
- GTX Basic generates highest revenue despite 68% discount rate

<img width="1087" height="214" alt="Screenshot 2026-05-06 113920" src="https://github.com/user-attachments/assets/4caec427-af7b-4147-b11a-41180f8a9977" />

## Tools
- Database: SQLite
- Platform: SQLite - SQLiteOnline.com
- Visualization: Tableau Public
- Data Source: Kaggle B2B Sales Pipeline (https://www.kaggle.com/datasets/innocentmfa/crm-sales-opportunities)

## Dataset Overview
Accounts- Overview of the different accounts. Rows include: Account, Sector, Year Established, Revenue, Employees, Office Location, and Subsidary.

Data Dictionary- Defines the dataset. Rows include: Table, Field, and Description.

Products- The different products, series, and price. Rows include: Product, Series, and Sales Price.

Sales Pipeline- Main dataset of the sales process. Rows include: Opportunity ID, Sales Agent, Product, Account, Deal Stage, Engage Date, Close Date, and Close Value.

Sales Team- Every member of the sales team information. Rows include: Sales Agent, Manager, and Regional Office.

## Data Quality Notes
NULL Values- To maintain data quality, NULL values were removed from calculations. This measure ensured that metrics like average deal duration was reflected accurately with completed records, without being skewed by incomplete data.

## Project Structure
'analysis.sql' - all queries with comments

'datafiles/' - data tables from Kaggle

'screenshots/' - result tables for each query

'tableau/' - Tableau visualizations 

'README.md' - findings and summary

---

## Funnel Analysis
**Questions Answered:**
- Where are deals dropping off in the pipeline?
- How long does it take to close won vs. lost deals?

**Insights:**
- Only 500 deals in "Prospecting" stage suggests insufficient activity at top of sales funnel.
- Won deals average 52 days vs 41 for lost deals (24% longer)

**Recommendation:** Double prospecting activity, implement 30 day criteria for deals likely to be lost.

### [Overall Win Rate](screenshots/01_overall_win_rate.png)
The overall win rate is 48.2%, (4,238 deals won out of 8,800) which is just below industry standards for B2B SaaS sales (50-55%). This indicates opportunity for improvement through better opportunity qualification and sales process optimization. Near 50% win rate suggests the team has been pursuing the right accounts but may need to refine value proposition. 

### [Deal Volume by Stage](screenshots/02_deals_by_stage.png)
 There is 1,589 deals in the 'Engaging' stage, 2,473 deals in the 'Lost' stage, 500 in the 'Prospecting' stage, and 4,238 in the 'Won' stage. This shows an obvious lack of opportunities in the 'Prospecting' stage with roughly 6% of the total volume. This suggests insufficient lead generation which can affect short and long-term revenue growth.  

<img width="1530" height="896" alt="Screenshot 2026-05-07 114846" src="https://github.com/user-attachments/assets/ab4105ab-4f53-4438-a522-d08c517092cc" />

### [Average Time to Close](screenshots/03_avg_deal_close.png)
Won deals take an average of 51.78 days to close compared to 41.48 days for lost deals, a 25% longer sales cycle for successful conversions. This suggests that high-value deals require more time, while losses indicate early disqualification. Implementing a 30-day checkpoint for stalled deals and opportunities not progressing after 1 month may be better to close as 'Lost' to free up space for more promising prospects. 

---

## Sales Team Analysis
**Questions Answered:** 
- Who are the top performing sales reps and is there a relationship between deal volume and win rate among reps?
- Which regional offices are outperforming, and which need support?
- How do different managers' teams compare in performance and efficiency?

**Insights**
- Top performer is Darcel Schlecht (65.4% win rate)
- 21/29 reps are below 50% win rate
- Performance gap of 24.6 between top and bottom rep
- No strong correlation between deal volume and win rate

**Recommendation:** Implement peer shadowing program, and and standardize best practices from top performers.

<img width="1530" height="994" alt="Screenshot 2026-05-08 123539" src="https://github.com/user-attachments/assets/68cf67df-fd80-4d35-8fa0-c8f9bb9a8cc9" />


### [Top Reps Win Rate](screenshots/04_top_reps_by_win_rate.png)
The performance of sales reps spans a 24.6 percentage gap between the top performer at 65.4% win rate to the lowest performer at 40.8%, indicating inconsistent methodologies across the sales team. With 21 out of 29 reps falling below a 50% win rate, this represents an opportunity for improvement through training and reinforcing the sales process. The top performers demonstrate that achieving 50-60% win rates are a realistic goal.  

[Top Rep Win Rate Additional Screenshot](screenshots/04(1)_top_reps_by_win_rate.png)

### [Deal Volume vs. Win Rate per Rep](screenshots/05_deal_volume_vs_win_rate.png)
Analysis reveals no strong correlation between deal volume and win rate, suggesting that activity metrics alone do not guarantee success. Some high-volume reps have lower win rates, while others with moderate volume achieve strong conversion. This analysis supports implementing win rate as the primary performance metric rather than deal volume, with coaching focused on prospect quality.

[Deal Volume vs. Win Rate Additional Screenshot 1](screenshots/05(1)_deal_volume_vs_win_rate.png)

[Deal Volume vs. Win Rate Additional Screenshot 2](screenshots/05(2)_deal_volume_vs_win_rate.png)

### [Performance by Regional Office](screenshots/06_performance_by_regional_office.png)
The Central regional office leads performance with 1,629 deals won out of 3,512. Next is West regional office performance with 1,438 deals won out of 2,997. Finally, the East regional office performance with 1,171 deals won out of 2,291. However the East office has the highest win rate despite lower volume, which can be contributed to multiple factors: better territory fit or superior execution. 

<img width="1535" height="985" alt="Screenshot 2026-05-08 152819" src="https://github.com/user-attachments/assets/7d767872-7e05-4e23-b408-e70c358e26ae" />

### [Performance by Manager](screenshots/07_performance_by_manager.png)
Manager performance shows Melvin Marxen is leading in deals won with 882 deals won and in volume with 1,929 opportunities. Cara Losch's team has the smallest pipeline with 480 deals won and 964 opportunities. All managers are relatively consistent with win rates in the 45-50% range. This analysis suggests resource balancing: adding members to manager Cara Losch's team to capitalize on their strong execution.

<img width="1528" height="978" alt="Screenshot 2026-05-09 150843" src="https://github.com/user-attachments/assets/0ddb5881-69ee-43d3-9378-15f77fec3fa8" />

---
 
## Product Analysis
This section will show win rate by product, compare two product lines, discounting behavior, and product discount. This section will be utilizing the sales_pipeline and the products spreadsheets.

<img width="1534" height="991" alt="Screenshot 2026-05-09 212600" src="https://github.com/user-attachments/assets/9fc05668-8747-4ea8-8ad5-62cd19392c15" />

### [Win Rate by Product](screenshots/08_win_rate_by_product.png)
There are 6 products, with the GTX Plus Pro having the highest win rate (.4948), the GTK 500 has the lowest win rate (.375). The GTX Basic has the most deals won (915) and the GTK 500 has the lowest deals won (15). 

### [GTX Series vs. MG Series](screenshots/09_gtx_vs_mg.png)
There are 3 GTX products (GTX Basic, GTX Plus Basic, and GTX Plus Pro), and 2 MG Series products (MG Advanced and MG Special). The MG Special has the highest win rate (.6484) and the GTX Plus Pro has generated the most total revenue (2629651). 

### [Discounting Behaviors](screenshots/10_discounting_behaviors.png)
Over 68% of all deals are below the list price or 3,825 deals. Around 30% of all deals (1,674) are sold above listing price, and 1% or 65 deals are done at list price.

<img width="1531" height="995" alt="Screenshot 2026-05-11 105256" src="https://github.com/user-attachments/assets/804caf48-96ae-4fc4-bd6a-ada27f0abee3" />

### [Product Discount](screenshots/11_product_discount.png) 
The GTX Basic product is sold below listing price most often, with 991 deals. The GTX Basic is also sold above listing price most often, with 436 deals. 

[Product Discount Additional Screenshot](screenshots/11(1)_product_discount.png)

<img width="1535" height="996" alt="Screenshot 2026-05-11 114220" src="https://github.com/user-attachments/assets/16927820-1b49-4cff-bf5b-16c4a66c7a9d" />

### What This Means
My recommendation for the sales team would be to evaluate their pricing strategy and make adjustments accordingly. With 68% of deals being closed below list price, I would also recommend reiterating to sales agents that discounts should be used as a last resort, not as a first option and provide more training and support on closing deals by proving value instead of using discounts. 

## Account & Sector Analysis
This section will show win rate by industry sector, deal value by sector, deal value by sector, win rate by office location, and top accounts by revenue generated. This secton will be utilizing the sales_pipeline and accounts spreadsheets. 

### [Win Rate by Industry Sector](screenshots/12_win_rate_by_industry.png)
There are 12 sectors, the top 3 highest win rate industries are marketing (.5994), software (.5945), and entertainment (.5765). The 3 industries with the lowest win rates are telecommunications (.5689), medical (.5633), and finance (.5531). 

<img width="1535" height="990" alt="Screenshot 2026-05-11 121404" src="https://github.com/user-attachments/assets/123c2c41-17c4-4183-b3fb-27af13e2b526" />

### [Deal Value by Sector](screenshots/13_deal_value_by_sector.png)
The top 3 revenue generating sectors are retail (1,867,528), technology (1,515,487), and medical (1,359,595). The 3 lowest revenue generating sectors are telecommunications (653,574), services (533,006), and employment (436,174).

<img width="1535" height="993" alt="Screenshot 2026-05-11 185955" src="https://github.com/user-attachments/assets/7e863867-8fa7-4d3e-9898-9aa7ed7d9d41" />

### [Win Rate by Office Location](screenshots/14_win_rate_by_office_location.png)
There are 15 office locations, spanning across countries in North America, South America, Europe, Africa, and Asia. Panama has the highest win rate (.6881), followed by Germany (.6727). Brazil has the second lowest win rate (.5246), and Romania has the lowest win rate (.4423). 

[Win Rate by Office Location Additional Screenshot](screenshots/14(1)_win_rate_by_office_location.png)

<img width="1528" height="951" alt="Screenshot 2026-05-11 210613" src="https://github.com/user-attachments/assets/0809d9eb-c34a-485b-805d-98b255318960" />

### [Top Accounts by Revenue Generated](screenshots/15_top_revenue_by_accounts.png)
The top 3 revenue generating accounts are Kan-code (341,455), Konex (269,245), and Condax (206,410). The 3 lowest generating accounts are Donware (56,637), Zathunicon (55,616), and Golddex (51,632). 

[Top Accounts by Revenue Generated Additional Screenshots](screenshots/) (from 15(1) to 15(6)).

### What This Means
My recommendation based on the account & sector analysis would be to have the sales team prospect more in marketing, software, and entertainment industries and reevaluate the strategy and pursuit of the telecommunications sector, as it is in lowest 3 for win rate by industry and deal value per sector.  

---
