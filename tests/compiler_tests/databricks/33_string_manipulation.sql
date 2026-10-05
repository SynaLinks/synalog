WITH t_1_Names AS (SELECT * FROM VALUES
  ("alice", "smith"),
  ("bob", "jones"),
  ("charlie", "brown")
AS UNUSED_TABLE_NAME(first, last)),
t_0_FormattedNames AS (SELECT
  Names.first AS first,
  UPPER(Names.first) AS upper_first,
  LENGTH(Names.last) AS len
FROM
  t_1_Names AS Names ORDER BY first NULLS LAST)
SELECT
  FormattedNames.first AS first,
  FormattedNames.upper_first AS upper_first,
  FormattedNames.len AS len
FROM
  t_0_FormattedNames AS FormattedNames ORDER BY first NULLS LAST;