WITH t_1_Manages AS (SELECT * FROM (
  
    SELECT
      "ceo" AS boss,
      "cto" AS report
   UNION ALL
  
    SELECT
      "ceo" AS boss,
      "cfo" AS report
   UNION ALL
  
    SELECT
      "cto" AS boss,
      "dev1" AS report
   UNION ALL
  
    SELECT
      "cto" AS boss,
      "dev2" AS report
   UNION ALL
  
    SELECT
      "cto" AS boss,
      "ops" AS report
   UNION ALL
  
    SELECT
      "cfo" AS boss,
      "acct" AS report
   UNION ALL
  
    SELECT
      "ops" AS boss,
      "sre1" AS report
   UNION ALL
  
    SELECT
      "ops" AS boss,
      "sre2" AS report
   UNION ALL
  
    SELECT
      "dev1" AS boss,
      "intern" AS report
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Manages.boss AS boss,
  t_0_Manages.report AS report
FROM
  t_1_Manages AS Manages, t_1_Manages AS t_0_Manages
WHERE
  (t_0_Manages.boss = Manages.report) ORDER BY boss, report;