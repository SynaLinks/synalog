WITH RECURSIVE t_3_Node AS (SELECT * FROM (
  
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
t_8_E AS (SELECT * FROM (
  
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
t_7_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_8_E AS E
   UNION ALL
  
    SELECT
      t_9_E.b AS a,
      t_9_E.a AS b
    FROM
      t_8_E AS t_9_E
  
) AS UNUSED_TABLE_NAME  ),
t_6_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_7_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY U_MultBodyAggAux.a, U_MultBodyAggAux.b),
t_5_Conn_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        U.a AS a,
        U.b AS b,
        0 AS synalog_step
      FROM
        t_6_U AS U
     UNION ALL
    
      SELECT
        t_12_U.a AS a,
        t_10_U.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_6_U AS t_12_U, t_6_U AS t_10_U
      WHERE
        (0 < 12) AND
        (1 = 0) AND
        (t_10_U.a IS t_12_U.b)
     UNION ALL
    
      SELECT
        t_21_U.a AS a,
        t_17_U.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_6_U AS t_21_U, t_6_U AS t_19_U, t_6_U AS t_17_U
      WHERE
        (((0) + (1)) < 12) AND
        (0 < 12) AND
        (1 = 0) AND
        (t_17_U.a IS t_19_U.b) AND
        (t_19_U.a IS t_21_U.b)
     UNION ALL
    
      SELECT
        t_29_U.a AS a,
        t_23_U.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_6_U AS t_29_U, t_6_U AS t_27_U, t_6_U AS t_25_U, t_6_U AS t_23_U
      WHERE
        (((((0) + (1))) + (1)) < 12) AND
        (((0) + (1)) < 12) AND
        (0 < 12) AND
        (1 = 0) AND
        (t_23_U.a IS t_25_U.b) AND
        (t_25_U.a IS t_27_U.b) AND
        (t_27_U.a IS t_29_U.b)
     UNION ALL
    
      SELECT
        t_39_U.a AS a,
        t_31_U.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_6_U AS t_39_U, t_6_U AS t_37_U, t_6_U AS t_35_U, t_6_U AS t_33_U, t_6_U AS t_31_U
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 12) AND
        (((((0) + (1))) + (1)) < 12) AND
        (((0) + (1)) < 12) AND
        (0 < 12) AND
        (1 = 0) AND
        (t_31_U.a IS t_33_U.b) AND
        (t_33_U.a IS t_35_U.b) AND
        (t_35_U.a IS t_37_U.b) AND
        (t_37_U.a IS t_39_U.b)
     UNION ALL
    
      SELECT
        t_51_U.a AS a,
        t_41_U.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_6_U AS t_51_U, t_6_U AS t_49_U, t_6_U AS t_47_U, t_6_U AS t_45_U, t_6_U AS t_43_U, t_6_U AS t_41_U
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 12) AND
        (((((((0) + (1))) + (1))) + (1)) < 12) AND
        (((((0) + (1))) + (1)) < 12) AND
        (((0) + (1)) < 12) AND
        (0 < 12) AND
        (1 = 0) AND
        (t_41_U.a IS t_43_U.b) AND
        (t_43_U.a IS t_45_U.b) AND
        (t_45_U.a IS t_47_U.b) AND
        (t_47_U.a IS t_49_U.b) AND
        (t_49_U.a IS t_51_U.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_52_Conn_RecursiveCte.a AS a,
  t_53_U.b AS b,
  ((t_52_Conn_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_5_Conn_RecursiveCte AS t_52_Conn_RecursiveCte, t_6_U AS t_53_U
WHERE
  (t_52_Conn_RecursiveCte.synalog_step < 12) AND
  (t_53_U.a IS t_52_Conn_RecursiveCte.b)),
t_4_Conn AS (SELECT
  Conn_RecursiveCte.a AS a,
  Conn_RecursiveCte.b AS b
FROM
  t_5_Conn_RecursiveCte AS Conn_RecursiveCte
GROUP BY Conn_RecursiveCte.a, Conn_RecursiveCte.b),
t_2_Comp_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Node.n AS n,
      Conn.b AS c
    FROM
      t_3_Node AS Node, t_4_Conn AS Conn
    WHERE
      (Conn.a IS Node.n)
   UNION ALL
  
    SELECT
      t_54_Node.n AS n,
      t_54_Node.n AS c
    FROM
      t_3_Node AS t_54_Node
  
) AS UNUSED_TABLE_NAME  ),
t_1_Comp AS (SELECT
  Comp_MultBodyAggAux.n AS n,
  MIN(Comp_MultBodyAggAux.c) AS c
FROM
  t_2_Comp_MultBodyAggAux AS Comp_MultBodyAggAux
GROUP BY Comp_MultBodyAggAux.n)
SELECT
  t_0_Comp.n AS m
FROM
  t_1_Comp AS Comp, t_1_Comp AS t_0_Comp
WHERE
  (Comp.n = 10) AND
  (t_0_Comp.c IS Comp.c) ORDER BY m NULLS LAST;