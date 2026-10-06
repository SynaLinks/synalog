-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_C AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'AB-001' AS code,
      'north' AS zone,
      CAST(12.5 AS double precision) AS x
   UNION ALL
  
    SELECT
      2 AS id,
      'AB-017' AS code,
      'south' AS zone,
      CAST(-3.75 AS double precision) AS x
   UNION ALL
  
    SELECT
      3 AS id,
      'XY-200' AS code,
      'north' AS zone,
      CAST(0.0 AS double precision) AS x
   UNION ALL
  
    SELECT
      4 AS id,
      'XY-031' AS code,
      'east' AS zone,
      CAST(7.0 AS double precision) AS x
   UNION ALL
  
    SELECT
      5 AS id,
      'QZ-999' AS code,
      'south' AS zone,
      CAST(-12.25 AS double precision) AS x
   UNION ALL
  
    SELECT
      6 AS id,
      'AB-120' AS code,
      'east' AS zone,
      CAST(99.9 AS double precision) AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  C.id AS id,
  LPAD((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(CAST(synalog_v AS numeric)) < 0.0000000000000005 THEN '0' WHEN CAST(synalog_v AS numeric) = FLOOR(CAST(synalog_v AS numeric)) AND ABS(CAST(synalog_v AS numeric)) < 1e18 THEN CAST(CAST(CAST(synalog_v AS numeric) AS BIGINT) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e38 THEN CAST(CAST(synalog_v AS numeric) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e15 THEN CAST(ROUND(CAST(CAST(synalog_v AS numeric) AS DECIMAL(38,0)), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS TEXT) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(synalog_v AS numeric), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS DECIMAL(38,15)) AS TEXT))) END) FROM (SELECT C.id AS synalog_v) AS synalog_n), 4, '0') AS s
FROM
  t_0_C AS C ORDER BY id, s;