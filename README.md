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
This section will show the overall win rate, the deal volume by stage, and the time to close a deal that is won vs lost. This information helps us understand how successful the team has been, how deals are progressing, and the amount of time it takes for an agent to close a successful or unsuccessful deal.

### Overall Win Rate
The overall win rate was just under 50%, specifically 4238/8800.

[Overall Win Rate] <img width="905" height="398" alt="01_overall_win_rate" src="https://github.com/user-attachments/assets/47d3f191-96b3-4579-9d52-6c68bfea8f01" />

### Deal Volume by Stage
The amount of deals in each stage of the sales process. There is 1,589 deals in the 'Engaging' stage, 2,473 deals in the 'Lost' stage, 500 in the 'Prospecting' stage, and 4,238 in the 'Won' stage.

[Deal Volume by Stage] <img width="920" height="616" alt="02_deals_by_stage" src="https://github.com/user-attachments/assets/9cb4d266-e092-4ef8-8c94-12d966fc5600" />

### Average Time to Close
The average amount of time it took to close both won and lost deals, excluding NULL values. The average amount of days to close a 'Lost' deal was 41.48 days. The average amount of days to close a 'Won' deal was 51.78 days.

[Average Time to Close] <img width="905" height="521" alt="03_avg_deal_close" src="https://github.com/user-attachments/assets/db81aa86-b948-4a06-971f-ba873bad025e" />

