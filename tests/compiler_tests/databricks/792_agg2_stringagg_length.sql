WITH t_2_V AS (SELECT * FROM VALUES
  ("a", 3),
  ("b", 9),
  ("c", 1),
  ("d", 5)
AS UNUSED_TABLE_NAME(n, s)),
t_1_J AS (SELECT
  (CASE WHEN COUNT(V.n) > 0 THEN ARRAY_JOIN(COLLECT_LIST(CAST(V.n AS STRING)), ',') END) AS j
FROM
  t_2_V AS V)
SELECT
  LENGTH(t_0_J.j) AS n
FROM
  t_1_J AS t_0_J;