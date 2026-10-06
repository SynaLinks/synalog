WITH t_1_I AS (SELECT * FROM (
  
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
t_0_S AS (SELECT
  I.customer AS customer,
  ARRAY_AGG(DISTINCT I.item) AS items
FROM
  t_1_I AS I
GROUP BY customer)
SELECT
  S.customer AS customer
FROM
  t_0_S AS S, UNNEST(S.items) as x_3
WHERE
  ("ink" = x_3) ORDER BY customer NULLS LAST;