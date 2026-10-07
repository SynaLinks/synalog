SELECT
  x_1.value AS s
FROM
  JSON_EACH(JSON_ARRAY('a''b', 'x\\''y', 'plain', '); DROP')) as x_1 ORDER BY s;