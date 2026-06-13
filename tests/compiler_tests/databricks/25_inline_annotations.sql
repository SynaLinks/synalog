WITH t_0_P1 AS (SELECT
  (MOD(((x_2) * (17)), 39)) AS col0
FROM
  explode(GENERATE_ARRAY(0, 10 - 1)) AS pushkin(x_2) ORDER BY col0),
t_0_P2 AS (SELECT
  x_5 AS col0
FROM
  explode(GENERATE_ARRAY(0, 20 - 1)) AS pushkin(x_5) LIMIT 5),
t_0_P3 AS (SELECT
  x_5 AS col0
FROM
  explode(GENERATE_ARRAY(0, 20 - 1)) AS pushkin(x_5)
WHERE
  ((MOD(x_5, 2)) = 0) ORDER BY col0 LIMIT 3)
SELECT * FROM (
  
    SELECT
      "ordered" AS col0,
      P1.col0 AS col1
    FROM
      t_0_P1 AS P1
   UNION ALL
  
    SELECT
      "limited" AS col0,
      P2.col0 AS col1
    FROM
      t_0_P2 AS P2
   UNION ALL
  
    SELECT
      "both" AS col0,
      P3.col0 AS col1
    FROM
      t_0_P3 AS P3
  
) AS UNUSED_TABLE_NAME  ORDER BY col0, col1 ;