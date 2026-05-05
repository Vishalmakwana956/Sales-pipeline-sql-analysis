# Sales-pipeline-sql-analysis
SQL Analysis of a B2B CRM dataset exploring win rates, deal-drop-off, and sales team performance across 8,800 opportunities.

## Key Findings

### Pipeline Health
- 48.2% overall win rate (4,238/8,800 deals)
- Gap in Prospecting: Only 500 deals in prospecting stage (5.7% of pipeline)
- Deal won take 10 days longer to close than lost deals on average (51.8 days vs 41.5 days)

## Tools
Kaggle- kaggle.com

SQLite - SQLiteOnline.com

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

'screenshots/' - result tables for each query

'README.md' - findings and summary

---

## Funnel Analysis
This section will show the overall win rate, the deal volume by stage, and the time to close a deal that is won vs lost. This information helps us understand how successful the team has been, how deals are progressing, and the amount of time it takes for an agent to close a successful or unsuccessful deal. This section will be utilizing the sales_pipeline spreadsheet.

### [Overall Win Rate](screenshots/01_overall_win_rate.png)
The overall win rate was just under 50%, specifically 4238/8800.

### [Deal Volume by Stage](screenshots/02_deals_by_stage.png)
The amount of deals in each stage of the sales process. There is 1,589 deals in the 'Engaging' stage, 2,473 deals in the 'Lost' stage, 500 in the 'Prospecting' stage, and 4,238 in the 'Won' stage.

### [Average Time to Close](screenshots/03_avg_deal_close.png)
The average amount of time it took to close both won and lost deals, excluding NULL values. The average amount of days to close a 'Lost' deal was 41.48 days. The average amount of days to close a 'Won' deal was 51.78 days.

### What This Means
My recommendation for this company's sales manager based on the Funnel Analysis would be to at least double the amount of opportunities in the 'Prospecting' stage, as 500 is low compared to the amount of opportunities (8,800). I would also recommend to speed up the sales process for opportunities that are unlikely to convert to 'Lost' opportuntities to 30 days, as spending 41.5 days for an opportunity that ultimately did not generate revenue for the company is too long to be in an agent's pipeline.

---

## Sales Team Analysis
This section will show the top reps, the win rate vs. deal volume per rep, the performance by regional office, and the performance by manager. This section will be utilizing the sales_pipeline and sales_teams spreadsheets. 

### [Top Reps Win Rate](screenshots/04_top_reps_by_win_rate.png)
The top rep has a 65.4% win rate, and the lowest performing rep has a 40.8% win rate. 

[Top Rep Win Rate Additional Screenshot](screenshots/04(1)_top_reps_by_win_rate.png)

### [Deal Volume vs. Win Rate per Rep](screenshots/05_deal_volume_vs_win_rate.png)
The amount of deals conducted per rep compared to their win rate.

[Deal Volume vs. Win Rate Additional Screenshot 1](screenshots/05(1)_deal_volume_vs_win_rate.png)

[Deal Volume vs. Win Rate Additional Screenshot 2](screenshots/05(2)_deal_volume_vs_win_rate.png)

### [Performance by Regional Office](screenshots/06_performance_by_regional_office.png)
This dataset has 3 Regional offices, West, Central, and East. Central Regional Office performance: 1,629 deals won out of 3,512. West Regional Office performance: 1,438 deals won out of 2,997. East Regional Office performance: 1,171 deals won out of 2,291. 

### [Performance by Manager](screenshots/07_performance_by_manager.png)
The overall performance by manger. Melvin Marxen has 882 deals won and 1,929 deal volume. Summer Sewald has 828 deals won and 1,701 deal volume. Dustin Brinkmann has 747 deals won and 1,583 deal volume. Rocco Neubert has 691 deals won and 1,327 deal volume. Celia Rouche 610 deals won and 1,296 deal volume. Cara Losch has 480 deals won and 964 deal volume.

### What This Means
My recommendation for this company, based on the Sales Team Analysis would be to increase training/support for reps when closing deals as 21/29 reps have a win rate of below 50%. Another recommendation I would make is along with increasing prospecting as discussed in the funnel analysis, is development and learning across regions and managers, for them to pick up any insights or tips from each other as they are performing well, but there is not a region or manager that is strongly outperforming the others.  

## Product Analysis
This section will show win rate by product, compare two product lines, discounting behavior, and product discount. This section will be utilizing the sales_pipeline and the products spreadsheets.

### [Win Rate by Product](screenshots/08_win_rate_by_product.png)
There are 6 products, with the GTX Plus Pro having the highest win rate (.4948), the GTK 500 has the lowest win rate (.375). The GTX Basic has the most deals won (915) and the GTK 500 has the lowest deals won (15). 

### [GTX Series vs. MG Series](screenshots/09_gtx_vs_mg.png)
There are 3 GTX products (GTX Basic, GTX Plus Basic, and GTX Plus Pro), and 2 MG Series products (MG Advanced and MG Special). The MG Special has the highest win rate (.6484) and the GTX Plus Pro has generated the most total revenue (2629651). 

### [Discounting Behaviors](screenshots/10_discounting_behaviors.png)
Over 68% of all deals are below the list price or 3,825 deals. Around 30% of all deals (1,674) are sold above listing price, and 1% or 65 deals are done at list price.

### [Product Discount](screenshots/11_product_discount.png) 
The GTX Basic product is sold below listing price most often, with 991 deals. The GTX Basic is also sold above listing price most often, with 436 deals. 

[Product Discount Additional Screenshot](screenshots/11(1)_product_discount.png)

### What This Means
My recommendation for the sales team would be to evaluate their pricing strategy and make adjustments accordingly. With 68% of deals being closed below list price, I would also recommend reiterating to sales agents that discounts should be used as a last resort, not as a first option and provide more training and support on closing deals by proving value instead of using discounts. 

## Account & Sector Analysis
This section will show win rate by industry sector, deal value by sector, deal value by sector, win rate by office location, and top accounts by revenue generated. This secton will be utilizing the sales_pipeline and accounts spreadsheets. 

### [Win Rate by Industry Sector](screenshots/12_win_rate_by_industry.png)
There are 12 sectors, the top 3 highest win rate industries are marketing (.5994), software (.5945), and entertainment (.5765). The 3 industries with the lowest win rates are telecommunications (.5689), medical (.5633), and finance (.5531). 

### [Deal Value by Sector](screenshots/13_deal_value_by_sector.png)
The top 3 revenue generating sectors are retail (1,867,528), technology (1,515,487), and medical (1,359,595). The 3 lowest revenue generating sectors are telecommunications (653,574), services (533,006), and employment (436,174).

### [Win Rate by Office Location](screenshots/14_win_rate_by_office_location.png)
There are 15 office locations, spanning across countries in North America, South America, Europe, Africa, and Asia. Panama has the highest win rate (.6881), followed by Germany (.6727). Brazil has the second lowest win rate (.5246), and Romania has the lowest win rate (.4423). 

[Win Rate by Office Location Additional Screenshot](screenshots/14(1)_win_rate_by_office_location.png)

### [Top Accounts by Revenue Generated](screenshots/15_top_revenue_by_accounts.png)
The top 3 revenue generating accounts are Kan-code (341,455), Konex (269,245), and Condax (206,410). The 3 lowest generating accounts are Donware (56,637), Zathunicon (55,616), and Golddex (51,632). 

[Top Accounts by Revenue Generated Additional Screenshots](screenshots/) (from 15(1) to 15(6)).

### What This Means
My recommendation based on the account & sector analysis would be to have the sales team prospect more in marketing, software, and entertainment industries and reevaluate the strategy and pursuit of the telecommunications sector, as it is in lowest 3 for win rate by industry and deal value per sector.  

---

## Key Takeaways
- At least double prospecting opportunities (currently 500).
- Increase training/support for sales agents in the closing stage of sales process.
- Evaluate pricing strategy and reinforce to sales agents that discounts should be offered as last resort.
- Increase prospecting in high win rate industries, and reevaluate telecommunication pursuit strategy.
