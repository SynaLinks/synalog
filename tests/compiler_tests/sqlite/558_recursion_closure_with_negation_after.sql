WITH RECURSIVE t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        E.b AS x,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_E AS E
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (E.a = 1)
     UNION ALL
    
      SELECT
        t_5_E.b AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_7_E, t_3_E AS t_5_E
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_5_E.a IS t_7_E.b) AND
        (t_7_E.a = 1)
     UNION ALL
    
      SELECT
        t_10_E.b AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_14_E, t_3_E AS t_12_E, t_3_E AS t_10_E
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_10_E.a IS t_12_E.b) AND
        (t_12_E.a IS t_14_E.b) AND
        (t_14_E.a = 1)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_17_E.b AS x,
  ((t_16_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_R_RecursiveCte AS t_16_R_RecursiveCte, t_3_E AS t_17_E
WHERE
  (t_16_R_RecursiveCte.synalog_step < 5) AND
  (t_17_E.a IS t_16_R_RecursiveCte.x)),
t_0_R AS (SELECT
  R_RecursiveCte.x AS x
FROM
  t_1_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x)
SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 5)) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_6.value)) AS synalog_value
  FROM
    t_0_R AS R, JSON_EACH(JSON_ARRAY(0)) as x_6
  WHERE
    (R.x IS x_3.value)) IS NULL);