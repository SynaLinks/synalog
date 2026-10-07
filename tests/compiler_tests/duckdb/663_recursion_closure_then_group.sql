-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_20_E AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'c' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_17_P_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_19_E.a AS s,
      t_19_E.b AS t
    FROM
      t_20_E AS t_19_E
  
) AS UNUSED_TABLE_NAME  ),
t_16_P_r0 AS (SELECT
  P_MultBodyAggAux_recursive_head_f1.s AS s,
  P_MultBodyAggAux_recursive_head_f1.t AS t
FROM
  t_17_P_MultBodyAggAux_recursive_head_f1 AS P_MultBodyAggAux_recursive_head_f1
GROUP BY P_MultBodyAggAux_recursive_head_f1.s, P_MultBodyAggAux_recursive_head_f1.t),
t_14_P_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      P_r0.s AS s,
      t_15_E.b AS t
    FROM
      t_16_P_r0 AS P_r0, t_20_E AS t_15_E
    WHERE
      (t_15_E.a = P_r0.t)
   UNION ALL
  
    SELECT
      t_21_E.a AS s,
      t_21_E.b AS t
    FROM
      t_20_E AS t_21_E
  
) AS UNUSED_TABLE_NAME  ),
t_13_P_r1 AS (SELECT
  P_MultBodyAggAux_recursive_head_f2.s AS s,
  P_MultBodyAggAux_recursive_head_f2.t AS t
FROM
  t_14_P_MultBodyAggAux_recursive_head_f2 AS P_MultBodyAggAux_recursive_head_f2
GROUP BY P_MultBodyAggAux_recursive_head_f2.s, P_MultBodyAggAux_recursive_head_f2.t),
t_11_P_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      P_r1.s AS s,
      t_12_E.b AS t
    FROM
      t_13_P_r1 AS P_r1, t_20_E AS t_12_E
    WHERE
      (t_12_E.a = P_r1.t)
   UNION ALL
  
    SELECT
      t_22_E.a AS s,
      t_22_E.b AS t
    FROM
      t_20_E AS t_22_E
  
) AS UNUSED_TABLE_NAME  ),
t_10_P_r2 AS (SELECT
  P_MultBodyAggAux_recursive_head_f3.s AS s,
  P_MultBodyAggAux_recursive_head_f3.t AS t
FROM
  t_11_P_MultBodyAggAux_recursive_head_f3 AS P_MultBodyAggAux_recursive_head_f3
GROUP BY P_MultBodyAggAux_recursive_head_f3.s, P_MultBodyAggAux_recursive_head_f3.t),
t_8_P_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      P_r2.s AS s,
      t_9_E.b AS t
    FROM
      t_10_P_r2 AS P_r2, t_20_E AS t_9_E
    WHERE
      (t_9_E.a = P_r2.t)
   UNION ALL
  
    SELECT
      t_23_E.a AS s,
      t_23_E.b AS t
    FROM
      t_20_E AS t_23_E
  
) AS UNUSED_TABLE_NAME  ),
t_7_P_r3 AS (SELECT
  P_MultBodyAggAux_recursive_head_f4.s AS s,
  P_MultBodyAggAux_recursive_head_f4.t AS t
FROM
  t_8_P_MultBodyAggAux_recursive_head_f4 AS P_MultBodyAggAux_recursive_head_f4
GROUP BY P_MultBodyAggAux_recursive_head_f4.s, P_MultBodyAggAux_recursive_head_f4.t),
t_5_P_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      P_r3.s AS s,
      t_6_E.b AS t
    FROM
      t_7_P_r3 AS P_r3, t_20_E AS t_6_E
    WHERE
      (t_6_E.a = P_r3.t)
   UNION ALL
  
    SELECT
      t_24_E.a AS s,
      t_24_E.b AS t
    FROM
      t_20_E AS t_24_E
  
) AS UNUSED_TABLE_NAME  ),
t_4_P_r4 AS (SELECT
  P_MultBodyAggAux_recursive_head_f5.s AS s,
  P_MultBodyAggAux_recursive_head_f5.t AS t
FROM
  t_5_P_MultBodyAggAux_recursive_head_f5 AS P_MultBodyAggAux_recursive_head_f5
GROUP BY P_MultBodyAggAux_recursive_head_f5.s, P_MultBodyAggAux_recursive_head_f5.t),
t_3_P_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      P_r4.s AS s,
      E.b AS t
    FROM
      t_4_P_r4 AS P_r4, t_20_E AS E
    WHERE
      (E.a = P_r4.t)
   UNION ALL
  
    SELECT
      t_25_E.a AS s,
      t_25_E.b AS t
    FROM
      t_20_E AS t_25_E
  
) AS UNUSED_TABLE_NAME  ),
t_2_P AS (SELECT
  P_MultBodyAggAux_recursive_head_f6.s AS s,
  P_MultBodyAggAux_recursive_head_f6.t AS t
FROM
  t_3_P_MultBodyAggAux_recursive_head_f6 AS P_MultBodyAggAux_recursive_head_f6
GROUP BY P_MultBodyAggAux_recursive_head_f6.s, P_MultBodyAggAux_recursive_head_f6.t),
t_1_L AS (SELECT
  P.s AS s,
  ARRAY_AGG(DISTINCT P.t ORDER BY P.t) AS l
FROM
  t_2_P AS P
GROUP BY P.s)
SELECT
  t_0_L.s AS s,
  LEN(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY s;