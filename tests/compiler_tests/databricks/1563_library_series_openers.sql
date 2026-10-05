WITH t_0_Sequel AS (SELECT * FROM VALUES
  (2, 3),
  (4, 5),
  (8, 9),
  (1, 2)
AS UNUSED_TABLE_NAME(book, next)),
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
GROUP BY 1 ORDER BY book NULLS LAST;
