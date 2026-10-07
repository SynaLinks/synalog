WITH t_3_S AS (SELECT * FROM VALUES
  ("north", 1, 5),
  ("north", 2, 8),
  ("north", 3, 3),
  ("north", 5, 9),
  ("north", 6, 1),
  ("south", 1, 7),
  ("south", 2, 7),
  ("south", 4, 2),
  ("south", 5, 6),
  ("east", 2, 4),
  ("east", 3, 11),
  ("east", 4, 6),
  ("east", 5, 10),
  ("east", 7, 3)
AS UNUSED_TABLE_NAME(r, d, v)),
t_2_D AS (SELECT
  S.d AS d
FROM
  t_3_S AS S
WHERE
  (S.r = "east")
GROUP BY 1),
t_0_B AS (SELECT
  MIN(t_1_D.d) AS lo,
  MAX(t_1_D.d) AS hi
FROM
  t_2_D AS t_1_D)
SELECT
  x_3 AS d
FROM
  t_0_B AS B, LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(((B.hi) + (1)) AS BIGINT)), x -> x < ((B.hi) + (1)))) AS x_3) AS pushkin
WHERE
  (x_3 > B.lo) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_D AS t_4_D
  WHERE
    (t_4_D.d = x_3)) IS NULL);