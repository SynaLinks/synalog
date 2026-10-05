WITH t_1_W AS (SELECT * FROM VALUES
  (1, "it's"),
  (2, "say \u0022hi\u0022"),
  (3, "café"),
  (4, "naïve"),
  (5, "a\\b"),
  (6, "50%"),
  (7, "o'neil"),
  (8, "x_y")
AS UNUSED_TABLE_NAME(id, w))
SELECT
  x_2 AS part
FROM
  t_1_W AS t_0_W, LATERAL (SELECT explode(SPLIT(t_0_W.w, REGEXP_REPLACE("'", '([^a-zA-Z0-9])', '\\\\$1'))) AS x_2) AS pushkin
WHERE
  (CAST(t_0_W.w AS STRING) LIKE "%'%" ESCAPE '\\')
GROUP BY 1 ORDER BY part NULLS LAST;
