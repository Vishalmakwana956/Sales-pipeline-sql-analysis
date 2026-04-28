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
