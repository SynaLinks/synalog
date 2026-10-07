WITH t_0_V AS (SELECT * FROM VALUES
  (1, "2024-01-01"),
  (2, "2024-02-28"),
  (3, "2024-02-29"),
  (4, "2023-03-01"),
  (5, "2000-12-31"),
  (6, "1999-07-15"),
  (7, "2026-10-06"),
  (8, "1970-01-01"),
  (9, "2100-02-28"),
  (10, "2004-08-09")
AS UNUSED_TABLE_NAME(id, d))
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  (SUBSTR(V.d, 1, LENGTH("2024")) = "2024") ORDER BY id NULLS LAST;