WITH RECURSIVE t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS n,
        0 AS h,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        E.b AS n,
        ((0) + (1)) AS h,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_E AS E
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (E.a = 1)
     UNION ALL
    
      SELECT
        t_4_E.b AS n,
        ((((0) + (1))) + (1)) AS h,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_6_E, t_2_E AS t_4_E
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_4_E.a IS t_6_E.b) AND
        (t_6_E.a = 1)
     UNION ALL
    
      SELECT
        t_9_E.b AS n,
        ((((((0) + (1))) + (1))) + (1)) AS h,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_13_E, t_2_E AS t_11_E, t_2_E AS t_9_E
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_9_E.a IS t_11_E.b) AND
        (t_11_E.a IS t_13_E.b) AND
        (t_13_E.a = 1)
     UNION ALL
    
      SELECT
        t_16_E.b AS n,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS h,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_22_E, t_2_E AS t_20_E, t_2_E AS t_18_E, t_2_E AS t_16_E
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_16_E.a IS t_18_E.b) AND
        (t_18_E.a IS t_20_E.b) AND
        (t_20_E.a IS t_22_E.b) AND
        (t_22_E.a = 1)
     UNION ALL
    
      SELECT
        t_25_E.b AS n,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS h,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_33_E, t_2_E AS t_31_E, t_2_E AS t_29_E, t_2_E AS t_27_E, t_2_E AS t_25_E
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 5) AND
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_25_E.a IS t_27_E.b) AND
        (t_27_E.a IS t_29_E.b) AND
        (t_29_E.a IS t_31_E.b) AND
        (t_31_E.a IS t_33_E.b) AND
        (t_33_E.a = 1)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_36_E.b AS n,
  ((t_35_P_RecursiveCte.h) + (1)) AS h,
  ((t_35_P_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_P_RecursiveCte AS t_35_P_RecursiveCte, t_2_E AS t_36_E
WHERE
  (t_35_P_RecursiveCte.synalog_step < 5) AND
  (t_36_E.a IS t_35_P_RecursiveCte.n))
SELECT
  P_RecursiveCte.n AS n,
  P_RecursiveCte.h AS h
FROM
  t_0_P_RecursiveCte AS P_RecursiveCte
GROUP BY P_RecursiveCte.n, P_RecursiveCte.h ORDER BY h NULLS LAST;