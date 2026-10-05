WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "it's" AS w
   UNION ALL
  
    SELECT
      2 AS id,
      "say \"hi\"" AS w
   UNION ALL
  
    SELECT
      3 AS id,
      "café" AS w
   UNION ALL
  
    SELECT
      4 AS id,
      "naïve" AS w
   UNION ALL
  
    SELECT
      5 AS id,
      "a\\b" AS w
   UNION ALL
  
    SELECT
      6 AS id,
      "50%" AS w
   UNION ALL
  
    SELECT
      7 AS id,
      "o'neil" AS w
   UNION ALL
  
    SELECT
      8 AS id,
      "x_y" AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.id AS id,
  SUBSTR(t_0_W.w, 1, 1) AS c
FROM
  t_1_W AS t_0_W ORDER BY id NULLS LAST, c NULLS LAST;
