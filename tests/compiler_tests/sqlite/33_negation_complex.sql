WITH t_0_Users AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      'Alice' AS col1,
      'admin' AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'Bob' AS col1,
      'user' AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      'Charlie' AS col1,
      'user' AS col2
   UNION ALL
  
    SELECT
      4 AS col0,
      'Diana' AS col1,
      'guest' AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      100 AS col1
   UNION ALL
  
    SELECT
      1 AS col0,
      200 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      50 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Users.col0 AS id,
  Users.col1 AS name
FROM
  t_0_Users AS Users
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_13.value)) AS logica_value
  FROM
    t_1_Orders AS Orders, JSON_EACH(JSON_ARRAY(0)) as x_13
  WHERE
    (Orders.col0 = Users.col0)) IS NULL) ORDER BY id;