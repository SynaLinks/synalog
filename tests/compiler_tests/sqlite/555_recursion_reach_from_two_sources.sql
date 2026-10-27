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
      10 AS a,
      11 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        x_7.value AS x,
        0 AS synalog_step
      FROM
        JSON_EACH(JSON_ARRAY(1, 10)) as x_7
     UNION ALL
    
      SELECT
        E.b AS x,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_E AS E, JSON_EACH(JSON_ARRAY(1, 10)) as x_22
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (E.a IS x_22.value)
     UNION ALL
    
      SELECT
        t_4_E.b AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_6_E, t_2_E AS t_4_E, JSON_EACH(JSON_ARRAY(1, 10)) as x_42
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_4_E.a IS t_6_E.b) AND
        (t_6_E.a IS x_42.value)
     UNION ALL
    
      SELECT
        t_9_E.b AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_13_E, t_2_E AS t_11_E, t_2_E AS t_9_E, JSON_EACH(JSON_ARRAY(1, 10)) as x_67
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_9_E.a IS t_11_E.b) AND
        (t_11_E.a IS t_13_E.b) AND
        (t_13_E.a IS x_67.value)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_16_E.b AS x,
  ((t_15_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_15_R_RecursiveCte, t_2_E AS t_16_E
WHERE
  (t_15_R_RecursiveCte.synalog_step < 5) AND
  (t_16_E.a IS t_15_R_RecursiveCte.x))
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x ORDER BY x NULLS LAST;