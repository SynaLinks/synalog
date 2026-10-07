WITH t_0_V AS (SELECT * FROM VALUES
  (1, "-- comment"),
  (2, "plain")
AS UNUSED_TABLE_NAME(id, s))
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  (CAST(V.s AS STRING) LIKE "-- comment" ESCAPE '\\');
