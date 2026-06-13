WITH t_1_Names AS (SELECT * FROM (
  
    SELECT
      "alice" AS first,
      "smith" AS last
   UNION ALL
  
    SELECT
      "bob" AS first,
      "jones" AS last
   UNION ALL
  
    SELECT
      "charlie" AS first,
      "brown" AS last
  
) AS UNUSED_TABLE_NAME  ),
t_0_FormattedNames AS (SELECT
  Names.first AS first,
  UPPER(Names.first) AS upper_first,
  LENGTH(Names.last) AS len
FROM
  t_1_Names AS Names ORDER BY first)
SELECT
  FormattedNames.first AS first,
  FormattedNames.upper_first AS upper_first,
  FormattedNames.len AS len
FROM
  t_0_FormattedNames AS FormattedNames ORDER BY first;