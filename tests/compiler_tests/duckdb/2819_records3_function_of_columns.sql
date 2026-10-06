-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_B AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.title AS title,
  ((((((B.title) || (' ('))) || (list_transform([B.year], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), 1, 1) || substr(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), 3, 14) || repeat('0', CAST(substr(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), strpos(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), 'e') + 1) AS INTEGER) - 14) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM format('{:.{}f}', CAST(synalog_v AS DOUBLE), GREATEST(1, LEAST(15, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)))))) END))[1]))) || (')')) AS label
FROM
  t_1_B AS B ORDER BY title, label;