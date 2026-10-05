WITH t_3_X AS (SELECT * FROM VALUES
  (1, "a"),
  (1, "b"),
  (2, "c")
AS UNUSED_TABLE_NAME(k, v)),
t_1_L AS (SELECT
  ARRAY_AGG(X.v) AS l
FROM
  t_3_X AS X
WHERE
  (X.k = 1))
SELECT
  ARRAY_SIZE(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;