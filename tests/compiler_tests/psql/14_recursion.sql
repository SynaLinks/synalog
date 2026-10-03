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
  
) AS UNUSED_TABLE_NAME  ),
t_84_Distance_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_85_Edge.col0 AS col0,
      t_85_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_85_Edge
  
) AS UNUSED_TABLE_NAME  ),
t_83_Distance_r0 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f1.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f1.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f1.logica_value) AS logica_value
FROM
  t_84_Distance_MultBodyAggAux_recursive_head_f1 AS Distance_MultBodyAggAux_recursive_head_f1
GROUP BY Distance_MultBodyAggAux_recursive_head_f1.col0, Distance_MultBodyAggAux_recursive_head_f1.col1),
t_79_Distance_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_80_Edge.col0 AS col0,
      t_80_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_80_Edge
   UNION ALL
  
    SELECT
      Distance_r0.col0 AS col0,
      t_81_Edge.col1 AS col1,
      ((t_82_Distance_r0.logica_value) + (1)) AS logica_value
    FROM
      t_83_Distance_r0 AS Distance_r0, t_1_Edge AS t_81_Edge, t_83_Distance_r0 AS t_82_Distance_r0
    WHERE
      (t_81_Edge.col0 = Distance_r0.col1) AND
      (t_82_Distance_r0.col0 = Distance_r0.col0) AND
      (t_82_Distance_r0.col1 = Distance_r0.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_78_Distance_r1 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f2.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f2.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f2.logica_value) AS logica_value
FROM
  t_79_Distance_MultBodyAggAux_recursive_head_f2 AS Distance_MultBodyAggAux_recursive_head_f2
GROUP BY Distance_MultBodyAggAux_recursive_head_f2.col0, Distance_MultBodyAggAux_recursive_head_f2.col1),
t_74_Distance_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_75_Edge.col0 AS col0,
      t_75_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_75_Edge
   UNION ALL
  
    SELECT
      Distance_r1.col0 AS col0,
      t_76_Edge.col1 AS col1,
      ((t_77_Distance_r1.logica_value) + (1)) AS logica_value
    FROM
      t_78_Distance_r1 AS Distance_r1, t_1_Edge AS t_76_Edge, t_78_Distance_r1 AS t_77_Distance_r1
    WHERE
      (t_76_Edge.col0 = Distance_r1.col1) AND
      (t_77_Distance_r1.col0 = Distance_r1.col0) AND
      (t_77_Distance_r1.col1 = Distance_r1.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_73_Distance_r2 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f3.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f3.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f3.logica_value) AS logica_value
FROM
  t_74_Distance_MultBodyAggAux_recursive_head_f3 AS Distance_MultBodyAggAux_recursive_head_f3
GROUP BY Distance_MultBodyAggAux_recursive_head_f3.col0, Distance_MultBodyAggAux_recursive_head_f3.col1),
t_69_Distance_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_70_Edge.col0 AS col0,
      t_70_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_70_Edge
   UNION ALL
  
    SELECT
      Distance_r2.col0 AS col0,
      t_71_Edge.col1 AS col1,
      ((t_72_Distance_r2.logica_value) + (1)) AS logica_value
    FROM
      t_73_Distance_r2 AS Distance_r2, t_1_Edge AS t_71_Edge, t_73_Distance_r2 AS t_72_Distance_r2
    WHERE
      (t_71_Edge.col0 = Distance_r2.col1) AND
      (t_72_Distance_r2.col0 = Distance_r2.col0) AND
      (t_72_Distance_r2.col1 = Distance_r2.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_68_Distance_r3 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f4.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f4.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f4.logica_value) AS logica_value
FROM
  t_69_Distance_MultBodyAggAux_recursive_head_f4 AS Distance_MultBodyAggAux_recursive_head_f4
GROUP BY Distance_MultBodyAggAux_recursive_head_f4.col0, Distance_MultBodyAggAux_recursive_head_f4.col1),
t_64_Distance_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_65_Edge.col0 AS col0,
      t_65_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_65_Edge
   UNION ALL
  
    SELECT
      Distance_r3.col0 AS col0,
      t_66_Edge.col1 AS col1,
      ((t_67_Distance_r3.logica_value) + (1)) AS logica_value
    FROM
      t_68_Distance_r3 AS Distance_r3, t_1_Edge AS t_66_Edge, t_68_Distance_r3 AS t_67_Distance_r3
    WHERE
      (t_66_Edge.col0 = Distance_r3.col1) AND
      (t_67_Distance_r3.col0 = Distance_r3.col0) AND
      (t_67_Distance_r3.col1 = Distance_r3.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_63_Distance_r4 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f5.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f5.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f5.logica_value) AS logica_value
FROM
  t_64_Distance_MultBodyAggAux_recursive_head_f5 AS Distance_MultBodyAggAux_recursive_head_f5
GROUP BY Distance_MultBodyAggAux_recursive_head_f5.col0, Distance_MultBodyAggAux_recursive_head_f5.col1),
t_59_Distance_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_60_Edge.col0 AS col0,
      t_60_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_60_Edge
   UNION ALL
  
    SELECT
      Distance_r4.col0 AS col0,
      t_61_Edge.col1 AS col1,
      ((t_62_Distance_r4.logica_value) + (1)) AS logica_value
    FROM
      t_63_Distance_r4 AS Distance_r4, t_1_Edge AS t_61_Edge, t_63_Distance_r4 AS t_62_Distance_r4
    WHERE
      (t_61_Edge.col0 = Distance_r4.col1) AND
      (t_62_Distance_r4.col0 = Distance_r4.col0) AND
      (t_62_Distance_r4.col1 = Distance_r4.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_58_Distance_r5 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f6.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f6.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f6.logica_value) AS logica_value
FROM
  t_59_Distance_MultBodyAggAux_recursive_head_f6 AS Distance_MultBodyAggAux_recursive_head_f6
GROUP BY Distance_MultBodyAggAux_recursive_head_f6.col0, Distance_MultBodyAggAux_recursive_head_f6.col1),
t_54_Distance_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_55_Edge.col0 AS col0,
      t_55_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_55_Edge
   UNION ALL
  
    SELECT
      Distance_r5.col0 AS col0,
      t_56_Edge.col1 AS col1,
      ((t_57_Distance_r5.logica_value) + (1)) AS logica_value
    FROM
      t_58_Distance_r5 AS Distance_r5, t_1_Edge AS t_56_Edge, t_58_Distance_r5 AS t_57_Distance_r5
    WHERE
      (t_56_Edge.col0 = Distance_r5.col1) AND
      (t_57_Distance_r5.col0 = Distance_r5.col0) AND
      (t_57_Distance_r5.col1 = Distance_r5.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_53_Distance_r6 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f7.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f7.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f7.logica_value) AS logica_value
FROM
  t_54_Distance_MultBodyAggAux_recursive_head_f7 AS Distance_MultBodyAggAux_recursive_head_f7
GROUP BY Distance_MultBodyAggAux_recursive_head_f7.col0, Distance_MultBodyAggAux_recursive_head_f7.col1),
t_49_Distance_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_50_Edge.col0 AS col0,
      t_50_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_50_Edge
   UNION ALL
  
    SELECT
      Distance_r6.col0 AS col0,
      t_51_Edge.col1 AS col1,
      ((t_52_Distance_r6.logica_value) + (1)) AS logica_value
    FROM
      t_53_Distance_r6 AS Distance_r6, t_1_Edge AS t_51_Edge, t_53_Distance_r6 AS t_52_Distance_r6
    WHERE
      (t_51_Edge.col0 = Distance_r6.col1) AND
      (t_52_Distance_r6.col0 = Distance_r6.col0) AND
      (t_52_Distance_r6.col1 = Distance_r6.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_48_Distance_r7 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f8.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f8.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f8.logica_value) AS logica_value
FROM
  t_49_Distance_MultBodyAggAux_recursive_head_f8 AS Distance_MultBodyAggAux_recursive_head_f8
GROUP BY Distance_MultBodyAggAux_recursive_head_f8.col0, Distance_MultBodyAggAux_recursive_head_f8.col1),
t_44_Distance_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_45_Edge.col0 AS col0,
      t_45_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_45_Edge
   UNION ALL
  
    SELECT
      Distance_r7.col0 AS col0,
      t_46_Edge.col1 AS col1,
      ((t_47_Distance_r7.logica_value) + (1)) AS logica_value
    FROM
      t_48_Distance_r7 AS Distance_r7, t_1_Edge AS t_46_Edge, t_48_Distance_r7 AS t_47_Distance_r7
    WHERE
      (t_46_Edge.col0 = Distance_r7.col1) AND
      (t_47_Distance_r7.col0 = Distance_r7.col0) AND
      (t_47_Distance_r7.col1 = Distance_r7.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_43_Distance_r8 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f9.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f9.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f9.logica_value) AS logica_value
FROM
  t_44_Distance_MultBodyAggAux_recursive_head_f9 AS Distance_MultBodyAggAux_recursive_head_f9
GROUP BY Distance_MultBodyAggAux_recursive_head_f9.col0, Distance_MultBodyAggAux_recursive_head_f9.col1),
t_39_Distance_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_40_Edge.col0 AS col0,
      t_40_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_40_Edge
   UNION ALL
  
    SELECT
      Distance_r8.col0 AS col0,
      t_41_Edge.col1 AS col1,
      ((t_42_Distance_r8.logica_value) + (1)) AS logica_value
    FROM
      t_43_Distance_r8 AS Distance_r8, t_1_Edge AS t_41_Edge, t_43_Distance_r8 AS t_42_Distance_r8
    WHERE
      (t_41_Edge.col0 = Distance_r8.col1) AND
      (t_42_Distance_r8.col0 = Distance_r8.col0) AND
      (t_42_Distance_r8.col1 = Distance_r8.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_38_Distance_r9 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f10.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f10.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f10.logica_value) AS logica_value
FROM
  t_39_Distance_MultBodyAggAux_recursive_head_f10 AS Distance_MultBodyAggAux_recursive_head_f10
GROUP BY Distance_MultBodyAggAux_recursive_head_f10.col0, Distance_MultBodyAggAux_recursive_head_f10.col1),
t_34_Distance_MultBodyAggAux_recursive_head_f21 AS (SELECT * FROM (
  
    SELECT
      t_35_Edge.col0 AS col0,
      t_35_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_1_Edge AS t_35_Edge
   UNION ALL
  
    SELECT
      Distance_r9.col0 AS col0,
      t_36_Edge.col1 AS col1,
      ((t_37_Distance_r9.logica_value) + (1)) AS logica_value
    FROM
      t_38_Distance_r9 AS Distance_r9, t_1_Edge AS t_36_Edge, t_38_Distance_r9 AS t_37_Distance_r9
    WHERE
      (t_36_Edge.col0 = Distance_r9.col1) AND
      (t_37_Distance_r9.col0 = Distance_r9.col0) AND
      (t_37_Distance_r9.col1 = Distance_r9.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_33_Distance AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f21.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f21.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f21.logica_value) AS logica_value
FROM
  t_34_Distance_MultBodyAggAux_recursive_head_f21 AS Distance_MultBodyAggAux_recursive_head_f21
GROUP BY Distance_MultBodyAggAux_recursive_head_f21.col0, Distance_MultBodyAggAux_recursive_head_f21.col1)
SELECT
  Reachable.col0 AS src,
  Reachable.col1 AS dst,
  Distance.logica_value AS distance
FROM
  t_0_Reachable AS Reachable, t_33_Distance AS Distance
WHERE
  (Distance.col0 = Reachable.col0) AND
  (Distance.col1 = Reachable.col1) ORDER BY src, dst;