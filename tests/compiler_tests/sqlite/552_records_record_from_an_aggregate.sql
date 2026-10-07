WITH t_0_S AS (SELECT
  MIN(x_5.value) AS lo,
  MAX(x_5.value) AS hi
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_5)
SELECT
  S.lo AS lo,
  S.hi AS hi
FROM
  t_0_S AS S;