WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      1 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_K AS (SELECT
  R.k AS k
FROM
  t_1_R AS R
GROUP BY 1),
t_2_Loud AS (SELECT
  t_3_R.k AS k
FROM
  t_1_R AS t_3_R
WHERE
  (t_3_R.v > 5)
GROUP BY 1)
SELECT
  K.k AS k
FROM
  t_0_K AS K
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_Loud AS Loud
  WHERE
    (Loud.k = K.k)) IS NULL) ORDER BY k;