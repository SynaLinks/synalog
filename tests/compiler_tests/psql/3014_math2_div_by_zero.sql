-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      7 AS x,
      0 AS z
   UNION ALL
  
    SELECT
      2 AS id,
      0 AS x,
      0 AS z
   UNION ALL
  
    SELECT
      3 AS id,
      CAST(7.5 AS double precision) AS x,
      2 AS z
   UNION ALL
  
    SELECT
      4 AS id,
      CAST(-7.5 AS double precision) AS x,
      2 AS z
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.id AS id,
  CAST((CASE WHEN ((t_0_V.x) < 0) <> ((t_0_V.z) < 0) THEN CEIL(CAST(t_0_V.x AS double precision) / NULLIF(t_0_V.z, 0)) ELSE FLOOR(CAST(t_0_V.x AS double precision) / NULLIF(t_0_V.z, 0)) END) AS BIGINT) AS v
FROM
  t_1_V AS t_0_V ORDER BY id;