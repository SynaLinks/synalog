WITH t_0_Users AS (SELECT * FROM VALUES
  (1, "Alice", "admin"),
  (2, "Bob", "user"),
  (3, "Charlie", "user"),
  (4, "Diana", "guest")
AS UNUSED_TABLE_NAME(col0, col1, col2)),
t_1_Orders AS (SELECT * FROM VALUES
  (1, 100),
  (1, 200),
  (2, 50)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT
  Users.col0 AS id,
  Users.col1 AS name
FROM
  t_0_Users AS Users
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Orders AS Orders
  WHERE
    (Orders.col0 = Users.col0)) IS NULL) ORDER BY id NULLS LAST;