WITH t_1_Rows AS (SELECT * FROM (
  
    SELECT
      'a,b,c' AS line
   UNION ALL
  
    SELECT
      'x,y' AS line
  
) AS UNUSED_TABLE_NAME  ),
t_0_Parsed AS (SELECT
  Rows.line AS line,
  JSON_ARRAY_LENGTH(SPLIT(Rows.line, ',')) AS n,
  JSON_EXTRACT(SPLIT(Rows.line, ','), '$[' || 0 || ']') AS first
FROM
  t_1_Rows AS Rows ORDER BY line)
SELECT
  Parsed.line AS line,
  Parsed.n AS n,
  Parsed.first AS first
FROM
  t_0_Parsed AS Parsed ORDER BY line;