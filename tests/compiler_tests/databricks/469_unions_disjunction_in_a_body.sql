WITH t_0_N AS (SELECT * FROM VALUES
  (1, "a"),
  (2, "b"),
  (3, "c")
AS UNUSED_TABLE_NAME(x, s))
SELECT * FROM (
  
    SELECT
      N.x AS x,
      N.s AS s
    FROM
      t_0_N AS N
    WHERE
      (1 = N.x)
   UNION ALL
  
    SELECT
      N.x AS x,
      N.s AS s
    FROM
      t_0_N AS N
    WHERE
      (2 = N.x)
  
) AS UNUSED_TABLE_NAME  ORDER BY x NULLS LAST ;