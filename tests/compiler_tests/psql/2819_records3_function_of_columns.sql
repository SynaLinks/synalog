-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

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
  (((B.title || ' (') || (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS TEXT) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN ABS(synalog_v) < 1 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15) AS TEXT))) WHEN ABS(synalog_v) < 1e18 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS TEXT) AS numeric))) AS TEXT))) AS DECIMAL(38,20)) AS TEXT))) ELSE CAST(CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS TEXT) AS numeric))) AS TEXT))) AS DECIMAL(38,0)) AS TEXT) END) FROM (SELECT B.year AS synalog_v) AS synalog_n)) || ')') AS label
FROM
  t_1_B AS B ORDER BY title, label;