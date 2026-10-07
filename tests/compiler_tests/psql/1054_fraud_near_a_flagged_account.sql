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
WITH t_0_Flagged AS (SELECT * FROM (
  
    SELECT
      'a1' AS account
   UNION ALL
  
    SELECT
      'a5' AS account
  
) AS UNUSED_TABLE_NAME  ),
t_5_HasPhone AS (SELECT * FROM (
  
    SELECT
      'a1' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a3' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a4' AS account,
      '555-3' AS phone
   UNION ALL
  
    SELECT
      'a5' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a6' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a7' AS account,
      '555-9' AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_3_Shares AS (SELECT
  HasPhone.account AS a,
  t_4_HasPhone.account AS b
FROM
  t_5_HasPhone AS HasPhone, t_5_HasPhone AS t_4_HasPhone
WHERE
  (HasPhone.account != t_4_HasPhone.account) AND
  (t_4_HasPhone.phone = HasPhone.phone)
GROUP BY HasPhone.account, t_4_HasPhone.account),
t_38_Linked_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_39_Shares.a AS a,
      t_39_Shares.b AS b
    FROM
      t_3_Shares AS t_39_Shares
  
) AS UNUSED_TABLE_NAME  ),
t_37_Linked_r0 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f1.a AS a,
  Linked_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_38_Linked_MultBodyAggAux_recursive_head_f1 AS Linked_MultBodyAggAux_recursive_head_f1
GROUP BY Linked_MultBodyAggAux_recursive_head_f1.a, Linked_MultBodyAggAux_recursive_head_f1.b),
t_34_Linked_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_35_Shares.a AS a,
      t_35_Shares.b AS b
    FROM
      t_3_Shares AS t_35_Shares
   UNION ALL
  
    SELECT
      Linked_r0.a AS a,
      t_36_Shares.b AS b
    FROM
      t_37_Linked_r0 AS Linked_r0, t_3_Shares AS t_36_Shares
    WHERE
      (t_36_Shares.a = Linked_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_33_Linked_r1 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f2.a AS a,
  Linked_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_34_Linked_MultBodyAggAux_recursive_head_f2 AS Linked_MultBodyAggAux_recursive_head_f2
GROUP BY Linked_MultBodyAggAux_recursive_head_f2.a, Linked_MultBodyAggAux_recursive_head_f2.b),
t_30_Linked_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_31_Shares.a AS a,
      t_31_Shares.b AS b
    FROM
      t_3_Shares AS t_31_Shares
   UNION ALL
  
    SELECT
      Linked_r1.a AS a,
      t_32_Shares.b AS b
    FROM
      t_33_Linked_r1 AS Linked_r1, t_3_Shares AS t_32_Shares
    WHERE
      (t_32_Shares.a = Linked_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_29_Linked_r2 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f3.a AS a,
  Linked_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_30_Linked_MultBodyAggAux_recursive_head_f3 AS Linked_MultBodyAggAux_recursive_head_f3
GROUP BY Linked_MultBodyAggAux_recursive_head_f3.a, Linked_MultBodyAggAux_recursive_head_f3.b),
t_26_Linked_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_27_Shares.a AS a,
      t_27_Shares.b AS b
    FROM
      t_3_Shares AS t_27_Shares
   UNION ALL
  
    SELECT
      Linked_r2.a AS a,
      t_28_Shares.b AS b
    FROM
      t_29_Linked_r2 AS Linked_r2, t_3_Shares AS t_28_Shares
    WHERE
      (t_28_Shares.a = Linked_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_25_Linked_r3 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f4.a AS a,
  Linked_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_26_Linked_MultBodyAggAux_recursive_head_f4 AS Linked_MultBodyAggAux_recursive_head_f4
GROUP BY Linked_MultBodyAggAux_recursive_head_f4.a, Linked_MultBodyAggAux_recursive_head_f4.b),
t_22_Linked_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_23_Shares.a AS a,
      t_23_Shares.b AS b
    FROM
      t_3_Shares AS t_23_Shares
   UNION ALL
  
    SELECT
      Linked_r3.a AS a,
      t_24_Shares.b AS b
    FROM
      t_25_Linked_r3 AS Linked_r3, t_3_Shares AS t_24_Shares
    WHERE
      (t_24_Shares.a = Linked_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_21_Linked_r4 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f5.a AS a,
  Linked_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_22_Linked_MultBodyAggAux_recursive_head_f5 AS Linked_MultBodyAggAux_recursive_head_f5
GROUP BY Linked_MultBodyAggAux_recursive_head_f5.a, Linked_MultBodyAggAux_recursive_head_f5.b),
t_18_Linked_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_19_Shares.a AS a,
      t_19_Shares.b AS b
    FROM
      t_3_Shares AS t_19_Shares
   UNION ALL
  
    SELECT
      Linked_r4.a AS a,
      t_20_Shares.b AS b
    FROM
      t_21_Linked_r4 AS Linked_r4, t_3_Shares AS t_20_Shares
    WHERE
      (t_20_Shares.a = Linked_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_17_Linked_r5 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f6.a AS a,
  Linked_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_18_Linked_MultBodyAggAux_recursive_head_f6 AS Linked_MultBodyAggAux_recursive_head_f6
GROUP BY Linked_MultBodyAggAux_recursive_head_f6.a, Linked_MultBodyAggAux_recursive_head_f6.b),
t_14_Linked_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_15_Shares.a AS a,
      t_15_Shares.b AS b
    FROM
      t_3_Shares AS t_15_Shares
   UNION ALL
  
    SELECT
      Linked_r5.a AS a,
      t_16_Shares.b AS b
    FROM
      t_17_Linked_r5 AS Linked_r5, t_3_Shares AS t_16_Shares
    WHERE
      (t_16_Shares.a = Linked_r5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_13_Linked_r6 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f7.a AS a,
  Linked_MultBodyAggAux_recursive_head_f7.b AS b
FROM
  t_14_Linked_MultBodyAggAux_recursive_head_f7 AS Linked_MultBodyAggAux_recursive_head_f7
GROUP BY Linked_MultBodyAggAux_recursive_head_f7.a, Linked_MultBodyAggAux_recursive_head_f7.b),
t_8_Linked_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_9_Shares.a AS a,
      t_9_Shares.b AS b
    FROM
      t_3_Shares AS t_9_Shares
   UNION ALL
  
    SELECT
      Linked_r6.a AS a,
      t_12_Shares.b AS b
    FROM
      t_13_Linked_r6 AS Linked_r6, t_3_Shares AS t_12_Shares
    WHERE
      (t_12_Shares.a = Linked_r6.b)
  
) AS UNUSED_TABLE_NAME  ),
t_7_Linked_r7 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f8.a AS a,
  Linked_MultBodyAggAux_recursive_head_f8.b AS b
FROM
  t_8_Linked_MultBodyAggAux_recursive_head_f8 AS Linked_MultBodyAggAux_recursive_head_f8
GROUP BY Linked_MultBodyAggAux_recursive_head_f8.a, Linked_MultBodyAggAux_recursive_head_f8.b),
t_2_Linked_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_3_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_r7.a AS a,
      t_6_Shares.b AS b
    FROM
      t_7_Linked_r7 AS Linked_r7, t_3_Shares AS t_6_Shares
    WHERE
      (t_6_Shares.a = Linked_r7.b)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Linked AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f9.a AS a,
  Linked_MultBodyAggAux_recursive_head_f9.b AS b
FROM
  t_2_Linked_MultBodyAggAux_recursive_head_f9 AS Linked_MultBodyAggAux_recursive_head_f9
GROUP BY Linked_MultBodyAggAux_recursive_head_f9.a, Linked_MultBodyAggAux_recursive_head_f9.b)
SELECT
  Linked.b AS account
FROM
  t_0_Flagged AS Flagged, t_1_Linked AS Linked
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_144 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_Flagged AS t_41_Flagged, UNNEST(ARRAY[0]::numeric[]) as x_144
  WHERE
    (t_41_Flagged.account = Linked.b)) AS numeric) IS NULL) AND
  (Linked.a = Flagged.account)
GROUP BY Linked.b ORDER BY account;