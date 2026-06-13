WITH t_0_Prime AS (SELECT * FROM (
  
    SELECT
      2 AS col0
   UNION ALL
  
    SELECT
      3 AS col0
   UNION ALL
  
    SELECT
      5 AS col0
   UNION ALL
  
    SELECT
      7 AS col0
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      "odd" AS test_name,
      x_5 AS x
    FROM
      explode(SEQUENCE(0, 10 - 1)) AS pushkin(x_5)
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        explode(SEQUENCE(0, 10 - 1)) AS pushkin(x_10)
      WHERE
        ((MOD(x_5, 2)) = 0) AND
        (x_5 = x_10)) IS NULL)
   UNION ALL
  
    SELECT
      "not_prime" AS test_name,
      x_5 AS x
    FROM
      explode(SEQUENCE(0, 10 - 1)) AS pushkin(x_5)
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
      explode(SEQUENCE(0, 10 - 1)) AS pushkin(x_7)
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_0_Prime AS Prime
      WHERE
        (Prime.col0 = x_7)) IS NULL) AND
      ((MOD(x_7, 2)) = 0)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;