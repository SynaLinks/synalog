-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      2 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      3 AS col1
   UNION ALL
  
    SELECT
      3 AS col0,
      4 AS col1
   UNION ALL
  
    SELECT
      4 AS col0,
      5 AS col1
   UNION ALL
  
    SELECT
      5 AS col0,
      6 AS col1
   UNION ALL
  
    SELECT
      6 AS col0,
      7 AS col1
  
) AS UNUSED_TABLE_NAME  ),
t_30_Reachable_r0 AS (SELECT * FROM (
  
    SELECT
      t_31_Edge.col0 AS col0,
      t_31_Edge.col1 AS col1
    FROM
      t_1_Edge AS t_31_Edge
  
) AS UNUSED_TABLE_NAME  ),
t_27_Reachable_r1 AS (SELECT * FROM (
  
    SELECT
      t_28_Edge.col0 AS col0,
      t_28_Edge.col1 AS col1
    FROM
      t_1_Edge AS t_28_Edge
   UNION ALL
  
    SELECT
      Reachable_r0.col0 AS col0,
      t_29_Edge.col1 AS col1
    FROM
      t_30_Reachable_r0 AS Reachable_r0, t_1_Edge AS t_29_Edge
    WHERE
      (t_29_Edge.col0 = Reachable_r0.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_24_Reachable_r2 AS (SELECT * FROM (
  
    SELECT
      t_25_Edge.col0 AS col0,
      t_25_Edge.col1 AS col1
    FROM
      t_1_Edge AS t_25_Edge
   UNION ALL
  
    SELECT
      Reachable_r1.col0 AS col0,
      t_26_Edge.col1 AS col1
    FROM
      t_27_Reachable_r1 AS Reachable_r1, t_1_Edge AS t_26_Edge
    WHERE
      (t_26_Edge.col0 = Reachable_r1.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_21_Reachable_r3 AS (SELECT * FROM (
  
    SELECT
      t_22_Edge.col0 AS col0,
      t_22_Edge.col1 AS col1
    FROM
      t_1_Edge AS t_22_Edge
   UNION ALL
  
    SELECT
      Reachable_r2.col0 AS col0,
      t_23_Edge.col1 AS col1
    FROM
      t_24_Reachable_r2 AS Reachable_r2, t_1_Edge AS t_23_Edge
    WHERE
      (t_23_Edge.col0 = Reachable_r2.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_18_Reachable_r4 AS (SELECT * FROM (
  
    SELECT
      t_19_Edge.col0 AS col0,
      t_19_Edge.col1 AS col1
    FROM
      t_1_Edge AS t_19_Edge
   UNION ALL
  
    SELECT
      Reachable_r3.col0 AS col0,
      t_20_Edge.col1 AS col1
    FROM
      t_21_Reachable_r3 AS Reachable_r3, t_1_Edge AS t_20_Edge
    WHERE
      (t_20_Edge.col0 = Reachable_r3.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_15_Reachable_r5 AS (SELECT * FROM (
  
    SELECT
      t_16_Edge.col0 AS col0,
      t_16_Edge.col1 AS col1
    FROM
      t_1_Edge AS t_16_Edge
   UNION ALL
  
    SELECT
      Reachable_r4.col0 AS col0,
      t_17_Edge.col1 AS col1
    FROM
      t_18_Reachable_r4 AS Reachable_r4, t_1_Edge AS t_17_Edge
    WHERE
      (t_17_Edge.col0 = Reachable_r4.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_12_Reachable_r6 AS (SELECT * FROM (
  
    SELECT
      t_13_Edge.col0 AS col0,
      t_13_Edge.col1 AS col1
    FROM
      t_1_Edge AS t_13_Edge
   UNION ALL
  
    SELECT
      Reachable_r5.col0 AS col0,
      t_14_Edge.col1 AS col1
    FROM
      t_15_Reachable_r5 AS Reachable_r5, t_1_Edge AS t_14_Edge
    WHERE
      (t_14_Edge.col0 = Reachable_r5.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_9_Reachable_r7 AS (SELECT * FROM (
  
    SELECT
      t_10_Edge.col0 AS col0,
      t_10_Edge.col1 AS col1
    FROM
      t_1_Edge AS t_10_Edge
   UNION ALL
  
    SELECT
      Reachable_r6.col0 AS col0,
      t_11_Edge.col1 AS col1
    FROM
      t_12_Reachable_r6 AS Reachable_r6, t_1_Edge AS t_11_Edge
    WHERE
      (t_11_Edge.col0 = Reachable_r6.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_6_Reachable_r8 AS (SELECT * FROM (
  
    SELECT
      t_7_Edge.col0 AS col0,
      t_7_Edge.col1 AS col1
    FROM
      t_1_Edge AS t_7_Edge
   UNION ALL
  
    SELECT
      Reachable_r7.col0 AS col0,
      t_8_Edge.col1 AS col1
    FROM
      t_9_Reachable_r7 AS Reachable_r7, t_1_Edge AS t_8_Edge
    WHERE
      (t_8_Edge.col0 = Reachable_r7.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_3_Reachable_r9 AS (SELECT * FROM (
  
    SELECT
      t_4_Edge.col0 AS col0,
      t_4_Edge.col1 AS col1
    FROM
      t_1_Edge AS t_4_Edge
   UNION ALL
  
    SELECT
      Reachable_r8.col0 AS col0,
      t_5_Edge.col1 AS col1
    FROM
      t_6_Reachable_r8 AS Reachable_r8, t_1_Edge AS t_5_Edge
    WHERE
      (t_5_Edge.col0 = Reachable_r8.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reachable AS (SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_r9.col0 AS col0,
      t_2_Edge.col1 AS col1
    FROM
      t_3_Reachable_r9 AS Reachable_r9, t_1_Edge AS t_2_Edge
    WHERE
      (t_2_Edge.col0 = Reachable_r9.col1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reachable.col0 AS x,
  Reachable.col1 AS y
FROM
  t_0_Reachable AS Reachable ORDER BY x, y;