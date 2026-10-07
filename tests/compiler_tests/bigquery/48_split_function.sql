WITH t_2_Rows AS (SELECT * FROM (
  
    SELECT
      "a,b,c" AS line
   UNION ALL
  
    SELECT
      "x,y" AS line
  
) AS UNUSED_TABLE_NAME  ),
t_0_Parsed AS (SELECT
  t_1_Rows.line AS line,
  ARRAY_LENGTH(SPLIT(t_1_Rows.line, ",")) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE SPLIT(t_1_Rows.line, ",")[SAFE_OFFSET(0)] END) AS first
FROM
  t_2_Rows AS t_1_Rows ORDER BY line NULLS LAST)
SELECT
  Parsed.line AS line,
  Parsed.n AS n,
  Parsed.first AS first
FROM
  t_0_Parsed AS Parsed ORDER BY line NULLS LAST;