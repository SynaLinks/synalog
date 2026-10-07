WITH t_2_I AS (SELECT * FROM (
  
    SELECT
      1 AS `order`,
      "ann" AS customer,
      "pen" AS item,
      2.5 AS price,
      3 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      1 AS `order`,
      "ann" AS customer,
      "ink" AS item,
      7.0 AS price,
      1 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      2 AS `order`,
      "ann" AS customer,
      "pad" AS item,
      4.0 AS price,
      2 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS `order`,
      "bob" AS customer,
      "pen" AS item,
      2.5 AS price,
      10 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS `order`,
      "bob" AS customer,
      "cap" AS item,
      1.25 AS price,
      4 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      3 AS `order`,
      "bob" AS customer,
      "ink" AS item,
      7.0 AS price,
      2 AS qty,
      3 AS pos
   UNION ALL
  
    SELECT
      4 AS `order`,
      "cid" AS customer,
      "pad" AS item,
      4.0 AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS `order`,
      "cid" AS customer,
      "pen" AS item,
      2.5 AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS `order`,
      "cid" AS customer,
      "pen" AS item,
      2.5 AS price,
      2 AS qty,
      2 AS pos
  
) AS UNUSED_TABLE_NAME  ),
t_3_T AS (SELECT
  t_5_I.pos AS pos,
  SUM(x_13) AS t
FROM
  t_2_I AS t_5_I, UNNEST(GENERATE_ARRAY(0, t_5_I.qty - 1)) as x_13
WHERE
  (t_5_I.`order` = 3)
GROUP BY pos)
SELECT
  t_1_T.pos AS pos,
  ARRAY_LENGTH(GENERATE_ARRAY(0, I.qty - 1)) AS n,
  t_1_T.t AS t
FROM
  t_2_I AS I, t_3_T AS t_1_T
WHERE
  (I.pos = t_1_T.pos) AND
  (I.`order` = 3) ORDER BY pos NULLS LAST, n NULLS LAST, t NULLS LAST;