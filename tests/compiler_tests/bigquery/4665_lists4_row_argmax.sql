WITH t_2_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[1, 2, 3] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      ARRAY[7] AS l
   UNION ALL
  
    SELECT
      4 AS k,
      ARRAY[5, 5, 9, 1] AS l
   UNION ALL
  
    SELECT
      5 AS k,
      null AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  (SELECT
  ARRAY_AGG(x_6 order by  [(CASE WHEN x_6 < 0 THEN NULL ELSE t_0_L.l[SAFE_OFFSET(x_6)] END)][offset(0)] desc limit 1)[OFFSET(0)] AS logica_value
FROM
  UNNEST(GENERATE_ARRAY(0, ARRAY_LENGTH(t_0_L.l) - 1)) as x_6) AS v
FROM
  t_2_L AS t_0_L ORDER BY k NULLS LAST;