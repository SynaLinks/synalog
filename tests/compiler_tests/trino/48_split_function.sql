WITH t_2_Rows AS (SELECT * FROM (
  
    SELECT
      'a,b,c' AS line
   UNION ALL
  
    SELECT
      'x,y' AS line
  
) AS UNUSED_TABLE_NAME  ),
t_0_Parsed AS (SELECT
  t_1_Rows.line AS line,
  CARDINALITY(SPLIT(t_1_Rows.line, ',')) AS n,
  ELEMENT_AT(SPLIT(t_1_Rows.line, ','), 0 + 1) AS first
FROM
  t_2_Rows AS t_1_Rows ORDER BY line)
SELECT
  Parsed.line AS line,
  Parsed.n AS n,
  Parsed.first AS first
FROM
  t_0_Parsed AS Parsed ORDER BY line;