-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Loan AS (SELECT * FROM (
  
    SELECT
      'ana' AS member,
      1 AS book,
      '2026-01-03' AS "out",
      '2026-01-20' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      4 AS book,
      '2026-02-01' AS "out",
      '2026-03-15' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      4 AS book,
      '2026-01-10' AS "out",
      '2026-01-12' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      5 AS book,
      '2026-02-11' AS "out",
      '2026-02-25' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      6 AS book,
      '2026-03-01' AS "out",
      '2026-04-02' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      8 AS book,
      '2026-01-05' AS "out",
      '2026-02-28' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      9 AS book,
      '2026-03-01' AS "out",
      '2026-03-09' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      10 AS book,
      '2026-03-03' AS "out",
      '2026-03-04' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      2 AS book,
      '2026-03-20' AS "out",
      '2026-03-30' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      3 AS book,
      '2026-04-01' AS "out",
      '2026-04-10' AS back
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Loan.member AS member,
  Loan.book AS book
FROM
  t_0_Loan AS Loan
WHERE
  (Loan."out" >= '2026-01-01') AND
  (Loan."out" < '2026-01-32')
) AS UNUSED_TABLE_NAME ORDER BY member IS NULL, member, book IS NULL, book;