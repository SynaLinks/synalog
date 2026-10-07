-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_Edge AS (SELECT * FROM (
  
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
t_31_Reachable_r0 AS (SELECT * FROM (
  
    SELECT
      t_32_Edge.col0 AS col0,
      t_32_Edge.col1 AS col1
    FROM
      t_2_Edge AS t_32_Edge
  
) AS UNUSED_TABLE_NAME  ),
t_28_Reachable_r1 AS (SELECT * FROM (
  
    SELECT
      t_29_Edge.col0 AS col0,
      t_29_Edge.col1 AS col1
    FROM
      t_2_Edge AS t_29_Edge
   UNION ALL
  
    SELECT
      Reachable_r0.col0 AS col0,
      t_30_Edge.col1 AS col1
    FROM
      t_31_Reachable_r0 AS Reachable_r0, t_2_Edge AS t_30_Edge
    WHERE
      (t_30_Edge.col0 = Reachable_r0.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_25_Reachable_r2 AS (SELECT * FROM (
  
    SELECT
      t_26_Edge.col0 AS col0,
      t_26_Edge.col1 AS col1
    FROM
      t_2_Edge AS t_26_Edge
   UNION ALL
  
    SELECT
      Reachable_r1.col0 AS col0,
      t_27_Edge.col1 AS col1
    FROM
      t_28_Reachable_r1 AS Reachable_r1, t_2_Edge AS t_27_Edge
    WHERE
      (t_27_Edge.col0 = Reachable_r1.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_22_Reachable_r3 AS (SELECT * FROM (
  
    SELECT
      t_23_Edge.col0 AS col0,
      t_23_Edge.col1 AS col1
    FROM
      t_2_Edge AS t_23_Edge
   UNION ALL
  
    SELECT
      Reachable_r2.col0 AS col0,
      t_24_Edge.col1 AS col1
    FROM
      t_25_Reachable_r2 AS Reachable_r2, t_2_Edge AS t_24_Edge
    WHERE
      (t_24_Edge.col0 = Reachable_r2.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_19_Reachable_r4 AS (SELECT * FROM (
  
    SELECT
      t_20_Edge.col0 AS col0,
      t_20_Edge.col1 AS col1
    FROM
      t_2_Edge AS t_20_Edge
   UNION ALL
  
    SELECT
      Reachable_r3.col0 AS col0,
      t_21_Edge.col1 AS col1
    FROM
      t_22_Reachable_r3 AS Reachable_r3, t_2_Edge AS t_21_Edge
    WHERE
      (t_21_Edge.col0 = Reachable_r3.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_16_Reachable_r5 AS (SELECT * FROM (
  
    SELECT
      t_17_Edge.col0 AS col0,
      t_17_Edge.col1 AS col1
    FROM
      t_2_Edge AS t_17_Edge
   UNION ALL
  
    SELECT
      Reachable_r4.col0 AS col0,
      t_18_Edge.col1 AS col1
    FROM
      t_19_Reachable_r4 AS Reachable_r4, t_2_Edge AS t_18_Edge
    WHERE
      (t_18_Edge.col0 = Reachable_r4.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_13_Reachable_r6 AS (SELECT * FROM (
  
    SELECT
      t_14_Edge.col0 AS col0,
      t_14_Edge.col1 AS col1
    FROM
      t_2_Edge AS t_14_Edge
   UNION ALL
  
    SELECT
      Reachable_r5.col0 AS col0,
      t_15_Edge.col1 AS col1
    FROM
      t_16_Reachable_r5 AS Reachable_r5, t_2_Edge AS t_15_Edge
    WHERE
      (t_15_Edge.col0 = Reachable_r5.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_10_Reachable_r7 AS (SELECT * FROM (
  
    SELECT
      t_11_Edge.col0 AS col0,
      t_11_Edge.col1 AS col1
    FROM
      t_2_Edge AS t_11_Edge
   UNION ALL
  
    SELECT
      Reachable_r6.col0 AS col0,
      t_12_Edge.col1 AS col1
    FROM
      t_13_Reachable_r6 AS Reachable_r6, t_2_Edge AS t_12_Edge
    WHERE
      (t_12_Edge.col0 = Reachable_r6.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_7_Reachable_r8 AS (SELECT * FROM (
  
    SELECT
      t_8_Edge.col0 AS col0,
      t_8_Edge.col1 AS col1
    FROM
      t_2_Edge AS t_8_Edge
   UNION ALL
  
    SELECT
      Reachable_r7.col0 AS col0,
      t_9_Edge.col1 AS col1
    FROM
      t_10_Reachable_r7 AS Reachable_r7, t_2_Edge AS t_9_Edge
    WHERE
      (t_9_Edge.col0 = Reachable_r7.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Reachable_r9 AS (SELECT * FROM (
  
    SELECT
      t_5_Edge.col0 AS col0,
      t_5_Edge.col1 AS col1
    FROM
      t_2_Edge AS t_5_Edge
   UNION ALL
  
    SELECT
      Reachable_r8.col0 AS col0,
      t_6_Edge.col1 AS col1
    FROM
      t_7_Reachable_r8 AS Reachable_r8, t_2_Edge AS t_6_Edge
    WHERE
      (t_6_Edge.col0 = Reachable_r8.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reachable AS (SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_2_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_r9.col0 AS col0,
      t_3_Edge.col1 AS col1
    FROM
      t_4_Reachable_r9 AS Reachable_r9, t_2_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.col0 = Reachable_r9.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_85_Distance_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_86_Edge.col0 AS col0,
      t_86_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_86_Edge
  
) AS UNUSED_TABLE_NAME  ),
t_84_Distance_r0 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f1.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f1.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f1.logica_value) AS logica_value
FROM
  t_85_Distance_MultBodyAggAux_recursive_head_f1 AS Distance_MultBodyAggAux_recursive_head_f1
GROUP BY Distance_MultBodyAggAux_recursive_head_f1.col0, Distance_MultBodyAggAux_recursive_head_f1.col1),
t_80_Distance_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_81_Edge.col0 AS col0,
      t_81_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_81_Edge
   UNION ALL
  
    SELECT
      Distance_r0.col0 AS col0,
      t_82_Edge.col1 AS col1,
      ((t_83_Distance_r0.logica_value) + (1)) AS logica_value
    FROM
      t_84_Distance_r0 AS Distance_r0, t_2_Edge AS t_82_Edge, t_84_Distance_r0 AS t_83_Distance_r0
    WHERE
      (t_82_Edge.col0 = Distance_r0.col1) AND
      (t_83_Distance_r0.col0 = Distance_r0.col0) AND
      (t_83_Distance_r0.col1 = Distance_r0.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_79_Distance_r1 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f2.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f2.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f2.logica_value) AS logica_value
FROM
  t_80_Distance_MultBodyAggAux_recursive_head_f2 AS Distance_MultBodyAggAux_recursive_head_f2
GROUP BY Distance_MultBodyAggAux_recursive_head_f2.col0, Distance_MultBodyAggAux_recursive_head_f2.col1),
t_75_Distance_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_76_Edge.col0 AS col0,
      t_76_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_76_Edge
   UNION ALL
  
    SELECT
      Distance_r1.col0 AS col0,
      t_77_Edge.col1 AS col1,
      ((t_78_Distance_r1.logica_value) + (1)) AS logica_value
    FROM
      t_79_Distance_r1 AS Distance_r1, t_2_Edge AS t_77_Edge, t_79_Distance_r1 AS t_78_Distance_r1
    WHERE
      (t_77_Edge.col0 = Distance_r1.col1) AND
      (t_78_Distance_r1.col0 = Distance_r1.col0) AND
      (t_78_Distance_r1.col1 = Distance_r1.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_74_Distance_r2 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f3.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f3.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f3.logica_value) AS logica_value
FROM
  t_75_Distance_MultBodyAggAux_recursive_head_f3 AS Distance_MultBodyAggAux_recursive_head_f3
GROUP BY Distance_MultBodyAggAux_recursive_head_f3.col0, Distance_MultBodyAggAux_recursive_head_f3.col1),
t_70_Distance_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_71_Edge.col0 AS col0,
      t_71_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_71_Edge
   UNION ALL
  
    SELECT
      Distance_r2.col0 AS col0,
      t_72_Edge.col1 AS col1,
      ((t_73_Distance_r2.logica_value) + (1)) AS logica_value
    FROM
      t_74_Distance_r2 AS Distance_r2, t_2_Edge AS t_72_Edge, t_74_Distance_r2 AS t_73_Distance_r2
    WHERE
      (t_72_Edge.col0 = Distance_r2.col1) AND
      (t_73_Distance_r2.col0 = Distance_r2.col0) AND
      (t_73_Distance_r2.col1 = Distance_r2.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_69_Distance_r3 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f4.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f4.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f4.logica_value) AS logica_value
FROM
  t_70_Distance_MultBodyAggAux_recursive_head_f4 AS Distance_MultBodyAggAux_recursive_head_f4
GROUP BY Distance_MultBodyAggAux_recursive_head_f4.col0, Distance_MultBodyAggAux_recursive_head_f4.col1),
t_65_Distance_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_66_Edge.col0 AS col0,
      t_66_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_66_Edge
   UNION ALL
  
    SELECT
      Distance_r3.col0 AS col0,
      t_67_Edge.col1 AS col1,
      ((t_68_Distance_r3.logica_value) + (1)) AS logica_value
    FROM
      t_69_Distance_r3 AS Distance_r3, t_2_Edge AS t_67_Edge, t_69_Distance_r3 AS t_68_Distance_r3
    WHERE
      (t_67_Edge.col0 = Distance_r3.col1) AND
      (t_68_Distance_r3.col0 = Distance_r3.col0) AND
      (t_68_Distance_r3.col1 = Distance_r3.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_64_Distance_r4 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f5.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f5.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f5.logica_value) AS logica_value
FROM
  t_65_Distance_MultBodyAggAux_recursive_head_f5 AS Distance_MultBodyAggAux_recursive_head_f5
GROUP BY Distance_MultBodyAggAux_recursive_head_f5.col0, Distance_MultBodyAggAux_recursive_head_f5.col1),
t_60_Distance_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_61_Edge.col0 AS col0,
      t_61_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_61_Edge
   UNION ALL
  
    SELECT
      Distance_r4.col0 AS col0,
      t_62_Edge.col1 AS col1,
      ((t_63_Distance_r4.logica_value) + (1)) AS logica_value
    FROM
      t_64_Distance_r4 AS Distance_r4, t_2_Edge AS t_62_Edge, t_64_Distance_r4 AS t_63_Distance_r4
    WHERE
      (t_62_Edge.col0 = Distance_r4.col1) AND
      (t_63_Distance_r4.col0 = Distance_r4.col0) AND
      (t_63_Distance_r4.col1 = Distance_r4.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_59_Distance_r5 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f6.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f6.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f6.logica_value) AS logica_value
FROM
  t_60_Distance_MultBodyAggAux_recursive_head_f6 AS Distance_MultBodyAggAux_recursive_head_f6
GROUP BY Distance_MultBodyAggAux_recursive_head_f6.col0, Distance_MultBodyAggAux_recursive_head_f6.col1),
t_55_Distance_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_56_Edge.col0 AS col0,
      t_56_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_56_Edge
   UNION ALL
  
    SELECT
      Distance_r5.col0 AS col0,
      t_57_Edge.col1 AS col1,
      ((t_58_Distance_r5.logica_value) + (1)) AS logica_value
    FROM
      t_59_Distance_r5 AS Distance_r5, t_2_Edge AS t_57_Edge, t_59_Distance_r5 AS t_58_Distance_r5
    WHERE
      (t_57_Edge.col0 = Distance_r5.col1) AND
      (t_58_Distance_r5.col0 = Distance_r5.col0) AND
      (t_58_Distance_r5.col1 = Distance_r5.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_54_Distance_r6 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f7.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f7.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f7.logica_value) AS logica_value
FROM
  t_55_Distance_MultBodyAggAux_recursive_head_f7 AS Distance_MultBodyAggAux_recursive_head_f7
GROUP BY Distance_MultBodyAggAux_recursive_head_f7.col0, Distance_MultBodyAggAux_recursive_head_f7.col1),
t_50_Distance_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_51_Edge.col0 AS col0,
      t_51_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_51_Edge
   UNION ALL
  
    SELECT
      Distance_r6.col0 AS col0,
      t_52_Edge.col1 AS col1,
      ((t_53_Distance_r6.logica_value) + (1)) AS logica_value
    FROM
      t_54_Distance_r6 AS Distance_r6, t_2_Edge AS t_52_Edge, t_54_Distance_r6 AS t_53_Distance_r6
    WHERE
      (t_52_Edge.col0 = Distance_r6.col1) AND
      (t_53_Distance_r6.col0 = Distance_r6.col0) AND
      (t_53_Distance_r6.col1 = Distance_r6.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_49_Distance_r7 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f8.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f8.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f8.logica_value) AS logica_value
FROM
  t_50_Distance_MultBodyAggAux_recursive_head_f8 AS Distance_MultBodyAggAux_recursive_head_f8
GROUP BY Distance_MultBodyAggAux_recursive_head_f8.col0, Distance_MultBodyAggAux_recursive_head_f8.col1),
t_45_Distance_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_46_Edge.col0 AS col0,
      t_46_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_46_Edge
   UNION ALL
  
    SELECT
      Distance_r7.col0 AS col0,
      t_47_Edge.col1 AS col1,
      ((t_48_Distance_r7.logica_value) + (1)) AS logica_value
    FROM
      t_49_Distance_r7 AS Distance_r7, t_2_Edge AS t_47_Edge, t_49_Distance_r7 AS t_48_Distance_r7
    WHERE
      (t_47_Edge.col0 = Distance_r7.col1) AND
      (t_48_Distance_r7.col0 = Distance_r7.col0) AND
      (t_48_Distance_r7.col1 = Distance_r7.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_44_Distance_r8 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f9.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f9.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f9.logica_value) AS logica_value
FROM
  t_45_Distance_MultBodyAggAux_recursive_head_f9 AS Distance_MultBodyAggAux_recursive_head_f9
GROUP BY Distance_MultBodyAggAux_recursive_head_f9.col0, Distance_MultBodyAggAux_recursive_head_f9.col1),
t_40_Distance_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_41_Edge.col0 AS col0,
      t_41_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_41_Edge
   UNION ALL
  
    SELECT
      Distance_r8.col0 AS col0,
      t_42_Edge.col1 AS col1,
      ((t_43_Distance_r8.logica_value) + (1)) AS logica_value
    FROM
      t_44_Distance_r8 AS Distance_r8, t_2_Edge AS t_42_Edge, t_44_Distance_r8 AS t_43_Distance_r8
    WHERE
      (t_42_Edge.col0 = Distance_r8.col1) AND
      (t_43_Distance_r8.col0 = Distance_r8.col0) AND
      (t_43_Distance_r8.col1 = Distance_r8.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_39_Distance_r9 AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f10.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f10.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f10.logica_value) AS logica_value
FROM
  t_40_Distance_MultBodyAggAux_recursive_head_f10 AS Distance_MultBodyAggAux_recursive_head_f10
GROUP BY Distance_MultBodyAggAux_recursive_head_f10.col0, Distance_MultBodyAggAux_recursive_head_f10.col1),
t_35_Distance_MultBodyAggAux_recursive_head_f21 AS (SELECT * FROM (
  
    SELECT
      t_36_Edge.col0 AS col0,
      t_36_Edge.col1 AS col1,
      1 AS logica_value
    FROM
      t_2_Edge AS t_36_Edge
   UNION ALL
  
    SELECT
      Distance_r9.col0 AS col0,
      t_37_Edge.col1 AS col1,
      ((t_38_Distance_r9.logica_value) + (1)) AS logica_value
    FROM
      t_39_Distance_r9 AS Distance_r9, t_2_Edge AS t_37_Edge, t_39_Distance_r9 AS t_38_Distance_r9
    WHERE
      (t_37_Edge.col0 = Distance_r9.col1) AND
      (t_38_Distance_r9.col0 = Distance_r9.col0) AND
      (t_38_Distance_r9.col1 = Distance_r9.col1)
  
) AS UNUSED_TABLE_NAME  ),
t_34_Distance AS (SELECT
  Distance_MultBodyAggAux_recursive_head_f21.col0 AS col0,
  Distance_MultBodyAggAux_recursive_head_f21.col1 AS col1,
  MIN(Distance_MultBodyAggAux_recursive_head_f21.logica_value) AS logica_value
FROM
  t_35_Distance_MultBodyAggAux_recursive_head_f21 AS Distance_MultBodyAggAux_recursive_head_f21
GROUP BY Distance_MultBodyAggAux_recursive_head_f21.col0, Distance_MultBodyAggAux_recursive_head_f21.col1)
SELECT
  Reachable.col0 AS src,
  Reachable.col1 AS dst,
  t_0_Distance.logica_value AS distance
FROM
  t_1_Reachable AS Reachable, t_34_Distance AS t_0_Distance
WHERE
  (t_0_Distance.col0 = Reachable.col0) AND
  (t_0_Distance.col1 = Reachable.col1) ORDER BY src, dst;