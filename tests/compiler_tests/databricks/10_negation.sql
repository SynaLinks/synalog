WITH t_0_Prime AS (SELECT * FROM VALUES
  (2),
  (3),
  (5),
  (7)
AS UNUSED_TABLE_NAME(col0))
SELECT * FROM (
  
    SELECT
      "odd" AS test_name,
      x_5 AS x
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(10 AS BIGINT)), x -> x < 10)) AS x_5) AS pushkin
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(10 AS BIGINT)), x -> x < 10)) AS x_10) AS pushkin
      WHERE
        ((MOD(x_5, NULLIF(2, 0))) = 0) AND
        (x_5 = x_10)) IS NULL)
   UNION ALL
  
    SELECT
      "not_prime" AS test_name,
      x_5 AS x
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(10 AS BIGINT)), x -> x < 10)) AS x_5) AS pushkin
    WHERE
      (x_5 > 1) AND
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_0_Prime AS Prime
      WHERE
        (Prime.col0 = x_5)) IS NULL)
   UNION ALL
  
    SELECT
      "even_not_prime" AS test_name,
      x_7 AS x
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(10 AS BIGINT)), x -> x < 10)) AS x_7) AS pushkin
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_0_Prime AS Prime
      WHERE
        (Prime.col0 = x_7)) IS NULL) AND
      ((MOD(x_7, NULLIF(2, 0))) = 0)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name NULLS LAST, x NULLS LAST ;