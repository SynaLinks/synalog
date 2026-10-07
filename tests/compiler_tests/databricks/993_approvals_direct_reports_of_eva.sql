WITH t_0_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester))
SELECT
  SUM(1) AS n
FROM
  t_0_ApproverOf AS ApproverOf
WHERE
  (ApproverOf.approver = "eva");