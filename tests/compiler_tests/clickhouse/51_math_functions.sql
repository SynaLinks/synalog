-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Numbers AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Computed AS (SELECT
  Numbers.x AS x,
  EXP(CAST(Numbers.x AS Nullable(Float64))) AS e,
  log(CAST(Numbers.x AS Nullable(Float64))) AS l,
  SIN(CAST(Numbers.x AS Nullable(Float64))) AS s,
  COS(CAST(Numbers.x AS Nullable(Float64))) AS c,
  POW(Numbers.x, 2) AS p
FROM
  t_1_Numbers AS Numbers ORDER BY x)
SELECT
  Computed.x AS x,
  Computed.e AS e,
  Computed.l AS l,
  Computed.s AS s,
  Computed.c AS c,
  Computed.p AS p
FROM
  t_0_Computed AS Computed ORDER BY x;