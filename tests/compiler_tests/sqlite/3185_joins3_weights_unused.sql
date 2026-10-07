WITH t_0_F AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS w
   UNION ALL
  
    SELECT
      'b' AS g,
      2 AS w
   UNION ALL
  
    SELECT
      null AS g,
      3 AS w
  
) AS UNUSED_TABLE_NAME  ),
t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'a' AS g,
      10 AS v
   UNION ALL
  
    SELECT
      2 AS id,
      'a' AS g,
      20 AS v
   UNION ALL
  
    SELECT
      3 AS id,
      'b' AS g,
      null AS v
   UNION ALL
  
    SELECT
      4 AS id,
      null AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_Used AS (SELECT
  E.g AS g
FROM
  t_2_E AS E
WHERE
  (E.g IS NOT null)
GROUP BY E.g)
SELECT
  F.w AS w
FROM
  t_0_F AS F
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_5.value)) AS logica_value
  FROM
    t_1_Used AS Used, JSON_EACH(JSON_ARRAY(0)) as x_5
  WHERE
    (Used.g = F.g)) IS NULL);