WITH RECURSIVE t_2_Influenced AS (SELECT * FROM (
  
    SELECT
      'austen' AS a,
      'tolkien' AS b
   UNION ALL
  
    SELECT
      'tolkien' AS a,
      'herbert' AS b
   UNION ALL
  
    SELECT
      'herbert' AS a,
      'gibson' AS b
   UNION ALL
  
    SELECT
      'asimov' AS a,
      'herbert' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Down_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Influenced.a AS a,
        Influenced.b AS b,
        0 AS synalog_step
      FROM
        t_2_Influenced AS Influenced
     UNION ALL
    
      SELECT
        t_5_Influenced.a AS a,
        t_3_Influenced.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Influenced AS t_5_Influenced, t_2_Influenced AS t_3_Influenced
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (t_3_Influenced.a IS t_5_Influenced.b)
     UNION ALL
    
      SELECT
        t_11_Influenced.a AS a,
        t_7_Influenced.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Influenced AS t_11_Influenced, t_2_Influenced AS t_9_Influenced, t_2_Influenced AS t_7_Influenced
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_7_Influenced.a IS t_9_Influenced.b) AND
        (t_9_Influenced.a IS t_11_Influenced.b)
     UNION ALL
    
      SELECT
        t_19_Influenced.a AS a,
        t_13_Influenced.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Influenced AS t_19_Influenced, t_2_Influenced AS t_17_Influenced, t_2_Influenced AS t_15_Influenced, t_2_Influenced AS t_13_Influenced
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_13_Influenced.a IS t_15_Influenced.b) AND
        (t_15_Influenced.a IS t_17_Influenced.b) AND
        (t_17_Influenced.a IS t_19_Influenced.b)
     UNION ALL
    
      SELECT
        t_29_Influenced.a AS a,
        t_21_Influenced.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Influenced AS t_29_Influenced, t_2_Influenced AS t_27_Influenced, t_2_Influenced AS t_25_Influenced, t_2_Influenced AS t_23_Influenced, t_2_Influenced AS t_21_Influenced
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_21_Influenced.a IS t_23_Influenced.b) AND
        (t_23_Influenced.a IS t_25_Influenced.b) AND
        (t_25_Influenced.a IS t_27_Influenced.b) AND
        (t_27_Influenced.a IS t_29_Influenced.b)
     UNION ALL
    
      SELECT
        t_41_Influenced.a AS a,
        t_31_Influenced.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Influenced AS t_41_Influenced, t_2_Influenced AS t_39_Influenced, t_2_Influenced AS t_37_Influenced, t_2_Influenced AS t_35_Influenced, t_2_Influenced AS t_33_Influenced, t_2_Influenced AS t_31_Influenced
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_31_Influenced.a IS t_33_Influenced.b) AND
        (t_33_Influenced.a IS t_35_Influenced.b) AND
        (t_35_Influenced.a IS t_37_Influenced.b) AND
        (t_37_Influenced.a IS t_39_Influenced.b) AND
        (t_39_Influenced.a IS t_41_Influenced.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Down_RecursiveCte.a AS a,
  t_43_Influenced.b AS b,
  ((t_42_Down_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Down_RecursiveCte AS t_42_Down_RecursiveCte, t_2_Influenced AS t_43_Influenced
WHERE
  (t_42_Down_RecursiveCte.synalog_step < 6) AND
  (t_43_Influenced.a IS t_42_Down_RecursiveCte.b)),
t_0_Down AS (SELECT
  Down_RecursiveCte.a AS a,
  Down_RecursiveCte.b AS b
FROM
  t_1_Down_RecursiveCte AS Down_RecursiveCte
GROUP BY Down_RecursiveCte.a, Down_RecursiveCte.b)
SELECT
  Down.a AS a,
  SUM(1) AS n
FROM
  t_0_Down AS Down
GROUP BY Down.a ORDER BY a NULLS LAST, n NULLS LAST;