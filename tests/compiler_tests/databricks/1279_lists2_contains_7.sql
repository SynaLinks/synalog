WITH t_1_L AS (SELECT * FROM VALUES
  (1, ARRAY(3, 1, 2)),
  (2, ARRAY()),
  (3, ARRAY(5)),
  (4, ARRAY(7, 7, 8, 9))
AS UNUSED_TABLE_NAME(id, l))
SELECT
  t_0_L.id AS id
FROM
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_3) AS pushkin
WHERE
  (7 = x_3)
GROUP BY 1;
