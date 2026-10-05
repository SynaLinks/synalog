DROP TABLE IF EXISTS logica_test.Even;
CREATE TABLE logica_test.Even AS SELECT
  x_3 AS col0
FROM
  UNNEST(FILTER(SEQUENCE(0, 10), x -> x < 10)) as pushkin(x_3)
WHERE
  ((MOD(x_3, 2)) = 0);

-- Interacting with table logica_test.Even

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
      'odd' AS test_name,
      x_5 AS x
    FROM
      UNNEST(FILTER(SEQUENCE(0, 10), x -> x < 10)) as pushkin(x_5)
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        logica_test.Even AS Even
      WHERE
        (Even.col0 = x_5)) IS NULL)
   UNION ALL
  
    SELECT
      'not_prime' AS test_name,
      x_5 AS x
    FROM
      UNNEST(FILTER(SEQUENCE(0, 10), x -> x < 10)) as pushkin(x_5)
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
      'even_not_prime' AS test_name,
      Even.col0 AS x
    FROM
      logica_test.Even AS Even
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_0_Prime AS Prime
      WHERE
        (Prime.col0 = Even.col0)) IS NULL)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;