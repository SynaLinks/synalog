WITH t_0_Data AS (SELECT * FROM VALUES
  (1, "Alice", "alice@example.com"),
  (2, "Bob", null),
  (3, null, "charlie@example.com"),
  (4, null, null)
AS UNUSED_TABLE_NAME(col0, col1, col2))
SELECT
  Data.col0 AS id,
  COALESCE(Data.col1, "Unknown") AS display_name
FROM
  t_0_Data AS Data ORDER BY id NULLS LAST;