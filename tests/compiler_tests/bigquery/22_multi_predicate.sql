WITH t_0_AllSquares AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) * (x_15)) AS sq,
      "even" AS type
    FROM
      UNNEST(GENERATE_ARRAY(0, 10 - 1)) as x_15
    WHERE
      ((MOD(x_15, 2)) = 0)
   UNION ALL
  
    SELECT
      x_25 AS x,
      ((x_25) * (x_25)) AS sq,
      "odd" AS type
    FROM
      UNNEST(GENERATE_ARRAY(0, 10 - 1)) as x_25
    WHERE
      ((MOD(x_25, 2)) = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AllSquares.x AS x,
  AllSquares.sq AS sq,
  AllSquares.type AS type
FROM
  t_0_AllSquares AS AllSquares ORDER BY x;