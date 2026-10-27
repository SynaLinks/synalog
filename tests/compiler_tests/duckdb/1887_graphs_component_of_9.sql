-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_2_Node AS (SELECT * FROM (
  
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
t_7_E AS (SELECT * FROM (
  
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
t_6_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_7_E AS E
   UNION ALL
  
    SELECT
      t_8_E.b AS a,
      t_8_E.a AS b
    FROM
      t_7_E AS t_8_E
  
) AS UNUSED_TABLE_NAME  ),
t_5_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_6_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY U_MultBodyAggAux.a, U_MultBodyAggAux.b),
t_4_Conn_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        U.a AS a,
        U.b AS b,
        0 AS synalog_step
      FROM
        t_5_U AS U
     UNION ALL
    
      SELECT
        t_11_U.a AS a,
        t_9_U.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_5_U AS t_11_U, t_5_U AS t_9_U
      WHERE
        (0 < 12) AND
        (1 = 0) AND
        (t_9_U.a IS NOT DISTINCT FROM t_11_U.b)
     UNION ALL
    
      SELECT
        t_20_U.a AS a,
        t_16_U.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_5_U AS t_20_U, t_5_U AS t_18_U, t_5_U AS t_16_U
      WHERE
        (((0) + (1)) < 12) AND
        (0 < 12) AND
        (1 = 0) AND
        (t_16_U.a IS NOT DISTINCT FROM t_18_U.b) AND
        (t_18_U.a IS NOT DISTINCT FROM t_20_U.b)
     UNION ALL
    
      SELECT
        t_28_U.a AS a,
        t_22_U.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_5_U AS t_28_U, t_5_U AS t_26_U, t_5_U AS t_24_U, t_5_U AS t_22_U
      WHERE
        (((((0) + (1))) + (1)) < 12) AND
        (((0) + (1)) < 12) AND
        (0 < 12) AND
        (1 = 0) AND
        (t_22_U.a IS NOT DISTINCT FROM t_24_U.b) AND
        (t_24_U.a IS NOT DISTINCT FROM t_26_U.b) AND
        (t_26_U.a IS NOT DISTINCT FROM t_28_U.b)
     UNION ALL
    
      SELECT
        t_38_U.a AS a,
        t_30_U.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_5_U AS t_38_U, t_5_U AS t_36_U, t_5_U AS t_34_U, t_5_U AS t_32_U, t_5_U AS t_30_U
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 12) AND
        (((((0) + (1))) + (1)) < 12) AND
        (((0) + (1)) < 12) AND
        (0 < 12) AND
        (1 = 0) AND
        (t_30_U.a IS NOT DISTINCT FROM t_32_U.b) AND
        (t_32_U.a IS NOT DISTINCT FROM t_34_U.b) AND
        (t_34_U.a IS NOT DISTINCT FROM t_36_U.b) AND
        (t_36_U.a IS NOT DISTINCT FROM t_38_U.b)
     UNION ALL
    
      SELECT
        t_50_U.a AS a,
        t_40_U.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_5_U AS t_50_U, t_5_U AS t_48_U, t_5_U AS t_46_U, t_5_U AS t_44_U, t_5_U AS t_42_U, t_5_U AS t_40_U
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 12) AND
        (((((((0) + (1))) + (1))) + (1)) < 12) AND
        (((((0) + (1))) + (1)) < 12) AND
        (((0) + (1)) < 12) AND
        (0 < 12) AND
        (1 = 0) AND
        (t_40_U.a IS NOT DISTINCT FROM t_42_U.b) AND
        (t_42_U.a IS NOT DISTINCT FROM t_44_U.b) AND
        (t_44_U.a IS NOT DISTINCT FROM t_46_U.b) AND
        (t_46_U.a IS NOT DISTINCT FROM t_48_U.b) AND
        (t_48_U.a IS NOT DISTINCT FROM t_50_U.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_51_Conn_RecursiveCte.a AS a,
  t_52_U.b AS b,
  ((t_51_Conn_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_4_Conn_RecursiveCte AS t_51_Conn_RecursiveCte, t_5_U AS t_52_U
WHERE
  (t_51_Conn_RecursiveCte.synalog_step < 12) AND
  (t_52_U.a IS NOT DISTINCT FROM t_51_Conn_RecursiveCte.b)),
t_3_Conn AS (SELECT
  Conn_RecursiveCte.a AS a,
  Conn_RecursiveCte.b AS b
FROM
  t_4_Conn_RecursiveCte AS Conn_RecursiveCte
GROUP BY Conn_RecursiveCte.a, Conn_RecursiveCte.b),
t_1_Comp_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Node.n AS n,
      Conn.b AS c
    FROM
      t_2_Node AS Node, t_3_Conn AS Conn
    WHERE
      (Conn.a IS NOT DISTINCT FROM Node.n)
   UNION ALL
  
    SELECT
      t_53_Node.n AS n,
      t_53_Node.n AS c
    FROM
      t_2_Node AS t_53_Node
  
) AS UNUSED_TABLE_NAME  ),
t_0_Comp AS (SELECT
  Comp_MultBodyAggAux.n AS n,
  MIN(Comp_MultBodyAggAux.c) AS c
FROM
  t_1_Comp_MultBodyAggAux AS Comp_MultBodyAggAux
GROUP BY Comp_MultBodyAggAux.n)
SELECT
  Comp.c AS c
FROM
  t_0_Comp AS Comp
WHERE
  (Comp.n = 9);