SELECT
  (SELECT
  MIN(x_4) AS synalog_value
FROM
  LATERAL (SELECT explode(ARRAY("bee", "ant", "cat")) AS x_4) AS pushkin) AS m;