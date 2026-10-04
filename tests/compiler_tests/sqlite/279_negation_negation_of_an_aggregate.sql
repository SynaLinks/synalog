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
GROUP BY R.k),
t_2_Loud AS (SELECT
  t_3_R.k AS k
FROM
  t_1_R AS t_3_R
WHERE
  (t_3_R.v > 5)
GROUP BY t_3_R.k)
SELECT
  K.k AS k
FROM
  t_0_K AS K
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_6.value)) AS logica_value
  FROM
    t_2_Loud AS Loud, JSON_EACH(JSON_ARRAY(0)) as x_6
  WHERE
    (Loud.k = K.k)) IS NULL) ORDER BY k;