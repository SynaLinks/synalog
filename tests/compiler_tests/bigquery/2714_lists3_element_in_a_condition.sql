WITH t_4_I AS (SELECT * FROM (
  
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
t_1_L AS (SELECT
  I.`order` AS `order`,
  ARRAY_AGG(I.item order by [I.pos][offset(0)]) AS l
FROM
  t_4_I AS I
GROUP BY `order`)
SELECT
  t_0_L.`order` AS `order`
FROM
  t_1_L AS t_0_L
WHERE
  ((CASE WHEN 0 < 0 THEN NULL ELSE t_0_L.l[SAFE_OFFSET(0)] END) = "pen") ORDER BY `order` NULLS LAST;