WITH t_0_Name AS (SELECT * FROM (
  
    SELECT
      0 AS p,
      "even" AS n
   UNION ALL
  
    SELECT
      1 AS p,
      "odd" AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_6 AS x,
  Name.n AS n
FROM
  t_0_Name AS Name, UNNEST(ARRAY[1, 2]) as x_6
WHERE
  (Name.p = CASE WHEN ((MOD(x_6, NULLIF(2, 0))) = 0) THEN 0 ELSE 1 END) ORDER BY x NULLS LAST;