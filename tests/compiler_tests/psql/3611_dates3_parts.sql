-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2024-01-01' AS d
   UNION ALL
  
    SELECT
      2 AS id,
      '2024-02-28' AS d
   UNION ALL
  
    SELECT
      3 AS id,
      '2024-02-29' AS d
   UNION ALL
  
    SELECT
      4 AS id,
      '2023-03-01' AS d
   UNION ALL
  
    SELECT
      5 AS id,
      '2000-12-31' AS d
   UNION ALL
  
    SELECT
      6 AS id,
      '1999-07-15' AS d
   UNION ALL
  
    SELECT
      7 AS id,
      '2026-10-06' AS d
   UNION ALL
  
    SELECT
      8 AS id,
      '1970-01-01' AS d
   UNION ALL
  
    SELECT
      9 AS id,
      '2100-02-28' AS d
   UNION ALL
  
    SELECT
      10 AS id,
      '2004-08-09' AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id,
  CAST(SUBSTR(V.d, 1, 4) AS BIGINT) AS y,
  CAST(SUBSTR(V.d, 6, 2) AS BIGINT) AS m,
  CAST(SUBSTR(V.d, 9, 2) AS BIGINT) AS dd
FROM
  t_0_V AS V ORDER BY id;