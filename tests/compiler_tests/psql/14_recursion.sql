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
      1 AS col0,
      3 AS col1
  
) AS UNUSED_TABLE_NAME  ),
t_50_Distance_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_51_Edge.col0 AS col0,
      t_51_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_51_Edge
  
) AS UNUSED_TABLE_NAME  ),
t_49_Distance_r0 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f1.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f1.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f1.logica_value) AS logica_value
FROM
  t_50_Distance_MultBodyAggAux_recursive_head_f1 AS Distance_MultBodyAggAux_recursive_head_f1
GROUP BY Distance_MultBodyAggAux_recursive_head_f1.col0, Distance_MultBodyAggAux_recursive_head_f1.col1),
t_45_Distance_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_46_Edge.col0 AS col0,
      t_46_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_46_Edge
   UNION ALL
  
    SELECT
      Distance_r0.col0 AS col0,
      t_47_Edge.col1 AS col1,
      ((t_48_Distance_r0.logica_value) + (1)) AS logica_value
    FROM
      t_49_Distance_r0 AS Distance_r0, t_1_Edge AS t_47_Edge, t_49_Distance_r0 AS t_48_Distance_r0
    WHERE
      (t_47_Edge.col0 = Distance_r0.col1) AND
      (t_48_Distance_r0.col0 = Distance_r0.col0) AND
      (t_48_Distance_r0.col1 = Distance_r0.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_44_Distance_r1 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f2.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f2.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f2.logica_value) AS logica_value
FROM
  t_45_Distance_MultBodyAggAux_recursive_head_f2 AS Distance_MultBodyAggAux_recursive_head_f2
GROUP BY Distance_MultBodyAggAux_recursive_head_f2.col0, Distance_MultBodyAggAux_recursive_head_f2.col1),
t_40_Distance_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_41_Edge.col0 AS col0,
      t_41_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_41_Edge
   UNION ALL
  
    SELECT
      Distance_r1.col0 AS col0,
      t_42_Edge.col1 AS col1,
      ((t_43_Distance_r1.logica_value) + (1)) AS logica_value
    FROM
      t_44_Distance_r1 AS Distance_r1, t_1_Edge AS t_42_Edge, t_44_Distance_r1 AS t_43_Distance_r1
    WHERE
      (t_42_Edge.col0 = Distance_r1.col1) AND
      (t_43_Distance_r1.col0 = Distance_r1.col0) AND
      (t_43_Distance_r1.col1 = Distance_r1.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_39_Distance_r2 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f3.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f3.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f3.logica_value) AS logica_value
FROM
  t_40_Distance_MultBodyAggAux_recursive_head_f3 AS Distance_MultBodyAggAux_recursive_head_f3
GROUP BY Distance_MultBodyAggAux_recursive_head_f3.col0, Distance_MultBodyAggAux_recursive_head_f3.col1),
t_35_Distance_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_36_Edge.col0 AS col0,
      t_36_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_36_Edge
   UNION ALL
  
    SELECT
      Distance_r2.col0 AS col0,
      t_37_Edge.col1 AS col1,
      ((t_38_Distance_r2.logica_value) + (1)) AS logica_value
    FROM
      t_39_Distance_r2 AS Distance_r2, t_1_Edge AS t_37_Edge, t_39_Distance_r2 AS t_38_Distance_r2
    WHERE
      (t_37_Edge.col0 = Distance_r2.col1) AND
      (t_38_Distance_r2.col0 = Distance_r2.col0) AND
      (t_38_Distance_r2.col1 = Distance_r2.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_34_Distance_r3 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f4.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f4.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f4.logica_value) AS logica_value
FROM
  t_35_Distance_MultBodyAggAux_recursive_head_f4 AS Distance_MultBodyAggAux_recursive_head_f4
GROUP BY Distance_MultBodyAggAux_recursive_head_f4.col0, Distance_MultBodyAggAux_recursive_head_f4.col1),
t_30_Distance_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_31_Edge.col0 AS col0,
      t_31_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_31_Edge
   UNION ALL
  
    SELECT
      Distance_r3.col0 AS col0,
      t_32_Edge.col1 AS col1,
      ((t_33_Distance_r3.logica_value) + (1)) AS logica_value
    FROM
      t_34_Distance_r3 AS Distance_r3, t_1_Edge AS t_32_Edge, t_34_Distance_r3 AS t_33_Distance_r3
    WHERE
      (t_32_Edge.col0 = Distance_r3.col1) AND
      (t_33_Distance_r3.col0 = Distance_r3.col0) AND
      (t_33_Distance_r3.col1 = Distance_r3.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_29_Distance_r4 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f5.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f5.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f5.logica_value) AS logica_value
FROM
  t_30_Distance_MultBodyAggAux_recursive_head_f5 AS Distance_MultBodyAggAux_recursive_head_f5
GROUP BY Distance_MultBodyAggAux_recursive_head_f5.col0, Distance_MultBodyAggAux_recursive_head_f5.col1),
t_25_Distance_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_26_Edge.col0 AS col0,
      t_26_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_26_Edge
   UNION ALL
  
    SELECT
      Distance_r4.col0 AS col0,
      t_27_Edge.col1 AS col1,
      ((t_28_Distance_r4.logica_value) + (1)) AS logica_value
    FROM
      t_29_Distance_r4 AS Distance_r4, t_1_Edge AS t_27_Edge, t_29_Distance_r4 AS t_28_Distance_r4
    WHERE
      (t_27_Edge.col0 = Distance_r4.col1) AND
      (t_28_Distance_r4.col0 = Distance_r4.col0) AND
      (t_28_Distance_r4.col1 = Distance_r4.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_24_Distance_r5 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f6.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f6.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f6.logica_value) AS logica_value
FROM
  t_25_Distance_MultBodyAggAux_recursive_head_f6 AS Distance_MultBodyAggAux_recursive_head_f6
GROUP BY Distance_MultBodyAggAux_recursive_head_f6.col0, Distance_MultBodyAggAux_recursive_head_f6.col1),
t_20_Distance_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_21_Edge.col0 AS col0,
      t_21_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_21_Edge
   UNION ALL
  
    SELECT
      Distance_r5.col0 AS col0,
      t_22_Edge.col1 AS col1,
      ((t_23_Distance_r5.logica_value) + (1)) AS logica_value
    FROM
      t_24_Distance_r5 AS Distance_r5, t_1_Edge AS t_22_Edge, t_24_Distance_r5 AS t_23_Distance_r5
    WHERE
      (t_22_Edge.col0 = Distance_r5.col1) AND
      (t_23_Distance_r5.col0 = Distance_r5.col0) AND
      (t_23_Distance_r5.col1 = Distance_r5.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_19_Distance_r6 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f7.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f7.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f7.logica_value) AS logica_value
FROM
  t_20_Distance_MultBodyAggAux_recursive_head_f7 AS Distance_MultBodyAggAux_recursive_head_f7
GROUP BY Distance_MultBodyAggAux_recursive_head_f7.col0, Distance_MultBodyAggAux_recursive_head_f7.col1),
t_15_Distance_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_16_Edge.col0 AS col0,
      t_16_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_16_Edge
   UNION ALL
  
    SELECT
      Distance_r6.col0 AS col0,
      t_17_Edge.col1 AS col1,
      ((t_18_Distance_r6.logica_value) + (1)) AS logica_value
    FROM
      t_19_Distance_r6 AS Distance_r6, t_1_Edge AS t_17_Edge, t_19_Distance_r6 AS t_18_Distance_r6
    WHERE
      (t_17_Edge.col0 = Distance_r6.col1) AND
      (t_18_Distance_r6.col0 = Distance_r6.col0) AND
      (t_18_Distance_r6.col1 = Distance_r6.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_14_Distance_r7 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f8.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f8.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f8.logica_value) AS logica_value
FROM
  t_15_Distance_MultBodyAggAux_recursive_head_f8 AS Distance_MultBodyAggAux_recursive_head_f8
GROUP BY Distance_MultBodyAggAux_recursive_head_f8.col0, Distance_MultBodyAggAux_recursive_head_f8.col1),
t_10_Distance_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_11_Edge.col0 AS col0,
      t_11_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_11_Edge
   UNION ALL
  
    SELECT
      Distance_r7.col0 AS col0,
      t_12_Edge.col1 AS col1,
      ((t_13_Distance_r7.logica_value) + (1)) AS logica_value
    FROM
      t_14_Distance_r7 AS Distance_r7, t_1_Edge AS t_12_Edge, t_14_Distance_r7 AS t_13_Distance_r7
    WHERE
      (t_12_Edge.col0 = Distance_r7.col1) AND
      (t_13_Distance_r7.col0 = Distance_r7.col0) AND
      (t_13_Distance_r7.col1 = Distance_r7.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_9_Distance_r8 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f9.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f9.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f9.logica_value) AS logica_value
FROM
  t_10_Distance_MultBodyAggAux_recursive_head_f9 AS Distance_MultBodyAggAux_recursive_head_f9
GROUP BY Distance_MultBodyAggAux_recursive_head_f9.col0, Distance_MultBodyAggAux_recursive_head_f9.col1),
t_5_Distance_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_6_Edge.col0 AS col0,
      t_6_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_6_Edge
   UNION ALL
  
    SELECT
      Distance_r8.col0 AS col0,
      t_7_Edge.col1 AS col1,
      ((t_8_Distance_r8.logica_value) + (1)) AS logica_value
    FROM
      t_9_Distance_r8 AS Distance_r8, t_1_Edge AS t_7_Edge, t_9_Distance_r8 AS t_8_Distance_r8
    WHERE
      (t_7_Edge.col0 = Distance_r8.col1) AND
      (t_8_Distance_r8.col0 = Distance_r8.col0) AND
      (t_8_Distance_r8.col1 = Distance_r8.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Distance_r9 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f10.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f10.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f10.logica_value) AS logica_value
FROM
  t_5_Distance_MultBodyAggAux_recursive_head_f10 AS Distance_MultBodyAggAux_recursive_head_f10
GROUP BY Distance_MultBodyAggAux_recursive_head_f10.col0, Distance_MultBodyAggAux_recursive_head_f10.col1),
t_0_Distance_MultBodyAggAux_recursive_head_f21 AS (SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Distance_r9.col0 AS col0,
      t_2_Edge.col1 AS col1,
      ((t_3_Distance_r9.logica_value) + (1)) AS logica_value
    FROM
      t_4_Distance_r9 AS Distance_r9, t_1_Edge AS t_2_Edge, t_4_Distance_r9 AS t_3_Distance_r9
    WHERE
      (t_2_Edge.col0 = Distance_r9.col1) AND
      (t_3_Distance_r9.col0 = Distance_r9.col0) AND
      (t_3_Distance_r9.col1 = Distance_r9.col1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Distance_MultBodyAggAux_recursive_head_f21.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f21.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f21.logica_value) AS logica_value
FROM
  t_0_Distance_MultBodyAggAux_recursive_head_f21 AS Distance_MultBodyAggAux_recursive_head_f21
GROUP BY Distance_MultBodyAggAux_recursive_head_f21.col0, Distance_MultBodyAggAux_recursive_head_f21.col1;