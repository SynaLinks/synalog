SELECT
  JSON_ARRAY_LENGTH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 3) select n from t) where n < 3)) AS n;