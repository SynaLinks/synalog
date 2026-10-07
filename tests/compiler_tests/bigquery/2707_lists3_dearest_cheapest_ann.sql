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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_AGG(I.item order by  [I.price][offset(0)] desc limit 1)[OFFSET(0)] AS dear,
  ARRAY_AGG(I.item order by [I.price][offset(0)] limit 1)[OFFSET(0)] AS cheap
FROM
  t_2_I AS I
WHERE
  (I.customer = "ann");