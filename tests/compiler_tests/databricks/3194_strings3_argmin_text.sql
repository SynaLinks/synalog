WITH t_1_V AS (SELECT * FROM VALUES
  (1, "b"),
  (2, "B"),
  (3, "c")
AS UNUSED_TABLE_NAME(id, w))
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(V.w AS value, V.id AS arg)))[0].arg AS id
FROM
  t_1_V AS V;