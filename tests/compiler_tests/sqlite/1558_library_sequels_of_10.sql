WITH RECURSIVE t_2_Sequel AS (SELECT * FROM (
  
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
t_1_After_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Sequel.book AS book,
        Sequel.next AS next,
        0 AS synalog_step
      FROM
        t_2_Sequel AS Sequel
     UNION ALL
    
      SELECT
        t_5_Sequel.book AS book,
        t_3_Sequel.next AS next,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Sequel AS t_5_Sequel, t_2_Sequel AS t_3_Sequel
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (t_3_Sequel.book IS t_5_Sequel.next)
     UNION ALL
    
      SELECT
        t_11_Sequel.book AS book,
        t_7_Sequel.next AS next,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Sequel AS t_11_Sequel, t_2_Sequel AS t_9_Sequel, t_2_Sequel AS t_7_Sequel
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_7_Sequel.book IS t_9_Sequel.next) AND
        (t_9_Sequel.book IS t_11_Sequel.next)
     UNION ALL
    
      SELECT
        t_19_Sequel.book AS book,
        t_13_Sequel.next AS next,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Sequel AS t_19_Sequel, t_2_Sequel AS t_17_Sequel, t_2_Sequel AS t_15_Sequel, t_2_Sequel AS t_13_Sequel
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_13_Sequel.book IS t_15_Sequel.next) AND
        (t_15_Sequel.book IS t_17_Sequel.next) AND
        (t_17_Sequel.book IS t_19_Sequel.next)
     UNION ALL
    
      SELECT
        t_29_Sequel.book AS book,
        t_21_Sequel.next AS next,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Sequel AS t_29_Sequel, t_2_Sequel AS t_27_Sequel, t_2_Sequel AS t_25_Sequel, t_2_Sequel AS t_23_Sequel, t_2_Sequel AS t_21_Sequel
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_21_Sequel.book IS t_23_Sequel.next) AND
        (t_23_Sequel.book IS t_25_Sequel.next) AND
        (t_25_Sequel.book IS t_27_Sequel.next) AND
        (t_27_Sequel.book IS t_29_Sequel.next)
     UNION ALL
    
      SELECT
        t_41_Sequel.book AS book,
        t_31_Sequel.next AS next,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Sequel AS t_41_Sequel, t_2_Sequel AS t_39_Sequel, t_2_Sequel AS t_37_Sequel, t_2_Sequel AS t_35_Sequel, t_2_Sequel AS t_33_Sequel, t_2_Sequel AS t_31_Sequel
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_31_Sequel.book IS t_33_Sequel.next) AND
        (t_33_Sequel.book IS t_35_Sequel.next) AND
        (t_35_Sequel.book IS t_37_Sequel.next) AND
        (t_37_Sequel.book IS t_39_Sequel.next) AND
        (t_39_Sequel.book IS t_41_Sequel.next)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_After_RecursiveCte.book AS book,
  t_43_Sequel.next AS next,
  ((t_42_After_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_After_RecursiveCte AS t_42_After_RecursiveCte, t_2_Sequel AS t_43_Sequel
WHERE
  (t_42_After_RecursiveCte.synalog_step < 6) AND
  (t_43_Sequel.book IS t_42_After_RecursiveCte.next)),
t_0_After AS (SELECT
  After_RecursiveCte.book AS book,
  After_RecursiveCte.next AS next
FROM
  t_1_After_RecursiveCte AS After_RecursiveCte
GROUP BY After_RecursiveCte.book, After_RecursiveCte.next)
SELECT
  After.next AS next
FROM
  t_0_After AS After
WHERE
  (After.book = 10);