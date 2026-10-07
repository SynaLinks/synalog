WITH t_0_Lo AS (SELECT
  MIN(x_4.value) AS m
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_4),
t_0_Hi AS (SELECT
  MAX(x_4.value) AS m
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_4)
SELECT * FROM (
  
    SELECT
      'min' AS k,
      Lo.m AS v
    FROM
      t_0_Lo AS Lo
   UNION ALL
  
    SELECT
      'max' AS k,
      Hi.m AS v
    FROM
      t_0_Hi AS Hi
  
) AS UNUSED_TABLE_NAME  ORDER BY k ;