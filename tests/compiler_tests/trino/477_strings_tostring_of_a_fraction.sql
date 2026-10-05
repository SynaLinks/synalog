WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1.5E0 AS x,
      42 AS y,
      null AS z
   UNION ALL
  
    SELECT
      2.5E0 AS x,
      7 AS y,
      1 AS z
  
) AS UNUSED_TABLE_NAME  )
SELECT
  element_at(transform(filter(ARRAY[V.x], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1) AS a,
  element_at(transform(filter(ARRAY[V.y], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1) AS b,
  element_at(transform(filter(ARRAY[V.z], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1) AS c
FROM
  t_0_V AS V
WHERE
  (V.x < 2);
