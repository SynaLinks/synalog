WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS v
   UNION ALL
  
    SELECT
      3 AS k,
      'c' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.k AS k,
  B.v AS v
FROM
  t_0_B AS B, UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
WHERE
  (B.k > 1) AND
  (B.v != 'c') AND
  (x_6 = B.k);