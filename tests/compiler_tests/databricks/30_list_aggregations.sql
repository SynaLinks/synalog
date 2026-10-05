WITH t_1_Tags AS (SELECT * FROM VALUES
  ("post1", "tech"),
  ("post1", "news"),
  ("post1", "featured"),
  ("post2", "tech"),
  ("post2", "tutorial"),
  ("post3", "news"),
  ("post3", "news")
AS UNUSED_TABLE_NAME(col0, col1)),
t_0_TagCount AS (SELECT
  Tags.col0 AS col0,
  SUM(1) AS count
FROM
  t_1_Tags AS Tags
GROUP BY 1)
SELECT
  TagCount.col0 AS post,
  TagCount.count AS count
FROM
  t_0_TagCount AS TagCount ORDER BY post NULLS LAST;