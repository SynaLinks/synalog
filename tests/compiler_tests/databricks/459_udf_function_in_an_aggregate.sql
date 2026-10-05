SELECT
  SUM(((x_5) * (x_5))) AS t
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_5) AS pushkin;