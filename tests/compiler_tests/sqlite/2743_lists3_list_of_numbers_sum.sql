WITH t_1_I AS (SELECT * FROM (
  
    SELECT
      1 AS "order",
      'ann' AS customer,
      'pen' AS item,
      2.5 AS price,
      3 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      1 AS "order",
      'ann' AS customer,
      'ink' AS item,
      7.0 AS price,
      1 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      2 AS "order",
      'ann' AS customer,
      'pad' AS item,
      4.0 AS price,
      2 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'pen' AS item,
      2.5 AS price,
      10 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'cap' AS item,
      1.25 AS price,
      4 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'ink' AS item,
      7.0 AS price,
      2 AS qty,
      3 AS pos
   UNION ALL
  
    SELECT
      4 AS "order",
      'cid' AS customer,
      'pad' AS item,
      4.0 AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS "order",
      'cid' AS customer,
      'pen' AS item,
      2.5 AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS "order",
      'cid' AS customer,
      'pen' AS item,
      2.5 AS price,
      2 AS qty,
      2 AS pos
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q0 AS (SELECT
  I.customer AS customer,
  JSON_GROUP_ARRAY(I.qty) AS l
FROM
  t_1_I AS I
GROUP BY I.customer)
SELECT
  Q0.customer AS customer,
  SUM(x_3.value) AS t
FROM
  t_0_Q0 AS Q0, JSON_EACH(Q0.l) as x_3
GROUP BY Q0.customer ORDER BY customer NULLS LAST, t NULLS LAST;