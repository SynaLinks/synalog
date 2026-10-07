WITH t_0_Names AS (SELECT * FROM VALUES
  ("Alice", "Smith"),
  ("Bob", "Jones")
AS UNUSED_TABLE_NAME(first, last))
SELECT
  (CONCAT((CONCAT(Names.first, " ")), Names.last)) AS name
FROM
  t_0_Names AS Names ORDER BY name NULLS LAST;