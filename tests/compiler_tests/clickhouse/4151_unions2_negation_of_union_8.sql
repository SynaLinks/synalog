-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_3_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_4_B AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
   UNION ALL
  
    SELECT
      7 AS x
   UNION ALL
  
    SELECT
      8 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_All_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      A.x AS x
    FROM
      t_3_A AS A
   UNION ALL
  
    SELECT
      B.x AS x
    FROM
      t_4_B AS B
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT
  All_MultBodyAggAux.x AS x
FROM
  t_2_All_MultBodyAggAux AS All_MultBodyAggAux
GROUP BY 1),
t_5_Pick AS (SELECT * FROM (
  
    SELECT
      8 AS x
    FROM
      t_3_A AS t_6_A
    WHERE
      (t_6_A.x = 8)
   UNION ALL
  
    SELECT
      8 AS x
    FROM
      t_4_B AS t_7_B
    WHERE
      (t_7_B.x = 8)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.x AS x
FROM
  t_1_All AS t_0_All
WHERE
  NOT (t_0_All.x IS NOT NULL AND CAST(t_0_All.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Pick.x AS synalog_k0
  FROM
    t_5_Pick AS Pick
  GROUP BY 1) AS synalog_m)) ORDER BY x;