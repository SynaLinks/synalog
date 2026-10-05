WITH t_0_B AS (SELECT * FROM VALUES
  (1, "a"),
  (2, "b")
AS UNUSED_TABLE_NAME(id, v))
SELECT
  B.id AS id,
  B.v AS v
FROM
  t_0_B AS B, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_6) AS pushkin
WHERE
  (B.id > 1) AND
  (x_6 = B.id);