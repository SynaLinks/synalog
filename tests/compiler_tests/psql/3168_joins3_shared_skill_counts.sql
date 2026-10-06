-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_S AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'sql' AS skill
   UNION ALL
  
    SELECT
      1 AS id,
      'go' AS skill
   UNION ALL
  
    SELECT
      2 AS id,
      'sql' AS skill
   UNION ALL
  
    SELECT
      3 AS id,
      'rust' AS skill
   UNION ALL
  
    SELECT
      5 AS id,
      'sql' AS skill
   UNION ALL
  
    SELECT
      5 AS id,
      'go' AS skill
   UNION ALL
  
    SELECT
      6 AS id,
      'excel' AS skill
  
) AS UNUSED_TABLE_NAME  ),
t_3_E AS (SELECT * FROM (
  
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
  E.name AS a,
  t_1_E.name AS b,
  SUM(1) AS n
FROM
  t_2_S AS S, t_2_S AS t_0_S, t_3_E AS E, t_3_E AS t_1_E
WHERE
  (S.id < t_0_S.id) AND
  (t_0_S.skill = S.skill) AND
  (E.id = S.id) AND
  (t_1_E.id = t_0_S.id)
GROUP BY E.name, t_1_E.name ORDER BY a, b, n;