WITH t_2_V AS (SELECT * FROM VALUES
  ("a", 5),
  ("a", 6),
  ("b", 1)
AS UNUSED_TABLE_NAME(g, x)),
t_1_G AS (SELECT
  V.g AS g
FROM
  t_2_V AS V
GROUP BY 1),
t_3_Big AS (SELECT
  t_4_V.g AS g
FROM
  t_2_V AS t_4_V
WHERE
  (t_4_V.x > 4)
GROUP BY 1)
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