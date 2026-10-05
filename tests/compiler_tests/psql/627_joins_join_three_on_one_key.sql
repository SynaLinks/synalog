-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_C AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'c' AS c
   UNION ALL
  
    SELECT
      2 AS k,
      'd' AS c
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_2_C.k AS k,
  'a' AS a,
  'b' AS b,
  t_2_C.c AS c
FROM
  t_3_C AS t_2_C
WHERE
  (1 = t_2_C.k) AND
  (1 = t_2_C.k);