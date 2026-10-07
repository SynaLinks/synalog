-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS n,
      CAST(null AS numeric) AS boss,
      10 AS d,
      5000 AS pay
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS n,
      1 AS boss,
      10 AS d,
      4000 AS pay
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS n,
      1 AS boss,
      20 AS d,
      4200 AS pay
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS n,
      2 AS boss,
      10 AS d,
      3000 AS pay
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS n,
      3 AS boss,
      20 AS d,
      3100 AS pay
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS n,
      3 AS boss,
      CAST(null AS numeric) AS d,
      2900 AS pay
   UNION ALL
  
    SELECT
      7 AS id,
      'gus' AS n,
      CAST(null AS numeric) AS boss,
      30 AS d,
      6000 AS pay
   UNION ALL
  
    SELECT
      8 AS id,
      'hal' AS n,
      7 AS boss,
      30 AS d,
      2500 AS pay
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_E.n AS n
FROM
  t_2_E AS E, t_2_E AS t_0_E, t_2_E AS t_1_E
WHERE
  (E.id = 8) AND
  (t_1_E.id = t_0_E.boss) AND
  (t_1_E.n = E.n) ORDER BY n;