WITH t_3_S AS (SELECT * FROM VALUES
  (1, "oslo", "2026-01-03", "tea", 2, 3.5E0),
  (2, "oslo", "2026-01-17", "cake", null, 4.0E0),
  (3, "rome", "2026-02-02", "tea", 5, 3.0E0),
  (4, "rome", "2026-02-11", "coffee", 1, 2.5E0),
  (5, "rome", "2026-03-09", "cake", 3, 4.5E0),
  (6, "lima", "2026-03-21", "coffee", 4, 2.0E0),
  (7, "lima", "2026-01-30", "tea", null, 3.25E0),
  (8, "oslo", "2026-03-02", "coffee", 6, 2.75E0),
  (9, "lima", "2026-02-14", "cake", 2, 5.0E0)
AS UNUSED_TABLE_NAME(id, shop, day, product, qty, price)),
t_0_T AS (SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(- S.price AS arg, S.id AS value))), s -> s.value) END) AS l
FROM
  t_3_S AS S)
SELECT
  (CASE WHEN x_2 < 0 THEN NULL ELSE ELEMENT_AT(T.l, CAST(x_2 AS INT) + 1) END) AS id
FROM
  t_0_T AS T, LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(2 AS BIGINT)), x -> x < 2)) AS x_2) AS pushkin ORDER BY id NULLS LAST;