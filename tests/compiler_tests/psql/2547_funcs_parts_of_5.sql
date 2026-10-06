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
  SUBSTRING(C.code FROM '^[A-Z]+') AS pre,
  CAST(SUBSTRING(C.code FROM '[0-9]+$') AS BIGINT) AS n
FROM
  t_0_C AS C
WHERE
  (C.id = 5);