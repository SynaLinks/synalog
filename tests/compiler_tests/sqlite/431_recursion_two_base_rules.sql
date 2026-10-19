WITH RECURSIVE t_1_R_RecursiveCte_base AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS logica_step
   UNION ALL
  
    SELECT
      10 AS x,
      0 AS logica_step
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        R_RecursiveCte_base.x AS x,
        R_RecursiveCte_base.logica_step AS logica_step
      FROM
        t_1_R_RecursiveCte_base AS R_RecursiveCte_base
     UNION ALL
    
      SELECT
        ((t_2_R_RecursiveCte_base.x) + (1)) AS x,
        ((t_2_R_RecursiveCte_base.logica_step) + (1)) AS logica_step
      FROM
        t_1_R_RecursiveCte_base AS t_2_R_RecursiveCte_base
      WHERE
        (((((t_2_R_RecursiveCte_base.x) - (10) * CAST((t_2_R_RecursiveCte_base.x) / NULLIF(10, 0) AS INTEGER))) = 0) OR (t_2_R_RecursiveCte_base.x = 1)) AND
        (t_2_R_RecursiveCte_base.logica_step < 3) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        ((((t_5_R_RecursiveCte_base.x) + (1))) + (1)) AS x,
        ((((t_5_R_RecursiveCte_base.logica_step) + (1))) + (1)) AS logica_step
      FROM
        t_1_R_RecursiveCte_base AS t_5_R_RecursiveCte_base
      WHERE
        (((((((t_5_R_RecursiveCte_base.x) + (1))) - (10) * CAST((((t_5_R_RecursiveCte_base.x) + (1))) / NULLIF(10, 0) AS INTEGER))) = 0) OR (((t_5_R_RecursiveCte_base.x) + (1)) = 1)) AND
        (((t_5_R_RecursiveCte_base.logica_step) + (1)) < 3) AND
        (((((t_5_R_RecursiveCte_base.x) - (10) * CAST((t_5_R_RecursiveCte_base.x) / NULLIF(10, 0) AS INTEGER))) = 0) OR (t_5_R_RecursiveCte_base.x = 1)) AND
        (t_5_R_RecursiveCte_base.logica_step < 3) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        ((((((t_9_R_RecursiveCte_base.x) + (1))) + (1))) + (1)) AS x,
        ((((((t_9_R_RecursiveCte_base.logica_step) + (1))) + (1))) + (1)) AS logica_step
      FROM
        t_1_R_RecursiveCte_base AS t_9_R_RecursiveCte_base
      WHERE
        (((((((((t_9_R_RecursiveCte_base.x) + (1))) + (1))) - (10) * CAST((((((t_9_R_RecursiveCte_base.x) + (1))) + (1))) / NULLIF(10, 0) AS INTEGER))) = 0) OR (((((t_9_R_RecursiveCte_base.x) + (1))) + (1)) = 1)) AND
        (((((t_9_R_RecursiveCte_base.logica_step) + (1))) + (1)) < 3) AND
        (((((((t_9_R_RecursiveCte_base.x) + (1))) - (10) * CAST((((t_9_R_RecursiveCte_base.x) + (1))) / NULLIF(10, 0) AS INTEGER))) = 0) OR (((t_9_R_RecursiveCte_base.x) + (1)) = 1)) AND
        (((t_9_R_RecursiveCte_base.logica_step) + (1)) < 3) AND
        (((((t_9_R_RecursiveCte_base.x) - (10) * CAST((t_9_R_RecursiveCte_base.x) / NULLIF(10, 0) AS INTEGER))) = 0) OR (t_9_R_RecursiveCte_base.x = 1)) AND
        (t_9_R_RecursiveCte_base.logica_step < 3) AND
        (1 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((t_10_R_RecursiveCte.x) + (1)) AS x,
  ((t_10_R_RecursiveCte.logica_step) + (1)) AS logica_step
FROM
  t_0_R_RecursiveCte AS t_10_R_RecursiveCte
WHERE
  (((((t_10_R_RecursiveCte.x) - (10) * CAST((t_10_R_RecursiveCte.x) / NULLIF(10, 0) AS INTEGER))) = 0) OR (t_10_R_RecursiveCte.x = 1)) AND
  (t_10_R_RecursiveCte.logica_step < 3))
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x ORDER BY x NULLS LAST;