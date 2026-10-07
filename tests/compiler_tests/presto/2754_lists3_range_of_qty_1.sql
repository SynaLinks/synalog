DROP TABLE IF EXISTS logica_test.R;
CREATE TABLE logica_test.R AS WITH t_0_I AS (SELECT * FROM (
  
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
  I.pos AS pos,
  FILTER(SEQUENCE(0, I.qty), x -> x < I.qty) AS r
FROM
  t_0_I AS I
WHERE
  (I."order" = 1);

-- Interacting with table logica_test.R

WITH t_2_T AS (SELECT
  t_3_R.pos AS pos,
  SUM(x_9) AS t
FROM
  logica_test.R AS t_3_R, UNNEST(TRANSFORM(t_3_R.r, synalog_e -> ROW(synalog_e))) as pushkin(x_9)
GROUP BY 1)
SELECT
  t_0_R.pos AS pos,
  CARDINALITY(t_0_R.r) AS n,
  t_1_T.t AS t
FROM
  logica_test.R AS t_0_R, t_2_T AS t_1_T
WHERE
  (t_1_T.pos = t_0_R.pos) ORDER BY pos, n, t;