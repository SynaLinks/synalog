WITH t_1_Parent AS (SELECT * FROM (
  
    SELECT
      "a" AS x,
      "b" AS y
   UNION ALL
  
    SELECT
      "b" AS x,
      "c" AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Parent.x AS x,
  t_0_Parent.y AS z
FROM
  t_1_Parent AS Parent, t_1_Parent AS t_0_Parent
WHERE
  (t_0_Parent.x = Parent.y);