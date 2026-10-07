SELECT * FROM VALUES
  ("rome", 1),
  ("paris", 2),
  ("oslo", 10)
AS UNUSED_TABLE_NAME(name, n) ORDER BY name NULLS LAST;