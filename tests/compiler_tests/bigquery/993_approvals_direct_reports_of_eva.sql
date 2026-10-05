WITH t_0_ApproverOf AS (SELECT * FROM (
  
    SELECT
      "eva" AS approver,
      "dan" AS requester
   UNION ALL
  
    SELECT
      "dan" AS approver,
      "cal" AS requester
   UNION ALL
  
    SELECT
      "dan" AS approver,
      "bea" AS requester
   UNION ALL
  
    SELECT
      "cal" AS approver,
      "ali" AS requester
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_ApproverOf AS ApproverOf
WHERE
  (ApproverOf.approver = "eva");