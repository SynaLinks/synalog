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
WITH t_2_Ship AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'acme' AS client,
      'paris' AS src,
      'lyon' AS dst,
      12 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      2 AS id,
      'acme' AS client,
      'lyon' AS src,
      'nice' AS dst,
      5 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      3 AS id,
      'bolt' AS client,
      'paris' AS src,
      'nice' AS dst,
      30 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      4 AS id,
      'bolt' AS client,
      'nice' AS src,
      'rome' AS dst,
      8 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      5 AS id,
      'cora' AS client,
      'rome' AS src,
      'milan' AS dst,
      14 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      6 AS id,
      'cora' AS client,
      'milan' AS src,
      'paris' AS dst,
      3 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      7 AS id,
      'acme' AS client,
      'paris' AS src,
      'rome' AS dst,
      22 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      8 AS id,
      'dune' AS client,
      'lyon' AS src,
      'paris' AS dst,
      9 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      9 AS id,
      'dune' AS client,
      'nice' AS src,
      'lyon' AS dst,
      11 AS kg,
      'dhl' AS carrier
  
) AS UNUSED_TABLE_NAME  ),
t_36_Reach_MultBodyAggAux_recursive_head_f1_f10 AS (SELECT * FROM (
  
    SELECT
      t_38_Ship.src AS a,
      t_38_Ship.dst AS b
    FROM
      t_2_Ship AS t_38_Ship
  
) AS UNUSED_TABLE_NAME  ),
t_35_Reach_r0_f10 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1_f10.a AS a,
  Reach_MultBodyAggAux_recursive_head_f1_f10.b AS b
FROM
  t_36_Reach_MultBodyAggAux_recursive_head_f1_f10 AS Reach_MultBodyAggAux_recursive_head_f1_f10
GROUP BY Reach_MultBodyAggAux_recursive_head_f1_f10.a, Reach_MultBodyAggAux_recursive_head_f1_f10.b),
t_30_Reach_MultBodyAggAux_recursive_head_f2_f10 AS (SELECT * FROM (
  
    SELECT
      t_32_Ship.src AS a,
      t_32_Ship.dst AS b
    FROM
      t_2_Ship AS t_32_Ship
   UNION ALL
  
    SELECT
      Reach_r0_f10.a AS a,
      t_34_Ship.dst AS b
    FROM
      t_35_Reach_r0_f10 AS Reach_r0_f10, t_2_Ship AS t_34_Ship
    WHERE
      (Reach_r0_f10.b = t_34_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_29_Reach_r1_f10 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2_f10.a AS a,
  Reach_MultBodyAggAux_recursive_head_f2_f10.b AS b
FROM
  t_30_Reach_MultBodyAggAux_recursive_head_f2_f10 AS Reach_MultBodyAggAux_recursive_head_f2_f10
GROUP BY Reach_MultBodyAggAux_recursive_head_f2_f10.a, Reach_MultBodyAggAux_recursive_head_f2_f10.b),
t_24_Reach_MultBodyAggAux_recursive_head_f3_f10 AS (SELECT * FROM (
  
    SELECT
      t_26_Ship.src AS a,
      t_26_Ship.dst AS b
    FROM
      t_2_Ship AS t_26_Ship
   UNION ALL
  
    SELECT
      Reach_r1_f10.a AS a,
      t_28_Ship.dst AS b
    FROM
      t_29_Reach_r1_f10 AS Reach_r1_f10, t_2_Ship AS t_28_Ship
    WHERE
      (Reach_r1_f10.b = t_28_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_23_Reach_r2_f10 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3_f10.a AS a,
  Reach_MultBodyAggAux_recursive_head_f3_f10.b AS b
FROM
  t_24_Reach_MultBodyAggAux_recursive_head_f3_f10 AS Reach_MultBodyAggAux_recursive_head_f3_f10
GROUP BY Reach_MultBodyAggAux_recursive_head_f3_f10.a, Reach_MultBodyAggAux_recursive_head_f3_f10.b),
t_18_Reach_MultBodyAggAux_recursive_head_f4_f10 AS (SELECT * FROM (
  
    SELECT
      t_20_Ship.src AS a,
      t_20_Ship.dst AS b
    FROM
      t_2_Ship AS t_20_Ship
   UNION ALL
  
    SELECT
      Reach_r2_f10.a AS a,
      t_22_Ship.dst AS b
    FROM
      t_23_Reach_r2_f10 AS Reach_r2_f10, t_2_Ship AS t_22_Ship
    WHERE
      (Reach_r2_f10.b = t_22_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_17_Reach_r3_f10 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4_f10.a AS a,
  Reach_MultBodyAggAux_recursive_head_f4_f10.b AS b
FROM
  t_18_Reach_MultBodyAggAux_recursive_head_f4_f10 AS Reach_MultBodyAggAux_recursive_head_f4_f10
GROUP BY Reach_MultBodyAggAux_recursive_head_f4_f10.a, Reach_MultBodyAggAux_recursive_head_f4_f10.b),
t_12_Reach_MultBodyAggAux_recursive_head_f5_f10 AS (SELECT * FROM (
  
    SELECT
      t_14_Ship.src AS a,
      t_14_Ship.dst AS b
    FROM
      t_2_Ship AS t_14_Ship
   UNION ALL
  
    SELECT
      Reach_r3_f10.a AS a,
      t_16_Ship.dst AS b
    FROM
      t_17_Reach_r3_f10 AS Reach_r3_f10, t_2_Ship AS t_16_Ship
    WHERE
      (Reach_r3_f10.b = t_16_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_11_Reach_r4_f10 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5_f10.a AS a,
  Reach_MultBodyAggAux_recursive_head_f5_f10.b AS b
FROM
  t_12_Reach_MultBodyAggAux_recursive_head_f5_f10 AS Reach_MultBodyAggAux_recursive_head_f5_f10
GROUP BY Reach_MultBodyAggAux_recursive_head_f5_f10.a, Reach_MultBodyAggAux_recursive_head_f5_f10.b),
t_6_Reach_MultBodyAggAux_recursive_head_f6_f10 AS (SELECT * FROM (
  
    SELECT
      t_8_Ship.src AS a,
      t_8_Ship.dst AS b
    FROM
      t_2_Ship AS t_8_Ship
   UNION ALL
  
    SELECT
      Reach_r4_f10.a AS a,
      t_10_Ship.dst AS b
    FROM
      t_11_Reach_r4_f10 AS Reach_r4_f10, t_2_Ship AS t_10_Ship
    WHERE
      (Reach_r4_f10.b = t_10_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_5_Reach_r5_f10 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f6_f10.a AS a,
  Reach_MultBodyAggAux_recursive_head_f6_f10.b AS b
FROM
  t_6_Reach_MultBodyAggAux_recursive_head_f6_f10 AS Reach_MultBodyAggAux_recursive_head_f6_f10
GROUP BY Reach_MultBodyAggAux_recursive_head_f6_f10.a, Reach_MultBodyAggAux_recursive_head_f6_f10.b),
t_1_Reach_MultBodyAggAux_recursive_head_f7_f10 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_2_Ship AS Ship
   UNION ALL
  
    SELECT
      Reach_r5_f10.a AS a,
      t_4_Ship.dst AS b
    FROM
      t_5_Reach_r5_f10 AS Reach_r5_f10, t_2_Ship AS t_4_Ship
    WHERE
      (Reach_r5_f10.b = t_4_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f7_f10.a AS a,
  Reach_MultBodyAggAux_recursive_head_f7_f10.b AS b
FROM
  t_1_Reach_MultBodyAggAux_recursive_head_f7_f10 AS Reach_MultBodyAggAux_recursive_head_f7_f10
GROUP BY Reach_MultBodyAggAux_recursive_head_f7_f10.a, Reach_MultBodyAggAux_recursive_head_f7_f10.b)
SELECT
  R.b AS b
FROM
  t_0_R AS R
WHERE
  (R.a = 'milan') ORDER BY b;