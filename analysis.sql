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














