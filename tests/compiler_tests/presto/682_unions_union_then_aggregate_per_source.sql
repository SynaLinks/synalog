WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      x_6 AS x
    FROM
      UNNEST(ARRAY[1, 2]) as pushkin(x_6)
   UNION ALL
  
    SELECT
      'b' AS src,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.src AS src,
  SUM(1) AS n
FROM
  t_0_S AS S
GROUP BY 1 ORDER BY src;