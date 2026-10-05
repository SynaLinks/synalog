WITH t_0_Event AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "2025-12-30 23:15:00" AS `at`,
      "login" AS kind,
      "ana" AS `user`
   UNION ALL
  
    SELECT
      2 AS id,
      "2026-01-02 08:05:30" AS `at`,
      "buy" AS kind,
      "ana" AS `user`
   UNION ALL
  
    SELECT
      3 AS id,
      "2026-01-15 12:00:00" AS `at`,
      "login" AS kind,
      "ben" AS `user`
   UNION ALL
  
    SELECT
      4 AS id,
      "2026-02-01 00:00:01" AS `at`,
      "buy" AS kind,
      "ben" AS `user`
   UNION ALL
  
    SELECT
      5 AS id,
      "2026-02-14 18:45:10" AS `at`,
      "buy" AS kind,
      "ana" AS `user`
   UNION ALL
  
    SELECT
      6 AS id,
      "2026-02-28 23:59:59" AS `at`,
      "login" AS kind,
      "cy" AS `user`
   UNION ALL
  
    SELECT
      7 AS id,
      "2026-03-01 06:30:00" AS `at`,
      "buy" AS kind,
      "cy" AS `user`
   UNION ALL
  
    SELECT
      8 AS id,
      "2026-03-15 14:20:00" AS `at`,
      "refund" AS kind,
      "ana" AS `user`
   UNION ALL
  
    SELECT
      9 AS id,
      "2026-03-31 09:00:00" AS `at`,
      "login" AS kind,
      "ben" AS `user`
   UNION ALL
  
    SELECT
      10 AS id,
      "2026-04-01 10:10:10" AS `at`,
      "buy" AS kind,
      "ben" AS `user`
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Event.id AS id,
  Event.`at` AS `at`
FROM
  t_0_Event AS Event
WHERE
  (Event.`user` = "ben") ORDER BY `at` desc LIMIT 1;
