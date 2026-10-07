WITH t_3_S AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_0_T AS (SELECT
  ARRAY_AGG(S.id order by [S.price][offset(0)]) AS l
FROM
  t_3_S AS S)
SELECT
  (CASE WHEN x_2 < 0 THEN NULL ELSE T.l[SAFE_OFFSET(x_2)] END) AS id
FROM
  t_0_T AS T, UNNEST(GENERATE_ARRAY(0, 2 - 1)) as x_2 ORDER BY id NULLS LAST;