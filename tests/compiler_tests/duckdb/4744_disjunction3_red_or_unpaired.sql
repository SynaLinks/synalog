-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_I AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'red' AS c,
      10 AS p,
      null AS t
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
      null AS t
   UNION ALL
  
    SELECT
      5 AS id,
      'blue' AS c,
      60 AS p,
      'x' AS t
   UNION ALL
  
    SELECT
      6 AS id,
      null AS c,
      30 AS p,
      'z' AS t
   UNION ALL
  
    SELECT
      7 AS id,
      'green' AS c,
      45 AS p,
      'y' AS t
  
) AS UNUSED_TABLE_NAME  ),
t_6_P AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      7 AS a,
      6 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_4_Paired_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_5_P.a AS x
    FROM
      t_6_P AS t_5_P
   UNION ALL
  
    SELECT
      t_7_P.b AS x
    FROM
      t_6_P AS t_7_P
  
) AS UNUSED_TABLE_NAME  ),
t_3_Paired AS (SELECT
  Paired_MultBodyAggAux.x AS x
FROM
  t_4_Paired_MultBodyAggAux AS Paired_MultBodyAggAux
GROUP BY Paired_MultBodyAggAux.x),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      I.id AS id
    FROM
      t_1_I AS I
    WHERE
      (I.c = 'red')
   UNION ALL
  
    SELECT
      t_2_I.id AS id
    FROM
      t_1_I AS t_2_I
    WHERE
      ((SELECT
        MIN((CASE WHEN x_10.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        t_3_Paired AS Paired, (select unnest([0]) as unnested_pod) as x_10
      WHERE
        (Paired.x = t_2_I.id)) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.id AS id
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY Q_MultBodyAggAux.id ORDER BY id;