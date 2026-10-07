WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      "a" AS g,
      5 AS x
   UNION ALL
  
    SELECT
      "a" AS g,
      6 AS x
   UNION ALL
  
    SELECT
      "b" AS g,
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_G AS (SELECT
  V.g AS g
FROM
  t_2_V AS V
GROUP BY g),
t_3_Big AS (SELECT
  t_4_V.g AS g
FROM
  t_2_V AS t_4_V
WHERE
  (t_4_V.x > 4)
GROUP BY g)
SELECT
  t_0_G.g AS g
FROM
  t_1_G AS t_0_G
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_Big AS Big
  WHERE
    (Big.g = t_0_G.g)) IS NULL);