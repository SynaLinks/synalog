WITH t_2_DateCase AS (SELECT * FROM (
  
    SELECT
      '2024-05-10' AS d
   UNION ALL
  
    SELECT
      '2024-03-01' AS d
   UNION ALL
  
    SELECT
      '2021-03-01' AS d
   UNION ALL
  
    SELECT
      '2024-01-01' AS d
  
) AS UNUSED_TABLE_NAME  ),
t_9_TsCase AS (SELECT * FROM (
  
    SELECT
      '2026-06-13 13:29:24' AS t
   UNION ALL
  
    SELECT
      '2026-06-13 13:05:00' AS t
   UNION ALL
  
    SELECT
      '2026-06-13 00:05:00' AS t
  
) AS UNUSED_TABLE_NAME  ),
t_0_DateArithmetic_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      'yesterday' AS kind,
      DateCase.d AS input,
      ((((((((SYNALOG_NUMBER_TEXT(CASE WHEN (CAST(SUBSTR(DateCase.d, 9, 2) AS INTEGER) > 1) THEN CAST(SUBSTR(DateCase.d, 1, 4) AS INTEGER) WHEN (CAST(SUBSTR(DateCase.d, 6, 2) AS INTEGER) = 1) THEN ((CAST(SUBSTR(DateCase.d, 1, 4) AS INTEGER)) - (1)) ELSE CAST(SUBSTR(DateCase.d, 1, 4) AS INTEGER) END)) || ('-'))) || (CASE WHEN (x_31.value < 10) THEN (('0') || (SYNALOG_NUMBER_TEXT(x_31.value))) ELSE SYNALOG_NUMBER_TEXT(x_31.value) END))) || ('-'))) || (CASE WHEN (x_32.value < 10) THEN (('0') || (SYNALOG_NUMBER_TEXT(x_32.value))) ELSE SYNALOG_NUMBER_TEXT(x_32.value) END)) AS result
    FROM
      t_2_DateCase AS DateCase, JSON_EACH(JSON_ARRAY(CASE WHEN (CAST(SUBSTR(DateCase.d, 9, 2) AS INTEGER) > 1) THEN CAST(SUBSTR(DateCase.d, 1, 4) AS INTEGER) WHEN (CAST(SUBSTR(DateCase.d, 6, 2) AS INTEGER) = 1) THEN ((CAST(SUBSTR(DateCase.d, 1, 4) AS INTEGER)) - (1)) ELSE CAST(SUBSTR(DateCase.d, 1, 4) AS INTEGER) END)) as x_29, JSON_EACH(JSON_ARRAY(CASE WHEN (CAST(SUBSTR(DateCase.d, 9, 2) AS INTEGER) > 1) THEN CAST(SUBSTR(DateCase.d, 6, 2) AS INTEGER) WHEN (CAST(SUBSTR(DateCase.d, 6, 2) AS INTEGER) = 1) THEN 12 ELSE ((CAST(SUBSTR(DateCase.d, 6, 2) AS INTEGER)) - (1)) END)) as x_30, JSON_EACH(JSON_ARRAY(CASE WHEN (CAST(SUBSTR(DateCase.d, 9, 2) AS INTEGER) > 1) THEN CAST(SUBSTR(DateCase.d, 6, 2) AS INTEGER) WHEN (CAST(SUBSTR(DateCase.d, 6, 2) AS INTEGER) = 1) THEN 12 ELSE ((CAST(SUBSTR(DateCase.d, 6, 2) AS INTEGER)) - (1)) END)) as x_31, JSON_EACH(JSON_ARRAY(CASE WHEN (CAST(SUBSTR(DateCase.d, 9, 2) AS INTEGER) > 1) THEN ((CAST(SUBSTR(DateCase.d, 9, 2) AS INTEGER)) - (1)) ELSE CASE WHEN (x_30.value = 2) THEN ((28) + (CASE WHEN (((((x_29.value) - (4) * CAST((x_29.value) / NULLIF(4, 0) AS INTEGER))) = 0) AND (((((x_29.value) - (100) * CAST((x_29.value) / NULLIF(100, 0) AS INTEGER))) != 0) OR ((((x_29.value) - (400) * CAST((x_29.value) / NULLIF(400, 0) AS INTEGER))) = 0))) THEN 1 ELSE 0 END)) WHEN ((((x_30.value = 4) OR (x_30.value = 6)) OR (x_30.value = 9)) OR (x_30.value = 11)) THEN 30 ELSE 31 END END)) as x_32
   UNION ALL
  
    SELECT
      'ten_minutes_ago' AS kind,
      TsCase.t AS input,
      ((((((((((((CASE WHEN (x_50.value < 0) THEN ((((((((SYNALOG_NUMBER_TEXT(CASE WHEN (CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 9, 2) AS INTEGER) > 1) THEN CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 1, 4) AS INTEGER) WHEN (CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 6, 2) AS INTEGER) = 1) THEN ((CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 1, 4) AS INTEGER)) - (1)) ELSE CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 1, 4) AS INTEGER) END)) || ('-'))) || (CASE WHEN (x_72.value < 10) THEN (('0') || (SYNALOG_NUMBER_TEXT(x_72.value))) ELSE SYNALOG_NUMBER_TEXT(x_72.value) END))) || ('-'))) || (CASE WHEN (x_73.value < 10) THEN (('0') || (SYNALOG_NUMBER_TEXT(x_73.value))) ELSE SYNALOG_NUMBER_TEXT(x_73.value) END)) ELSE SUBSTR(TsCase.t, 1, 10) END) || (' '))) || (CASE WHEN (CASE WHEN (x_50.value < 0) THEN 23 ELSE x_50.value END < 10) THEN (('0') || (SYNALOG_NUMBER_TEXT(CASE WHEN (x_50.value < 0) THEN 23 ELSE x_50.value END))) ELSE SYNALOG_NUMBER_TEXT(CASE WHEN (x_50.value < 0) THEN 23 ELSE x_50.value END) END))) || (':'))) || (CASE WHEN (x_69.value < 10) THEN (('0') || (SYNALOG_NUMBER_TEXT(x_69.value))) ELSE SYNALOG_NUMBER_TEXT(x_69.value) END))) || (':'))) || (SUBSTR(TsCase.t, 18, 2))) AS result
    FROM
      t_9_TsCase AS TsCase, JSON_EACH(JSON_ARRAY(CASE WHEN (CAST(SUBSTR(TsCase.t, 15, 2) AS INTEGER) >= 10) THEN CAST(SUBSTR(TsCase.t, 12, 2) AS INTEGER) ELSE ((CAST(SUBSTR(TsCase.t, 12, 2) AS INTEGER)) - (1)) END)) as x_50, JSON_EACH(JSON_ARRAY(CASE WHEN (CAST(SUBSTR(TsCase.t, 15, 2) AS INTEGER) >= 10) THEN ((CAST(SUBSTR(TsCase.t, 15, 2) AS INTEGER)) - (10)) ELSE ((CAST(SUBSTR(TsCase.t, 15, 2) AS INTEGER)) + (50)) END)) as x_69, JSON_EACH(JSON_ARRAY(CASE WHEN (CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 9, 2) AS INTEGER) > 1) THEN CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 1, 4) AS INTEGER) WHEN (CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 6, 2) AS INTEGER) = 1) THEN ((CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 1, 4) AS INTEGER)) - (1)) ELSE CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 1, 4) AS INTEGER) END)) as x_70, JSON_EACH(JSON_ARRAY(CASE WHEN (CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 9, 2) AS INTEGER) > 1) THEN CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 6, 2) AS INTEGER) WHEN (CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 6, 2) AS INTEGER) = 1) THEN 12 ELSE ((CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 6, 2) AS INTEGER)) - (1)) END)) as x_71, JSON_EACH(JSON_ARRAY(CASE WHEN (CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 9, 2) AS INTEGER) > 1) THEN CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 6, 2) AS INTEGER) WHEN (CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 6, 2) AS INTEGER) = 1) THEN 12 ELSE ((CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 6, 2) AS INTEGER)) - (1)) END)) as x_72, JSON_EACH(JSON_ARRAY(CASE WHEN (CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 9, 2) AS INTEGER) > 1) THEN ((CAST(SUBSTR(SUBSTR(TsCase.t, 1, 10), 9, 2) AS INTEGER)) - (1)) ELSE CASE WHEN (x_71.value = 2) THEN ((28) + (CASE WHEN (((((x_70.value) - (4) * CAST((x_70.value) / NULLIF(4, 0) AS INTEGER))) = 0) AND (((((x_70.value) - (100) * CAST((x_70.value) / NULLIF(100, 0) AS INTEGER))) != 0) OR ((((x_70.value) - (400) * CAST((x_70.value) / NULLIF(400, 0) AS INTEGER))) = 0))) THEN 1 ELSE 0 END)) WHEN ((((x_71.value = 4) OR (x_71.value = 6)) OR (x_71.value = 9)) OR (x_71.value = 11)) THEN 30 ELSE 31 END END)) as x_73
  
) AS UNUSED_TABLE_NAME  )
SELECT
  DateArithmetic_MultBodyAggAux.kind AS kind,
  DateArithmetic_MultBodyAggAux.input AS input,
  DateArithmetic_MultBodyAggAux.result AS result
FROM
  t_0_DateArithmetic_MultBodyAggAux AS DateArithmetic_MultBodyAggAux
GROUP BY DateArithmetic_MultBodyAggAux.kind, DateArithmetic_MultBodyAggAux.input, DateArithmetic_MultBodyAggAux.result ORDER BY kind NULLS LAST, input NULLS LAST;