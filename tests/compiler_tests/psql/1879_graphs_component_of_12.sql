-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
        (COALESCE(t_9_U.a, 0) = COALESCE(t_11_U.b, 0) AND (t_9_U.a IS NULL) = (t_11_U.b IS NULL))
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
        (COALESCE(t_16_U.a, 0) = COALESCE(t_18_U.b, 0) AND (t_16_U.a IS NULL) = (t_18_U.b IS NULL)) AND
        (COALESCE(t_18_U.a, 0) = COALESCE(t_20_U.b, 0) AND (t_18_U.a IS NULL) = (t_20_U.b IS NULL))
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
        (COALESCE(t_22_U.a, 0) = COALESCE(t_24_U.b, 0) AND (t_22_U.a IS NULL) = (t_24_U.b IS NULL)) AND
        (COALESCE(t_24_U.a, 0) = COALESCE(t_26_U.b, 0) AND (t_24_U.a IS NULL) = (t_26_U.b IS NULL)) AND
        (COALESCE(t_26_U.a, 0) = COALESCE(t_28_U.b, 0) AND (t_26_U.a IS NULL) = (t_28_U.b IS NULL))
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
        (COALESCE(t_30_U.a, 0) = COALESCE(t_32_U.b, 0) AND (t_30_U.a IS NULL) = (t_32_U.b IS NULL)) AND
        (COALESCE(t_32_U.a, 0) = COALESCE(t_34_U.b, 0) AND (t_32_U.a IS NULL) = (t_34_U.b IS NULL)) AND
        (COALESCE(t_34_U.a, 0) = COALESCE(t_36_U.b, 0) AND (t_34_U.a IS NULL) = (t_36_U.b IS NULL)) AND
        (COALESCE(t_36_U.a, 0) = COALESCE(t_38_U.b, 0) AND (t_36_U.a IS NULL) = (t_38_U.b IS NULL))
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
        (COALESCE(t_40_U.a, 0) = COALESCE(t_42_U.b, 0) AND (t_40_U.a IS NULL) = (t_42_U.b IS NULL)) AND
        (COALESCE(t_42_U.a, 0) = COALESCE(t_44_U.b, 0) AND (t_42_U.a IS NULL) = (t_44_U.b IS NULL)) AND
        (COALESCE(t_44_U.a, 0) = COALESCE(t_46_U.b, 0) AND (t_44_U.a IS NULL) = (t_46_U.b IS NULL)) AND
        (COALESCE(t_46_U.a, 0) = COALESCE(t_48_U.b, 0) AND (t_46_U.a IS NULL) = (t_48_U.b IS NULL)) AND
        (COALESCE(t_48_U.a, 0) = COALESCE(t_50_U.b, 0) AND (t_48_U.a IS NULL) = (t_50_U.b IS NULL))
    
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
  (COALESCE(t_52_U.a, 0) = COALESCE(t_51_Conn_RecursiveCte.b, 0) AND (t_52_U.a IS NULL) = (t_51_Conn_RecursiveCte.b IS NULL))),
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
      (COALESCE(Conn.a, 0) = COALESCE(Node.n, 0) AND (Conn.a IS NULL) = (Node.n IS NULL))
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
  (Comp.n = 12);