-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_E AS (SELECT * FROM (
  
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
t_1_S AS (SELECT
  E.g AS g,
  SUM(E.v) AS s
FROM
  t_2_E AS E
GROUP BY E.g),
t_3_F AS (SELECT * FROM (
  
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
  t_0_S.g AS g,
  t_0_S.s AS s,
  F.w AS w
FROM
  t_1_S AS t_0_S, t_3_F AS F
WHERE
  (F.g = t_0_S.g) ORDER BY g;