WITH t_2_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Effective_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS ApproverOf
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (ApproverOf.approver = "dan")) IS NULL)
   UNION ALL
  
    SELECT
      "fay" AS approver,
      t_3_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.approver = "dan") AND
      (t_3_ApproverOf.approver = "dan")
  
) AS UNUSED_TABLE_NAME  ),
t_0_Effective AS (SELECT
  Effective_MultBodyAggAux.approver AS approver,
  Effective_MultBodyAggAux.requester AS requester
FROM
  t_1_Effective_MultBodyAggAux AS Effective_MultBodyAggAux
GROUP BY 1, 2)
SELECT
  Effective.approver AS approver
FROM
  t_0_Effective AS Effective
WHERE
  (Effective.requester = "dan")
GROUP BY 1 ORDER BY approver NULLS LAST;