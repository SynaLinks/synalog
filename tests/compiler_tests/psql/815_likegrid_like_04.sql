-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY['cat', 'cart', 'scat', 'Cat', 'ct', 'c_t']) as x_3
WHERE
  (x_3 LIKE '%a%' ESCAPE '\') ORDER BY w;
