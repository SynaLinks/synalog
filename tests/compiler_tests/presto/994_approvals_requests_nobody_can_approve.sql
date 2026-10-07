WITH t_2_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_1_Requester AS (SELECT
  ApproverOf.requester AS requester
FROM
  t_2_ApproverOf AS ApproverOf
GROUP BY 1),
t_4_Effective_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_5_ApproverOf.approver AS approver,
      t_5_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_5_ApproverOf
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (t_5_ApproverOf.approver = 'dan')) IS NULL)
   UNION ALL
  
    SELECT
      'fay' AS approver,
      t_6_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_6_ApproverOf
    WHERE
      (t_6_ApproverOf.approver = 'dan')
  
) AS UNUSED_TABLE_NAME  ),
t_3_Effective AS (SELECT
  Effective_MultBodyAggAux.approver AS approver,
  Effective_MultBodyAggAux.requester AS requester
FROM
  t_4_Effective_MultBodyAggAux AS Effective_MultBodyAggAux
GROUP BY 1, 2)
SELECT
  t_0_Requester.requester AS requester
FROM
  t_1_Requester AS t_0_Requester
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_Effective AS Effective
  WHERE
    (Effective.requester = t_0_Requester.requester)) IS NULL) ORDER BY requester;