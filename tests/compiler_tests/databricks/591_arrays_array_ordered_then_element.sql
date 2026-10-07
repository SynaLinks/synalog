WITH t_5_V AS (SELECT * FROM VALUES
  (3, "c"),
  (1, "a"),
  (2, "b")
AS UNUSED_TABLE_NAME(k, v)),
t_1_L AS (SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(t_2_V.k AS arg, t_2_V.v AS value))), s -> s.value) END) AS l
FROM
  t_5_V AS t_2_V)
SELECT
  (CASE WHEN ((ARRAY_SIZE(t_0_L.l)) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(t_0_L.l, CAST(((ARRAY_SIZE(t_0_L.l)) - (1)) AS INT) + 1) END) AS last
FROM
  t_1_L AS t_0_L;