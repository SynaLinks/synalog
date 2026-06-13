WITH t_0_BigNumbers AS (SELECT
  x_5.value AS x
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_5
WHERE
  (x_5.value > 5) ORDER BY x)
SELECT
  BigNumbers.x AS x
FROM
  t_0_BigNumbers AS BigNumbers ORDER BY x;