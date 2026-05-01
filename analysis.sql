-- ===============================================
-- Sales Pipeline SQL Analysis
-- Dataset: B2B CRM Sales Pipeline (Kaggle)
-- Tool: SQLite via SQLiteOnline.com
-- Last Updated: 4/27/2026
-- ===============================================

-- SECTION 1: FUNNEL ANALYSIS
-- Goal: Understand overall win/loss rates and
-- where deals are dropping off across stages

-- ===============================================

-- Question: What is the overall win rate?
-- Why it matters: Establishes our baseline close 
-- rate before breaking down ant other variable

-- ===============================================

-- Overall Win Rate Query:
SELECT SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END)
    || '/' ||
    COUNT(*) AS win_rate
FROM sales_pipeline;

-- ===============================================

-- Question: How many deals are at each stage?
-- Why it matters: Shows the shape of the pipeline
-- and whether deals are moving along or stalling

-- ===============================================

-- Deals Won By Stage Query:
SELECT COUNT(*) AS deal_volume_by_stage
FROM sales_pipeline
WHERE deal_stage IN ('Won', 'Engaging', 'Prospecting', 'Lost')
GROUP BY deal_stage;

-- ===============================================

-- Question: What is the average amount of days
-- to close a deal (Won vs. Lost)?
-- Why it matters: Helps sales efficiency, forecast
-- revenue timing, and identify obstacles in deal process

-- ===============================================

-- Average Days to Close Deals Query:
SELECT deal_stage,
ROUND(AVG(julianday(close_date) - julianday(engage_date)), 2) AS avg_days_to_close
FROM sales_pipeline
WHERE deal_stage IN ('Won', 'Lost')
    AND close_date IS NOT NULL
    AND engage_date IS NOT NULL
GROUP BY deal_stage;

-- ===============================================

-- SECTION 2: SALES TEAM ANALYSIS
-- Goal: Understand how reps, managers, and 
-- regional offices are performing.

-- ===============================================

-- Question: Which reps are the best performing by
-- win rate?
-- Why it matters: Provides insight into reps who
-- are performing and those who are underperforming

-- ===============================================

-- Top Reps by Win Rate Query:
SELECT 
    sales_agent,
    ROUND(
        100.0 * SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) 
        / COUNT(deal_stage),
        2
    ) || '%' AS win_rate
FROM sales_pipeline
GROUP BY sales_agent
ORDER BY win_rate DESC;

-- ===============================================

-- Question: Which reps are closing the most deals
-- compared to the amount of volume?
-- Why it matters: Shows which reps are the most
-- efficient while taking volume into consideration

-- ===============================================

-- Deal Volume vs Win Rate Query:
SELECT 
    sales_agent,
    COUNT(*) AS deal_volume,
    SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) AS deals_won,
    ROUND(
        100.0 * SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) 
        / COUNT(*),
        2
    ) AS win_rate_pct
FROM sales_pipeline
GROUP BY sales_agent
ORDER BY win_rate_pct DESC;

-- =============================================== 

-- Question: How is each regional office performing?
-- Why it matters: Shows how each regional office 
-- is performing compared to each other

-- ===============================================

-- Regional Office Performance Query:
SELECT 
    regional_office,
    COUNT(*) AS deal_volume,
    SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) AS deals_won,
    SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END)
    || '/' || 
    COUNT(*) AS win_rate_pct
FROM sales_pipeline
JOIN sales_teams
ON sales_pipeline.sales_agent = sales_teams.sales_agent
GROUP BY regional_office
ORDER BY win_rate_pct DESC;

-- ================================================

-- Question: Which manager's team is the strongest?
-- Why it matters: Allows team to see if training 
-- methods and team is performing to standards.

-- ================================================

-- Manager Performance Query:
SELECT 
    manager,
    COUNT(*) AS deal_volume,
    SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) AS deals_won,
    SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END)
    || '/' || 
    COUNT(*) AS win_rate_pct
FROM sales_pipeline
JOIN sales_teams
ON sales_pipeline.sales_agent = sales_teams.sales_agent
GROUP BY manager
ORDER BY win_rate_pct DESC;

-- ================================================

-- SECTION 3: PRODUCT ANALYSIS
-- Goal: Determine which product generates the most
-- revenue and which product is being discounted most.

-- ================================================

-- Question: Which product closes most often?
-- Why it matters: Provides insight into most popular
-- and least successful product

-- ================================================

-- Win Rate by Product Query:
SELECT 
    sp.product,
    COUNT(*) AS pro_volume,
    SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) AS deals_won,
    ROUND(
        1.0 * SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) 
        / COUNT(*), 
        4
    ) AS pro_win_rate
FROM sales_pipeline sp
JOIN products p
ON sp.product = p.product
GROUP BY sp.product
ORDER BY pro_win_rate DESC;

-- ================================================

-- Question: Which product line (GTX or MG) has the
-- higher win rate and generates the most revenue?
-- Why it matters: Determines which series is selling
-- at a higher rate and makes the most money

-- ================================================

-- GTX Series vs. MG Series Query:
SELECT 
    p.product,
    COUNT(*) AS pro_volume,
    SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) AS deals_won,
    ROUND(
        1.0 * SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) 
        / COUNT(*), 
        4
    ) AS pro_win_rate,
    SUM(CASE 
        WHEN sp.deal_stage = 'Won' THEN sp.close_value 
        ELSE 0 
    END) AS total_revenue
FROM sales_pipeline sp
JOIN products p
ON sp.product = p.product
WHERE (sp.product LIKE 'GTX%' OR sp.product LIKE 'MG%') 
AND sp.close_value Is NOT NULL
GROUP BY p.product

-- =================================================

-- Question: Are reps closing deals at, below, or
-- above list price?
-- Why it matters: Provides context regarding reps
-- providing value to customers, consumers
-- willingness to pay, and affects profits & gross
-- margins.

-- =================================================

-- Closing Deal Rate Query:
SELECT 
    CASE 
        WHEN sp.close_value > p.sales_price THEN 'Above list'
        WHEN sp.close_value = p.sales_price THEN 'At list'
        WHEN sp.close_value < p.sales_price THEN 'Below list'
        ELSE 'Unknown'
    END AS pricing_result,
    COUNT(*) AS deals,
    ROUND(1.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 4) AS percent_of_total
FROM sales_pipeline sp
JOIN products p
ON sp.product = p.product
WHERE sp.close_value IS NOT NULL
  AND p.sales_price IS NOT NULL
GROUP BY pricing_result
ORDER BY deals DESC;

-- =================================================

-- Question: Which product is being discounted the
-- most?
-- Why it matters: Can be a signal of lack of
-- pricing power, reps relying on discounts, and 
-- future pricing stratigies. 

-- ================================================= 

-- Product Discount Rate Query:
SELECT p.product,
    CASE 
        WHEN sp.close_value > p.sales_price THEN 'Above list'
        WHEN sp.close_value = p.sales_price THEN 'At list'
        WHEN sp.close_value < p.sales_price THEN 'Below list'
        ELSE 'Unknown'
    END AS pricing_result,
    COUNT(*) AS deals
FROM sales_pipeline sp
JOIN products p
ON sp.product = p.product
WHERE sp.close_value IS NOT NULL
  AND p.sales_price IS NOT NULL
GROUP BY p.product, pricing_result
ORDER BY p.product, deals DESC;

-- =================================================

-- SECTION 4: ACCOUNT & SECTOR ANALYSIS
-- Goal: Understand whether industry, company size,
-- revenue, or geography affects how likely a deal 
-- is to close.

-- =================================================

-- Question: Which industry closes at the highest rate?
-- Why it matters: Tells us where the team should be 
-- focusing prospecting efforts.

-- =================================================

-- Win Rate by Industry Query:
SELECT 
    ac.sector AS industry,
    COUNT(*) AS total_deals,
    SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) AS deals_won,
    ROUND(
        1.0 * SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) 
        / COUNT(*), 
        4
    ) AS win_rate
FROM sales_pipeline sp
JOIN accounts ac
ON sp.account = ac.account
GROUP BY ac.sector
ORDER BY win_rate DESC;

-- =================================================

-- Question: Which sector generates the most revenue?
-- Why it matters: Determines which industry closes at 
-- a higher value, irrespective of win rate.

-- =================================================

-- Deal Value by Sector Query: 
SELECT 
    ac.sector AS industry,
    COUNT(*) AS total_deals,
    SUM (CASE
         WHEN sp.deal_stage = 'Won' THEN sp.close_value 
         ELSE 0
    END) AS total_revenue
FROM sales_pipeline sp
JOIN accounts ac
ON sp.account = ac.account
WHERE sp.close_value IS NOT NULL
GROUP BY ac.sector
ORDER BY total_revenue DESC;

-- =================================================

-- Question: Do US based accounts close differently
-- than international accounts? 
-- Why it matters: Provides insight into how US based
-- accounts are performing compared to international
-- based accounts.

-- =================================================

-- Win Rate by Office Location Query:
SELECT 
    ac.office_location AS country,
    COUNT(*) AS total_deals,
    SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) AS deals_won,
    ROUND(
        1.0 * SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) 
        / COUNT(*), 
        4
    ) AS win_rate
FROM sales_pipeline sp
JOIN accounts ac
ON sp.account = ac.account
GROUP BY ac.office_location
ORDER BY win_rate DESC;

-- =================================================

-- Question: Which specific accounts have generated
-- the most total closed revenue across all their deals?
-- Why it matters: Shows which accounts are performing
-- the best in regards to money generated.

-- =================================================

-- Top Accounts by Revenue Generated Query:
SELECT 
    ac.account AS account,
    COUNT(*) AS total_deals,
    SUM (CASE
         WHEN sp.deal_stage = 'Won' THEN sp.close_value 
         ELSE 0
    END) AS total_revenue
FROM sales_pipeline sp
JOIN accounts ac
ON sp.account = ac.account
WHERE sp.close_value IS NOT NULL
GROUP BY ac.account
ORDER BY total_revenue DESC;

-- =================================================
