WITH t_1_V AS (SELECT * FROM VALUES
  (10, 1),
  (30, 9),
  (20, 5)
AS UNUSED_TABLE_NAME(id, s))
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(V.s AS value, V.id AS arg)), false)[0].arg AS w
FROM
  t_1_V AS V;