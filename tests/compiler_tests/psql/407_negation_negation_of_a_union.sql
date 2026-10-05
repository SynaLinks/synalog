-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]::numeric[]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_U AS U, UNNEST(ARRAY[0]::numeric[]) as x_6
  WHERE
    (U.x = x_3)) AS numeric) IS NULL);