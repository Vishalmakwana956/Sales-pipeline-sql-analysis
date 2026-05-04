# Sales-pipeline-sql-analysis
SQL Analysis of a B2B CRM dataset exploring win rates, deal-drop-off, and sales team performance across 8,800 opportunities.

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

### [Average Time to Close](03_avg_deal_close.png)
The average amount of time it took to close both won and lost deals, excluding NULL values. The average amount of days to close a 'Lost' deal was 41.48 days. The average amount of days to close a 'Won' deal was 51.78 days.

### What This Means
My recommendation for this company's sales manager based on the Funnel Analysis would be to at least double the amount of opportunities in the 'Prospecting' stage, as 500 is low compared to the amount of opportunities (8,800). I would also recommend to speed up the sales process for opportunities that are unlikely to convert to 'Lost' opportuntities to 30 days, as spending 41.5 days for an opportunity that ultimately did not generate revenue for the company is too long to be in an agent's pipeline.

---

## Sales Team Analysis
This section will show the top reps, the win rate vs. deal volume per rep, the performance by regional office, and the performance by manager. This section will be utilizing the sales_pipeline and sales_teams spreadsheets. 

### Top Reps Win Rate
The top rep has a 65.4% win rate, and the lowest performing rep has a 40.8% win rate. 

[Top Rep Win Rate] <img width="925" height="871" alt="04_top_reps_by_win_rate" src="https://github.com/user-attachments/assets/fa3ed998-aba4-490c-b490-7609c6fb49ad" /> <img width="909" height="869" alt="04(1)_top_reps_by_win_rate" src="https://github.com/user-attachments/assets/24634c5c-53c1-42f4-b4f1-ac30fae969c2" />

### Deal Volume vs. Win Rate per Rep
The amount of deals conducted per rep compared to their win rate.

[Deal Volume vs. Win Rate] <img width="923" height="882" alt="05_deal_volume_vs_win_rate" src="https://github.com/user-attachments/assets/1cafef15-a0f0-4f91-8f72-f5a8ec8fec25" /> <img width="922" height="861" alt="05(1)_deal_volume_vs_win_rate" src="https://github.com/user-attachments/assets/9840e1f9-5048-4809-82c1-77122522d348" /> <img width="910" height="550" alt="05(2)_deal_volume_vs_win_rate" src="https://github.com/user-attachments/assets/11bd3636-ede9-4a6f-9e7d-26ac4276f192" /> 

### Performance by Regional Office
This dataset has 3 Regional offices, West, Central, and East. Central Regional Office performance: 1,629 deals won out of 3,512. West Regional Office performance: 1,438 deals won out of 2,997. East Regional Office performance: 1,171 deals won out of 2,291. 

[Performance by Regional Office] <img width="915" height="508" alt="Screenshot 2026-04-29 091440" src="https://github.com/user-attachments/assets/5f369507-e01d-49db-83e5-4eea1c667a33" />

### Performance by Manager
The overall performance by maanger. Melvin Marxen has 882 deals won and 1,929 deal volume. Summer Sewald has 828 deals won and 1,701 deal volume. Dustin Brinkmann has 747 deals won and 1,583 deal volume. Rocco Neubert has 691 deals won and 1,327 deal volume. Celia Rouche 610 deals won and 1,296 deal volume. Cara Losch has 480 deals won and 964 deal volume.

[Performance by Manager] <img width="918" height="613" alt="07_performance_by_manager" src="https://github.com/user-attachments/assets/35737e30-9139-49eb-82e8-8b559017f101" />

### What This Means
My recommendation for this company, based on the Sales Team Analysis would be to increase training/support for reps when closing deals as 21/29 reps have a win rate of below 50%. Another recommendation I would make is along with increasing prospecting as discussed in the funnel analysis, is development and learning across regions and managers, for them to pick up any insights or tips from each other as they are performing well, but there is not a region or manager that is strongly outperforming the others.  

## Product Analysis
This section will show win rate by product, compare two product lines, discounting behavior, and product discount. This section will be utilizing the sales_pipeline and the products spreadsheets.

### Win Rate by Product
There are 6 products, with the GTX Plus Pro having the highest win rate (.4948), the GTK 500 has the lowest win rate (.375). The GTX Basic has the most deals won (915) and the GTK 500 has the lowest deals won (15). 

[Win Rate by Product] <img width="914" height="669" alt="08_win_rate_by_product" src="https://github.com/user-attachments/assets/a2de1f95-2471-436f-b79b-27bb73dd1e84" />

### GTX Series vs. MG Series
There are 3 GTX products (GTX Basic, GTX Plus Basic, and GTX Plus Pro), and 2 MG Series products (MG Advanced and MG Special). The MG Special has the highest win rate (.6484) and the GTX Plus Pro has generated the most total revenue (2629651). 

[GTX Series vs. MG Series] <img width="922" height="718" alt="09_gtx_vs_mg" src="https://github.com/user-attachments/assets/8f5917b8-8ae4-41b0-b2ae-4a1eed86b299" />

### Discounting Behaviors
Over 68% of all deals are below the list price or 3,825 deals. Around 30% of all deals (1,674) are sold above listing price, and 1% or 65 deals are done at list price.

[Discounting Behaviors] <img width="914" height="664" alt="10_discounting_behaviors" src="https://github.com/user-attachments/assets/ec468a39-5182-4fe1-b800-c5a360fead11" />

### Product Discount 
The GTX Basic product is sold below listing price most often, with 991 deals. The GTX Basic is also sold above listing price most often, with 436 deals. 

[Product Discount] <img width="921" height="866" alt="11_product_discount" src="https://github.com/user-attachments/assets/b032ecbd-cab7-467a-8a18-5ab669ad5a52" /> <img width="913" height="599" alt="11(1)_product_discount" src="https://github.com/user-attachments/assets/1b01223d-de42-4ef8-b0b0-62b207b6d7fc" />

### What This Means
My recommendation for the sales team would be to evaluate their pricing strategy and make adjustments accordingly. With 68% of deals being closed below list price, I would also recommend reiterating to sales agents that discounts should be used as a last resort, not as a first option and provide more training and support on closing deals by proving value instead of using discounts. 

## Account & Sector Analysis
This section will show win rate by industry sector, deal value by sector, deal value by sector, win rate by office location, and top accounts by revenue generated. This secton will be utilizing the sales_pipeline and accounts spreadsheets. 

### Win Rate by Industry Sector
There are 12 sectors, the top 3 highest win rate industries are marketing (.5994), software (.5945), and entertainment (.5765). The 3 industries with the lowest win rates are telecommunications (.5689), medical (.5633), and finance (.5531). 

[Win Rate by Industry] <img width="914" height="820" alt="12_win_rate_by_industry" src="https://github.com/user-attachments/assets/d5ed194c-9bef-4048-ae9f-e4b7b3e0cbbc" />

### Deal Value by Sector
The top 3 revenue generating sectors are retail (1,867,528), technology (1,515,487), and medical (1,359,595). The 3 lowest revenue generating sectors are telecommunications (653,574), services (533,006), and employment (436,174).

[Deal Value by Sector] <img width="917" height="817" alt="13_deal_value_by_sector" src="https://github.com/user-attachments/assets/a2dde806-89cd-43d3-ac91-ce173aac1223" />

### Win Rate by Office Location
There are 15 office locations, spanning across countries in North America, South America, Europe, Africa, and Asia. Panama has the highest win rate (.6881), followed by Germany (.6727). Brazil has the second lowest win rate (.5246), and Romania has the lowest win rate (.4423). 

[Win Rate by Office Location] <img width="917" height="873" alt="14_win_rate_by_office_location" src="https://github.com/user-attachments/assets/ccd9ecab-f5c3-4ca1-8975-f928dc279c5f" /> <img width="914" height="512" alt="14(1)_win_rate_by_office_location" src="https://github.com/user-attachments/assets/b9e7139b-308e-47c5-a04f-78ac935e20ff" />

### Top Accounts by Revenue Generated
The top 3 revenue generating accounts are Kan-code (341,455), Konex (269,245), and Condax (206,410). The 3 lowest generating accounts are Donware (56,637), Zathunicon (55,616), and Golddex (51,632). 

[Top Accounts by Revenue Generated] (2/7 screenshots, rest are in screenshots folder). <img width="916" height="872" alt="15_top_revenue_by_accounts" src="https://github.com/user-attachments/assets/f87d176e-68f0-4a8f-87ec-59ef08d1bc7c" /> <img width="920" height="492" alt="15(1)_top_revenue_by_accounts" src="https://github.com/user-attachments/assets/f39ecc90-63b3-4a9b-b728-8a36cfb47c5f" />

### What This Means
My recommendation based on the account & sector analysis would be to have the sales team prospect more in marketing, software, and entertainment industries and reevaluate the strategy and pursuit of the telecommunications sector, as it is in lowest 3 for win rate by industry and deal value per sector.  

---

## Key Takeaways
- At least double prospecting opportunities (currently 500).
- Increase training/support for sales agents in the closing stage of sales process.
- Evaluate pricing strategy and reinforce to sales agents that discounts should be offered as last resort.
- Increase prospecting in high win rate industries, and reevaluate telecommunication pursuit strategy.
