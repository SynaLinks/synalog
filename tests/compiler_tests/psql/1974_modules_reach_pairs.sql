-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_33_Graph_Reach_MultBodyAggAux_recursive_head_f1_f12 AS (SELECT * FROM (
  
    SELECT
      t_34_Local.a AS a,
      t_34_Local.b AS b
    FROM
      t_2_Local AS t_34_Local
  
) AS UNUSED_TABLE_NAME  ),
t_32_Graph_Reach_r0_f12 AS (SELECT
  Graph_Reach_MultBodyAggAux_recursive_head_f1_f12.a AS a,
  Graph_Reach_MultBodyAggAux_recursive_head_f1_f12.b AS b
FROM
  t_33_Graph_Reach_MultBodyAggAux_recursive_head_f1_f12 AS Graph_Reach_MultBodyAggAux_recursive_head_f1_f12
GROUP BY Graph_Reach_MultBodyAggAux_recursive_head_f1_f12.a, Graph_Reach_MultBodyAggAux_recursive_head_f1_f12.b),
t_29_Graph_Reach_MultBodyAggAux_recursive_head_f2_f12 AS (SELECT * FROM (
  
    SELECT
      t_30_Local.a AS a,
      t_30_Local.b AS b
    FROM
      t_2_Local AS t_30_Local
   UNION ALL
  
    SELECT
      Graph_Reach_r0_f12.a AS a,
      t_31_Local.b AS b
    FROM
      t_32_Graph_Reach_r0_f12 AS Graph_Reach_r0_f12, t_2_Local AS t_31_Local
    WHERE
      (t_31_Local.a = Graph_Reach_r0_f12.b)
  
) AS UNUSED_TABLE_NAME  ),
t_28_Graph_Reach_r1_f12 AS (SELECT
  Graph_Reach_MultBodyAggAux_recursive_head_f2_f12.a AS a,
  Graph_Reach_MultBodyAggAux_recursive_head_f2_f12.b AS b
FROM
  t_29_Graph_Reach_MultBodyAggAux_recursive_head_f2_f12 AS Graph_Reach_MultBodyAggAux_recursive_head_f2_f12
GROUP BY Graph_Reach_MultBodyAggAux_recursive_head_f2_f12.a, Graph_Reach_MultBodyAggAux_recursive_head_f2_f12.b),
t_25_Graph_Reach_MultBodyAggAux_recursive_head_f3_f12 AS (SELECT * FROM (
  
    SELECT
      t_26_Local.a AS a,
      t_26_Local.b AS b
    FROM
      t_2_Local AS t_26_Local
   UNION ALL
  
    SELECT
      Graph_Reach_r1_f12.a AS a,
      t_27_Local.b AS b
    FROM
      t_28_Graph_Reach_r1_f12 AS Graph_Reach_r1_f12, t_2_Local AS t_27_Local
    WHERE
      (t_27_Local.a = Graph_Reach_r1_f12.b)
  
) AS UNUSED_TABLE_NAME  ),
t_24_Graph_Reach_r2_f12 AS (SELECT
  Graph_Reach_MultBodyAggAux_recursive_head_f3_f12.a AS a,
  Graph_Reach_MultBodyAggAux_recursive_head_f3_f12.b AS b
FROM
  t_25_Graph_Reach_MultBodyAggAux_recursive_head_f3_f12 AS Graph_Reach_MultBodyAggAux_recursive_head_f3_f12
GROUP BY Graph_Reach_MultBodyAggAux_recursive_head_f3_f12.a, Graph_Reach_MultBodyAggAux_recursive_head_f3_f12.b),
t_21_Graph_Reach_MultBodyAggAux_recursive_head_f4_f12 AS (SELECT * FROM (
  
    SELECT
      t_22_Local.a AS a,
      t_22_Local.b AS b
    FROM
      t_2_Local AS t_22_Local
   UNION ALL
  
    SELECT
      Graph_Reach_r2_f12.a AS a,
      t_23_Local.b AS b
    FROM
      t_24_Graph_Reach_r2_f12 AS Graph_Reach_r2_f12, t_2_Local AS t_23_Local
    WHERE
      (t_23_Local.a = Graph_Reach_r2_f12.b)
  
) AS UNUSED_TABLE_NAME  ),
t_20_Graph_Reach_r3_f12 AS (SELECT
  Graph_Reach_MultBodyAggAux_recursive_head_f4_f12.a AS a,
  Graph_Reach_MultBodyAggAux_recursive_head_f4_f12.b AS b
FROM
  t_21_Graph_Reach_MultBodyAggAux_recursive_head_f4_f12 AS Graph_Reach_MultBodyAggAux_recursive_head_f4_f12
GROUP BY Graph_Reach_MultBodyAggAux_recursive_head_f4_f12.a, Graph_Reach_MultBodyAggAux_recursive_head_f4_f12.b),
t_17_Graph_Reach_MultBodyAggAux_recursive_head_f5_f12 AS (SELECT * FROM (
  
    SELECT
      t_18_Local.a AS a,
      t_18_Local.b AS b
    FROM
      t_2_Local AS t_18_Local
   UNION ALL
  
    SELECT
      Graph_Reach_r3_f12.a AS a,
      t_19_Local.b AS b
    FROM
      t_20_Graph_Reach_r3_f12 AS Graph_Reach_r3_f12, t_2_Local AS t_19_Local
    WHERE
      (t_19_Local.a = Graph_Reach_r3_f12.b)
  
) AS UNUSED_TABLE_NAME  ),
t_16_Graph_Reach_r4_f12 AS (SELECT
  Graph_Reach_MultBodyAggAux_recursive_head_f5_f12.a AS a,
  Graph_Reach_MultBodyAggAux_recursive_head_f5_f12.b AS b
FROM
  t_17_Graph_Reach_MultBodyAggAux_recursive_head_f5_f12 AS Graph_Reach_MultBodyAggAux_recursive_head_f5_f12
GROUP BY Graph_Reach_MultBodyAggAux_recursive_head_f5_f12.a, Graph_Reach_MultBodyAggAux_recursive_head_f5_f12.b),
t_13_Graph_Reach_MultBodyAggAux_recursive_head_f6_f12 AS (SELECT * FROM (
  
    SELECT
      t_14_Local.a AS a,
      t_14_Local.b AS b
    FROM
      t_2_Local AS t_14_Local
   UNION ALL
  
    SELECT
      Graph_Reach_r4_f12.a AS a,
      t_15_Local.b AS b
    FROM
      t_16_Graph_Reach_r4_f12 AS Graph_Reach_r4_f12, t_2_Local AS t_15_Local
    WHERE
      (t_15_Local.a = Graph_Reach_r4_f12.b)
  
) AS UNUSED_TABLE_NAME  ),
t_12_Graph_Reach_r5_f12 AS (SELECT
  Graph_Reach_MultBodyAggAux_recursive_head_f6_f12.a AS a,
  Graph_Reach_MultBodyAggAux_recursive_head_f6_f12.b AS b
FROM
  t_13_Graph_Reach_MultBodyAggAux_recursive_head_f6_f12 AS Graph_Reach_MultBodyAggAux_recursive_head_f6_f12
GROUP BY Graph_Reach_MultBodyAggAux_recursive_head_f6_f12.a, Graph_Reach_MultBodyAggAux_recursive_head_f6_f12.b),
t_9_Graph_Reach_MultBodyAggAux_recursive_head_f7_f12 AS (SELECT * FROM (
  
    SELECT
      t_10_Local.a AS a,
      t_10_Local.b AS b
    FROM
      t_2_Local AS t_10_Local
   UNION ALL
  
    SELECT
      Graph_Reach_r5_f12.a AS a,
      t_11_Local.b AS b
    FROM
      t_12_Graph_Reach_r5_f12 AS Graph_Reach_r5_f12, t_2_Local AS t_11_Local
    WHERE
      (t_11_Local.a = Graph_Reach_r5_f12.b)
  
) AS UNUSED_TABLE_NAME  ),
t_8_Graph_Reach_r6_f12 AS (SELECT
  Graph_Reach_MultBodyAggAux_recursive_head_f7_f12.a AS a,
  Graph_Reach_MultBodyAggAux_recursive_head_f7_f12.b AS b
FROM
  t_9_Graph_Reach_MultBodyAggAux_recursive_head_f7_f12 AS Graph_Reach_MultBodyAggAux_recursive_head_f7_f12
GROUP BY Graph_Reach_MultBodyAggAux_recursive_head_f7_f12.a, Graph_Reach_MultBodyAggAux_recursive_head_f7_f12.b),
t_5_Graph_Reach_MultBodyAggAux_recursive_head_f8_f12 AS (SELECT * FROM (
  
    SELECT
      t_6_Local.a AS a,
      t_6_Local.b AS b
    FROM
      t_2_Local AS t_6_Local
   UNION ALL
  
    SELECT
      Graph_Reach_r6_f12.a AS a,
      t_7_Local.b AS b
    FROM
      t_8_Graph_Reach_r6_f12 AS Graph_Reach_r6_f12, t_2_Local AS t_7_Local
    WHERE
      (t_7_Local.a = Graph_Reach_r6_f12.b)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Graph_Reach_r7_f12 AS (SELECT
  Graph_Reach_MultBodyAggAux_recursive_head_f8_f12.a AS a,
  Graph_Reach_MultBodyAggAux_recursive_head_f8_f12.b AS b
FROM
  t_5_Graph_Reach_MultBodyAggAux_recursive_head_f8_f12 AS Graph_Reach_MultBodyAggAux_recursive_head_f8_f12
GROUP BY Graph_Reach_MultBodyAggAux_recursive_head_f8_f12.a, Graph_Reach_MultBodyAggAux_recursive_head_f8_f12.b),
t_1_Graph_Reach_MultBodyAggAux_recursive_head_f9_f12 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_2_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_r7_f12.a AS a,
      t_3_Local.b AS b
    FROM
      t_4_Graph_Reach_r7_f12 AS Graph_Reach_r7_f12, t_2_Local AS t_3_Local
    WHERE
      (t_3_Local.a = Graph_Reach_r7_f12.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R AS (SELECT
  Graph_Reach_MultBodyAggAux_recursive_head_f9_f12.a AS a,
  Graph_Reach_MultBodyAggAux_recursive_head_f9_f12.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_recursive_head_f9_f12 AS Graph_Reach_MultBodyAggAux_recursive_head_f9_f12
GROUP BY Graph_Reach_MultBodyAggAux_recursive_head_f9_f12.a, Graph_Reach_MultBodyAggAux_recursive_head_f9_f12.b)
SELECT
  R.a AS a,
  R.b AS b
FROM
  t_0_R AS R ORDER BY a, b;
