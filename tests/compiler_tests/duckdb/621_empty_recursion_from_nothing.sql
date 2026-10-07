-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_14_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      x_37.unnested_pod AS x
    FROM
      (select unnest([1]) as unnested_pod) as x_37
    WHERE
      (x_37.unnested_pod > 5)
  
) AS UNUSED_TABLE_NAME  ),
t_13_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_14_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY R_MultBodyAggAux_recursive_head_f1.x),
t_11_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      2 AS x
    FROM
      t_13_R_r0 AS R_r0
    WHERE
      (R_r0.x = 1)
   UNION ALL
  
    SELECT
      x_39.unnested_pod AS x
    FROM
      (select unnest([1]) as unnested_pod) as x_39
    WHERE
      (x_39.unnested_pod > 5)
  
) AS UNUSED_TABLE_NAME  ),
t_10_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_11_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY R_MultBodyAggAux_recursive_head_f2.x),
t_8_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      2 AS x
    FROM
      t_10_R_r1 AS R_r1
    WHERE
      (R_r1.x = 1)
   UNION ALL
  
    SELECT
      x_41.unnested_pod AS x
    FROM
      (select unnest([1]) as unnested_pod) as x_41
    WHERE
      (x_41.unnested_pod > 5)
  
) AS UNUSED_TABLE_NAME  ),
t_7_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_8_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY R_MultBodyAggAux_recursive_head_f3.x),
t_5_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      2 AS x
    FROM
      t_7_R_r2 AS R_r2
    WHERE
      (R_r2.x = 1)
   UNION ALL
  
    SELECT
      x_43.unnested_pod AS x
    FROM
      (select unnest([1]) as unnested_pod) as x_43
    WHERE
      (x_43.unnested_pod > 5)
  
) AS UNUSED_TABLE_NAME  ),
t_4_R_r3 AS (SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_5_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY R_MultBodyAggAux_recursive_head_f4.x),
t_2_R_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      2 AS x
    FROM
      t_4_R_r3 AS R_r3
    WHERE
      (R_r3.x = 1)
   UNION ALL
  
    SELECT
      x_45.unnested_pod AS x
    FROM
      (select unnest([1]) as unnested_pod) as x_45
    WHERE
      (x_45.unnested_pod > 5)
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r4 AS (SELECT
  R_MultBodyAggAux_recursive_head_f5.x AS x
FROM
  t_2_R_MultBodyAggAux_recursive_head_f5 AS R_MultBodyAggAux_recursive_head_f5
GROUP BY R_MultBodyAggAux_recursive_head_f5.x),
t_0_R_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      2 AS x
    FROM
      t_1_R_r4 AS R_r4
    WHERE
      (R_r4.x = 1)
   UNION ALL
  
    SELECT
      x_47.unnested_pod AS x
    FROM
      (select unnest([1]) as unnested_pod) as x_47
    WHERE
      (x_47.unnested_pod > 5)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f6.x AS x
FROM
  t_0_R_MultBodyAggAux_recursive_head_f6 AS R_MultBodyAggAux_recursive_head_f6
GROUP BY R_MultBodyAggAux_recursive_head_f6.x ORDER BY x;