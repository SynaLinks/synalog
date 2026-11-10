-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Emp AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      'eng' AS dept,
      7000 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'bob' AS name,
      'eng' AS dept,
      5200 AS salary,
      'lyon' AS city
   UNION ALL
  
    SELECT
      'cid' AS name,
      'ops' AS dept,
      4100 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'dan' AS name,
      'ops' AS dept,
      3900 AS salary,
      'nice' AS city
   UNION ALL
  
    SELECT
      'eve' AS name,
      'sales' AS dept,
      6100 AS salary,
      'lyon' AS city
   UNION ALL
  
    SELECT
      'fay' AS name,
      'sales' AS dept,
      2800 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'gus' AS name,
      'hr' AS dept,
      4500 AS salary,
      'nice' AS city
   UNION ALL
  
    SELECT
      'hal' AS name,
      'eng' AS dept,
      9100 AS salary,
      'nice' AS city
  
) AS UNUSED_TABLE_NAME  ),
t_0_T AS (SELECT * FROM (
  
    SELECT
      Emp.name AS name,
      CAST(tuple(Emp.city) AS Tuple(tag Nullable(String))) AS r
    FROM
      t_1_Emp AS Emp
    WHERE
      (Emp.dept = 'sales')
   UNION ALL
  
    SELECT
      t_2_Emp.name AS name,
      CAST(tuple(t_2_Emp.dept) AS Tuple(tag Nullable(String))) AS r
    FROM
      t_1_Emp AS t_2_Emp
    WHERE
      (t_2_Emp.salary > 9000)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.name AS name,
  tupleElement(T.r, 'tag') AS tag
FROM
  t_0_T AS T ORDER BY name, tag;