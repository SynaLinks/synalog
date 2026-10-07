WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      '2026-01-01' AS "from"
   UNION ALL
  
    SELECT
      '2026-02-01' AS "from"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P."from" AS "from"
FROM
  t_0_P AS P
WHERE
  (P."from" > '2026-01-15');