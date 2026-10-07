-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_5_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_6_B AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
   UNION ALL
  
    SELECT
      7 AS x
   UNION ALL
  
    SELECT
      8 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_4_L_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      A.x AS l
    FROM
      t_5_A AS A
    WHERE
      (A.x <= 4)
   UNION ALL
  
    SELECT
      'b' AS src,
      B.x AS l
    FROM
      t_6_B AS B
    WHERE
      (B.x <= 4)
  
) AS UNUSED_TABLE_NAME  ),
t_3_L AS (SELECT
  L_MultBodyAggAux.src AS src,
  ARRAY_AGG(L_MultBodyAggAux.l) AS l
FROM
  t_4_L_MultBodyAggAux AS L_MultBodyAggAux
GROUP BY L_MultBodyAggAux.src),
t_7_M AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      [] AS l
   UNION ALL
  
    SELECT
      'b' AS src,
      [] AS l
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT * FROM (
  
    SELECT
      t_2_L.src AS src,
      t_2_L.l AS l
    FROM
      t_3_L AS t_2_L
   UNION ALL
  
    SELECT
      M.src AS src,
      M.l AS l
    FROM
      t_7_M AS M
    WHERE
      ((SELECT
        MIN((CASE WHEN x_20.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        t_3_L AS t_8_L, (select unnest([0]) as unnested_pod) as x_20
      WHERE
        (t_8_L.src = M.src)) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.src AS src,
  LEN(t_0_All.l) AS n
FROM
  t_1_All AS t_0_All ORDER BY src;