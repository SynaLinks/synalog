SELECT
  x_10.value AS name,
  (((('Hello, ') || (x_10.value))) || ('!')) AS message
FROM
  JSON_EACH(JSON_ARRAY('Alice', 'Bob', 'Charlie')) as x_10 ORDER BY name;