-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS n,
      CAST(null AS numeric) AS boss,
      10 AS d,
      5000 AS pay
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS n,
      1 AS boss,
      10 AS d,
      4000 AS pay
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS n,
      1 AS boss,
      20 AS d,
      4200 AS pay
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS n,
      2 AS boss,
      10 AS d,
      3000 AS pay
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS n,
      3 AS boss,
      20 AS d,
      3100 AS pay
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS n,
      3 AS boss,
      CAST(null AS numeric) AS d,
      2900 AS pay
   UNION ALL
  
    SELECT
      7 AS id,
      'gus' AS n,
      CAST(null AS numeric) AS boss,
      30 AS d,
      6000 AS pay
   UNION ALL
  
    SELECT
      8 AS id,
      'hal' AS n,
      7 AS boss,
      30 AS d,
      2500 AS pay
  
) AS UNUSED_TABLE_NAME  ),
t_42_Up_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_43_E.boss AS id
    FROM
      t_3_E AS t_43_E
    WHERE
      (t_43_E.id = 3)
  
) AS UNUSED_TABLE_NAME  ),
t_41_Up_r0 AS (SELECT
  Up_MultBodyAggAux_recursive_head_f1.id AS id
FROM
  t_42_Up_MultBodyAggAux_recursive_head_f1 AS Up_MultBodyAggAux_recursive_head_f1
GROUP BY Up_MultBodyAggAux_recursive_head_f1.id),
t_38_Up_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_39_E.boss AS id
    FROM
      t_3_E AS t_39_E
    WHERE
      (t_39_E.id = 3)
   UNION ALL
  
    SELECT
      t_40_E.boss AS id
    FROM
      t_41_Up_r0 AS Up_r0, t_3_E AS t_40_E
    WHERE
      (t_40_E.id = Up_r0.id)
  
) AS UNUSED_TABLE_NAME  ),
t_37_Up_r1 AS (SELECT
  Up_MultBodyAggAux_recursive_head_f2.id AS id
FROM
  t_38_Up_MultBodyAggAux_recursive_head_f2 AS Up_MultBodyAggAux_recursive_head_f2
GROUP BY Up_MultBodyAggAux_recursive_head_f2.id),
t_34_Up_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_35_E.boss AS id
    FROM
      t_3_E AS t_35_E
    WHERE
      (t_35_E.id = 3)
   UNION ALL
  
    SELECT
      t_36_E.boss AS id
    FROM
      t_37_Up_r1 AS Up_r1, t_3_E AS t_36_E
    WHERE
      (t_36_E.id = Up_r1.id)
  
) AS UNUSED_TABLE_NAME  ),
t_33_Up_r2 AS (SELECT
  Up_MultBodyAggAux_recursive_head_f3.id AS id
FROM
  t_34_Up_MultBodyAggAux_recursive_head_f3 AS Up_MultBodyAggAux_recursive_head_f3
GROUP BY Up_MultBodyAggAux_recursive_head_f3.id),
t_30_Up_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_31_E.boss AS id
    FROM
      t_3_E AS t_31_E
    WHERE
      (t_31_E.id = 3)
   UNION ALL
  
    SELECT
      t_32_E.boss AS id
    FROM
      t_33_Up_r2 AS Up_r2, t_3_E AS t_32_E
    WHERE
      (t_32_E.id = Up_r2.id)
  
) AS UNUSED_TABLE_NAME  ),
t_29_Up_r3 AS (SELECT
  Up_MultBodyAggAux_recursive_head_f4.id AS id
FROM
  t_30_Up_MultBodyAggAux_recursive_head_f4 AS Up_MultBodyAggAux_recursive_head_f4
GROUP BY Up_MultBodyAggAux_recursive_head_f4.id),
t_26_Up_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_27_E.boss AS id
    FROM
      t_3_E AS t_27_E
    WHERE
      (t_27_E.id = 3)
   UNION ALL
  
    SELECT
      t_28_E.boss AS id
    FROM
      t_29_Up_r3 AS Up_r3, t_3_E AS t_28_E
    WHERE
      (t_28_E.id = Up_r3.id)
  
) AS UNUSED_TABLE_NAME  ),
t_25_Up_r4 AS (SELECT
  Up_MultBodyAggAux_recursive_head_f5.id AS id
FROM
  t_26_Up_MultBodyAggAux_recursive_head_f5 AS Up_MultBodyAggAux_recursive_head_f5
GROUP BY Up_MultBodyAggAux_recursive_head_f5.id),
t_22_Up_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_23_E.boss AS id
    FROM
      t_3_E AS t_23_E
    WHERE
      (t_23_E.id = 3)
   UNION ALL
  
    SELECT
      t_24_E.boss AS id
    FROM
      t_25_Up_r4 AS Up_r4, t_3_E AS t_24_E
    WHERE
      (t_24_E.id = Up_r4.id)
  
) AS UNUSED_TABLE_NAME  ),
t_21_Up_r5 AS (SELECT
  Up_MultBodyAggAux_recursive_head_f6.id AS id
FROM
  t_22_Up_MultBodyAggAux_recursive_head_f6 AS Up_MultBodyAggAux_recursive_head_f6
GROUP BY Up_MultBodyAggAux_recursive_head_f6.id),
t_18_Up_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_19_E.boss AS id
    FROM
      t_3_E AS t_19_E
    WHERE
      (t_19_E.id = 3)
   UNION ALL
  
    SELECT
      t_20_E.boss AS id
    FROM
      t_21_Up_r5 AS Up_r5, t_3_E AS t_20_E
    WHERE
      (t_20_E.id = Up_r5.id)
  
) AS UNUSED_TABLE_NAME  ),
t_17_Up_r6 AS (SELECT
  Up_MultBodyAggAux_recursive_head_f7.id AS id
FROM
  t_18_Up_MultBodyAggAux_recursive_head_f7 AS Up_MultBodyAggAux_recursive_head_f7
GROUP BY Up_MultBodyAggAux_recursive_head_f7.id),
t_14_Up_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_15_E.boss AS id
    FROM
      t_3_E AS t_15_E
    WHERE
      (t_15_E.id = 3)
   UNION ALL
  
    SELECT
      t_16_E.boss AS id
    FROM
      t_17_Up_r6 AS Up_r6, t_3_E AS t_16_E
    WHERE
      (t_16_E.id = Up_r6.id)
  
) AS UNUSED_TABLE_NAME  ),
t_13_Up_r7 AS (SELECT
  Up_MultBodyAggAux_recursive_head_f8.id AS id
FROM
  t_14_Up_MultBodyAggAux_recursive_head_f8 AS Up_MultBodyAggAux_recursive_head_f8
GROUP BY Up_MultBodyAggAux_recursive_head_f8.id),
t_10_Up_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_11_E.boss AS id
    FROM
      t_3_E AS t_11_E
    WHERE
      (t_11_E.id = 3)
   UNION ALL
  
    SELECT
      t_12_E.boss AS id
    FROM
      t_13_Up_r7 AS Up_r7, t_3_E AS t_12_E
    WHERE
      (t_12_E.id = Up_r7.id)
  
) AS UNUSED_TABLE_NAME  ),
t_9_Up_r8 AS (SELECT
  Up_MultBodyAggAux_recursive_head_f9.id AS id
FROM
  t_10_Up_MultBodyAggAux_recursive_head_f9 AS Up_MultBodyAggAux_recursive_head_f9
GROUP BY Up_MultBodyAggAux_recursive_head_f9.id),
t_6_Up_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_7_E.boss AS id
    FROM
      t_3_E AS t_7_E
    WHERE
      (t_7_E.id = 3)
   UNION ALL
  
    SELECT
      t_8_E.boss AS id
    FROM
      t_9_Up_r8 AS Up_r8, t_3_E AS t_8_E
    WHERE
      (t_8_E.id = Up_r8.id)
  
) AS UNUSED_TABLE_NAME  ),
t_5_Up_r9 AS (SELECT
  Up_MultBodyAggAux_recursive_head_f10.id AS id
FROM
  t_6_Up_MultBodyAggAux_recursive_head_f10 AS Up_MultBodyAggAux_recursive_head_f10
GROUP BY Up_MultBodyAggAux_recursive_head_f10.id),
t_1_Up_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      t_2_E.boss AS id
    FROM
      t_3_E AS t_2_E
    WHERE
      (t_2_E.id = 3)
   UNION ALL
  
    SELECT
      t_4_E.boss AS id
    FROM
      t_5_Up_r9 AS Up_r9, t_3_E AS t_4_E
    WHERE
      (t_4_E.id = Up_r9.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up AS (SELECT
  Up_MultBodyAggAux_recursive_head_f11.id AS id
FROM
  t_1_Up_MultBodyAggAux_recursive_head_f11 AS Up_MultBodyAggAux_recursive_head_f11
GROUP BY Up_MultBodyAggAux_recursive_head_f11.id)
SELECT
  E.n AS n
FROM
  t_0_Up AS Up, t_3_E AS E
WHERE
  (E.id = Up.id) ORDER BY n;