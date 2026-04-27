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















