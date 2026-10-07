-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'a' AS g,
      10 AS v
   UNION ALL
  
    SELECT
      2 AS id,
      'a' AS g,
      20 AS v
   UNION ALL
  
    SELECT
      3 AS id,
      'b' AS g,
      CAST(null AS numeric) AS v
   UNION ALL
  
    SELECT
      4 AS id,
      CAST(null AS text) AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_F AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS w
   UNION ALL
  
    SELECT
      'b' AS g,
      2 AS w
   UNION ALL
  
    SELECT
      CAST(null AS text) AS g,
      3 AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.id AS id,
  E.v AS v,
  F.w AS w
FROM
  t_0_E AS E, t_1_F AS F
WHERE
  (E.g = 'b') AND
  (F.g = 'b');