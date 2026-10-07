DROP TABLE IF EXISTS logica_test.L;
CREATE TABLE logica_test.L AS WITH t_1_I AS (SELECT * FROM (
  
    SELECT
      1 AS "order",
      'ann' AS customer,
      'pen' AS item,
      2.5E0 AS price,
      3 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      1 AS "order",
      'ann' AS customer,
      'ink' AS item,
      7.0E0 AS price,
      1 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      2 AS "order",
      'ann' AS customer,
      'pad' AS item,
      4.0E0 AS price,
      2 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'pen' AS item,
      2.5E0 AS price,
      10 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'cap' AS item,
      1.25E0 AS price,
      4 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'ink' AS item,
      7.0E0 AS price,
      2 AS qty,
      3 AS pos
   UNION ALL
  
    SELECT
      4 AS "order",
      'cid' AS customer,
      'pad' AS item,
      4.0E0 AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS "order",
      'cid' AS customer,
      'pen' AS item,
      2.5E0 AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS "order",
      'cid' AS customer,
      'pen' AS item,
      2.5E0 AS price,
      2 AS qty,
      2 AS pos
  
) AS UNUSED_TABLE_NAME  )
SELECT
  I."order" AS "order",
  ARRAY_AGG(I.item order by I.pos) AS l
FROM
  t_1_I AS I
GROUP BY 1;

-- Interacting with table logica_test.L

SELECT
  t_0_L."order" AS "order"
FROM
  logica_test.L AS t_0_L
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.L AS t_1_L, UNNEST(TRANSFORM(t_1_L.l, synalog_e -> ROW(synalog_e))) as pushkin(x_6)
  WHERE
    ('ink' = x_6) AND
    (t_0_L."order" = t_1_L."order")) IS NULL) ORDER BY "order";