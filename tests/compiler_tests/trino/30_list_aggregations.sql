WITH t_1_Tags AS (SELECT * FROM (
  
    SELECT
      'post1' AS col0,
      'tech' AS col1
   UNION ALL
  
    SELECT
      'post1' AS col0,
      'news' AS col1
   UNION ALL
  
    SELECT
      'post1' AS col0,
      'featured' AS col1
   UNION ALL
  
    SELECT
      'post2' AS col0,
      'tech' AS col1
   UNION ALL
  
    SELECT
      'post2' AS col0,
      'tutorial' AS col1
   UNION ALL
  
    SELECT
      'post3' AS col0,
      'news' AS col1
   UNION ALL
  
    SELECT
      'post3' AS col0,
      'news' AS col1
  
) AS UNUSED_TABLE_NAME  ),
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
  t_0_TagCount AS TagCount ORDER BY post;