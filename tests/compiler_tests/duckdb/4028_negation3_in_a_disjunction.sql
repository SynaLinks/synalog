-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_U AS (SELECT * FROM (
  
    SELECT
      'ann' AS u,
      31 AS age
   UNION ALL
  
    SELECT
      'bob' AS u,
      25 AS age
   UNION ALL
  
    SELECT
      'cid' AS u,
      40 AS age
   UNION ALL
  
    SELECT
      'dee' AS u,
      19 AS age
   UNION ALL
  
    SELECT
      'eve' AS u,
      52 AS age
   UNION ALL
  
    SELECT
      'fay' AS u,
      28 AS age
   UNION ALL
  
    SELECT
      'gus' AS u,
      35 AS age
  
) AS UNUSED_TABLE_NAME  ),
t_3_F AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cid' AS b
   UNION ALL
  
    SELECT
      'cid' AS a,
      'dee' AS b
   UNION ALL
  
    SELECT
      'dee' AS a,
      'cid' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'fay' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cid' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_1_U.u AS u
    FROM
      t_2_U AS t_1_U
    WHERE
      ((SELECT
        MIN((CASE WHEN x_7.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        t_3_F AS F, (select unnest([0]) as unnested_pod) as x_7
      WHERE
        (F.b = t_1_U.u)) IS NULL)
   UNION ALL
  
    SELECT
      t_4_U.u AS u
    FROM
      t_2_U AS t_4_U
    WHERE
      (t_4_U.age > 40)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.u AS u
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY Q_MultBodyAggAux.u ORDER BY u;