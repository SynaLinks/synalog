-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_3_Sequel AS (SELECT * FROM (
  
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
t_2_After_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Sequel.book AS book,
        Sequel.next AS next,
        0 AS synalog_step
      FROM
        t_3_Sequel AS Sequel
     UNION ALL
    
      SELECT
        t_6_Sequel.book AS book,
        t_4_Sequel.next AS next,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_Sequel AS t_6_Sequel, t_3_Sequel AS t_4_Sequel
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_4_Sequel.book, 0) = COALESCE(t_6_Sequel.next, 0) AND (t_4_Sequel.book IS NULL) = (t_6_Sequel.next IS NULL))
     UNION ALL
    
      SELECT
        t_12_Sequel.book AS book,
        t_8_Sequel.next AS next,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Sequel AS t_12_Sequel, t_3_Sequel AS t_10_Sequel, t_3_Sequel AS t_8_Sequel
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_8_Sequel.book, 0) = COALESCE(t_10_Sequel.next, 0) AND (t_8_Sequel.book IS NULL) = (t_10_Sequel.next IS NULL)) AND
        (COALESCE(t_10_Sequel.book, 0) = COALESCE(t_12_Sequel.next, 0) AND (t_10_Sequel.book IS NULL) = (t_12_Sequel.next IS NULL))
     UNION ALL
    
      SELECT
        t_20_Sequel.book AS book,
        t_14_Sequel.next AS next,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Sequel AS t_20_Sequel, t_3_Sequel AS t_18_Sequel, t_3_Sequel AS t_16_Sequel, t_3_Sequel AS t_14_Sequel
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_14_Sequel.book, 0) = COALESCE(t_16_Sequel.next, 0) AND (t_14_Sequel.book IS NULL) = (t_16_Sequel.next IS NULL)) AND
        (COALESCE(t_16_Sequel.book, 0) = COALESCE(t_18_Sequel.next, 0) AND (t_16_Sequel.book IS NULL) = (t_18_Sequel.next IS NULL)) AND
        (COALESCE(t_18_Sequel.book, 0) = COALESCE(t_20_Sequel.next, 0) AND (t_18_Sequel.book IS NULL) = (t_20_Sequel.next IS NULL))
     UNION ALL
    
      SELECT
        t_30_Sequel.book AS book,
        t_22_Sequel.next AS next,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Sequel AS t_30_Sequel, t_3_Sequel AS t_28_Sequel, t_3_Sequel AS t_26_Sequel, t_3_Sequel AS t_24_Sequel, t_3_Sequel AS t_22_Sequel
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_22_Sequel.book, 0) = COALESCE(t_24_Sequel.next, 0) AND (t_22_Sequel.book IS NULL) = (t_24_Sequel.next IS NULL)) AND
        (COALESCE(t_24_Sequel.book, 0) = COALESCE(t_26_Sequel.next, 0) AND (t_24_Sequel.book IS NULL) = (t_26_Sequel.next IS NULL)) AND
        (COALESCE(t_26_Sequel.book, 0) = COALESCE(t_28_Sequel.next, 0) AND (t_26_Sequel.book IS NULL) = (t_28_Sequel.next IS NULL)) AND
        (COALESCE(t_28_Sequel.book, 0) = COALESCE(t_30_Sequel.next, 0) AND (t_28_Sequel.book IS NULL) = (t_30_Sequel.next IS NULL))
     UNION ALL
    
      SELECT
        t_42_Sequel.book AS book,
        t_32_Sequel.next AS next,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Sequel AS t_42_Sequel, t_3_Sequel AS t_40_Sequel, t_3_Sequel AS t_38_Sequel, t_3_Sequel AS t_36_Sequel, t_3_Sequel AS t_34_Sequel, t_3_Sequel AS t_32_Sequel
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_32_Sequel.book, 0) = COALESCE(t_34_Sequel.next, 0) AND (t_32_Sequel.book IS NULL) = (t_34_Sequel.next IS NULL)) AND
        (COALESCE(t_34_Sequel.book, 0) = COALESCE(t_36_Sequel.next, 0) AND (t_34_Sequel.book IS NULL) = (t_36_Sequel.next IS NULL)) AND
        (COALESCE(t_36_Sequel.book, 0) = COALESCE(t_38_Sequel.next, 0) AND (t_36_Sequel.book IS NULL) = (t_38_Sequel.next IS NULL)) AND
        (COALESCE(t_38_Sequel.book, 0) = COALESCE(t_40_Sequel.next, 0) AND (t_38_Sequel.book IS NULL) = (t_40_Sequel.next IS NULL)) AND
        (COALESCE(t_40_Sequel.book, 0) = COALESCE(t_42_Sequel.next, 0) AND (t_40_Sequel.book IS NULL) = (t_42_Sequel.next IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_43_After_RecursiveCte.book AS book,
  t_44_Sequel.next AS next,
  ((t_43_After_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_2_After_RecursiveCte AS t_43_After_RecursiveCte, t_3_Sequel AS t_44_Sequel
WHERE
  (t_43_After_RecursiveCte.synalog_step < 6) AND
  (COALESCE(t_44_Sequel.book, 0) = COALESCE(t_43_After_RecursiveCte.next, 0) AND (t_44_Sequel.book IS NULL) = (t_43_After_RecursiveCte.next IS NULL))),
t_1_After AS (SELECT
  After_RecursiveCte.book AS book,
  After_RecursiveCte.next AS next
FROM
  t_2_After_RecursiveCte AS After_RecursiveCte
GROUP BY After_RecursiveCte.book, After_RecursiveCte.next),
t_45_IsSequel AS (SELECT
  t_46_Sequel.next AS book
FROM
  t_3_Sequel AS t_46_Sequel
GROUP BY t_46_Sequel.next),
t_0_C AS (SELECT
  After.book AS book,
  SUM(1) AS n
FROM
  t_1_After AS After
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_213 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_45_IsSequel AS IsSequel, UNNEST(ARRAY[0]) as x_213
  WHERE
    (COALESCE(IsSequel.book, 0) = COALESCE(After.book, 0) AND (IsSequel.book IS NULL) = (After.book IS NULL))) AS numeric) IS NULL)
GROUP BY After.book)
SELECT
  C.book AS book,
  ((C.n) + (1)) AS n
FROM
  t_0_C AS C ORDER BY book, n;