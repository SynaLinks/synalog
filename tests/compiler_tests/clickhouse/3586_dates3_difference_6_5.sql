-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_7_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2024-01-01' AS d
   UNION ALL
  
    SELECT
      2 AS id,
      '2024-02-28' AS d
   UNION ALL
  
    SELECT
      3 AS id,
      '2024-02-29' AS d
   UNION ALL
  
    SELECT
      4 AS id,
      '2023-03-01' AS d
   UNION ALL
  
    SELECT
      5 AS id,
      '2000-12-31' AS d
   UNION ALL
  
    SELECT
      6 AS id,
      '1999-07-15' AS d
   UNION ALL
  
    SELECT
      7 AS id,
      '2026-10-06' AS d
   UNION ALL
  
    SELECT
      8 AS id,
      '1970-01-01' AS d
   UNION ALL
  
    SELECT
      9 AS id,
      '2100-02-28' AS d
   UNION ALL
  
    SELECT
      10 AS id,
      '2004-08-09' AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ((((((((((((((365) * (((CAST(substringUTF8(t_0_V.d, 1, 4) AS Nullable(Int64))) - (1970))))) + (((if(4 = 0, NULL, toInt64(trunc(((CAST(substringUTF8(t_0_V.d, 1, 4) AS Nullable(Int64))) - (1969)) / if(4 = 0, 1, 4))))) - (if(100 = 0, NULL, toInt64(trunc(((CAST(substringUTF8(t_0_V.d, 1, 4) AS Nullable(Int64))) - (1901)) / if(100 = 0, 1, 100))))))))) + (if(400 = 0, NULL, toInt64(trunc(((CAST(substringUTF8(t_0_V.d, 1, 4) AS Nullable(Int64))) - (1601)) / if(400 = 0, 1, 400))))))) + (CASE WHEN ((CAST(substringUTF8(t_0_V.d, 6, 2) AS Nullable(Int64)) > 2) AND (((((CAST(substringUTF8(t_0_V.d, 1, 4) AS Nullable(Int64))) % NULLIF(4, 0)) = 0) AND (((CAST(substringUTF8(t_0_V.d, 1, 4) AS Nullable(Int64))) % NULLIF(100, 0)) != 0)) OR (((CAST(substringUTF8(t_0_V.d, 1, 4) AS Nullable(Int64))) % NULLIF(400, 0)) = 0))) THEN 1 ELSE 0 END))) + ((CASE WHEN ((CAST(substringUTF8(t_0_V.d, 6, 2) AS Nullable(Int64))) - (1)) < 0 OR ((CAST(substringUTF8(t_0_V.d, 6, 2) AS Nullable(Int64))) - (1)) >= length([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]) THEN NULL ELSE arrayElement([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334], toInt64(((CAST(substringUTF8(t_0_V.d, 6, 2) AS Nullable(Int64))) - (1))) + 1) END)))) + (((CAST(substringUTF8(t_0_V.d, 9, 2) AS Nullable(Int64))) - (1))))) - (((((((((((((365) * (((CAST(substringUTF8(V.d, 1, 4) AS Nullable(Int64))) - (1970))))) + (((if(4 = 0, NULL, toInt64(trunc(((CAST(substringUTF8(V.d, 1, 4) AS Nullable(Int64))) - (1969)) / if(4 = 0, 1, 4))))) - (if(100 = 0, NULL, toInt64(trunc(((CAST(substringUTF8(V.d, 1, 4) AS Nullable(Int64))) - (1901)) / if(100 = 0, 1, 100))))))))) + (if(400 = 0, NULL, toInt64(trunc(((CAST(substringUTF8(V.d, 1, 4) AS Nullable(Int64))) - (1601)) / if(400 = 0, 1, 400))))))) + (CASE WHEN ((CAST(substringUTF8(V.d, 6, 2) AS Nullable(Int64)) > 2) AND (((((CAST(substringUTF8(V.d, 1, 4) AS Nullable(Int64))) % NULLIF(4, 0)) = 0) AND (((CAST(substringUTF8(V.d, 1, 4) AS Nullable(Int64))) % NULLIF(100, 0)) != 0)) OR (((CAST(substringUTF8(V.d, 1, 4) AS Nullable(Int64))) % NULLIF(400, 0)) = 0))) THEN 1 ELSE 0 END))) + ((CASE WHEN ((CAST(substringUTF8(V.d, 6, 2) AS Nullable(Int64))) - (1)) < 0 OR ((CAST(substringUTF8(V.d, 6, 2) AS Nullable(Int64))) - (1)) >= length([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]) THEN NULL ELSE arrayElement([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334], toInt64(((CAST(substringUTF8(V.d, 6, 2) AS Nullable(Int64))) - (1))) + 1) END)))) + (((CAST(substringUTF8(V.d, 9, 2) AS Nullable(Int64))) - (1)))))) AS n
FROM
  t_7_V AS V, t_7_V AS t_0_V
WHERE
  (V.id = 6) AND
  (t_0_V.id = 5);