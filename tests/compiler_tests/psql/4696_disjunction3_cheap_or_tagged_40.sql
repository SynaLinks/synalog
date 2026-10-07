-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_I AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'red' AS c,
      10 AS p,
      CAST(null AS text) AS t
   UNION ALL
  
    SELECT
      2 AS id,
      'blue' AS c,
      25 AS p,
      'x' AS t
   UNION ALL
  
    SELECT
      3 AS id,
      'red' AS c,
      40 AS p,
      'y' AS t
   UNION ALL
  
    SELECT
      4 AS id,
      'green' AS c,
      5 AS p,
      CAST(null AS text) AS t
   UNION ALL
  
    SELECT
      5 AS id,
      'blue' AS c,
      60 AS p,
      'x' AS t
   UNION ALL
  
    SELECT
      6 AS id,
      CAST(null AS text) AS c,
      30 AS p,
      'z' AS t
   UNION ALL
  
    SELECT
      7 AS id,
      'green' AS c,
      45 AS p,
      'y' AS t
  
) AS UNUSED_TABLE_NAME  ),
t_2_C_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      I.id AS id
    FROM
      t_3_I AS I
    WHERE
      (I.p < 40)
   UNION ALL
  
    SELECT
      t_4_I.id AS id
    FROM
      t_3_I AS t_4_I
    WHERE
      (t_4_I.t IS NOT null)
  
) AS UNUSED_TABLE_NAME  ),
t_1_C AS (SELECT
  C_MultBodyAggAux.id AS id
FROM
  t_2_C_MultBodyAggAux AS C_MultBodyAggAux
GROUP BY C_MultBodyAggAux.id)
SELECT
  SUM(1) AS n
FROM
  t_1_C AS t_0_C;