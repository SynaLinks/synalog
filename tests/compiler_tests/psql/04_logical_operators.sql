-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT * FROM (
  
    SELECT
      'and' AS test_name,
      x_5 AS x
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_5
    WHERE
      ((x_5 > 2) AND (x_5 < 7))
   UNION ALL
  
    SELECT
      'complex' AS test_name,
      x_5 AS x
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_5
    WHERE
      (((x_5 > 2) AND (x_5 < 4)) OR ((x_5 > 6) AND (x_5 < 9)))
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;