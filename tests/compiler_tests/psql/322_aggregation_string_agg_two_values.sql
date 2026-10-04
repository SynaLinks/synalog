-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS s
   UNION ALL
  
    SELECT
      'b' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_0_J AS (SELECT
  STRING_AGG(CAST(V.s AS TEXT), ',') AS j
FROM
  t_1_V AS V)
SELECT
  COALESCE(ARRAY_LENGTH(STRING_TO_ARRAY(J.j, ','), 1), 0) AS parts,
  LENGTH(J.j) AS length
FROM
  t_0_J AS J;