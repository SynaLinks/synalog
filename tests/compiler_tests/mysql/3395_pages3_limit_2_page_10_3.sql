-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name,
      90 AS score,
      2.5e0 AS x,
      true AS ok
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name,
      75 AS score,
      null AS x,
      false AS ok
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS name,
      90 AS score,
      3.0e0 AS x,
      true AS ok
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS name,
      null AS score,
      1.25e0 AS x,
      false AS ok
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS name,
      60 AS score,
      10.0e0 AS x,
      true AS ok
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS name,
      75 AS score,
      0.5e0 AS x,
      null AS ok
   UNION ALL
  
    SELECT
      7 AS id,
      'gus' AS name,
      88 AS score,
      2.5e0 AS x,
      false AS ok
   UNION ALL
  
    SELECT
      8 AS id,
      'hal' AS name,
      null AS score,
      null AS x,
      true AS ok
   UNION ALL
  
    SELECT
      9 AS id,
      'ida' AS name,
      100 AS score,
      7.75e0 AS x,
      false AS ok
   UNION ALL
  
    SELECT
      10 AS id,
      'jon' AS name,
      60 AS score,
      12.0e0 AS x,
      true AS ok
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  V.id AS id,
  V.score AS score
FROM
  t_0_V AS V
) AS UNUSED_TABLE_NAME ORDER BY score IS NULL, score, id IS NULL, id LIMIT 2;