WITH t_0_I AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  I.item AS item,
  SUM(1) AS n
FROM
  t_0_I AS I, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < I.qty) select n from t) where n < I.qty)) as x_3
GROUP BY I.item ORDER BY item NULLS LAST, n NULLS LAST;