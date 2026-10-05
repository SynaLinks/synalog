-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_32_P_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_33_E.a AS a,
      t_33_E.b AS b
    FROM
      t_1_E AS t_33_E
  
) AS UNUSED_TABLE_NAME  ),
t_31_P_r0 AS (SELECT
  P_MultBodyAggAux_recursive_head_f1.a AS a,
  P_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_32_P_MultBodyAggAux_recursive_head_f1 AS P_MultBodyAggAux_recursive_head_f1
GROUP BY P_MultBodyAggAux_recursive_head_f1.a, P_MultBodyAggAux_recursive_head_f1.b),
t_28_P_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_29_E.a AS a,
      t_29_E.b AS b
    FROM
      t_1_E AS t_29_E
   UNION ALL
  
    SELECT
      P_r0.a AS a,
      t_30_E.b AS b
    FROM
      t_31_P_r0 AS P_r0, t_1_E AS t_30_E
    WHERE
      (t_30_E.a = P_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_27_P_r1 AS (SELECT
  P_MultBodyAggAux_recursive_head_f2.a AS a,
  P_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_28_P_MultBodyAggAux_recursive_head_f2 AS P_MultBodyAggAux_recursive_head_f2
GROUP BY P_MultBodyAggAux_recursive_head_f2.a, P_MultBodyAggAux_recursive_head_f2.b),
t_24_P_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_25_E.a AS a,
      t_25_E.b AS b
    FROM
      t_1_E AS t_25_E
   UNION ALL
  
    SELECT
      P_r1.a AS a,
      t_26_E.b AS b
    FROM
      t_27_P_r1 AS P_r1, t_1_E AS t_26_E
    WHERE
      (t_26_E.a = P_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_23_P_r2 AS (SELECT
  P_MultBodyAggAux_recursive_head_f3.a AS a,
  P_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_24_P_MultBodyAggAux_recursive_head_f3 AS P_MultBodyAggAux_recursive_head_f3
GROUP BY P_MultBodyAggAux_recursive_head_f3.a, P_MultBodyAggAux_recursive_head_f3.b),
t_20_P_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_21_E.a AS a,
      t_21_E.b AS b
    FROM
      t_1_E AS t_21_E
   UNION ALL
  
    SELECT
      P_r2.a AS a,
      t_22_E.b AS b
    FROM
      t_23_P_r2 AS P_r2, t_1_E AS t_22_E
    WHERE
      (t_22_E.a = P_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_19_P_r3 AS (SELECT
  P_MultBodyAggAux_recursive_head_f4.a AS a,
  P_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_20_P_MultBodyAggAux_recursive_head_f4 AS P_MultBodyAggAux_recursive_head_f4
GROUP BY P_MultBodyAggAux_recursive_head_f4.a, P_MultBodyAggAux_recursive_head_f4.b),
t_16_P_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_17_E.a AS a,
      t_17_E.b AS b
    FROM
      t_1_E AS t_17_E
   UNION ALL
  
    SELECT
      P_r3.a AS a,
      t_18_E.b AS b
    FROM
      t_19_P_r3 AS P_r3, t_1_E AS t_18_E
    WHERE
      (t_18_E.a = P_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_15_P_r4 AS (SELECT
  P_MultBodyAggAux_recursive_head_f5.a AS a,
  P_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_16_P_MultBodyAggAux_recursive_head_f5 AS P_MultBodyAggAux_recursive_head_f5
GROUP BY P_MultBodyAggAux_recursive_head_f5.a, P_MultBodyAggAux_recursive_head_f5.b),
t_12_P_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_13_E.a AS a,
      t_13_E.b AS b
    FROM
      t_1_E AS t_13_E
   UNION ALL
  
    SELECT
      P_r4.a AS a,
      t_14_E.b AS b
    FROM
      t_15_P_r4 AS P_r4, t_1_E AS t_14_E
    WHERE
      (t_14_E.a = P_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_11_P_r5 AS (SELECT
  P_MultBodyAggAux_recursive_head_f6.a AS a,
  P_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_12_P_MultBodyAggAux_recursive_head_f6 AS P_MultBodyAggAux_recursive_head_f6
GROUP BY P_MultBodyAggAux_recursive_head_f6.a, P_MultBodyAggAux_recursive_head_f6.b),
t_8_P_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_9_E.a AS a,
      t_9_E.b AS b
    FROM
      t_1_E AS t_9_E
   UNION ALL
  
    SELECT
      P_r5.a AS a,
      t_10_E.b AS b
    FROM
      t_11_P_r5 AS P_r5, t_1_E AS t_10_E
    WHERE
      (t_10_E.a = P_r5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_7_P_r6 AS (SELECT
  P_MultBodyAggAux_recursive_head_f7.a AS a,
  P_MultBodyAggAux_recursive_head_f7.b AS b
FROM
  t_8_P_MultBodyAggAux_recursive_head_f7 AS P_MultBodyAggAux_recursive_head_f7
GROUP BY P_MultBodyAggAux_recursive_head_f7.a, P_MultBodyAggAux_recursive_head_f7.b),
t_4_P_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_5_E.a AS a,
      t_5_E.b AS b
    FROM
      t_1_E AS t_5_E
   UNION ALL
  
    SELECT
      P_r6.a AS a,
      t_6_E.b AS b
    FROM
      t_7_P_r6 AS P_r6, t_1_E AS t_6_E
    WHERE
      (t_6_E.a = P_r6.b)
  
) AS UNUSED_TABLE_NAME  ),
t_3_P_r7 AS (SELECT
  P_MultBodyAggAux_recursive_head_f8.a AS a,
  P_MultBodyAggAux_recursive_head_f8.b AS b
FROM
  t_4_P_MultBodyAggAux_recursive_head_f8 AS P_MultBodyAggAux_recursive_head_f8
GROUP BY P_MultBodyAggAux_recursive_head_f8.a, P_MultBodyAggAux_recursive_head_f8.b),
t_0_P_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_r7.a AS a,
      t_2_E.b AS b
    FROM
      t_3_P_r7 AS P_r7, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_r7.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P_MultBodyAggAux_recursive_head_f9.a AS a,
  P_MultBodyAggAux_recursive_head_f9.b AS b
FROM
  t_0_P_MultBodyAggAux_recursive_head_f9 AS P_MultBodyAggAux_recursive_head_f9
GROUP BY P_MultBodyAggAux_recursive_head_f9.a, P_MultBodyAggAux_recursive_head_f9.b ORDER BY a, b;