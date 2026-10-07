WITH t_0_Name AS (SELECT * FROM (
  
    SELECT
      0 AS p,
      'even' AS n
   UNION ALL
  
    SELECT
      1 AS p,
      'odd' AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_6.value AS x,
  Name.n AS n
FROM
  t_0_Name AS Name, JSON_EACH(JSON_ARRAY(1, 2)) as x_6
WHERE
  (Name.p = CASE WHEN ((((x_6.value) - (2) * CAST((x_6.value) / NULLIF(2, 0) AS INTEGER))) = 0) THEN 0 ELSE 1 END) ORDER BY x NULLS LAST;