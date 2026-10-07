WITH t_2_Rows AS (SELECT * FROM VALUES
  ("a,b,c"),
  ("x,y")
AS UNUSED_TABLE_NAME(line)),
t_0_Parsed AS (SELECT
  t_1_Rows.line AS line,
  ARRAY_SIZE(SPLIT(t_1_Rows.line, REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1'))) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE ELEMENT_AT(SPLIT(t_1_Rows.line, REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1')), CAST(0 AS INT) + 1) END) AS first
FROM
  t_2_Rows AS t_1_Rows ORDER BY line NULLS LAST)
SELECT
  Parsed.line AS line,
  Parsed.n AS n,
  Parsed.first AS first
FROM
  t_0_Parsed AS Parsed ORDER BY line NULLS LAST;