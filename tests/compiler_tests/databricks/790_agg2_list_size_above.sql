WITH t_2_V AS (SELECT * FROM VALUES
  ("a", 3),
  ("b", 9),
  ("c", 1),
  ("d", 5)
AS UNUSED_TABLE_NAME(n, s)),
t_1_L AS (SELECT
  ARRAY_AGG(V.s) AS l
FROM
  t_2_V AS V
WHERE
  (V.s > 2))
SELECT
  ARRAY_SIZE(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;