-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
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
t_40_ShortestPath_MultBodyAggAux_recursive_head_f21 AS (SELECT * FROM (
  
    SELECT
      t_41_Edge.col0 AS col0,
      t_41_Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS t_41_Edge
  
) AS UNUSED_TABLE_NAME  ),
t_39_ShortestPath_r0 AS (SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f21.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f21.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f21.min_len) AS min_len
FROM
  t_40_ShortestPath_MultBodyAggAux_recursive_head_f21 AS ShortestPath_MultBodyAggAux_recursive_head_f21
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f21.col0, ShortestPath_MultBodyAggAux_recursive_head_f21.col1),
t_36_ShortestPath_MultBodyAggAux_recursive_head_f22 AS (SELECT * FROM (
  
    SELECT
      t_37_Edge.col0 AS col0,
      t_37_Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS t_37_Edge
   UNION ALL
  
    SELECT
      ShortestPath_r0.col0 AS col0,
      t_38_Edge.col1 AS col1,
      ((ShortestPath_r0.min_len) + (1)) AS min_len
    FROM
      t_39_ShortestPath_r0 AS ShortestPath_r0, t_1_Edge AS t_38_Edge
    WHERE
      (t_38_Edge.col0 = ShortestPath_r0.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_35_ShortestPath_r1 AS (SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f22.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f22.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f22.min_len) AS min_len
FROM
  t_36_ShortestPath_MultBodyAggAux_recursive_head_f22 AS ShortestPath_MultBodyAggAux_recursive_head_f22
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f22.col0, ShortestPath_MultBodyAggAux_recursive_head_f22.col1),
t_32_ShortestPath_MultBodyAggAux_recursive_head_f23 AS (SELECT * FROM (
  
    SELECT
      t_33_Edge.col0 AS col0,
      t_33_Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS t_33_Edge
   UNION ALL
  
    SELECT
      ShortestPath_r1.col0 AS col0,
      t_34_Edge.col1 AS col1,
      ((ShortestPath_r1.min_len) + (1)) AS min_len
    FROM
      t_35_ShortestPath_r1 AS ShortestPath_r1, t_1_Edge AS t_34_Edge
    WHERE
      (t_34_Edge.col0 = ShortestPath_r1.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_31_ShortestPath_r2 AS (SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f23.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f23.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f23.min_len) AS min_len
FROM
  t_32_ShortestPath_MultBodyAggAux_recursive_head_f23 AS ShortestPath_MultBodyAggAux_recursive_head_f23
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f23.col0, ShortestPath_MultBodyAggAux_recursive_head_f23.col1),
t_28_ShortestPath_MultBodyAggAux_recursive_head_f24 AS (SELECT * FROM (
  
    SELECT
      t_29_Edge.col0 AS col0,
      t_29_Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS t_29_Edge
   UNION ALL
  
    SELECT
      ShortestPath_r2.col0 AS col0,
      t_30_Edge.col1 AS col1,
      ((ShortestPath_r2.min_len) + (1)) AS min_len
    FROM
      t_31_ShortestPath_r2 AS ShortestPath_r2, t_1_Edge AS t_30_Edge
    WHERE
      (t_30_Edge.col0 = ShortestPath_r2.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_27_ShortestPath_r3 AS (SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f24.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f24.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f24.min_len) AS min_len
FROM
  t_28_ShortestPath_MultBodyAggAux_recursive_head_f24 AS ShortestPath_MultBodyAggAux_recursive_head_f24
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f24.col0, ShortestPath_MultBodyAggAux_recursive_head_f24.col1),
t_24_ShortestPath_MultBodyAggAux_recursive_head_f25 AS (SELECT * FROM (
  
    SELECT
      t_25_Edge.col0 AS col0,
      t_25_Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS t_25_Edge
   UNION ALL
  
    SELECT
      ShortestPath_r3.col0 AS col0,
      t_26_Edge.col1 AS col1,
      ((ShortestPath_r3.min_len) + (1)) AS min_len
    FROM
      t_27_ShortestPath_r3 AS ShortestPath_r3, t_1_Edge AS t_26_Edge
    WHERE
      (t_26_Edge.col0 = ShortestPath_r3.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_23_ShortestPath_r4 AS (SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f25.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f25.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f25.min_len) AS min_len
FROM
  t_24_ShortestPath_MultBodyAggAux_recursive_head_f25 AS ShortestPath_MultBodyAggAux_recursive_head_f25
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f25.col0, ShortestPath_MultBodyAggAux_recursive_head_f25.col1),
t_20_ShortestPath_MultBodyAggAux_recursive_head_f26 AS (SELECT * FROM (
  
    SELECT
      t_21_Edge.col0 AS col0,
      t_21_Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS t_21_Edge
   UNION ALL
  
    SELECT
      ShortestPath_r4.col0 AS col0,
      t_22_Edge.col1 AS col1,
      ((ShortestPath_r4.min_len) + (1)) AS min_len
    FROM
      t_23_ShortestPath_r4 AS ShortestPath_r4, t_1_Edge AS t_22_Edge
    WHERE
      (t_22_Edge.col0 = ShortestPath_r4.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_19_ShortestPath_r5 AS (SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f26.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f26.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f26.min_len) AS min_len
FROM
  t_20_ShortestPath_MultBodyAggAux_recursive_head_f26 AS ShortestPath_MultBodyAggAux_recursive_head_f26
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f26.col0, ShortestPath_MultBodyAggAux_recursive_head_f26.col1),
t_16_ShortestPath_MultBodyAggAux_recursive_head_f27 AS (SELECT * FROM (
  
    SELECT
      t_17_Edge.col0 AS col0,
      t_17_Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS t_17_Edge
   UNION ALL
  
    SELECT
      ShortestPath_r5.col0 AS col0,
      t_18_Edge.col1 AS col1,
      ((ShortestPath_r5.min_len) + (1)) AS min_len
    FROM
      t_19_ShortestPath_r5 AS ShortestPath_r5, t_1_Edge AS t_18_Edge
    WHERE
      (t_18_Edge.col0 = ShortestPath_r5.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_15_ShortestPath_r6 AS (SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f27.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f27.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f27.min_len) AS min_len
FROM
  t_16_ShortestPath_MultBodyAggAux_recursive_head_f27 AS ShortestPath_MultBodyAggAux_recursive_head_f27
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f27.col0, ShortestPath_MultBodyAggAux_recursive_head_f27.col1),
t_12_ShortestPath_MultBodyAggAux_recursive_head_f28 AS (SELECT * FROM (
  
    SELECT
      t_13_Edge.col0 AS col0,
      t_13_Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS t_13_Edge
   UNION ALL
  
    SELECT
      ShortestPath_r6.col0 AS col0,
      t_14_Edge.col1 AS col1,
      ((ShortestPath_r6.min_len) + (1)) AS min_len
    FROM
      t_15_ShortestPath_r6 AS ShortestPath_r6, t_1_Edge AS t_14_Edge
    WHERE
      (t_14_Edge.col0 = ShortestPath_r6.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_11_ShortestPath_r7 AS (SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f28.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f28.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f28.min_len) AS min_len
FROM
  t_12_ShortestPath_MultBodyAggAux_recursive_head_f28 AS ShortestPath_MultBodyAggAux_recursive_head_f28
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f28.col0, ShortestPath_MultBodyAggAux_recursive_head_f28.col1),
t_8_ShortestPath_MultBodyAggAux_recursive_head_f29 AS (SELECT * FROM (
  
    SELECT
      t_9_Edge.col0 AS col0,
      t_9_Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS t_9_Edge
   UNION ALL
  
    SELECT
      ShortestPath_r7.col0 AS col0,
      t_10_Edge.col1 AS col1,
      ((ShortestPath_r7.min_len) + (1)) AS min_len
    FROM
      t_11_ShortestPath_r7 AS ShortestPath_r7, t_1_Edge AS t_10_Edge
    WHERE
      (t_10_Edge.col0 = ShortestPath_r7.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_7_ShortestPath_r8 AS (SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f29.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f29.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f29.min_len) AS min_len
FROM
  t_8_ShortestPath_MultBodyAggAux_recursive_head_f29 AS ShortestPath_MultBodyAggAux_recursive_head_f29
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f29.col0, ShortestPath_MultBodyAggAux_recursive_head_f29.col1),
t_4_ShortestPath_MultBodyAggAux_recursive_head_f30 AS (SELECT * FROM (
  
    SELECT
      t_5_Edge.col0 AS col0,
      t_5_Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS t_5_Edge
   UNION ALL
  
    SELECT
      ShortestPath_r8.col0 AS col0,
      t_6_Edge.col1 AS col1,
      ((ShortestPath_r8.min_len) + (1)) AS min_len
    FROM
      t_7_ShortestPath_r8 AS ShortestPath_r8, t_1_Edge AS t_6_Edge
    WHERE
      (t_6_Edge.col0 = ShortestPath_r8.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_3_ShortestPath_r9 AS (SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f30.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f30.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f30.min_len) AS min_len
FROM
  t_4_ShortestPath_MultBodyAggAux_recursive_head_f30 AS ShortestPath_MultBodyAggAux_recursive_head_f30
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f30.col0, ShortestPath_MultBodyAggAux_recursive_head_f30.col1),
t_0_ShortestPath_MultBodyAggAux_recursive_head_f33 AS (SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1,
      1 AS min_len
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      ShortestPath_r9.col0 AS col0,
      t_2_Edge.col1 AS col1,
      ((ShortestPath_r9.min_len) + (1)) AS min_len
    FROM
      t_3_ShortestPath_r9 AS ShortestPath_r9, t_1_Edge AS t_2_Edge
    WHERE
      (t_2_Edge.col0 = ShortestPath_r9.col1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ShortestPath_MultBodyAggAux_recursive_head_f33.col0 AS col0,
  ShortestPath_MultBodyAggAux_recursive_head_f33.col1 AS col1,
  MIN(ShortestPath_MultBodyAggAux_recursive_head_f33.min_len) AS min_len
FROM
  t_0_ShortestPath_MultBodyAggAux_recursive_head_f33 AS ShortestPath_MultBodyAggAux_recursive_head_f33
GROUP BY ShortestPath_MultBodyAggAux_recursive_head_f33.col0, ShortestPath_MultBodyAggAux_recursive_head_f33.col1;