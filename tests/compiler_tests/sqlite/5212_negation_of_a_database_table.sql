SELECT
  providers.npi AS npi
FROM
  providers
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_10.value)) AS synalog_value
  FROM
    ground_truth, JSON_EACH(JSON_ARRAY(0)) as x_10
  WHERE
    (providers.npi IS ground_truth.npi) AND
    (providers.scheme IS ground_truth.scheme)) IS NULL);