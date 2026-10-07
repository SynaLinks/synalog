WITH t_1_D AS (SELECT * FROM (
  
    SELECT
      10 AS dept,
      'eng' AS dname,
      'paris' AS city
   UNION ALL
  
    SELECT
      20 AS dept,
      'ops' AS dname,
      'lyon' AS city
   UNION ALL
  
    SELECT
      40 AS dept,
      'hr' AS dname,
      'nice' AS city
   UNION ALL
  
    SELECT
      null AS dept,
      'temp' AS dname,
      'lyon' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D.dname AS a,
  t_0_D.dname AS b
FROM
  t_1_D AS D, t_1_D AS t_0_D
WHERE
  (D.dname < t_0_D.dname) AND
  (t_0_D.city = D.city);