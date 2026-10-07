-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_2_Part_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Uses.part AS part
    FROM
      t_3_Uses AS Uses
   UNION ALL
  
    SELECT
      t_4_Uses.component AS part
    FROM
      t_3_Uses AS t_4_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_1_Part AS (SELECT
  Part_MultBodyAggAux.part AS part
FROM
  t_2_Part_MultBodyAggAux AS Part_MultBodyAggAux
GROUP BY Part_MultBodyAggAux.part)
SELECT
  t_0_Part.part AS part
FROM
  t_1_Part AS t_0_Part
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_3_Uses AS t_5_Uses, UNNEST(ARRAY[0]) as x_10
  WHERE
    (t_5_Uses.part = t_0_Part.part)) AS numeric) IS NULL) ORDER BY part;