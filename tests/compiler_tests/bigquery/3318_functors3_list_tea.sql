WITH t_2_Sale AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "north" AS region,
      "tea" AS product,
      120 AS amount
   UNION ALL
  
    SELECT
      2 AS id,
      "north" AS region,
      "cake" AS product,
      40 AS amount
   UNION ALL
  
    SELECT
      3 AS id,
      "south" AS region,
      "tea" AS product,
      75 AS amount
   UNION ALL
  
    SELECT
      4 AS id,
      "south" AS region,
      "coffee" AS product,
      210 AS amount
   UNION ALL
  
    SELECT
      5 AS id,
      "east" AS region,
      "cake" AS product,
      55 AS amount
   UNION ALL
  
    SELECT
      6 AS id,
      "east" AS region,
      "tea" AS product,
      130 AS amount
   UNION ALL
  
    SELECT
      7 AS id,
      "north" AS region,
      "coffee" AS product,
      95 AS amount
   UNION ALL
  
    SELECT
      8 AS id,
      "south" AS region,
      "cake" AS product,
      20 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_1_R AS (SELECT
  ARRAY_AGG(Sale.amount) AS l
FROM
  t_2_Sale AS Sale
WHERE
  (Sale.product = "tea")),
t_3_T AS (SELECT
  SUM(x_10) AS t
FROM
  t_1_R AS t_4_R, UNNEST(t_4_R.l) as x_10)
SELECT
  ARRAY_LENGTH(R.l) AS n,
  t_0_T.t AS t
FROM
  t_1_R AS R, t_3_T AS t_0_T;