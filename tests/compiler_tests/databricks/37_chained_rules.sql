WITH t_0_Raw AS (SELECT * FROM (
  
    SELECT
      1 AS v
   UNION ALL
  
    SELECT
      2 AS v
   UNION ALL
  
    SELECT
      3 AS v
   UNION ALL
  
    SELECT
      4 AS v
   UNION ALL
  
    SELECT
      5 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Raw.v AS v,
  ((Raw.v) * (2)) AS doubled,
  ((((Raw.v) * (2))) + (10)) AS plus_ten
FROM
  t_0_Raw AS Raw
WHERE
  (Raw.v > 2) ORDER BY v;