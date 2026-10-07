WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      "a_c" AS w
   UNION ALL
  
    SELECT
      "abc" AS w
   UNION ALL
  
    SELECT
      "50%" AS w
   UNION ALL
  
    SELECT
      "500" AS w
   UNION ALL
  
    SELECT
      "x\\y" AS w
   UNION ALL
  
    SELECT
      "" AS w
   UNION ALL
  
    SELECT
      "Ab" AS w
   UNION ALL
  
    SELECT
      "a%c" AS w
   UNION ALL
  
    SELECT
      "aXc" AS w
   UNION ALL
  
    SELECT
      "ac" AS w
   UNION ALL
  
    SELECT
      "hello world" AS w
   UNION ALL
  
    SELECT
      "_x" AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.w AS w
FROM
  t_1_W AS t_0_W
WHERE
  ((t_0_W.w LIKE "a\\_c") = false) ORDER BY w NULLS LAST;
