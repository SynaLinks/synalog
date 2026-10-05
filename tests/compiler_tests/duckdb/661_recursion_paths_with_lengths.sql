-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_17_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_14_P_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_16_E.b AS n,
      1 AS l
    FROM
      t_17_E AS t_16_E
    WHERE
      (t_16_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_13_P_r0 AS (SELECT
  P_MultBodyAggAux_recursive_head_f1.n AS n,
  P_MultBodyAggAux_recursive_head_f1.l AS l
FROM
  t_14_P_MultBodyAggAux_recursive_head_f1 AS P_MultBodyAggAux_recursive_head_f1
GROUP BY P_MultBodyAggAux_recursive_head_f1.n, P_MultBodyAggAux_recursive_head_f1.l),
t_11_P_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_12_E.b AS n,
      ((P_r0.l) + (1)) AS l
    FROM
      t_13_P_r0 AS P_r0, t_17_E AS t_12_E
    WHERE
      (P_r0.l < 3) AND
      (t_12_E.a = P_r0.n)
   UNION ALL
  
    SELECT
      t_18_E.b AS n,
      1 AS l
    FROM
      t_17_E AS t_18_E
    WHERE
      (t_18_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_10_P_r1 AS (SELECT
  P_MultBodyAggAux_recursive_head_f2.n AS n,
  P_MultBodyAggAux_recursive_head_f2.l AS l
FROM
  t_11_P_MultBodyAggAux_recursive_head_f2 AS P_MultBodyAggAux_recursive_head_f2
GROUP BY P_MultBodyAggAux_recursive_head_f2.n, P_MultBodyAggAux_recursive_head_f2.l),
t_8_P_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_9_E.b AS n,
      ((P_r1.l) + (1)) AS l
    FROM
      t_10_P_r1 AS P_r1, t_17_E AS t_9_E
    WHERE
      (P_r1.l < 3) AND
      (t_9_E.a = P_r1.n)
   UNION ALL
  
    SELECT
      t_19_E.b AS n,
      1 AS l
    FROM
      t_17_E AS t_19_E
    WHERE
      (t_19_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_7_P_r2 AS (SELECT
  P_MultBodyAggAux_recursive_head_f3.n AS n,
  P_MultBodyAggAux_recursive_head_f3.l AS l
FROM
  t_8_P_MultBodyAggAux_recursive_head_f3 AS P_MultBodyAggAux_recursive_head_f3
GROUP BY P_MultBodyAggAux_recursive_head_f3.n, P_MultBodyAggAux_recursive_head_f3.l),
t_5_P_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_6_E.b AS n,
      ((P_r2.l) + (1)) AS l
    FROM
      t_7_P_r2 AS P_r2, t_17_E AS t_6_E
    WHERE
      (P_r2.l < 3) AND
      (t_6_E.a = P_r2.n)
   UNION ALL
  
    SELECT
      t_20_E.b AS n,
      1 AS l
    FROM
      t_17_E AS t_20_E
    WHERE
      (t_20_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_4_P_r3 AS (SELECT
  P_MultBodyAggAux_recursive_head_f4.n AS n,
  P_MultBodyAggAux_recursive_head_f4.l AS l
FROM
  t_5_P_MultBodyAggAux_recursive_head_f4 AS P_MultBodyAggAux_recursive_head_f4
GROUP BY P_MultBodyAggAux_recursive_head_f4.n, P_MultBodyAggAux_recursive_head_f4.l),
t_2_P_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_3_E.b AS n,
      ((P_r3.l) + (1)) AS l
    FROM
      t_4_P_r3 AS P_r3, t_17_E AS t_3_E
    WHERE
      (P_r3.l < 3) AND
      (t_3_E.a = P_r3.n)
   UNION ALL
  
    SELECT
      t_21_E.b AS n,
      1 AS l
    FROM
      t_17_E AS t_21_E
    WHERE
      (t_21_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_r4 AS (SELECT
  P_MultBodyAggAux_recursive_head_f5.n AS n,
  P_MultBodyAggAux_recursive_head_f5.l AS l
FROM
  t_2_P_MultBodyAggAux_recursive_head_f5 AS P_MultBodyAggAux_recursive_head_f5
GROUP BY P_MultBodyAggAux_recursive_head_f5.n, P_MultBodyAggAux_recursive_head_f5.l),
t_0_P_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_r4.l) + (1)) AS l
    FROM
      t_1_P_r4 AS P_r4, t_17_E AS E
    WHERE
      (P_r4.l < 3) AND
      (E.a = P_r4.n)
   UNION ALL
  
    SELECT
      t_22_E.b AS n,
      1 AS l
    FROM
      t_17_E AS t_22_E
    WHERE
      (t_22_E.a = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P_MultBodyAggAux_recursive_head_f6.n AS n,
  P_MultBodyAggAux_recursive_head_f6.l AS l
FROM
  t_0_P_MultBodyAggAux_recursive_head_f6 AS P_MultBodyAggAux_recursive_head_f6
GROUP BY P_MultBodyAggAux_recursive_head_f6.n, P_MultBodyAggAux_recursive_head_f6.l ORDER BY n, l;