-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_8_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_7_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_8_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY R_MultBodyAggAux_recursive_head_f1.x),
t_5_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_23.unnested_pod) + (1)) AS x
    FROM
      t_7_R_r0 AS R_r0, (select unnest(Range(6)) as unnested_pod) as x_23
    WHERE
      (R_r0.x = x_23.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_4_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_5_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY R_MultBodyAggAux_recursive_head_f2.x),
t_2_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_15.unnested_pod) + (1)) AS x
    FROM
      t_4_R_r1 AS R_r1, (select unnest(Range(6)) as unnested_pod) as x_15
    WHERE
      (R_r1.x = x_15.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_2_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY R_MultBodyAggAux_recursive_head_f3.x),
t_0_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS x
    FROM
      t_1_R_r2 AS R_r2, (select unnest(Range(6)) as unnested_pod) as x_7
    WHERE
      (R_r2.x = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_0_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY R_MultBodyAggAux_recursive_head_f4.x ORDER BY x;