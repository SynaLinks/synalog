-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Node AS (SELECT * FROM (
  
    SELECT
      1 AS n
   UNION ALL
  
    SELECT
      2 AS n
   UNION ALL
  
    SELECT
      3 AS n
   UNION ALL
  
    SELECT
      4 AS n
   UNION ALL
  
    SELECT
      5 AS n
   UNION ALL
  
    SELECT
      6 AS n
   UNION ALL
  
    SELECT
      7 AS n
   UNION ALL
  
    SELECT
      8 AS n
   UNION ALL
  
    SELECT
      9 AS n
   UNION ALL
  
    SELECT
      10 AS n
   UNION ALL
  
    SELECT
      11 AS n
   UNION ALL
  
    SELECT
      12 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      6 AS b
   UNION ALL
  
    SELECT
      6 AS a,
      7 AS b
   UNION ALL
  
    SELECT
      7 AS a,
      8 AS b
   UNION ALL
  
    SELECT
      8 AS a,
      5 AS b
   UNION ALL
  
    SELECT
      9 AS a,
      10 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY U_MultBodyAggAux.a, U_MultBodyAggAux.b)
SELECT
  Node.n AS n
FROM
  t_0_Node AS Node
WHERE
  (COALESCE((SELECT
    SUM((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_U AS U, (select unnest([0]) as unnested_pod) as x_4
  WHERE
    (U.a = Node.n)), 0) >= 3) ORDER BY n;
