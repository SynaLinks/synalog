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
WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      0 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_4 AS x
FROM
  UNNEST(ARRAY[1, 2]::numeric[]) as x_4
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_8 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_E AS E, UNNEST(ARRAY[0]::numeric[]) as x_8
  WHERE
    (E.b < x_4) AND
    (E.a = x_4)) AS numeric) IS NULL);