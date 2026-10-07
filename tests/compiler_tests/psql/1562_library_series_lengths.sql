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
WITH t_22_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_19_After_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_21_Sequel.book AS book,
      t_21_Sequel.next AS next
    FROM
      t_22_Sequel AS t_21_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_18_After_r0 AS (SELECT
  After_MultBodyAggAux_recursive_head_f1.book AS book,
  After_MultBodyAggAux_recursive_head_f1.next AS next
FROM
  t_19_After_MultBodyAggAux_recursive_head_f1 AS After_MultBodyAggAux_recursive_head_f1
GROUP BY After_MultBodyAggAux_recursive_head_f1.book, After_MultBodyAggAux_recursive_head_f1.next),
t_16_After_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      After_r0.book AS book,
      t_17_Sequel.next AS next
    FROM
      t_18_After_r0 AS After_r0, t_22_Sequel AS t_17_Sequel
    WHERE
      (t_17_Sequel.book = After_r0.next)
   UNION ALL
  
    SELECT
      t_23_Sequel.book AS book,
      t_23_Sequel.next AS next
    FROM
      t_22_Sequel AS t_23_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_15_After_r1 AS (SELECT
  After_MultBodyAggAux_recursive_head_f2.book AS book,
  After_MultBodyAggAux_recursive_head_f2.next AS next
FROM
  t_16_After_MultBodyAggAux_recursive_head_f2 AS After_MultBodyAggAux_recursive_head_f2
GROUP BY After_MultBodyAggAux_recursive_head_f2.book, After_MultBodyAggAux_recursive_head_f2.next),
t_13_After_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      After_r1.book AS book,
      t_14_Sequel.next AS next
    FROM
      t_15_After_r1 AS After_r1, t_22_Sequel AS t_14_Sequel
    WHERE
      (t_14_Sequel.book = After_r1.next)
   UNION ALL
  
    SELECT
      t_24_Sequel.book AS book,
      t_24_Sequel.next AS next
    FROM
      t_22_Sequel AS t_24_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_12_After_r2 AS (SELECT
  After_MultBodyAggAux_recursive_head_f3.book AS book,
  After_MultBodyAggAux_recursive_head_f3.next AS next
FROM
  t_13_After_MultBodyAggAux_recursive_head_f3 AS After_MultBodyAggAux_recursive_head_f3
GROUP BY After_MultBodyAggAux_recursive_head_f3.book, After_MultBodyAggAux_recursive_head_f3.next),
t_10_After_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      After_r2.book AS book,
      t_11_Sequel.next AS next
    FROM
      t_12_After_r2 AS After_r2, t_22_Sequel AS t_11_Sequel
    WHERE
      (t_11_Sequel.book = After_r2.next)
   UNION ALL
  
    SELECT
      t_25_Sequel.book AS book,
      t_25_Sequel.next AS next
    FROM
      t_22_Sequel AS t_25_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_9_After_r3 AS (SELECT
  After_MultBodyAggAux_recursive_head_f4.book AS book,
  After_MultBodyAggAux_recursive_head_f4.next AS next
FROM
  t_10_After_MultBodyAggAux_recursive_head_f4 AS After_MultBodyAggAux_recursive_head_f4
GROUP BY After_MultBodyAggAux_recursive_head_f4.book, After_MultBodyAggAux_recursive_head_f4.next),
t_7_After_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      After_r3.book AS book,
      t_8_Sequel.next AS next
    FROM
      t_9_After_r3 AS After_r3, t_22_Sequel AS t_8_Sequel
    WHERE
      (t_8_Sequel.book = After_r3.next)
   UNION ALL
  
    SELECT
      t_26_Sequel.book AS book,
      t_26_Sequel.next AS next
    FROM
      t_22_Sequel AS t_26_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_6_After_r4 AS (SELECT
  After_MultBodyAggAux_recursive_head_f5.book AS book,
  After_MultBodyAggAux_recursive_head_f5.next AS next
FROM
  t_7_After_MultBodyAggAux_recursive_head_f5 AS After_MultBodyAggAux_recursive_head_f5
GROUP BY After_MultBodyAggAux_recursive_head_f5.book, After_MultBodyAggAux_recursive_head_f5.next),
t_4_After_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      After_r4.book AS book,
      t_5_Sequel.next AS next
    FROM
      t_6_After_r4 AS After_r4, t_22_Sequel AS t_5_Sequel
    WHERE
      (t_5_Sequel.book = After_r4.next)
   UNION ALL
  
    SELECT
      t_27_Sequel.book AS book,
      t_27_Sequel.next AS next
    FROM
      t_22_Sequel AS t_27_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_3_After_r5 AS (SELECT
  After_MultBodyAggAux_recursive_head_f6.book AS book,
  After_MultBodyAggAux_recursive_head_f6.next AS next
FROM
  t_4_After_MultBodyAggAux_recursive_head_f6 AS After_MultBodyAggAux_recursive_head_f6
GROUP BY After_MultBodyAggAux_recursive_head_f6.book, After_MultBodyAggAux_recursive_head_f6.next),
t_2_After_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      After_r5.book AS book,
      Sequel.next AS next
    FROM
      t_3_After_r5 AS After_r5, t_22_Sequel AS Sequel
    WHERE
      (Sequel.book = After_r5.next)
   UNION ALL
  
    SELECT
      t_28_Sequel.book AS book,
      t_28_Sequel.next AS next
    FROM
      t_22_Sequel AS t_28_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_1_After AS (SELECT
  After_MultBodyAggAux_recursive_head_f7.book AS book,
  After_MultBodyAggAux_recursive_head_f7.next AS next
FROM
  t_2_After_MultBodyAggAux_recursive_head_f7 AS After_MultBodyAggAux_recursive_head_f7
GROUP BY After_MultBodyAggAux_recursive_head_f7.book, After_MultBodyAggAux_recursive_head_f7.next),
t_29_IsSequel AS (SELECT
  t_30_Sequel.next AS book
FROM
  t_22_Sequel AS t_30_Sequel
GROUP BY t_30_Sequel.next),
t_0_C AS (SELECT
  After.book AS book,
  SUM(1) AS n
FROM
  t_1_After AS After
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_105 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_29_IsSequel AS IsSequel, UNNEST(ARRAY[0]::numeric[]) as x_105
  WHERE
    (IsSequel.book = After.book)) AS numeric) IS NULL)
GROUP BY After.book)
SELECT
  C.book AS book,
  ((C.n) + (1)) AS n
FROM
  t_0_C AS C ORDER BY book, n;