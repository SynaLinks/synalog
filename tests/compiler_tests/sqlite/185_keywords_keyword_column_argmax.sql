WITH t_2_S AS (SELECT * FROM (
  
    SELECT
      1 AS "order",
      5 AS s
   UNION ALL
  
    SELECT
      2 AS "order",
      9 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(ArgMax(t_0_S."order", t_0_S.s, 1), '$[' || 0 || ']') END) AS "order"
FROM
  t_2_S AS t_0_S;