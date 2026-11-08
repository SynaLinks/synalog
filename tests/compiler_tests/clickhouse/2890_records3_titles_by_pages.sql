-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_8_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Dune' AS title,
      'herbert' AS author,
      1965 AS year,
      412 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      2 AS id,
      'Emma' AS title,
      'austen' AS author,
      1815 AS year,
      474 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      3 AS id,
      'Ubik' AS title,
      'dick' AS author,
      1969 AS year,
      202 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      4 AS id,
      'Kim' AS title,
      'kipling' AS author,
      1901 AS year,
      368 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      5 AS id,
      'Solaris' AS title,
      'lem' AS author,
      1961 AS year,
      204 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      6 AS id,
      'Persuasion' AS title,
      'austen' AS author,
      1817 AS year,
      249 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      7 AS id,
      'Valis' AS title,
      'dick' AS author,
      1981 AS year,
      271 AS pages,
      true AS sf
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(B.pages, CAST(tuple(B.title) AS Tuple(t Nullable(String))))))) AS l
FROM
  t_8_B AS B),
t_0_J AS (SELECT
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(x_12, tupleElement((CASE WHEN x_12 < 0 OR x_12 >= length(t_4_L.l) THEN NULL ELSE arrayElement(t_4_L.l, toInt64(x_12) + 1) END), 't'))))) AS s
FROM
  t_5_L AS t_4_L
  ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(length(t_4_L.l), 0)))) AS x_12)
SELECT
  arrayStringConcat(J.s, ', ') AS s
FROM
  t_0_J AS J;