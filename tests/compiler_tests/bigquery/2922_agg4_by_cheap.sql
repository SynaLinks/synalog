WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "oslo" AS shop,
      "2026-01-03" AS day,
      "tea" AS product,
      2 AS qty,
      3.5 AS price
   UNION ALL
  
    SELECT
      2 AS id,
      "oslo" AS shop,
      "2026-01-17" AS day,
      "cake" AS product,
      null AS qty,
      4.0 AS price
   UNION ALL
  
    SELECT
      3 AS id,
      "rome" AS shop,
      "2026-02-02" AS day,
      "tea" AS product,
      5 AS qty,
      3.0 AS price
   UNION ALL
  
    SELECT
      4 AS id,
      "rome" AS shop,
      "2026-02-11" AS day,
      "coffee" AS product,
      1 AS qty,
      2.5 AS price
   UNION ALL
  
    SELECT
      5 AS id,
      "rome" AS shop,
      "2026-03-09" AS day,
      "cake" AS product,
      3 AS qty,
      4.5 AS price
   UNION ALL
  
    SELECT
      6 AS id,
      "lima" AS shop,
      "2026-03-21" AS day,
      "coffee" AS product,
      4 AS qty,
      2.0 AS price
   UNION ALL
  
    SELECT
      7 AS id,
      "lima" AS shop,
      "2026-01-30" AS day,
      "tea" AS product,
      null AS qty,
      3.25 AS price
   UNION ALL
  
    SELECT
      8 AS id,
      "oslo" AS shop,
      "2026-03-02" AS day,
      "coffee" AS product,
      6 AS qty,
      2.75 AS price
   UNION ALL
  
    SELECT
      9 AS id,
      "lima" AS shop,
      "2026-02-14" AS day,
      "cake" AS product,
      2 AS qty,
      5.0 AS price
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (S.price < 3) AS cheap,
  SUM(1) AS n
FROM
  t_0_S AS S
GROUP BY cheap ORDER BY cheap, n;