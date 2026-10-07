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
SELECT * FROM (
  
    SELECT
      x_6 AS k,
      'one' AS n
    FROM
      UNNEST(ARRAY[1, 2]::numeric[]) as x_6
    WHERE
      (1 = x_6)
   UNION ALL
  
    SELECT
      x_3 AS k,
      'none' AS n
    FROM
      UNNEST(ARRAY[1, 2]::numeric[]) as x_3
    WHERE
      (CAST((SELECT
        MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        UNNEST(ARRAY[0]::numeric[]) as x_6
      WHERE
        (x_3 = 1)) AS numeric) IS NULL)
  
) AS UNUSED_TABLE_NAME  ORDER BY k ;