WITH t_0_Names AS (SELECT * FROM (
  
    SELECT
      'Alice' AS first,
      'Smith' AS last
   UNION ALL
  
    SELECT
      'Bob' AS first,
      'Jones' AS last
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (CONCAT((CONCAT(Names.first, ' ')), Names.last)) AS name
FROM
  t_0_Names AS Names ORDER BY name;