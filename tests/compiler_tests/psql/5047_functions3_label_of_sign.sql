-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      3 AS x,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      'hello' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      CAST(null AS numeric) AS x,
      'x' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      CAST(null AS text) AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'seven' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  CASE WHEN (CASE WHEN (t_0_V.x > 0) THEN 1 WHEN (t_0_V.x < 0) THEN -1 ELSE 0 END IS null) THEN 'none' ELSE (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(CAST(synalog_v AS numeric)) < 0.0000000000000005 THEN '0' WHEN CAST(synalog_v AS numeric) = FLOOR(CAST(synalog_v AS numeric)) AND ABS(CAST(synalog_v AS numeric)) < 1e18 THEN CAST(CAST(CAST(synalog_v AS numeric) AS BIGINT) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e38 THEN CAST(CAST(synalog_v AS numeric) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e15 THEN CAST(ROUND(CAST(CAST(synalog_v AS numeric) AS DECIMAL(38,0)), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS TEXT) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(synalog_v AS numeric), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS DECIMAL(38,15)) AS TEXT))) END) FROM (SELECT CASE WHEN (t_0_V.x > 0) THEN 1 WHEN (t_0_V.x < 0) THEN -1 ELSE 0 END AS synalog_v) AS synalog_n) END AS v
FROM
  t_1_V AS t_0_V ORDER BY k;