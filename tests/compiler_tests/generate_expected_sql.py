#!/usr/bin/env python3
"""Generate expected SQL golden files for compiler tests using Python Logica.

Layout: canonical engine-independent sources live in fixtures/*.l; each
engine directory holds the golden .sql files plus optional .l overrides for
programs that genuinely differ on that engine (and engine-only fixtures).

For each fixture, compiles the last user-defined predicate with the target
engine and writes the SQL to <engine>/<test_name>.sql.

Fixtures listed in SYNALOG_GOLDENS or ABSENT_GOLDENS (see DEVIATIONS.md) are
never overwritten by this script:
  - SYNALOG_GOLDENS deviate from upstream on purpose; regenerate them with
    `synalog.compile` instead.
  - ABSENT_GOLDENS document compiler subsystems synalog does not have yet.

Usage:
    python3 generate_expected_sql.py

Requires the logica package (GitHub main, see DEVIATIONS.md / project notes):
    pip install logica
"""

import glob
import os
import signal
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

# Set up import path for Logica imports BEFORE importing logica
os.environ['LOGICAPATH'] = SCRIPT_DIR
os.chdir(SCRIPT_DIR)

from logica.parser_py import parse as logica_parse
from logica.compiler import universe

ENGINES = ["sqlite", "duckdb", "psql", "bigquery", "trino", "presto", "databricks"]

# Goldens intentionally generated from synalog, not upstream (DEVIATIONS.md).
SYNALOG_GOLDENS = {
    ("trino", "06_arrays"), ("trino", "23_combine"), ("trino", "48_split_function"),
    ("trino", "50_array_functions"), ("trino", "51_math_functions"),
    ("presto", "06_arrays"), ("presto", "23_combine"), ("presto", "48_split_function"),
    ("presto", "50_array_functions"), ("presto", "51_math_functions"),
    # PrestoDB has no FORMAT/printf; synalog lowers Format(...) to a `||` concat
    # chain (see DEVIATIONS.md). Trino keeps the native FORMAT.
    ("presto", "56_format"),
    ("psql", "23_combine"),
    # DuckDB recursion: upstream routes DuckDB to the iterative flat path, which
    # needs a runtime fixpoint loop and truncates the closure under synalog's
    # static single-script compilation. synalog uses the inline unrolling (like
    # every other engine), which is correct; see DEVIATIONS.md.
    ("duckdb", "35_recursive_annotated"),
    # DuckDB `LOG(x)` is base-10; Logica's `Log` is natural log, so synalog emits
    # `LN(x)` (upstream's `LOG` is numerically wrong here). Same fix as trino/presto.
    ("duckdb", "51_math_functions"),
    # When one base table feeds multiple @Ground predicates, upstream globally
    # numbers its alias (t_1_Sales, t_2_Sales) while synalog aliases each as the
    # predicate name (Sales). Cosmetic only — both are valid and produce identical
    # results on every engine (verified in tests/e2e); see DEVIATIONS.md.
    *(((e, "62_multi_ground_join") for e in
       ["bigquery", "sqlite", "psql", "duckdb", "trino", "presto", "databricks"])),
    # Today/Now are synalog-only built-in temporal concepts: the compiler inlines
    # a per-dialect one-row relation (native current date/timestamp). Upstream
    # Logica has no such concept, so these goldens come from synalog on every
    # engine (see DEVIATIONS.md).
    *(("sqlite", "52_today_now"), ("duckdb", "52_today_now"), ("psql", "52_today_now"),
      ("bigquery", "52_today_now"), ("trino", "52_today_now"), ("presto", "52_today_now"),
      ("databricks", "52_today_now")),
    # A predicate named after an SQL keyword (`Values`, `Rows`): upstream uses
    # the name as a bare table alias (`t_1_Values AS Values`), which no engine
    # parses; synalog falls back to its numbered alias. See DEVIATIONS.md.
    *(((e, f) for e in ["bigquery", "sqlite", "psql", "duckdb", "trino", "presto", "databricks"]
       for f in ["44_import_extend", "48_split_function"])),
    # Databricks: synalog emits Spark/Databricks-valid SQL where upstream Logica
    # emits BigQuery-isms that do not run on Databricks (GENERATE_ARRAY,
    # ARRAY_LENGTH, FORMAT, OFFSET, in-aggregate ARRAY_AGG ORDER BY, ARRAY_JOIN
    # for concat, `::` casts). Verified against Apache Spark; see DEVIATIONS.md.
    # A functor applied to an imported predicate: upstream Logica leaves the
    # argument unresolved (the module prefixed its predicates), so the functor
    # silently returns the generic rule's rows. synalog resolves it; see
    # DEVIATIONS.md.
    *(((e, "63_functor_imported") for e in
       ["bigquery", "sqlite", "psql", "duckdb", "trino", "presto", "databricks"])),
    *(("databricks", n) for n in [
        "02_arithmetic", "03_comparison", "04_logical_operators", "06_arrays",
        "08_aggregations_array", "09_argmin_argmax", "10_negation",
        "11_disjunction", "12_if_then_else", "15_annotations", "19_type_casting",
        "20_list_comprehension", "22_multi_predicate", "23_combine",
        "25_inline_annotations", "26_builtin_functions", "27_assignment",
        "27_boolean_ops", "28_multi_rule_predicate", "29_argmin_argmax",
        "30_complex_expressions", "31_user_functions", "33_string_manipulation",
        "36_range_operations", "41_edge_arithmetic", "46_constraint",
        "47_like_pattern", "48_split_function", "50_array_functions",
        "54_sqlexpr", "55_argmax_k", "56_format",
    ]),
    # 17_outer_join tests `Test` (its ContactInfo concatenates arrays: no
    # ARRAY_CONCAT_AGG outside BigQuery; psql's empty arrays are '{}').
    ("trino", "17_outer_join"), ("presto", "17_outer_join"),
    ("databricks", "17_outer_join"), ("psql", "17_outer_join"),
    # Records are ROW casts on Presto/Trino and declared types on psql;
    # psql's natural logarithm is LN (see DEVIATIONS.md).
    ("trino", "32_nested_records"), ("presto", "32_nested_records"), ("psql", "32_nested_records"),
    ("psql", "51_math_functions"),
    # Columns named after SQL keywords are quoted, deep recursion is written
    # out as a script (see DEVIATIONS.md).
    *{(engine, "64_keyword_columns") for engine in ("bigquery", "databricks", "duckdb", "presto", "psql", "sqlite", "trino")},
    *{(engine, "65_deep_recursion") for engine in ("bigquery", "databricks", "duckdb", "presto", "psql", "sqlite", "trino")},
    *{(engine, "66_deep_mutual_recursion") for engine in ("bigquery", "databricks", "duckdb", "presto", "psql", "sqlite", "trino")},
    # Fixtures from tests/programs (see DEVIATIONS.md for each reason).
    # A keyword inside an underscored name: upstream splits the rule.
    ("bigquery", "108_execution_keyword_inside_a_name"),
    ("bigquery", "209_verifier_keyword_in_an_underscored_name"),
    ("databricks", "108_execution_keyword_inside_a_name"),
    ("databricks", "209_verifier_keyword_in_an_underscored_name"),
    ("duckdb", "108_execution_keyword_inside_a_name"),
    ("duckdb", "209_verifier_keyword_in_an_underscored_name"),
    ("presto", "108_execution_keyword_inside_a_name"),
    ("presto", "209_verifier_keyword_in_an_underscored_name"),
    ("psql", "108_execution_keyword_inside_a_name"),
    ("psql", "209_verifier_keyword_in_an_underscored_name"),
    ("sqlite", "108_execution_keyword_inside_a_name"),
    ("sqlite", "209_verifier_keyword_in_an_underscored_name"),
    ("trino", "108_execution_keyword_inside_a_name"),
    ("trino", "209_verifier_keyword_in_an_underscored_name"),
    # Deep recursion written out as a script.
    ("bigquery", "148_execution_deep_recursion"),
    ("bigquery", "158_execution_deep_recursion_odd_depth"),
    ("bigquery", "159_execution_deep_recursion_converges"),
    ("bigquery", "160_execution_deep_mutual_recursion"),
    ("bigquery", "183_keywords_keyword_column_in_deep_recursion"),
    ("bigquery", "189_recursion_depth_21_iterated"),
    ("bigquery", "190_recursion_depth_22"),
    ("bigquery", "191_recursion_depth_25"),
    ("bigquery", "194_recursion_deep_closure_with_pairs"),
    ("bigquery", "195_recursion_deep_recursion_used_twice"),
    ("bigquery", "196_recursion_two_deep_recursions"),
    ("bigquery", "197_recursion_deep_recursion_with_negation_after"),
    ("bigquery", "198_recursion_deep_shortest_path"),
    ("bigquery", "199_recursion_cycle_terminates"),
    ("bigquery", "65_deep_recursion"),
    ("bigquery", "66_deep_mutual_recursion"),
    ("databricks", "148_execution_deep_recursion"),
    ("databricks", "158_execution_deep_recursion_odd_depth"),
    ("databricks", "159_execution_deep_recursion_converges"),
    ("databricks", "160_execution_deep_mutual_recursion"),
    ("databricks", "183_keywords_keyword_column_in_deep_recursion"),
    ("databricks", "189_recursion_depth_21_iterated"),
    ("databricks", "190_recursion_depth_22"),
    ("databricks", "191_recursion_depth_25"),
    ("databricks", "194_recursion_deep_closure_with_pairs"),
    ("databricks", "195_recursion_deep_recursion_used_twice"),
    ("databricks", "196_recursion_two_deep_recursions"),
    ("databricks", "197_recursion_deep_recursion_with_negation_after"),
    ("databricks", "198_recursion_deep_shortest_path"),
    ("databricks", "199_recursion_cycle_terminates"),
    ("databricks", "65_deep_recursion"),
    ("databricks", "66_deep_mutual_recursion"),
    ("duckdb", "115_execution_recursion_depth_bounds"),
    ("duckdb", "148_execution_deep_recursion"),
    ("duckdb", "158_execution_deep_recursion_odd_depth"),
    ("duckdb", "159_execution_deep_recursion_converges"),
    ("duckdb", "160_execution_deep_mutual_recursion"),
    ("duckdb", "183_keywords_keyword_column_in_deep_recursion"),
    ("duckdb", "189_recursion_depth_21_iterated"),
    ("duckdb", "190_recursion_depth_22"),
    ("duckdb", "191_recursion_depth_25"),
    ("duckdb", "194_recursion_deep_closure_with_pairs"),
    ("duckdb", "195_recursion_deep_recursion_used_twice"),
    ("duckdb", "196_recursion_two_deep_recursions"),
    ("duckdb", "197_recursion_deep_recursion_with_negation_after"),
    ("duckdb", "198_recursion_deep_shortest_path"),
    ("duckdb", "199_recursion_cycle_terminates"),
    ("duckdb", "65_deep_recursion"),
    ("duckdb", "66_deep_mutual_recursion"),
    ("presto", "148_execution_deep_recursion"),
    ("presto", "158_execution_deep_recursion_odd_depth"),
    ("presto", "159_execution_deep_recursion_converges"),
    ("presto", "160_execution_deep_mutual_recursion"),
    ("presto", "183_keywords_keyword_column_in_deep_recursion"),
    ("presto", "189_recursion_depth_21_iterated"),
    ("presto", "190_recursion_depth_22"),
    ("presto", "191_recursion_depth_25"),
    ("presto", "194_recursion_deep_closure_with_pairs"),
    ("presto", "195_recursion_deep_recursion_used_twice"),
    ("presto", "196_recursion_two_deep_recursions"),
    ("presto", "197_recursion_deep_recursion_with_negation_after"),
    ("presto", "198_recursion_deep_shortest_path"),
    ("presto", "199_recursion_cycle_terminates"),
    ("presto", "65_deep_recursion"),
    ("presto", "66_deep_mutual_recursion"),
    ("psql", "148_execution_deep_recursion"),
    ("psql", "158_execution_deep_recursion_odd_depth"),
    ("psql", "159_execution_deep_recursion_converges"),
    ("psql", "160_execution_deep_mutual_recursion"),
    ("psql", "183_keywords_keyword_column_in_deep_recursion"),
    ("psql", "189_recursion_depth_21_iterated"),
    ("psql", "190_recursion_depth_22"),
    ("psql", "191_recursion_depth_25"),
    ("psql", "194_recursion_deep_closure_with_pairs"),
    ("psql", "195_recursion_deep_recursion_used_twice"),
    ("psql", "196_recursion_two_deep_recursions"),
    ("psql", "197_recursion_deep_recursion_with_negation_after"),
    ("psql", "198_recursion_deep_shortest_path"),
    ("psql", "199_recursion_cycle_terminates"),
    ("psql", "65_deep_recursion"),
    ("psql", "66_deep_mutual_recursion"),
    ("sqlite", "148_execution_deep_recursion"),
    ("sqlite", "158_execution_deep_recursion_odd_depth"),
    ("sqlite", "159_execution_deep_recursion_converges"),
    ("sqlite", "160_execution_deep_mutual_recursion"),
    ("sqlite", "183_keywords_keyword_column_in_deep_recursion"),
    ("sqlite", "189_recursion_depth_21_iterated"),
    ("sqlite", "190_recursion_depth_22"),
    ("sqlite", "191_recursion_depth_25"),
    ("sqlite", "194_recursion_deep_closure_with_pairs"),
    ("sqlite", "195_recursion_deep_recursion_used_twice"),
    ("sqlite", "196_recursion_two_deep_recursions"),
    ("sqlite", "197_recursion_deep_recursion_with_negation_after"),
    ("sqlite", "198_recursion_deep_shortest_path"),
    ("sqlite", "199_recursion_cycle_terminates"),
    ("sqlite", "65_deep_recursion"),
    ("sqlite", "66_deep_mutual_recursion"),
    ("trino", "148_execution_deep_recursion"),
    ("trino", "158_execution_deep_recursion_odd_depth"),
    ("trino", "159_execution_deep_recursion_converges"),
    ("trino", "160_execution_deep_mutual_recursion"),
    ("trino", "183_keywords_keyword_column_in_deep_recursion"),
    ("trino", "189_recursion_depth_21_iterated"),
    ("trino", "190_recursion_depth_22"),
    ("trino", "191_recursion_depth_25"),
    ("trino", "194_recursion_deep_closure_with_pairs"),
    ("trino", "195_recursion_deep_recursion_used_twice"),
    ("trino", "196_recursion_two_deep_recursions"),
    ("trino", "197_recursion_deep_recursion_with_negation_after"),
    ("trino", "198_recursion_deep_shortest_path"),
    ("trino", "199_recursion_cycle_terminates"),
    ("trino", "65_deep_recursion"),
    ("trino", "66_deep_mutual_recursion"),
    # Databricks: Spark SQL constructs.
    ("databricks", "102_execution_argmax"),
    ("databricks", "109_execution_string_functions"),
    ("databricks", "123_execution_like"),
    ("databricks", "132_execution_argmin"),
    ("databricks", "149_execution_range"),
    ("databricks", "188_recursion_depth_20_unrolled"),
    ("databricks", "99_execution_in_list"),
    # DuckDB recursion unrolled horizontally.
    ("duckdb", "105_execution_shortest_path"),
    ("duckdb", "114_execution_negation_of_derived"),
    ("duckdb", "138_execution_recursive_count"),
    ("duckdb", "139_execution_mutual_recursion"),
    ("duckdb", "187_recursion_depth_bounds_hops"),
    ("duckdb", "188_recursion_depth_20_unrolled"),
    ("duckdb", "200_recursion_depth_one"),
    ("duckdb", "202_verifier_recursion_with_depth"),
    ("duckdb", "92_execution_transitive_closure"),
    # Predicates and columns named after SQL keywords.
    ("bigquery", "155_execution_recursion_keyword_name"),
    ("bigquery", "156_execution_column_named_like_keyword"),
    ("bigquery", "161_execution_table_column_named_like_keyword"),
    ("bigquery", "174_keywords_column_order_in_join"),
    ("bigquery", "175_keywords_column_group_in_aggregate"),
    ("bigquery", "176_keywords_column_select_in_negation"),
    ("bigquery", "177_keywords_column_from_compared"),
    ("bigquery", "178_keywords_columns_where_and_limit"),
    ("bigquery", "179_keywords_keyword_column_in_order_by_desc"),
    ("bigquery", "180_keywords_keyword_column_paged"),
    ("bigquery", "181_keywords_keyword_column_searched"),
    ("bigquery", "182_keywords_keyword_column_in_recursion"),
    ("bigquery", "185_keywords_keyword_column_argmax"),
    ("bigquery", "186_keywords_mixed_case_keyword_column"),
    ("bigquery", "64_keyword_columns"),
    ("databricks", "155_execution_recursion_keyword_name"),
    ("databricks", "156_execution_column_named_like_keyword"),
    ("databricks", "161_execution_table_column_named_like_keyword"),
    ("databricks", "174_keywords_column_order_in_join"),
    ("databricks", "175_keywords_column_group_in_aggregate"),
    ("databricks", "176_keywords_column_select_in_negation"),
    ("databricks", "177_keywords_column_from_compared"),
    ("databricks", "178_keywords_columns_where_and_limit"),
    ("databricks", "179_keywords_keyword_column_in_order_by_desc"),
    ("databricks", "180_keywords_keyword_column_paged"),
    ("databricks", "181_keywords_keyword_column_searched"),
    ("databricks", "182_keywords_keyword_column_in_recursion"),
    ("databricks", "185_keywords_keyword_column_argmax"),
    ("databricks", "186_keywords_mixed_case_keyword_column"),
    ("databricks", "64_keyword_columns"),
    ("duckdb", "155_execution_recursion_keyword_name"),
    ("duckdb", "156_execution_column_named_like_keyword"),
    ("duckdb", "161_execution_table_column_named_like_keyword"),
    ("duckdb", "174_keywords_column_order_in_join"),
    ("duckdb", "175_keywords_column_group_in_aggregate"),
    ("duckdb", "176_keywords_column_select_in_negation"),
    ("duckdb", "177_keywords_column_from_compared"),
    ("duckdb", "178_keywords_columns_where_and_limit"),
    ("duckdb", "179_keywords_keyword_column_in_order_by_desc"),
    ("duckdb", "180_keywords_keyword_column_paged"),
    ("duckdb", "181_keywords_keyword_column_searched"),
    ("duckdb", "182_keywords_keyword_column_in_recursion"),
    ("duckdb", "184_keywords_keyword_column_functor"),
    ("duckdb", "185_keywords_keyword_column_argmax"),
    ("duckdb", "186_keywords_mixed_case_keyword_column"),
    ("duckdb", "64_keyword_columns"),
    ("presto", "155_execution_recursion_keyword_name"),
    ("presto", "156_execution_column_named_like_keyword"),
    ("presto", "161_execution_table_column_named_like_keyword"),
    ("presto", "174_keywords_column_order_in_join"),
    ("presto", "175_keywords_column_group_in_aggregate"),
    ("presto", "176_keywords_column_select_in_negation"),
    ("presto", "177_keywords_column_from_compared"),
    ("presto", "178_keywords_columns_where_and_limit"),
    ("presto", "179_keywords_keyword_column_in_order_by_desc"),
    ("presto", "180_keywords_keyword_column_paged"),
    ("presto", "181_keywords_keyword_column_searched"),
    ("presto", "182_keywords_keyword_column_in_recursion"),
    ("presto", "185_keywords_keyword_column_argmax"),
    ("presto", "186_keywords_mixed_case_keyword_column"),
    ("presto", "64_keyword_columns"),
    ("psql", "155_execution_recursion_keyword_name"),
    ("psql", "156_execution_column_named_like_keyword"),
    ("psql", "161_execution_table_column_named_like_keyword"),
    ("psql", "174_keywords_column_order_in_join"),
    ("psql", "175_keywords_column_group_in_aggregate"),
    ("psql", "176_keywords_column_select_in_negation"),
    ("psql", "177_keywords_column_from_compared"),
    ("psql", "178_keywords_columns_where_and_limit"),
    ("psql", "179_keywords_keyword_column_in_order_by_desc"),
    ("psql", "180_keywords_keyword_column_paged"),
    ("psql", "181_keywords_keyword_column_searched"),
    ("psql", "182_keywords_keyword_column_in_recursion"),
    ("psql", "184_keywords_keyword_column_functor"),
    ("psql", "185_keywords_keyword_column_argmax"),
    ("psql", "186_keywords_mixed_case_keyword_column"),
    ("psql", "64_keyword_columns"),
    ("sqlite", "155_execution_recursion_keyword_name"),
    ("sqlite", "156_execution_column_named_like_keyword"),
    ("sqlite", "161_execution_table_column_named_like_keyword"),
    ("sqlite", "174_keywords_column_order_in_join"),
    ("sqlite", "175_keywords_column_group_in_aggregate"),
    ("sqlite", "176_keywords_column_select_in_negation"),
    ("sqlite", "177_keywords_column_from_compared"),
    ("sqlite", "178_keywords_columns_where_and_limit"),
    ("sqlite", "179_keywords_keyword_column_in_order_by_desc"),
    ("sqlite", "180_keywords_keyword_column_paged"),
    ("sqlite", "181_keywords_keyword_column_searched"),
    ("sqlite", "182_keywords_keyword_column_in_recursion"),
    ("sqlite", "185_keywords_keyword_column_argmax"),
    ("sqlite", "186_keywords_mixed_case_keyword_column"),
    ("sqlite", "64_keyword_columns"),
    ("trino", "155_execution_recursion_keyword_name"),
    ("trino", "156_execution_column_named_like_keyword"),
    ("trino", "161_execution_table_column_named_like_keyword"),
    ("trino", "174_keywords_column_order_in_join"),
    ("trino", "175_keywords_column_group_in_aggregate"),
    ("trino", "176_keywords_column_select_in_negation"),
    ("trino", "177_keywords_column_from_compared"),
    ("trino", "178_keywords_columns_where_and_limit"),
    ("trino", "179_keywords_keyword_column_in_order_by_desc"),
    ("trino", "180_keywords_keyword_column_paged"),
    ("trino", "181_keywords_keyword_column_searched"),
    ("trino", "182_keywords_keyword_column_in_recursion"),
    ("trino", "185_keywords_keyword_column_argmax"),
    ("trino", "186_keywords_mixed_case_keyword_column"),
    ("trino", "64_keyword_columns"),
    # Front matter: upstream has none.
    ("bigquery", "163_front_matter_name_description_and_order"),
    ("bigquery", "164_front_matter_helpers_need_no_order"),
    ("bigquery", "165_front_matter_functor_result_named"),
    ("bigquery", "167_front_matter_extra_keys_are_the_hosts"),
    ("bigquery", "168_front_matter_quoted_colon_in_description"),
    ("bigquery", "169_front_matter_crlf_line_endings"),
    ("bigquery", "170_front_matter_multiline_description"),
    ("bigquery", "171_front_matter_dashes_in_a_string"),
    ("bigquery", "172_front_matter_name_with_spaces"),
    ("databricks", "163_front_matter_name_description_and_order"),
    ("databricks", "164_front_matter_helpers_need_no_order"),
    ("databricks", "165_front_matter_functor_result_named"),
    ("databricks", "167_front_matter_extra_keys_are_the_hosts"),
    ("databricks", "168_front_matter_quoted_colon_in_description"),
    ("databricks", "169_front_matter_crlf_line_endings"),
    ("databricks", "170_front_matter_multiline_description"),
    ("databricks", "171_front_matter_dashes_in_a_string"),
    ("databricks", "172_front_matter_name_with_spaces"),
    ("duckdb", "163_front_matter_name_description_and_order"),
    ("duckdb", "164_front_matter_helpers_need_no_order"),
    ("duckdb", "165_front_matter_functor_result_named"),
    ("duckdb", "167_front_matter_extra_keys_are_the_hosts"),
    ("duckdb", "168_front_matter_quoted_colon_in_description"),
    ("duckdb", "169_front_matter_crlf_line_endings"),
    ("duckdb", "170_front_matter_multiline_description"),
    ("duckdb", "171_front_matter_dashes_in_a_string"),
    ("duckdb", "172_front_matter_name_with_spaces"),
    ("presto", "163_front_matter_name_description_and_order"),
    ("presto", "164_front_matter_helpers_need_no_order"),
    ("presto", "165_front_matter_functor_result_named"),
    ("presto", "167_front_matter_extra_keys_are_the_hosts"),
    ("presto", "168_front_matter_quoted_colon_in_description"),
    ("presto", "169_front_matter_crlf_line_endings"),
    ("presto", "170_front_matter_multiline_description"),
    ("presto", "171_front_matter_dashes_in_a_string"),
    ("presto", "172_front_matter_name_with_spaces"),
    ("psql", "163_front_matter_name_description_and_order"),
    ("psql", "164_front_matter_helpers_need_no_order"),
    ("psql", "165_front_matter_functor_result_named"),
    ("psql", "167_front_matter_extra_keys_are_the_hosts"),
    ("psql", "168_front_matter_quoted_colon_in_description"),
    ("psql", "169_front_matter_crlf_line_endings"),
    ("psql", "170_front_matter_multiline_description"),
    ("psql", "171_front_matter_dashes_in_a_string"),
    ("psql", "172_front_matter_name_with_spaces"),
    ("sqlite", "163_front_matter_name_description_and_order"),
    ("sqlite", "164_front_matter_helpers_need_no_order"),
    ("sqlite", "165_front_matter_functor_result_named"),
    ("sqlite", "167_front_matter_extra_keys_are_the_hosts"),
    ("sqlite", "168_front_matter_quoted_colon_in_description"),
    ("sqlite", "169_front_matter_crlf_line_endings"),
    ("sqlite", "170_front_matter_multiline_description"),
    ("sqlite", "171_front_matter_dashes_in_a_string"),
    ("sqlite", "172_front_matter_name_with_spaces"),
    ("trino", "163_front_matter_name_description_and_order"),
    ("trino", "164_front_matter_helpers_need_no_order"),
    ("trino", "165_front_matter_functor_result_named"),
    ("trino", "167_front_matter_extra_keys_are_the_hosts"),
    ("trino", "168_front_matter_quoted_colon_in_description"),
    ("trino", "169_front_matter_crlf_line_endings"),
    ("trino", "170_front_matter_multiline_description"),
    ("trino", "171_front_matter_dashes_in_a_string"),
    ("trino", "172_front_matter_name_with_spaces"),
    # @Assert: upstream has none (it does not change the SQL).
    ("bigquery", "67_assertions_pending_before_its_predicate"),
    ("bigquery", "68_assertions_unbound_variable_is_unsupported"),
    ("bigquery", "69_assertions_assertion_on_limited_predicate"),
    ("bigquery", "70_assertions_pending_on_missing_helper"),
    ("bigquery", "71_assertions_assertion_reads_a_value_function"),
    ("databricks", "67_assertions_pending_before_its_predicate"),
    ("databricks", "68_assertions_unbound_variable_is_unsupported"),
    ("databricks", "69_assertions_assertion_on_limited_predicate"),
    ("databricks", "70_assertions_pending_on_missing_helper"),
    ("databricks", "71_assertions_assertion_reads_a_value_function"),
    ("duckdb", "67_assertions_pending_before_its_predicate"),
    ("duckdb", "68_assertions_unbound_variable_is_unsupported"),
    ("duckdb", "69_assertions_assertion_on_limited_predicate"),
    ("duckdb", "70_assertions_pending_on_missing_helper"),
    ("duckdb", "71_assertions_assertion_reads_a_value_function"),
    ("presto", "67_assertions_pending_before_its_predicate"),
    ("presto", "68_assertions_unbound_variable_is_unsupported"),
    ("presto", "69_assertions_assertion_on_limited_predicate"),
    ("presto", "70_assertions_pending_on_missing_helper"),
    ("presto", "71_assertions_assertion_reads_a_value_function"),
    ("psql", "67_assertions_pending_before_its_predicate"),
    ("psql", "68_assertions_unbound_variable_is_unsupported"),
    ("psql", "69_assertions_assertion_on_limited_predicate"),
    ("psql", "70_assertions_pending_on_missing_helper"),
    ("psql", "71_assertions_assertion_reads_a_value_function"),
    ("sqlite", "67_assertions_pending_before_its_predicate"),
    ("sqlite", "68_assertions_unbound_variable_is_unsupported"),
    ("sqlite", "69_assertions_assertion_on_limited_predicate"),
    ("sqlite", "70_assertions_pending_on_missing_helper"),
    ("sqlite", "71_assertions_assertion_reads_a_value_function"),
    ("trino", "67_assertions_pending_before_its_predicate"),
    ("trino", "68_assertions_unbound_variable_is_unsupported"),
    ("trino", "69_assertions_assertion_on_limited_predicate"),
    ("trino", "70_assertions_pending_on_missing_helper"),
    ("trino", "71_assertions_assertion_reads_a_value_function"),
    # @Limit(P, 0): upstream drops the LIMIT.
    ("bigquery", "81_directives_limit_zero"),
    ("databricks", "81_directives_limit_zero"),
    ("duckdb", "81_directives_limit_zero"),
    ("presto", "81_directives_limit_zero"),
    ("psql", "81_directives_limit_zero"),
    ("sqlite", "81_directives_limit_zero"),
    ("trino", "81_directives_limit_zero"),
    # Predicates named like library functions: upstream's type inference fails.
    ("duckdb", "101_execution_functor"),
    ("duckdb", "134_execution_nested_conditional_numbers"),
    ("duckdb", "137_execution_functor_of_a_functor"),
    ("duckdb", "162_execution_predicate_named_like_a_function"),
    ("duckdb", "203_verifier_conditional"),
    ("duckdb", "206_verifier_functor"),
    ("duckdb", "210_verifier_recursion_through_aggregate"),
    ("duckdb", "86_execution_max_min"),
    ("psql", "101_execution_functor"),
    ("psql", "134_execution_nested_conditional_numbers"),
    ("psql", "137_execution_functor_of_a_functor"),
    ("psql", "162_execution_predicate_named_like_a_function"),
    ("psql", "203_verifier_conditional"),
    ("psql", "206_verifier_functor"),
    ("psql", "210_verifier_recursion_through_aggregate"),
    ("psql", "86_execution_max_min"),
    # x in arr: CONTAINS on Presto/Trino.
    ("presto", "99_execution_in_list"),
    ("trino", "99_execution_in_list"),
    # Numbers with a decimal point are DOUBLE on Trino, Presto and Databricks
    # (see DEVIATIONS.md).
    ("databricks", "28_list_membership"),
    ("presto", "28_list_membership"),
    ("trino", "28_list_membership"),
    ("databricks", "121_execution_float_sum"),
    ("presto", "121_execution_float_sum"),
    ("trino", "121_execution_float_sum"),
    ("databricks", "157_execution_float_comparison"),
    ("presto", "157_execution_float_comparison"),
    ("trino", "157_execution_float_comparison"),
}

# Goldens intentionally absent because synalog lacks the subsystem
# (DEVIATIONS.md). Currently none.
ABSENT_GOLDENS = set()


def last_predicate(rules, source):
    """The predicate of the last rule the fixture itself writes — same
    convention as the Rust golden tests (tests/common/mod.rs), which explain
    it: by the position of each rule's text (`full_text`) in the source."""
    last, last_position = None, 0
    for r in rules:
        name = r.get('head', {}).get('predicate_name')
        if name == '@Make':
            name = made_predicate(r['head'])
        position = source.find(r.get('full_text', '\0'))
        if position >= last_position and name and not name.startswith(('@', '_')):
            last, last_position = name, position
    return last


def made_predicate(head):
    """The predicate an `@Make` head (`F := G(...)`) defines: its first argument."""
    try:
        value = head["record"]["field_value"][0]["value"]
        return value.get("expression", value)["literal"]["the_predicate"]["predicate_name"]
    except (KeyError, IndexError, TypeError):
        return None


class TimeoutError(Exception):
    pass


def _timeout_handler(signum, frame):
    raise TimeoutError("Compilation timed out")


import re as _re

def _with_engine(source, engine):
    """An @Engine line first — after the YAML front matter when the file opens
    with one (front matter must open the file); same as tests/common/mod.rs."""
    annotation = '@Engine("{}");\n'.format(engine)
    lines = source.splitlines(keepends=True)
    if lines and lines[0].rstrip() == '---':
        for i, line in enumerate(lines[1:], 1):
            if line.rstrip() == '---':
                return ''.join(lines[:i + 1]) + annotation + ''.join(lines[i + 1:])
    return annotation + source


def _strip_engine(source):
    """Remove @Engine(...) annotation from source."""
    return _re.sub(r'@Engine\([^)]*\)\s*;?\s*', '', source)


def fixture_stems(engine):
    """Canonical fixture stems plus the engine's overrides/engine-only fixtures."""
    stems = set()
    for pattern in ("fixtures/*.l", f"{engine}/*.l"):
        for path in glob.glob(pattern):
            stems.add(os.path.splitext(os.path.basename(path))[0])
    return sorted(stems)


def fixture_source(engine, stem):
    """Engine-specific override wins over the canonical fixture."""
    override = os.path.join(engine, f"{stem}.l")
    if os.path.exists(override):
        return override
    return os.path.join("fixtures", f"{stem}.l")


def generate_for_file(l_path, engine, timeout=30):
    """Try to compile a .l file. Returns (predicate, sql) or error tuple."""
    source = open(l_path).read()
    source = _with_engine(_strip_engine(source), engine)

    old_handler = signal.signal(signal.SIGALRM, _timeout_handler)
    signal.alarm(timeout)
    try:
        parsed = logica_parse.ParseFile(source)['rule']

        pred = last_predicate(parsed, source)
        if pred is None:
            return None
        program = universe.LogicaProgram(parsed, user_flags={})
        sql = program.FormattedPredicateSql(pred)
        return (pred, sql)
    except TimeoutError:
        return ("timeout", None)
    except Exception as e:
        return ("error", str(e))
    finally:
        signal.alarm(0)
        signal.signal(signal.SIGALRM, old_handler)


def process_engine(engine):
    """Generate goldens for all of an engine's fixtures."""
    stems = fixture_stems(engine)
    print(f"\n=== Processing {engine} ({len(stems)} fixtures) ===")

    stats = {"ok": 0, "timeout": 0, "no_pred": 0, "error": 0, "protected": 0}
    errors = {}

    for stem in stems:
        if stem.endswith("_fail"):
            continue
        print(f"  {stem}...", end=" ", flush=True)

        if (engine, stem) in SYNALOG_GOLDENS or (engine, stem) in ABSENT_GOLDENS:
            stats["protected"] += 1
            print("SKIP (protected, see DEVIATIONS.md)")
            continue

        result = generate_for_file(fixture_source(engine, stem), engine)

        if result is None:
            stats["no_pred"] += 1
            print("SKIP (no predicates)")
            continue
        if result[0] == "timeout":
            stats["timeout"] += 1
            print("SKIP (timeout)")
            continue
        if result[0] == "error":
            stats["error"] += 1
            errors[stem] = result[1]
            print(f"ERROR: {result[1][:60]}...")
            continue

        pred, sql = result
        with open(os.path.join(engine, f"{stem}.sql"), 'w') as f:
            f.write(sql)

        stats["ok"] += 1
        print(f"OK ({pred})")

    return stats, errors


def main():
    print("Generating expected SQL for compiler tests...")

    all_stats = {}
    all_errors = {}

    for engine in ENGINES:
        if os.path.isdir(os.path.join(SCRIPT_DIR, engine)):
            stats, errors = process_engine(engine)
            all_stats[engine] = stats
            all_errors[engine] = errors

    print(f"\n{'='*50}")
    print("SUMMARY")
    print(f"{'='*50}")

    for engine, stats in all_stats.items():
        total = sum(stats.values())
        print(f"\n{engine.upper()}:")
        print(f"  OK:          {stats['ok']}/{total}")
        print(f"  Protected:   {stats['protected']}/{total}")
        print(f"  Timeout:     {stats['timeout']}/{total}")
        print(f"  No predicate:{stats['no_pred']}/{total}")
        print(f"  Errors:      {stats['error']}/{total}")

        if all_errors.get(engine):
            print(f"\n  Errors detail:")
            for name, err in all_errors[engine].items():
                print(f"    - {name}: {err[:80]}")

    print(f"\nSQL files written to engine directories")


if __name__ == "__main__":
    main()
