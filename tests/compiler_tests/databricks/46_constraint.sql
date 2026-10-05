WITH t_0_BigNumbers AS (SELECT
  x_5 AS x
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_5) AS pushkin
WHERE
  (x_5 > 5) ORDER BY x NULLS LAST)
SELECT
  BigNumbers.x AS x
FROM
  t_0_BigNumbers AS BigNumbers ORDER BY x NULLS LAST;