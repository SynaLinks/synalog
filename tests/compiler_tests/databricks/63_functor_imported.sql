WITH t_2_Segments_Customer AS (SELECT * FROM VALUES
  (1, "enterprise"),
  (2, "smb")
AS UNUSED_TABLE_NAME(customer_id, tier)),
t_1_Enterprise AS (SELECT
  Segments_Customer.customer_id AS customer_id
FROM
  t_2_Segments_Customer AS Segments_Customer
WHERE
  (Segments_Customer.tier = "enterprise")
GROUP BY 1),
t_3_Segments_Order AS (SELECT * FROM VALUES
  (1, 100),
  (2, 7)
AS UNUSED_TABLE_NAME(customer_id, amount)),
t_0_EnterpriseRevenue AS (SELECT
  SUM(Segments_Order.amount) AS revenue
FROM
  t_1_Enterprise AS Enterprise, t_3_Segments_Order AS Segments_Order
WHERE
  (Segments_Order.customer_id = Enterprise.customer_id))
SELECT
  EnterpriseRevenue.revenue AS revenue
FROM
  t_0_EnterpriseRevenue AS EnterpriseRevenue ORDER BY revenue NULLS LAST;