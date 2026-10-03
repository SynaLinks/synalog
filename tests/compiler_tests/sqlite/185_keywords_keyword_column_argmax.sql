WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      1 AS "order",
      5 AS s
   UNION ALL
  
    SELECT
      2 AS "order",
      9 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(ArgMax(S."order", S.s, 1), '$[' || 0 || ']') AS "order"
FROM
  t_1_S AS S;