-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_3_S AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_1_E.name AS name
FROM
  t_2_E AS E, t_3_S AS S, t_3_S AS t_0_S, t_2_E AS t_1_E
WHERE
  (t_0_S.id != E.id) AND
  (E.name = 'dee') AND
  (S.id = E.id) AND
  (t_0_S.skill = S.skill) AND
  (t_1_E.id = t_0_S.id)
GROUP BY t_1_E.name;