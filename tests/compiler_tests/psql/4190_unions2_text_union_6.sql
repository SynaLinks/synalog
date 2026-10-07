-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_B AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
   UNION ALL
  
    SELECT
      7 AS x
   UNION ALL
  
    SELECT
      8 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_U AS (SELECT * FROM (
  
    SELECT
      (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(CAST(synalog_v AS numeric)) < 0.0000000000000005 THEN '0' WHEN CAST(synalog_v AS numeric) = FLOOR(CAST(synalog_v AS numeric)) AND ABS(CAST(synalog_v AS numeric)) < 1e18 THEN CAST(CAST(CAST(synalog_v AS numeric) AS BIGINT) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e38 THEN CAST(CAST(synalog_v AS numeric) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e15 THEN CAST(ROUND(CAST(CAST(synalog_v AS numeric) AS DECIMAL(38,0)), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS TEXT) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(synalog_v AS numeric), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS DECIMAL(38,15)) AS TEXT))) END) FROM (SELECT A.x AS synalog_v) AS synalog_n) AS s
    FROM
      t_1_A AS A
    WHERE
      (A.x <= 6)
   UNION ALL
  
    SELECT
      ((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(CAST(synalog_v AS numeric)) < 0.0000000000000005 THEN '0' WHEN CAST(synalog_v AS numeric) = FLOOR(CAST(synalog_v AS numeric)) AND ABS(CAST(synalog_v AS numeric)) < 1e18 THEN CAST(CAST(CAST(synalog_v AS numeric) AS BIGINT) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e38 THEN CAST(CAST(synalog_v AS numeric) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e15 THEN CAST(ROUND(CAST(CAST(synalog_v AS numeric) AS DECIMAL(38,0)), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS TEXT) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(synalog_v AS numeric), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS DECIMAL(38,15)) AS TEXT))) END) FROM (SELECT B.x AS synalog_v) AS synalog_n) || '*') AS s
    FROM
      t_2_B AS B
    WHERE
      (B.x <= 6)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.s AS s
FROM
  t_0_U AS U ORDER BY s;