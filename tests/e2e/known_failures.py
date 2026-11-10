"""Tests known to fail on an engine, each with its reason.

Each entry is a strict xfail (conftest.py): a test listed here must fail, and
one that passes is reported, so that the list only shrinks. An entry is a
limitation of the engine, never a gap of synalog's own: the SQL it names is
what the engine documents.

A test is named by its function and its parameters without the engine:
`test_fixture_executes[06_arrays]`,
`test_program_rows[lists3/split_element_x_0-rows-0]` (a program's
expectations are numbered within it).
"""

from __future__ import annotations

import re


def test_key(name: str) -> str:
    """The name an entry gives a test of the name `name` (a test item's)."""
    # pytest-xdist's group (`--dist loadgroup`) follows the parameters.
    name = re.sub(r"@\w+$", "", name)
    match = re.fullmatch(r"(\w+)\[([^-\]]+)-(.*)\]", name)
    if not match:
        return name
    function, _engine, params = match.groups()
    return f"{function}[{params}]"


# -- ClickHouse --------------------------------------------------------------
# Each is a limitation of ClickHouse (26.3) the compiler cannot write around.

NULL_LIST = (
    "ClickHouse: an array is never null (no Nullable(Array)): a null list is empty, its Size 0, "
    "and a List of no rows []"
)
NON_EQUI_CORRELATION = (
    "ClickHouse: a subquery correlated to the outer row by a comparison other than equality is not "
    "supported (and, where it runs, counts wrongly)"
)
CORRELATED_ORDER_BY = "ClickHouse: a correlated subquery in an ORDER BY is not supported"
CORRELATED_AGGREGATE_ARGUMENT = "ClickHouse: a correlated subquery in an aggregate's argument is not supported"

CLICKHOUSE: dict[str, str] = {
    # CORRELATED_AGGREGATE_ARGUMENT
    'test_fixture_executes[3806_combine4_combine_of_combines]': CORRELATED_AGGREGATE_ARGUMENT,
    'test_fixture_executes[3879_combine4_share_per_customer_grouped]': CORRELATED_AGGREGATE_ARGUMENT,
    'test_matches_duckdb[3806_combine4_combine_of_combines]': CORRELATED_AGGREGATE_ARGUMENT,
    'test_matches_duckdb[3879_combine4_share_per_customer_grouped]': CORRELATED_AGGREGATE_ARGUMENT,
    'test_program_rows[combine4/combine_of_combines-rows-0]': CORRELATED_AGGREGATE_ARGUMENT,
    'test_program_rows[combine4/share_per_customer_grouped-rows-0]': CORRELATED_AGGREGATE_ARGUMENT,
    # CORRELATED_ORDER_BY
    'test_fixture_executes[1678_combine3_arrivals_per_city]': CORRELATED_ORDER_BY,
    'test_fixture_executes[1679_combine3_correlated_per_client]': CORRELATED_ORDER_BY,
    'test_fixture_executes[1683_combine3_departures_with_zero]': CORRELATED_ORDER_BY,
    'test_fixture_executes[1695_combine3_share_of_client_weight]': CORRELATED_ORDER_BY,
    'test_fixture_executes[2221_analytics_dense_rank_east]': CORRELATED_ORDER_BY,
    'test_fixture_executes[2222_analytics_dense_rank_north]': CORRELATED_ORDER_BY,
    'test_fixture_executes[2223_analytics_dense_rank_south]': CORRELATED_ORDER_BY,
    'test_fixture_executes[2254_analytics_rank_east]': CORRELATED_ORDER_BY,
    'test_fixture_executes[2255_analytics_rank_north]': CORRELATED_ORDER_BY,
    'test_fixture_executes[2270_analytics_rank_south]': CORRELATED_ORDER_BY,
    'test_fixture_executes[3156_joins3_projects_per_employee_with_zero]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[1678_combine3_arrivals_per_city]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[1679_combine3_correlated_per_client]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[1683_combine3_departures_with_zero]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[1695_combine3_share_of_client_weight]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[2221_analytics_dense_rank_east]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[2222_analytics_dense_rank_north]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[2223_analytics_dense_rank_south]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[2254_analytics_rank_east]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[2255_analytics_rank_north]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[2270_analytics_rank_south]': CORRELATED_ORDER_BY,
    'test_matches_duckdb[3156_joins3_projects_per_employee_with_zero]': CORRELATED_ORDER_BY,
    'test_program_rows[analytics/dense_rank_east-rows-0]': CORRELATED_ORDER_BY,
    'test_program_rows[analytics/dense_rank_north-rows-0]': CORRELATED_ORDER_BY,
    'test_program_rows[analytics/dense_rank_south-rows-0]': CORRELATED_ORDER_BY,
    'test_program_rows[analytics/rank_east-rows-0]': CORRELATED_ORDER_BY,
    'test_program_rows[analytics/rank_north-rows-0]': CORRELATED_ORDER_BY,
    'test_program_rows[analytics/rank_south-rows-0]': CORRELATED_ORDER_BY,
    'test_program_rows[combine3/arrivals_per_city-rows-0]': CORRELATED_ORDER_BY,
    'test_program_rows[combine3/correlated_per_client-rows-0]': CORRELATED_ORDER_BY,
    'test_program_rows[combine3/departures_with_zero-rows-0]': CORRELATED_ORDER_BY,
    'test_program_rows[combine3/share_of_client_weight-rows-0]': CORRELATED_ORDER_BY,
    'test_program_rows[joins3/projects_per_employee_with_zero-rows-0]': CORRELATED_ORDER_BY,
    # NON_EQUI_CORRELATION
    'test_fixture_executes[2256_analytics_rank_of_east_day_2]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2257_analytics_rank_of_east_day_3]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2258_analytics_rank_of_east_day_4]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2259_analytics_rank_of_east_day_5]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2260_analytics_rank_of_east_day_7]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2261_analytics_rank_of_north_day_1]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2262_analytics_rank_of_north_day_2]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2263_analytics_rank_of_north_day_3]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2264_analytics_rank_of_north_day_5]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2265_analytics_rank_of_north_day_6]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2266_analytics_rank_of_south_day_1]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2267_analytics_rank_of_south_day_2]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2268_analytics_rank_of_south_day_4]': NON_EQUI_CORRELATION,
    'test_fixture_executes[2269_analytics_rank_of_south_day_5]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2256_analytics_rank_of_east_day_2]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2257_analytics_rank_of_east_day_3]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2258_analytics_rank_of_east_day_4]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2259_analytics_rank_of_east_day_5]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2260_analytics_rank_of_east_day_7]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2261_analytics_rank_of_north_day_1]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2262_analytics_rank_of_north_day_2]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2263_analytics_rank_of_north_day_3]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2264_analytics_rank_of_north_day_5]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2265_analytics_rank_of_north_day_6]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2266_analytics_rank_of_south_day_1]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2267_analytics_rank_of_south_day_2]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2268_analytics_rank_of_south_day_4]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[2269_analytics_rank_of_south_day_5]': NON_EQUI_CORRELATION,
    'test_matches_duckdb[3872_combine4_rank_in_customer]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_east_day_2-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_east_day_3-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_east_day_4-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_east_day_5-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_east_day_7-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_north_day_1-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_north_day_2-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_north_day_3-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_north_day_5-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_north_day_6-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_south_day_1-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_south_day_2-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_south_day_4-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[analytics/rank_of_south_day_5-rows-0]': NON_EQUI_CORRELATION,
    'test_program_rows[combine4/rank_in_customer-rows-0]': NON_EQUI_CORRELATION,
    # NULL_LIST
    'test_matches_duckdb[2729_lists3_empty_strings_joined]': NULL_LIST,
    'test_matches_duckdb[2731_lists3_empty_strings_size]': NULL_LIST,
    'test_matches_duckdb[2747_lists3_null_list_joined]': NULL_LIST,
    'test_matches_duckdb[2763_lists3_record_with_null_list]': NULL_LIST,
    'test_matches_duckdb[2765_lists3_size_of_null]': NULL_LIST,
    'test_matches_duckdb[3699_typing_null_list_and_list_in_a_record]': NULL_LIST,
    'test_matches_duckdb[3708_typing_numbers_null_at_0_direct]': NULL_LIST,
    'test_matches_duckdb[3709_typing_numbers_null_at_0_joined]': NULL_LIST,
    'test_matches_duckdb[3710_typing_numbers_null_at_0_through]': NULL_LIST,
    'test_matches_duckdb[3711_typing_numbers_null_at_1_direct]': NULL_LIST,
    'test_matches_duckdb[3712_typing_numbers_null_at_1_joined]': NULL_LIST,
    'test_matches_duckdb[3713_typing_numbers_null_at_1_through]': NULL_LIST,
    'test_matches_duckdb[3714_typing_numbers_null_at_2_direct]': NULL_LIST,
    'test_matches_duckdb[3715_typing_numbers_null_at_2_joined]': NULL_LIST,
    'test_matches_duckdb[3716_typing_numbers_null_at_2_through]': NULL_LIST,
    'test_matches_duckdb[3739_typing_texts_null_at_0_direct]': NULL_LIST,
    'test_matches_duckdb[3740_typing_texts_null_at_0_joined]': NULL_LIST,
    'test_matches_duckdb[3741_typing_texts_null_at_0_through]': NULL_LIST,
    'test_matches_duckdb[3742_typing_texts_null_at_1_direct]': NULL_LIST,
    'test_matches_duckdb[3743_typing_texts_null_at_1_joined]': NULL_LIST,
    'test_matches_duckdb[3744_typing_texts_null_at_1_through]': NULL_LIST,
    'test_matches_duckdb[3745_typing_texts_null_at_2_direct]': NULL_LIST,
    'test_matches_duckdb[3746_typing_texts_null_at_2_joined]': NULL_LIST,
    'test_matches_duckdb[3747_typing_texts_null_at_2_through]': NULL_LIST,
    'test_matches_duckdb[3845_combine4_list_set_array_of_nothing]': NULL_LIST,
    'test_matches_duckdb[3846_combine4_list_size_above_0]': NULL_LIST,
    'test_matches_duckdb[3847_combine4_list_size_above_10]': NULL_LIST,
    'test_matches_duckdb[3848_combine4_list_size_above_35]': NULL_LIST,
    'test_matches_duckdb[3849_combine4_list_size_above_6]': NULL_LIST,
    'test_matches_duckdb[3850_combine4_list_size_per_customer]': NULL_LIST,
    'test_matches_duckdb[3870_combine4_orders_of_dee_sorted]': NULL_LIST,
    'test_matches_duckdb[3873_combine4_set_size_above_0]': NULL_LIST,
    'test_matches_duckdb[3874_combine4_set_size_above_10]': NULL_LIST,
    'test_matches_duckdb[3875_combine4_set_size_above_35]': NULL_LIST,
    'test_matches_duckdb[3876_combine4_set_size_above_6]': NULL_LIST,
    'test_matches_duckdb[3877_combine4_set_size_per_customer]': NULL_LIST,
    'test_matches_duckdb[4514_lists4_join_dash]': NULL_LIST,
    'test_matches_duckdb[4515_lists4_join_nothing]': NULL_LIST,
    'test_matches_duckdb[4538_lists4_reversed_list_2]': NULL_LIST,
    'test_matches_duckdb[4545_lists4_sorted_list_2]': NULL_LIST,
    'test_matches_duckdb[4548_lists4_split_b_first]': NULL_LIST,
    'test_matches_duckdb[4550_lists4_split_b_size]': NULL_LIST,
    'test_matches_duckdb[4554_lists4_split_comma_first]': NULL_LIST,
    'test_matches_duckdb[4556_lists4_split_comma_size]': NULL_LIST,
    'test_matches_duckdb[4557_lists4_split_semicolon_first]': NULL_LIST,
    'test_matches_duckdb[4559_lists4_split_semicolon_size]': NULL_LIST,
    'test_matches_duckdb[4673_lists4_row_list_size_above_0]': NULL_LIST,
    'test_matches_duckdb[4674_lists4_row_list_size_above_4]': NULL_LIST,
    'test_matches_duckdb[4682_lists4_row_set_size_above_0]': NULL_LIST,
    'test_matches_duckdb[4683_lists4_row_set_size_above_4]': NULL_LIST,
    'test_matches_duckdb[4684_lists4_row_sorted_desc]': NULL_LIST,
    'test_matches_duckdb[793_arrays_size_of_null_empty_and_split]': NULL_LIST,
    'test_program_rows[arrays/31_size_of_null_empty_and_split-rows-0]': NULL_LIST,
    'test_program_rows[combine4/list_set_array_of_nothing-rows-0]': NULL_LIST,
    'test_program_rows[combine4/list_size_above_0-rows-0]': NULL_LIST,
    'test_program_rows[combine4/list_size_above_10-rows-0]': NULL_LIST,
    'test_program_rows[combine4/list_size_above_35-rows-0]': NULL_LIST,
    'test_program_rows[combine4/list_size_above_6-rows-0]': NULL_LIST,
    'test_program_rows[combine4/list_size_per_customer-rows-0]': NULL_LIST,
    'test_program_rows[combine4/orders_of_dee_sorted-rows-0]': NULL_LIST,
    'test_program_rows[combine4/set_size_above_0-rows-0]': NULL_LIST,
    'test_program_rows[combine4/set_size_above_10-rows-0]': NULL_LIST,
    'test_program_rows[combine4/set_size_above_35-rows-0]': NULL_LIST,
    'test_program_rows[combine4/set_size_above_6-rows-0]': NULL_LIST,
    'test_program_rows[combine4/set_size_per_customer-rows-0]': NULL_LIST,
    'test_program_rows[lists3/empty_strings_joined-rows-0]': NULL_LIST,
    'test_program_rows[lists3/empty_strings_size-rows-0]': NULL_LIST,
    'test_program_rows[lists3/null_list_joined-rows-0]': NULL_LIST,
    'test_program_rows[lists3/record_with_null_list-rows-0]': NULL_LIST,
    'test_program_rows[lists3/size_of_null-rows-0]': NULL_LIST,
    'test_program_rows[lists4/join_dash-rows-0]': NULL_LIST,
    'test_program_rows[lists4/join_nothing-rows-0]': NULL_LIST,
    'test_program_rows[lists4/reversed_list_2-rows-0]': NULL_LIST,
    'test_program_rows[lists4/row_list_size_above_0-rows-0]': NULL_LIST,
    'test_program_rows[lists4/row_list_size_above_4-rows-0]': NULL_LIST,
    'test_program_rows[lists4/row_set_size_above_0-rows-0]': NULL_LIST,
    'test_program_rows[lists4/row_set_size_above_4-rows-0]': NULL_LIST,
    'test_program_rows[lists4/row_sorted_desc-rows-0]': NULL_LIST,
    'test_program_rows[lists4/sorted_list_2-rows-0]': NULL_LIST,
    'test_program_rows[lists4/split_b_first-rows-0]': NULL_LIST,
    'test_program_rows[lists4/split_b_size-rows-0]': NULL_LIST,
    'test_program_rows[lists4/split_comma_first-rows-0]': NULL_LIST,
    'test_program_rows[lists4/split_comma_size-rows-0]': NULL_LIST,
    'test_program_rows[lists4/split_semicolon_first-rows-0]': NULL_LIST,
    'test_program_rows[lists4/split_semicolon_size-rows-0]': NULL_LIST,
    'test_program_rows[typing/null_list_and_list_in_a_record-rows-0]': NULL_LIST,
    'test_program_rows[typing/numbers_null_at_0_direct-rows-0]': NULL_LIST,
    'test_program_rows[typing/numbers_null_at_0_joined-rows-0]': NULL_LIST,
    'test_program_rows[typing/numbers_null_at_0_through-rows-0]': NULL_LIST,
    'test_program_rows[typing/numbers_null_at_1_direct-rows-0]': NULL_LIST,
    'test_program_rows[typing/numbers_null_at_1_joined-rows-0]': NULL_LIST,
    'test_program_rows[typing/numbers_null_at_1_through-rows-0]': NULL_LIST,
    'test_program_rows[typing/numbers_null_at_2_direct-rows-0]': NULL_LIST,
    'test_program_rows[typing/numbers_null_at_2_joined-rows-0]': NULL_LIST,
    'test_program_rows[typing/numbers_null_at_2_through-rows-0]': NULL_LIST,
    'test_program_rows[typing/texts_null_at_0_direct-rows-0]': NULL_LIST,
    'test_program_rows[typing/texts_null_at_0_joined-rows-0]': NULL_LIST,
    'test_program_rows[typing/texts_null_at_0_through-rows-0]': NULL_LIST,
    'test_program_rows[typing/texts_null_at_1_direct-rows-0]': NULL_LIST,
    'test_program_rows[typing/texts_null_at_1_joined-rows-0]': NULL_LIST,
    'test_program_rows[typing/texts_null_at_1_through-rows-0]': NULL_LIST,
    'test_program_rows[typing/texts_null_at_2_direct-rows-0]': NULL_LIST,
    'test_program_rows[typing/texts_null_at_2_joined-rows-0]': NULL_LIST,
    'test_program_rows[typing/texts_null_at_2_through-rows-0]': NULL_LIST,
}

KNOWN_FAILURES: dict[str, dict[str, str]] = {
    "clickhouse": CLICKHOUSE,
}
