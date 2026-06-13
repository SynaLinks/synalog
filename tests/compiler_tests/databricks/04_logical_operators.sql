SELECT * FROM (
  
    SELECT
      "and" AS test_name,
      x_5 AS x
    FROM
      explode(SEQUENCE(0, 10 - 1)) AS pushkin(x_5)
    WHERE
      ((x_5 > 2) AND (x_5 < 7))
   UNION ALL
  
    SELECT
      "complex" AS test_name,
      x_5 AS x
    FROM
      explode(SEQUENCE(0, 10 - 1)) AS pushkin(x_5)
    WHERE
      (((x_5 > 2) AND (x_5 < 4)) OR ((x_5 > 6) AND (x_5 < 9)))
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;