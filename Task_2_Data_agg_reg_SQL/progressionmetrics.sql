/*
Topic: Progression Metrics & Best Practices
-------------------------------------------
These are not direct SQL queries but performance and quality indicators 
to ensure your SQL aggregation/reporting is correct and efficient.
*/

-- ✅ Success Checklist:
-- 1. Create 3+ summary reports matching sample outputs.
-- 2. Explain the difference between WHERE and HAVING in your own words.
-- 3. Format numbers/dates for readability in reports.
-- 4. Validate totals from reports against source data counts.

-- ⚠️ Common Failure Patterns:
-- 1. More than 5% variance in validation checks → investigate joins/filters.
-- 2. Nulls in department assignments not handled (use COALESCE).
-- 3. Queries taking >30s on full dataset → consider indexing or filtering.

-- 💡 Expert Tip:
-- "Always include COUNT(*) in aggregations — it reveals if groups 
--  have sufficient data for reliable averages."
