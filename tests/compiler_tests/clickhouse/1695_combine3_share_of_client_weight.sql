-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Ship AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'acme' AS client,
      'paris' AS src,
      'lyon' AS dst,
      12 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      2 AS id,
      'acme' AS client,
      'lyon' AS src,
      'nice' AS dst,
      5 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      3 AS id,
      'bolt' AS client,
      'paris' AS src,
      'nice' AS dst,
      30 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      4 AS id,
      'bolt' AS client,
      'nice' AS src,
      'rome' AS dst,
      8 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      5 AS id,
      'cora' AS client,
      'rome' AS src,
      'milan' AS dst,
      14 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      6 AS id,
      'cora' AS client,
      'milan' AS src,
      'paris' AS dst,
      3 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      7 AS id,
      'acme' AS client,
      'paris' AS src,
      'rome' AS dst,
      22 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      8 AS id,
      'dune' AS client,
      'lyon' AS src,
      'paris' AS dst,
      9 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      9 AS id,
      'dune' AS client,
      'nice' AS src,
      'lyon' AS dst,
      11 AS kg,
      'dhl' AS carrier
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Ship.id AS id,
  arrayElement(arrayMap(synalog_v -> (CASE WHEN synalog_v IS NULL OR 4 IS NULL THEN NULL WHEN CAST(synalog_v AS Float64) = 0 THEN CAST(synalog_v AS Float64) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14 + 4 >= 0 THEN (CASE WHEN CAST(synalog_v AS Float64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS Float64)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS Float64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS Float64)) * POWER(10, 4) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14 + 4)) / POWER(10, 4) + 0 END), [((100) * ((Ship.kg / NULLIF((SELECT
  SUM(t_0_Ship.kg) AS synalog_value
FROM
  t_1_Ship AS t_0_Ship
WHERE
  (t_0_Ship.client = Ship.client)), 0))))]), 1) AS pct
FROM
  t_1_Ship AS Ship ORDER BY id, pct;