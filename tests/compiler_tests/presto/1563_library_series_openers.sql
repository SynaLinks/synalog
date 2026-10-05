WITH t_0_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_IsSequel AS (SELECT
  t_2_Sequel.next AS book
FROM
  t_0_Sequel AS t_2_Sequel
GROUP BY 1)
SELECT
  Sequel.book AS book
FROM
  t_0_Sequel AS Sequel
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_IsSequel AS IsSequel
  WHERE
    (IsSequel.book = Sequel.book)) IS NULL)
GROUP BY 1 ORDER BY book;