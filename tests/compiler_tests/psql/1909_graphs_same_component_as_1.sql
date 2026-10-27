-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
        (COALESCE(t_10_U.a, 0) = COALESCE(t_12_U.b, 0) AND (t_10_U.a IS NULL) = (t_12_U.b IS NULL))
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
        (COALESCE(t_17_U.a, 0) = COALESCE(t_19_U.b, 0) AND (t_17_U.a IS NULL) = (t_19_U.b IS NULL)) AND
        (COALESCE(t_19_U.a, 0) = COALESCE(t_21_U.b, 0) AND (t_19_U.a IS NULL) = (t_21_U.b IS NULL))
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
        (COALESCE(t_23_U.a, 0) = COALESCE(t_25_U.b, 0) AND (t_23_U.a IS NULL) = (t_25_U.b IS NULL)) AND
        (COALESCE(t_25_U.a, 0) = COALESCE(t_27_U.b, 0) AND (t_25_U.a IS NULL) = (t_27_U.b IS NULL)) AND
        (COALESCE(t_27_U.a, 0) = COALESCE(t_29_U.b, 0) AND (t_27_U.a IS NULL) = (t_29_U.b IS NULL))
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
        (COALESCE(t_31_U.a, 0) = COALESCE(t_33_U.b, 0) AND (t_31_U.a IS NULL) = (t_33_U.b IS NULL)) AND
        (COALESCE(t_33_U.a, 0) = COALESCE(t_35_U.b, 0) AND (t_33_U.a IS NULL) = (t_35_U.b IS NULL)) AND
        (COALESCE(t_35_U.a, 0) = COALESCE(t_37_U.b, 0) AND (t_35_U.a IS NULL) = (t_37_U.b IS NULL)) AND
        (COALESCE(t_37_U.a, 0) = COALESCE(t_39_U.b, 0) AND (t_37_U.a IS NULL) = (t_39_U.b IS NULL))
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
        (COALESCE(t_41_U.a, 0) = COALESCE(t_43_U.b, 0) AND (t_41_U.a IS NULL) = (t_43_U.b IS NULL)) AND
        (COALESCE(t_43_U.a, 0) = COALESCE(t_45_U.b, 0) AND (t_43_U.a IS NULL) = (t_45_U.b IS NULL)) AND
        (COALESCE(t_45_U.a, 0) = COALESCE(t_47_U.b, 0) AND (t_45_U.a IS NULL) = (t_47_U.b IS NULL)) AND
        (COALESCE(t_47_U.a, 0) = COALESCE(t_49_U.b, 0) AND (t_47_U.a IS NULL) = (t_49_U.b IS NULL)) AND
        (COALESCE(t_49_U.a, 0) = COALESCE(t_51_U.b, 0) AND (t_49_U.a IS NULL) = (t_51_U.b IS NULL))
    
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
  (COALESCE(t_53_U.a, 0) = COALESCE(t_52_Conn_RecursiveCte.b, 0) AND (t_53_U.a IS NULL) = (t_52_Conn_RecursiveCte.b IS NULL))),
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
      (COALESCE(Conn.a, 0) = COALESCE(Node.n, 0) AND (Conn.a IS NULL) = (Node.n IS NULL))
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
  (Comp.n = 1) AND
  (ARRAY[ROW(t_0_Comp.c)] = ARRAY[ROW(Comp.c)]) ORDER BY m;