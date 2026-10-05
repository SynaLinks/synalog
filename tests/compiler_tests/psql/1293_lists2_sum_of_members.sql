-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ARRAY[3, 1, 2] AS l
   UNION ALL
  
    SELECT
      2 AS id,
      '{}' AS l
   UNION ALL
  
    SELECT
      3 AS id,
      ARRAY[5] AS l
   UNION ALL
  
    SELECT
      4 AS id,
      ARRAY[7, 7, 8, 9] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.id AS id,
  SUM(x_3) AS s
FROM
  t_1_L AS t_0_L, UNNEST(t_0_L.l) as x_3
GROUP BY t_0_L.id ORDER BY id, s;
