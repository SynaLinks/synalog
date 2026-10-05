WITH t_0_C AS (SELECT * FROM VALUES
  (1, "Ab"),
  (2, "AB")
AS UNUSED_TABLE_NAME(id, last))
SELECT
  C.id AS id
FROM
  t_0_C AS C
WHERE
  (UPPER(C.last) = C.last);
