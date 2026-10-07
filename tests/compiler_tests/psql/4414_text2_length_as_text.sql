-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_W AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'Hello' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      ' a ' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      'aaa' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      CAST(null AS text) AS s
   UNION ALL
  
    SELECT
      6 AS k,
      'hello world' AS s
   UNION ALL
  
    SELECT
      7 AS k,
      'naïve' AS s
   UNION ALL
  
    SELECT
      8 AS k,
      'lol' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W.k AS k,
  (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS TEXT) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN ABS(synalog_v) < 1 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15) AS TEXT))) WHEN ABS(synalog_v) < 1e18 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS TEXT) AS numeric))) AS TEXT))) AS DECIMAL(38,20)) AS TEXT))) ELSE CAST(CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS TEXT) AS numeric))) AS TEXT))) AS DECIMAL(38,0)) AS TEXT) END) FROM (SELECT LENGTH(W.s) AS synalog_v) AS synalog_n) AS v
FROM
  t_0_W AS W ORDER BY k;