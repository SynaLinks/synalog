-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Member AS (SELECT * FROM (
  
    SELECT
      'ana' AS name
   UNION ALL
  
    SELECT
      'ben' AS name
   UNION ALL
  
    SELECT
      'cy' AS name
   UNION ALL
  
    SELECT
      'dee' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_3_Loan AS (SELECT * FROM (
  
    SELECT
      'ana' AS member,
      1 AS book,
      '2026-01-03' AS out,
      '2026-01-20' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      4 AS book,
      '2026-02-01' AS out,
      '2026-03-15' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      4 AS book,
      '2026-01-10' AS out,
      '2026-01-12' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      5 AS book,
      '2026-02-11' AS out,
      '2026-02-25' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      6 AS book,
      '2026-03-01' AS out,
      '2026-04-02' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      8 AS book,
      '2026-01-05' AS out,
      '2026-02-28' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      9 AS book,
      '2026-03-01' AS out,
      '2026-03-09' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      10 AS book,
      '2026-03-03' AS out,
      '2026-03-04' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      2 AS book,
      '2026-03-20' AS out,
      '2026-03-30' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      3 AS book,
      '2026-04-01' AS out,
      '2026-04-10' AS back
  
) AS UNUSED_TABLE_NAME  ),
t_2_Active AS (SELECT
  Loan.member AS name
FROM
  t_3_Loan AS Loan
GROUP BY 1)
SELECT
  t_0_Member.name AS name
FROM
  t_1_Member AS t_0_Member
WHERE
  NOT (t_0_Member.name IS NOT NULL AND CAST(t_0_Member.name AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Active.name AS synalog_k0
  FROM
    t_2_Active AS Active
  GROUP BY 1) AS synalog_m));