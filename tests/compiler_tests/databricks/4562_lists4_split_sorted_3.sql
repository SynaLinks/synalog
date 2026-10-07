WITH t_2_T AS (SELECT * FROM VALUES
  (1, "a,b,c"),
  (2, ""),
  (3, "abc"),
  (4, ",,"),
  (5, "x,"),
  (6, null)
AS UNUSED_TABLE_NAME(k, s))
SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(x_4 AS arg, x_4 AS value))), s -> s.value) END) AS a
FROM
  t_2_T AS T, LATERAL (SELECT explode(SPLIT(T.s, REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1'))) AS x_4) AS pushkin
WHERE
  (T.k = 3);