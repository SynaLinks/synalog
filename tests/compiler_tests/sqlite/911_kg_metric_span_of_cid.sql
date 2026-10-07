WITH t_25_Employees AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      'ann' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/ann' AS url
   UNION ALL
  
    SELECT
      2 AS person_id,
      'bob' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/bob' AS url
   UNION ALL
  
    SELECT
      3 AS person_id,
      'cid' AS name,
      'ops' AS dept,
      20 AS team_id,
      'inactive' AS status,
      'https://x/cid' AS url
   UNION ALL
  
    SELECT
      4 AS person_id,
      'dan' AS name,
      'ops' AS dept,
      20 AS team_id,
      'active' AS status,
      'https://x/dan' AS url
   UNION ALL
  
    SELECT
      5 AS person_id,
      'eve' AS name,
      'eng' AS dept,
      30 AS team_id,
      'active' AS status,
      'https://x/eve' AS url
  
) AS UNUSED_TABLE_NAME  ),
t_24_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_25_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
t_27_Management AS (SELECT * FROM (
  
    SELECT
      1 AS manager_id,
      2 AS employee_id
   UNION ALL
  
    SELECT
      1 AS manager_id,
      5 AS employee_id
   UNION ALL
  
    SELECT
      4 AS manager_id,
      3 AS employee_id
   UNION ALL
  
    SELECT
      2 AS manager_id,
      6 AS employee_id
  
) AS UNUSED_TABLE_NAME  ),
t_22_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_23_Person.person_id AS employee_id
FROM
  t_24_Person AS Person, t_24_Person AS t_23_Person, t_27_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_23_Person.person_id)
GROUP BY Person.person_id, t_23_Person.person_id),
t_19_Below_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_21_Manages.manager_id AS manager_id,
      t_21_Manages.employee_id AS employee_id
    FROM
      t_22_Manages AS t_21_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_18_Below_r0 AS (SELECT
  Below_MultBodyAggAux_recursive_head_f1.manager_id AS manager_id,
  Below_MultBodyAggAux_recursive_head_f1.employee_id AS employee_id
FROM
  t_19_Below_MultBodyAggAux_recursive_head_f1 AS Below_MultBodyAggAux_recursive_head_f1
GROUP BY Below_MultBodyAggAux_recursive_head_f1.manager_id, Below_MultBodyAggAux_recursive_head_f1.employee_id),
t_16_Below_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      Below_r0.manager_id AS manager_id,
      t_17_Manages.employee_id AS employee_id
    FROM
      t_18_Below_r0 AS Below_r0, t_22_Manages AS t_17_Manages
    WHERE
      (t_17_Manages.manager_id = Below_r0.employee_id)
   UNION ALL
  
    SELECT
      t_31_Manages.manager_id AS manager_id,
      t_31_Manages.employee_id AS employee_id
    FROM
      t_22_Manages AS t_31_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_15_Below_r1 AS (SELECT
  Below_MultBodyAggAux_recursive_head_f2.manager_id AS manager_id,
  Below_MultBodyAggAux_recursive_head_f2.employee_id AS employee_id
FROM
  t_16_Below_MultBodyAggAux_recursive_head_f2 AS Below_MultBodyAggAux_recursive_head_f2
GROUP BY Below_MultBodyAggAux_recursive_head_f2.manager_id, Below_MultBodyAggAux_recursive_head_f2.employee_id),
t_13_Below_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      Below_r1.manager_id AS manager_id,
      t_14_Manages.employee_id AS employee_id
    FROM
      t_15_Below_r1 AS Below_r1, t_22_Manages AS t_14_Manages
    WHERE
      (t_14_Manages.manager_id = Below_r1.employee_id)
   UNION ALL
  
    SELECT
      t_32_Manages.manager_id AS manager_id,
      t_32_Manages.employee_id AS employee_id
    FROM
      t_22_Manages AS t_32_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_12_Below_r2 AS (SELECT
  Below_MultBodyAggAux_recursive_head_f3.manager_id AS manager_id,
  Below_MultBodyAggAux_recursive_head_f3.employee_id AS employee_id
FROM
  t_13_Below_MultBodyAggAux_recursive_head_f3 AS Below_MultBodyAggAux_recursive_head_f3
GROUP BY Below_MultBodyAggAux_recursive_head_f3.manager_id, Below_MultBodyAggAux_recursive_head_f3.employee_id),
t_10_Below_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      Below_r2.manager_id AS manager_id,
      t_11_Manages.employee_id AS employee_id
    FROM
      t_12_Below_r2 AS Below_r2, t_22_Manages AS t_11_Manages
    WHERE
      (t_11_Manages.manager_id = Below_r2.employee_id)
   UNION ALL
  
    SELECT
      t_33_Manages.manager_id AS manager_id,
      t_33_Manages.employee_id AS employee_id
    FROM
      t_22_Manages AS t_33_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_9_Below_r3 AS (SELECT
  Below_MultBodyAggAux_recursive_head_f4.manager_id AS manager_id,
  Below_MultBodyAggAux_recursive_head_f4.employee_id AS employee_id
FROM
  t_10_Below_MultBodyAggAux_recursive_head_f4 AS Below_MultBodyAggAux_recursive_head_f4
GROUP BY Below_MultBodyAggAux_recursive_head_f4.manager_id, Below_MultBodyAggAux_recursive_head_f4.employee_id),
t_7_Below_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      Below_r3.manager_id AS manager_id,
      t_8_Manages.employee_id AS employee_id
    FROM
      t_9_Below_r3 AS Below_r3, t_22_Manages AS t_8_Manages
    WHERE
      (t_8_Manages.manager_id = Below_r3.employee_id)
   UNION ALL
  
    SELECT
      t_34_Manages.manager_id AS manager_id,
      t_34_Manages.employee_id AS employee_id
    FROM
      t_22_Manages AS t_34_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_6_Below_r4 AS (SELECT
  Below_MultBodyAggAux_recursive_head_f5.manager_id AS manager_id,
  Below_MultBodyAggAux_recursive_head_f5.employee_id AS employee_id
FROM
  t_7_Below_MultBodyAggAux_recursive_head_f5 AS Below_MultBodyAggAux_recursive_head_f5
GROUP BY Below_MultBodyAggAux_recursive_head_f5.manager_id, Below_MultBodyAggAux_recursive_head_f5.employee_id),
t_4_Below_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      Below_r4.manager_id AS manager_id,
      t_5_Manages.employee_id AS employee_id
    FROM
      t_6_Below_r4 AS Below_r4, t_22_Manages AS t_5_Manages
    WHERE
      (t_5_Manages.manager_id = Below_r4.employee_id)
   UNION ALL
  
    SELECT
      t_35_Manages.manager_id AS manager_id,
      t_35_Manages.employee_id AS employee_id
    FROM
      t_22_Manages AS t_35_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_3_Below_r5 AS (SELECT
  Below_MultBodyAggAux_recursive_head_f6.manager_id AS manager_id,
  Below_MultBodyAggAux_recursive_head_f6.employee_id AS employee_id
FROM
  t_4_Below_MultBodyAggAux_recursive_head_f6 AS Below_MultBodyAggAux_recursive_head_f6
GROUP BY Below_MultBodyAggAux_recursive_head_f6.manager_id, Below_MultBodyAggAux_recursive_head_f6.employee_id),
t_2_Below_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      Below_r5.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      t_3_Below_r5 AS Below_r5, t_22_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_r5.employee_id)
   UNION ALL
  
    SELECT
      t_36_Manages.manager_id AS manager_id,
      t_36_Manages.employee_id AS employee_id
    FROM
      t_22_Manages AS t_36_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_1_Below AS (SELECT
  Below_MultBodyAggAux_recursive_head_f7.manager_id AS manager_id,
  Below_MultBodyAggAux_recursive_head_f7.employee_id AS employee_id
FROM
  t_2_Below_MultBodyAggAux_recursive_head_f7 AS Below_MultBodyAggAux_recursive_head_f7
GROUP BY Below_MultBodyAggAux_recursive_head_f7.manager_id, Below_MultBodyAggAux_recursive_head_f7.employee_id),
t_0_Count AS (SELECT
  SUM(1) AS n
FROM
  t_1_Below AS Below
WHERE
  (Below.manager_id = 3))
SELECT
  COALESCE(Count.n, 0) AS n
FROM
  t_0_Count AS Count;