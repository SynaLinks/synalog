WITH t_2_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      1 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_K AS (SELECT
  R.k AS k
FROM
  t_2_R AS R
GROUP BY 1),
t_3_Loud AS (SELECT
  t_4_R.k AS k
FROM
  t_2_R AS t_4_R
WHERE
  (t_4_R.v > 5)
GROUP BY 1)
SELECT
  t_0_K.k AS k
FROM
  t_1_K AS t_0_K
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_Loud AS Loud
  WHERE
    (Loud.k = t_0_K.k)) IS NULL) ORDER BY k;