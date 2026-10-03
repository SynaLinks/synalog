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
WITH t_60_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_59_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.y AS y
FROM
  t_60_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY Reach_MultBodyAggAux_recursive_head_f1.y),
t_57_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_160) + (1)) AS y
    FROM
      t_59_Reach_r0 AS Reach_r0, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_160
    WHERE
      (Reach_r0.y = x_160)
  
) AS UNUSED_TABLE_NAME  ),
t_56_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2.y AS y
FROM
  t_57_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY Reach_MultBodyAggAux_recursive_head_f2.y),
t_54_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_152) + (1)) AS y
    FROM
      t_56_Reach_r1 AS Reach_r1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_152
    WHERE
      (Reach_r1.y = x_152)
  
) AS UNUSED_TABLE_NAME  ),
t_53_Reach_r2 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3.y AS y
FROM
  t_54_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY Reach_MultBodyAggAux_recursive_head_f3.y),
t_51_Reach_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_144) + (1)) AS y
    FROM
      t_53_Reach_r2 AS Reach_r2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_144
    WHERE
      (Reach_r2.y = x_144)
  
) AS UNUSED_TABLE_NAME  ),
t_50_Reach_r3 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4.y AS y
FROM
  t_51_Reach_MultBodyAggAux_recursive_head_f4 AS Reach_MultBodyAggAux_recursive_head_f4
GROUP BY Reach_MultBodyAggAux_recursive_head_f4.y),
t_48_Reach_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_136) + (1)) AS y
    FROM
      t_50_Reach_r3 AS Reach_r3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_136
    WHERE
      (Reach_r3.y = x_136)
  
) AS UNUSED_TABLE_NAME  ),
t_47_Reach_r4 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5.y AS y
FROM
  t_48_Reach_MultBodyAggAux_recursive_head_f5 AS Reach_MultBodyAggAux_recursive_head_f5
GROUP BY Reach_MultBodyAggAux_recursive_head_f5.y),
t_45_Reach_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_128) + (1)) AS y
    FROM
      t_47_Reach_r4 AS Reach_r4, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_128
    WHERE
      (Reach_r4.y = x_128)
  
) AS UNUSED_TABLE_NAME  ),
t_44_Reach_r5 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f6.y AS y
FROM
  t_45_Reach_MultBodyAggAux_recursive_head_f6 AS Reach_MultBodyAggAux_recursive_head_f6
GROUP BY Reach_MultBodyAggAux_recursive_head_f6.y),
t_42_Reach_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_120) + (1)) AS y
    FROM
      t_44_Reach_r5 AS Reach_r5, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_120
    WHERE
      (Reach_r5.y = x_120)
  
) AS UNUSED_TABLE_NAME  ),
t_41_Reach_r6 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f7.y AS y
FROM
  t_42_Reach_MultBodyAggAux_recursive_head_f7 AS Reach_MultBodyAggAux_recursive_head_f7
GROUP BY Reach_MultBodyAggAux_recursive_head_f7.y),
t_39_Reach_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_112) + (1)) AS y
    FROM
      t_41_Reach_r6 AS Reach_r6, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_112
    WHERE
      (Reach_r6.y = x_112)
  
) AS UNUSED_TABLE_NAME  ),
t_38_Reach_r7 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f8.y AS y
FROM
  t_39_Reach_MultBodyAggAux_recursive_head_f8 AS Reach_MultBodyAggAux_recursive_head_f8
GROUP BY Reach_MultBodyAggAux_recursive_head_f8.y),
t_36_Reach_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_104) + (1)) AS y
    FROM
      t_38_Reach_r7 AS Reach_r7, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_104
    WHERE
      (Reach_r7.y = x_104)
  
) AS UNUSED_TABLE_NAME  ),
t_35_Reach_r8 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f9.y AS y
FROM
  t_36_Reach_MultBodyAggAux_recursive_head_f9 AS Reach_MultBodyAggAux_recursive_head_f9
GROUP BY Reach_MultBodyAggAux_recursive_head_f9.y),
t_33_Reach_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_96) + (1)) AS y
    FROM
      t_35_Reach_r8 AS Reach_r8, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_96
    WHERE
      (Reach_r8.y = x_96)
  
) AS UNUSED_TABLE_NAME  ),
t_32_Reach_r9 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f10.y AS y
FROM
  t_33_Reach_MultBodyAggAux_recursive_head_f10 AS Reach_MultBodyAggAux_recursive_head_f10
GROUP BY Reach_MultBodyAggAux_recursive_head_f10.y),
t_30_Reach_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_88) + (1)) AS y
    FROM
      t_32_Reach_r9 AS Reach_r9, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_88
    WHERE
      (Reach_r9.y = x_88)
  
) AS UNUSED_TABLE_NAME  ),
t_29_Reach_r10 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f11.y AS y
FROM
  t_30_Reach_MultBodyAggAux_recursive_head_f11 AS Reach_MultBodyAggAux_recursive_head_f11
GROUP BY Reach_MultBodyAggAux_recursive_head_f11.y),
t_27_Reach_MultBodyAggAux_recursive_head_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_80) + (1)) AS y
    FROM
      t_29_Reach_r10 AS Reach_r10, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_80
    WHERE
      (Reach_r10.y = x_80)
  
) AS UNUSED_TABLE_NAME  ),
t_26_Reach_r11 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f12.y AS y
FROM
  t_27_Reach_MultBodyAggAux_recursive_head_f12 AS Reach_MultBodyAggAux_recursive_head_f12
GROUP BY Reach_MultBodyAggAux_recursive_head_f12.y),
t_24_Reach_MultBodyAggAux_recursive_head_f13 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_72) + (1)) AS y
    FROM
      t_26_Reach_r11 AS Reach_r11, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_72
    WHERE
      (Reach_r11.y = x_72)
  
) AS UNUSED_TABLE_NAME  ),
t_23_Reach_r12 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f13.y AS y
FROM
  t_24_Reach_MultBodyAggAux_recursive_head_f13 AS Reach_MultBodyAggAux_recursive_head_f13
GROUP BY Reach_MultBodyAggAux_recursive_head_f13.y),
t_21_Reach_MultBodyAggAux_recursive_head_f14 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_64) + (1)) AS y
    FROM
      t_23_Reach_r12 AS Reach_r12, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_64
    WHERE
      (Reach_r12.y = x_64)
  
) AS UNUSED_TABLE_NAME  ),
t_20_Reach_r13 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f14.y AS y
FROM
  t_21_Reach_MultBodyAggAux_recursive_head_f14 AS Reach_MultBodyAggAux_recursive_head_f14
GROUP BY Reach_MultBodyAggAux_recursive_head_f14.y),
t_18_Reach_MultBodyAggAux_recursive_head_f15 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_56) + (1)) AS y
    FROM
      t_20_Reach_r13 AS Reach_r13, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_56
    WHERE
      (Reach_r13.y = x_56)
  
) AS UNUSED_TABLE_NAME  ),
t_17_Reach_r14 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f15.y AS y
FROM
  t_18_Reach_MultBodyAggAux_recursive_head_f15 AS Reach_MultBodyAggAux_recursive_head_f15
GROUP BY Reach_MultBodyAggAux_recursive_head_f15.y),
t_15_Reach_MultBodyAggAux_recursive_head_f16 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_48) + (1)) AS y
    FROM
      t_17_Reach_r14 AS Reach_r14, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_48
    WHERE
      (Reach_r14.y = x_48)
  
) AS UNUSED_TABLE_NAME  ),
t_14_Reach_r15 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f16.y AS y
FROM
  t_15_Reach_MultBodyAggAux_recursive_head_f16 AS Reach_MultBodyAggAux_recursive_head_f16
GROUP BY Reach_MultBodyAggAux_recursive_head_f16.y),
t_12_Reach_MultBodyAggAux_recursive_head_f17 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_40) + (1)) AS y
    FROM
      t_14_Reach_r15 AS Reach_r15, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_40
    WHERE
      (Reach_r15.y = x_40)
  
) AS UNUSED_TABLE_NAME  ),
t_11_Reach_r16 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f17.y AS y
FROM
  t_12_Reach_MultBodyAggAux_recursive_head_f17 AS Reach_MultBodyAggAux_recursive_head_f17
GROUP BY Reach_MultBodyAggAux_recursive_head_f17.y),
t_9_Reach_MultBodyAggAux_recursive_head_f18 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_32) + (1)) AS y
    FROM
      t_11_Reach_r16 AS Reach_r16, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_32
    WHERE
      (Reach_r16.y = x_32)
  
) AS UNUSED_TABLE_NAME  ),
t_8_Reach_r17 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f18.y AS y
FROM
  t_9_Reach_MultBodyAggAux_recursive_head_f18 AS Reach_MultBodyAggAux_recursive_head_f18
GROUP BY Reach_MultBodyAggAux_recursive_head_f18.y),
t_6_Reach_MultBodyAggAux_recursive_head_f19 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_24) + (1)) AS y
    FROM
      t_8_Reach_r17 AS Reach_r17, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_24
    WHERE
      (Reach_r17.y = x_24)
  
) AS UNUSED_TABLE_NAME  ),
t_5_Reach_r18 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f19.y AS y
FROM
  t_6_Reach_MultBodyAggAux_recursive_head_f19 AS Reach_MultBodyAggAux_recursive_head_f19
GROUP BY Reach_MultBodyAggAux_recursive_head_f19.y),
t_3_Reach_MultBodyAggAux_recursive_head_f20 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_16) + (1)) AS y
    FROM
      t_5_Reach_r18 AS Reach_r18, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_16
    WHERE
      (Reach_r18.y = x_16)
  
) AS UNUSED_TABLE_NAME  ),
t_2_Reach_r19 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f20.y AS y
FROM
  t_3_Reach_MultBodyAggAux_recursive_head_f20 AS Reach_MultBodyAggAux_recursive_head_f20
GROUP BY Reach_MultBodyAggAux_recursive_head_f20.y),
t_1_Reach_MultBodyAggAux_recursive_head_f21 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_8) + (1)) AS y
    FROM
      t_2_Reach_r19 AS Reach_r19, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_8
    WHERE
      (Reach_r19.y = x_8)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f21.y AS y
FROM
  t_1_Reach_MultBodyAggAux_recursive_head_f21 AS Reach_MultBodyAggAux_recursive_head_f21
GROUP BY Reach_MultBodyAggAux_recursive_head_f21.y)
SELECT
  MAX(Reach.y) AS m
FROM
  t_0_Reach AS Reach;