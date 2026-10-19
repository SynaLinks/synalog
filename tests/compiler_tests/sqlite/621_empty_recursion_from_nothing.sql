WITH RECURSIVE t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        x_7.value AS x,
        0 AS logica_step
      FROM
        JSON_EACH(JSON_ARRAY(1)) as x_7
      WHERE
        (x_7.value > 5)
     UNION ALL
    
      SELECT
        2 AS x,
        ((0) + (1)) AS logica_step
      FROM
        JSON_EACH(JSON_ARRAY(1)) as x_22
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (x_22.value > 5) AND
        (1 = x_22.value)
     UNION ALL
    
      SELECT
        2 AS x,
        ((((0) + (1))) + (1)) AS logica_step
      FROM
        JSON_EACH(JSON_ARRAY(1)) as x_42
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (x_42.value > 5) AND
        (1 = 2) AND
        (1 = x_42.value)
     UNION ALL
    
      SELECT
        2 AS x,
        ((((((0) + (1))) + (1))) + (1)) AS logica_step
      FROM
        JSON_EACH(JSON_ARRAY(1)) as x_67
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (x_67.value > 5) AND
        (1 = 2) AND
        (1 = x_67.value)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  2 AS x,
  ((t_14_R_RecursiveCte.logica_step) + (1)) AS logica_step
FROM
  t_0_R_RecursiveCte AS t_14_R_RecursiveCte
WHERE
  (t_14_R_RecursiveCte.logica_step < 5) AND
  (t_14_R_RecursiveCte.x = 1))
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x ORDER BY x NULLS LAST;