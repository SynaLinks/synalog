WITH t_0_B AS (SELECT * FROM VALUES
  (1, "a"),
  (2, "b"),
  (3, "c")
AS UNUSED_TABLE_NAME(k, v))
SELECT
  B.k AS k,
  B.v AS v
FROM
  t_0_B AS B, LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_6) AS pushkin
WHERE
  (B.k > 1) AND
  (B.v != "c") AND
  (x_6 = B.k);