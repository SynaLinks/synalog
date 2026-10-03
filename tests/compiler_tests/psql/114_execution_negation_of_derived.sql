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
WITH t_30_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_29_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.x AS x,
  Reach_MultBodyAggAux_recursive_head_f1.y AS y
FROM
  t_30_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY Reach_MultBodyAggAux_recursive_head_f1.x, Reach_MultBodyAggAux_recursive_head_f1.y),
t_32_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_27_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      Reach_r0.x AS x,
      t_28_Edge.y AS y
    FROM
      t_29_Reach_r0 AS Reach_r0, t_32_Edge AS t_28_Edge
    WHERE
      (t_28_Edge.x = Reach_r0.y)
  
) AS UNUSED_TABLE_NAME  ),
t_26_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2.x AS x,
  Reach_MultBodyAggAux_recursive_head_f2.y AS y
FROM
  t_27_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY Reach_MultBodyAggAux_recursive_head_f2.x, Reach_MultBodyAggAux_recursive_head_f2.y),
t_24_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      Reach_r1.x AS x,
      t_25_Edge.y AS y
    FROM
      t_26_Reach_r1 AS Reach_r1, t_32_Edge AS t_25_Edge
    WHERE
      (t_25_Edge.x = Reach_r1.y)
  
) AS UNUSED_TABLE_NAME  ),
t_23_Reach_r2 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3.x AS x,
  Reach_MultBodyAggAux_recursive_head_f3.y AS y
FROM
  t_24_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY Reach_MultBodyAggAux_recursive_head_f3.x, Reach_MultBodyAggAux_recursive_head_f3.y),
t_21_Reach_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      Reach_r2.x AS x,
      t_22_Edge.y AS y
    FROM
      t_23_Reach_r2 AS Reach_r2, t_32_Edge AS t_22_Edge
    WHERE
      (t_22_Edge.x = Reach_r2.y)
  
) AS UNUSED_TABLE_NAME  ),
t_20_Reach_r3 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4.x AS x,
  Reach_MultBodyAggAux_recursive_head_f4.y AS y
FROM
  t_21_Reach_MultBodyAggAux_recursive_head_f4 AS Reach_MultBodyAggAux_recursive_head_f4
GROUP BY Reach_MultBodyAggAux_recursive_head_f4.x, Reach_MultBodyAggAux_recursive_head_f4.y),
t_18_Reach_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      Reach_r3.x AS x,
      t_19_Edge.y AS y
    FROM
      t_20_Reach_r3 AS Reach_r3, t_32_Edge AS t_19_Edge
    WHERE
      (t_19_Edge.x = Reach_r3.y)
  
) AS UNUSED_TABLE_NAME  ),
t_17_Reach_r4 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5.x AS x,
  Reach_MultBodyAggAux_recursive_head_f5.y AS y
FROM
  t_18_Reach_MultBodyAggAux_recursive_head_f5 AS Reach_MultBodyAggAux_recursive_head_f5
GROUP BY Reach_MultBodyAggAux_recursive_head_f5.x, Reach_MultBodyAggAux_recursive_head_f5.y),
t_15_Reach_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      Reach_r4.x AS x,
      t_16_Edge.y AS y
    FROM
      t_17_Reach_r4 AS Reach_r4, t_32_Edge AS t_16_Edge
    WHERE
      (t_16_Edge.x = Reach_r4.y)
  
) AS UNUSED_TABLE_NAME  ),
t_14_Reach_r5 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f6.x AS x,
  Reach_MultBodyAggAux_recursive_head_f6.y AS y
FROM
  t_15_Reach_MultBodyAggAux_recursive_head_f6 AS Reach_MultBodyAggAux_recursive_head_f6
GROUP BY Reach_MultBodyAggAux_recursive_head_f6.x, Reach_MultBodyAggAux_recursive_head_f6.y),
t_12_Reach_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      Reach_r5.x AS x,
      t_13_Edge.y AS y
    FROM
      t_14_Reach_r5 AS Reach_r5, t_32_Edge AS t_13_Edge
    WHERE
      (t_13_Edge.x = Reach_r5.y)
  
) AS UNUSED_TABLE_NAME  ),
t_11_Reach_r6 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f7.x AS x,
  Reach_MultBodyAggAux_recursive_head_f7.y AS y
FROM
  t_12_Reach_MultBodyAggAux_recursive_head_f7 AS Reach_MultBodyAggAux_recursive_head_f7
GROUP BY Reach_MultBodyAggAux_recursive_head_f7.x, Reach_MultBodyAggAux_recursive_head_f7.y),
t_9_Reach_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      Reach_r6.x AS x,
      t_10_Edge.y AS y
    FROM
      t_11_Reach_r6 AS Reach_r6, t_32_Edge AS t_10_Edge
    WHERE
      (t_10_Edge.x = Reach_r6.y)
  
) AS UNUSED_TABLE_NAME  ),
t_8_Reach_r7 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f8.x AS x,
  Reach_MultBodyAggAux_recursive_head_f8.y AS y
FROM
  t_9_Reach_MultBodyAggAux_recursive_head_f8 AS Reach_MultBodyAggAux_recursive_head_f8
GROUP BY Reach_MultBodyAggAux_recursive_head_f8.x, Reach_MultBodyAggAux_recursive_head_f8.y),
t_6_Reach_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      Reach_r7.x AS x,
      t_7_Edge.y AS y
    FROM
      t_8_Reach_r7 AS Reach_r7, t_32_Edge AS t_7_Edge
    WHERE
      (t_7_Edge.x = Reach_r7.y)
  
) AS UNUSED_TABLE_NAME  ),
t_5_Reach_r8 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f9.x AS x,
  Reach_MultBodyAggAux_recursive_head_f9.y AS y
FROM
  t_6_Reach_MultBodyAggAux_recursive_head_f9 AS Reach_MultBodyAggAux_recursive_head_f9
GROUP BY Reach_MultBodyAggAux_recursive_head_f9.x, Reach_MultBodyAggAux_recursive_head_f9.y),
t_3_Reach_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      Reach_r8.x AS x,
      t_4_Edge.y AS y
    FROM
      t_5_Reach_r8 AS Reach_r8, t_32_Edge AS t_4_Edge
    WHERE
      (t_4_Edge.x = Reach_r8.y)
  
) AS UNUSED_TABLE_NAME  ),
t_2_Reach_r9 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f10.x AS x,
  Reach_MultBodyAggAux_recursive_head_f10.y AS y
FROM
  t_3_Reach_MultBodyAggAux_recursive_head_f10 AS Reach_MultBodyAggAux_recursive_head_f10
GROUP BY Reach_MultBodyAggAux_recursive_head_f10.x, Reach_MultBodyAggAux_recursive_head_f10.y),
t_1_Reach_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      Reach_r9.x AS x,
      Edge.y AS y
    FROM
      t_2_Reach_r9 AS Reach_r9, t_32_Edge AS Edge
    WHERE
      (Edge.x = Reach_r9.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f11.x AS x,
  Reach_MultBodyAggAux_recursive_head_f11.y AS y
FROM
  t_1_Reach_MultBodyAggAux_recursive_head_f11 AS Reach_MultBodyAggAux_recursive_head_f11
GROUP BY Reach_MultBodyAggAux_recursive_head_f11.x, Reach_MultBodyAggAux_recursive_head_f11.y)
SELECT
  x_3 AS n
FROM
  UNNEST(ARRAY['a', 'b', 'c', 'e']::text[]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_7 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_Reach AS Reach, UNNEST(ARRAY[0]::numeric[]) as x_7
  WHERE
    (Reach.x = 'a') AND
    (Reach.y = x_3)) AS numeric) IS NULL) ORDER BY n;