-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

SELECT
  tupleElement(x_8, 'y') AS y,
  tupleElement(x_8, 'm') AS m,
  tupleElement(x_8, 'd') AS d
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [((((-1) + (719468))) - (((if(146097 = 0, NULL, toInt64(trunc(((((-1) + (719468))) - (CASE WHEN (((-1) + (719468)) >= 0) THEN 0 ELSE 146096 END)) / if(146097 = 0, 1, 146097))))) * (146097))))] AS x_4
  ARRAY JOIN [if(365 = 0, NULL, toInt64(trunc(((((x_4) - (if(1460 = 0, NULL, toInt64(trunc(x_4 / if(1460 = 0, 1, 1460))))))) + (((if(36524 = 0, NULL, toInt64(trunc(x_4 / if(36524 = 0, 1, 36524))))) - (if(146096 = 0, NULL, toInt64(trunc(x_4 / if(146096 = 0, 1, 146096)))))))) / if(365 = 0, 1, 365))))] AS x_5
  ARRAY JOIN [((x_4) - (((((365) * (x_5))) + (((if(4 = 0, NULL, toInt64(trunc(x_5 / if(4 = 0, 1, 4))))) - (if(100 = 0, NULL, toInt64(trunc(x_5 / if(100 = 0, 1, 100))))))))))] AS x_6
  ARRAY JOIN [((if(153 = 0, NULL, toInt64(trunc(((((5) * (x_6))) + (2)) / if(153 = 0, 1, 153))))) + (CASE WHEN (if(153 = 0, NULL, toInt64(trunc(((((5) * (x_6))) + (2)) / if(153 = 0, 1, 153)))) < 10) THEN 3 ELSE -9 END))] AS x_7
  ARRAY JOIN [CAST(tuple(((((x_6) - (if(5 = 0, NULL, toInt64(trunc(((((153) * (if(153 = 0, NULL, toInt64(trunc(((((5) * (x_6))) + (2)) / if(153 = 0, 1, 153))))))) + (2)) / if(5 = 0, 1, 5))))))) + (1)), x_7, ((((x_5) + (((if(146097 = 0, NULL, toInt64(trunc(((((-1) + (719468))) - (CASE WHEN (((-1) + (719468)) >= 0) THEN 0 ELSE 146096 END)) / if(146097 = 0, 1, 146097))))) * (400))))) + (CASE WHEN (x_7 <= 2) THEN 1 ELSE 0 END))) AS Tuple(d Nullable(Float64), m Nullable(Float64), y Nullable(Float64)))] AS x_8;