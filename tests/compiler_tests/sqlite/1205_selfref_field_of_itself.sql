SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(0, 1)) as x_3
WHERE
  (JSON_OBJECT('a', x_3.value) IS JSON_OBJECT('a', x_3.value)) ORDER BY x NULLS LAST;