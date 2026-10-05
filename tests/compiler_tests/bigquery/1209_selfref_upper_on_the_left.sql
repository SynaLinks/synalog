WITH t_0_C AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "Ab" AS last
   UNION ALL
  
    SELECT
      2 AS id,
      "AB" AS last
  
) AS UNUSED_TABLE_NAME  )
SELECT
  C.id AS id
FROM
  t_0_C AS C
WHERE
  (UPPER(C.last) = C.last);