WITH t_0_Boosted AS (SELECT
  x_8.value AS x,
  x_8.value * 100 + 1 AS boosted
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 5) select n from t) where n < 5)) as x_8 ORDER BY x)
SELECT
  Boosted.x AS x,
  Boosted.boosted AS boosted
FROM
  t_0_Boosted AS Boosted ORDER BY x;