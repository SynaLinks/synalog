-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name,
      10 AS dept,
      CAST(null AS numeric) AS boss
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name,
      10 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS name,
      20 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS name,
      CAST(null AS numeric) AS dept,
      2 AS boss
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS name,
      30 AS dept,
      3 AS boss
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS name,
      20 AS dept,
      CAST(null AS numeric) AS boss
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_E.name AS name
FROM
  t_1_E AS E, t_1_E AS t_0_E
WHERE
  (t_0_E.name != 'bob') AND
  (E.name = 'bob') AND
  (t_0_E.dept = E.dept);