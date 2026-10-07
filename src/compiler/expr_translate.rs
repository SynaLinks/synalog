// Modified from: logica/compiler/expr_translate.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// Original work: Copyright 2020 Google LLC, licensed under the Apache License, Version 2.0.
// Modifications: Copyright 2025-2026 Yoan Sallami (Synalinks Team), licensed under the Apache License, Version 2.0.

use std::collections::{HashMap, HashSet};
use crate::parser::Json;
use crate::compiler::CompileResult;
use crate::compiler::CompileError;
use crate::compiler::dialects::Dialect;
use crate::compiler::type_inference::Type;

/// The type of a record-literal field read from its value alone: a literal,
/// or a nested record. Used where no rule is at hand (the PostgreSQL types a
/// program declares); `ExprTranslator::value_type` knows a rule's variables.
fn record_field_type(expr: &Json) -> Type {
    let obj = expr.as_object();
    if let Some(rec) = obj.get("record") {
        return record_literal_type(rec);
    }
    if let Some(lit) = obj.get("literal") {
        let lo = lit.as_object();
        if let Some(rec) = lo.get("the_record") {
            return record_literal_type(rec);
        }
        if lo.contains_key("the_number") {
            return Type::Number;
        }
        if lo.contains_key("the_bool") {
            return Type::Bool;
        }
        if lo.contains_key("the_string") {
            return Type::String;
        }
    }
    Type::String
}

/// Build a `Type::Record` from a `record` AST node by typing each field value.
/// Positional (non-string) fields are skipped: only named-field records become
/// SQL records here (synthetic nodes like negation's `IsNull(Combine= …)` carry
/// a positional field and are not record literals).
pub(crate) fn record_literal_type(record: &Json) -> Type {
    let mut fields = HashMap::new();
    for fv in record.as_object()["field_value"].as_array() {
        let fo = fv.as_object();
        let Some(field) = fo.get("field").filter(|f| f.is_string()) else {
            continue;
        };
        let name = field.as_str().to_string();
        let val = &fo["value"];
        let e = val.as_object().get("expression").unwrap_or(val);
        fields.insert(name, record_field_type(e));
    }
    Type::Record { fields, is_opened: false }
}

// Remaining missing features from Python expr_translate.py:
//   - VariableMaybeTableSQLite(): SQLite table-to-record expansion using type inference.
//   - RecordAsJson() / convert_to_json mode for JSON annotation output.
//   - ExpressionIsTable() / VariableIsTable(): proper table detection.
//   - custom_udfs support in ExprTranslator.
//   - debug_undefined_variables mode (returns UNDEFINED_varname placeholder).
// Implemented: CleanOperatorsAndFunctions, BuiltInFunctionArityRange, SubIfStruct, ConvertToSqlForGroupBy.

/// Convert a snake_case or dot.separated function name to CamelCase.
/// Matches Python Logica's CamelCase conversion:
///   `array_agg` → `ArrayAgg`, `st_area` → `StArea`,
///   `hll_count.extract` → `HllCountExtract`
fn to_camel_case(s: &str) -> String {
    let s = s.replace('.', "_");
    s.split('_')
        .map(|p| {
            let mut c = p.chars();
            match c.next() {
                None => String::new(),
                Some(f) => {
                    let mut r = f.to_uppercase().to_string();
                    r.push_str(c.as_str());
                    r
                }
            }
        })
        .collect()
}

/// Bulk StandardSQL functions from processed_functions.csv.
/// Format: function,sql_function,aggregates,has_repeated_args,min_args,max_args
/// Rows starting with `$` are operators (skipped here).
fn bulk_built_in_functions() -> HashMap<String, String> {
    let csv_data = "\
abs,ABS
acos,ACOS
acosh,ACOSH
aead.decrypt_bytes,AEAD.DECRYPT_BYTES
aead.decrypt_string,AEAD.DECRYPT_STRING
aead.encrypt,AEAD.ENCRYPT
any_value,ANY_VALUE
approx_count_distinct,APPROX_COUNT_DISTINCT
approx_quantiles,APPROX_QUANTILES
approx_top_count,APPROX_TOP_COUNT
approx_top_sum,APPROX_TOP_SUM
array_agg,ARRAY_AGG
array_concat,ARRAY_CONCAT
array_concat_agg,ARRAY_CONCAT_AGG
array_length,ARRAY_LENGTH
array_reverse,ARRAY_REVERSE
array_to_string,ARRAY_TO_STRING
asin,ASIN
asinh,ASINH
atan,ATAN
atan2,ATAN2
atanh,ATANH
avg,AVG
bit_and,BIT_AND
bit_cast_to_int32,BIT_CAST_TO_INT32
bit_cast_to_int64,BIT_CAST_TO_INT64
bit_cast_to_uint32,BIT_CAST_TO_UINT32
bit_cast_to_uint64,BIT_CAST_TO_UINT64
bit_count,BIT_COUNT
bit_or,BIT_OR
bit_xor,BIT_XOR
byte_length,BYTE_LENGTH
ceil,CEIL
char_length,CHAR_LENGTH
coalesce,COALESCE
code_points_to_bytes,CODE_POINTS_TO_BYTES
code_points_to_string,CODE_POINTS_TO_STRING
concat,CONCAT
corr,CORR
cos,COS
cosh,COSH
count,COUNT
countif,COUNTIF
covar_pop,COVAR_POP
covar_samp,COVAR_SAMP
cume_dist,CUME_DIST
current_date,CURRENT_DATE
current_datetime,CURRENT_DATETIME
current_time,CURRENT_TIME
current_timestamp,CURRENT_TIMESTAMP
date,DATE
date_add,DATE_ADD
date_diff,DATE_DIFF
date_from_unix_date,DATE_FROM_UNIX_DATE
date_sub,DATE_SUB
date_trunc,DATE_TRUNC
datetime,DATETIME
datetime_add,DATETIME_ADD
datetime_diff,DATETIME_DIFF
datetime_sub,DATETIME_SUB
datetime_trunc,DATETIME_TRUNC
dense_rank,DENSE_RANK
div,DIV
ends_with,ENDS_WITH
error,ERROR
exp,EXP
farm_fingerprint,FARM_FINGERPRINT
first_value,FIRST_VALUE
floor,FLOOR
format,FORMAT
format_date,FORMAT_DATE
format_datetime,FORMAT_DATETIME
format_time,FORMAT_TIME
format_timestamp,FORMAT_TIMESTAMP
from_base32,FROM_BASE32
from_base64,FROM_BASE64
from_hex,FROM_HEX
from_proto,FROM_PROTO
generate_array,GENERATE_ARRAY
generate_date_array,GENERATE_DATE_ARRAY
generate_timestamp_array,GENERATE_TIMESTAMP_ARRAY
generate_uuid,GENERATE_UUID
greatest,GREATEST
hll_count.extract,HLL_COUNT.EXTRACT
hll_count.init,HLL_COUNT.INIT
hll_count.merge,HLL_COUNT.MERGE
hll_count.merge_partial,HLL_COUNT.MERGE_PARTIAL
ieee_divide,IEEE_DIVIDE
if,IF
ifnull,IFNULL
is_inf,IS_INF
is_nan,IS_NAN
json_extract,JSON_EXTRACT
json_extract_scalar,JSON_EXTRACT_SCALAR
json_query,JSON_QUERY
json_value,JSON_VALUE
keys.add_key_from_raw_bytes,KEYS.ADD_KEY_FROM_RAW_BYTES
keys.keyset_from_json,KEYS.KEYSET_FROM_JSON
keys.keyset_length,KEYS.KEYSET_LENGTH
keys.keyset_to_json,KEYS.KEYSET_TO_JSON
keys.new_keyset,KEYS.NEW_KEYSET
keys.rotate_keyset,KEYS.ROTATE_KEYSET
lag,LAG
last_value,LAST_VALUE
lead,LEAD
least,LEAST
length,LENGTH
ln,LN
log,LOG
log10,LOG10
logical_and,LOGICAL_AND
logical_or,LOGICAL_OR
lower,LOWER
lpad,LPAD
ltrim,LTRIM
max,MAX
md5,MD5
min,MIN
mod,MOD
net.format_ip,NET.FORMAT_IP
net.format_packed_ip,NET.FORMAT_PACKED_IP
net.host,NET.HOST
net.ip_from_string,NET.IP_FROM_STRING
net.ip_in_net,NET.IP_IN_NET
net.ip_net_mask,NET.IP_NET_MASK
net.ip_to_string,NET.IP_TO_STRING
net.ip_trunc,NET.IP_TRUNC
net.ipv4_from_int64,NET.IPV4_FROM_INT64
net.ipv4_to_int64,NET.IPV4_TO_INT64
net.make_net,NET.MAKE_NET
net.parse_ip,NET.PARSE_IP
net.parse_packed_ip,NET.PARSE_PACKED_IP
net.public_suffix,NET.PUBLIC_SUFFIX
net.reg_domain,NET.REG_DOMAIN
net.safe_ip_from_string,NET.SAFE_IP_FROM_STRING
normalize,NORMALIZE
normalize_and_casefold,NORMALIZE_AND_CASEFOLD
nth_value,NTH_VALUE
ntile,NTILE
nullif,NULLIF
parse_date,PARSE_DATE
parse_datetime,PARSE_DATETIME
parse_time,PARSE_TIME
parse_timestamp,PARSE_TIMESTAMP
percent_rank,PERCENT_RANK
percentile_cont,PERCENTILE_CONT
percentile_disc,PERCENTILE_DISC
pow,POW
proto_default_if_null,PROTO_DEFAULT_IF_NULL
rand,RAND
range_bucket,RANGE_BUCKET
rank,RANK
regexp_contains,REGEXP_CONTAINS
regexp_extract,REGEXP_EXTRACT
regexp_extract_all,REGEXP_EXTRACT_ALL
regexp_match,REGEXP_MATCH
regexp_replace,REGEXP_REPLACE
repeat,REPEAT
replace,REPLACE
reverse,REVERSE
round,ROUND
row_number,ROW_NUMBER
rpad,RPAD
rtrim,RTRIM
safe_add,SAFE_ADD
safe_convert_bytes_to_string,SAFE_CONVERT_BYTES_TO_STRING
safe_divide,SAFE_DIVIDE
safe_multiply,SAFE_MULTIPLY
safe_negate,SAFE_NEGATE
safe_subtract,SAFE_SUBTRACT
session_user,SESSION_USER
sha1,SHA1
sha256,SHA256
sha512,SHA512
sign,SIGN
sin,SIN
sinh,SINH
split,SPLIT
sqrt,SQRT
st_accum,ST_ACCUM
st_area,ST_AREA
st_asbinary,ST_ASBINARY
st_asgeojson,ST_ASGEOJSON
st_askml,ST_ASKML
st_astext,ST_ASTEXT
st_boundary,ST_BOUNDARY
st_buffer,ST_BUFFER
st_bufferwithtolerance,ST_BUFFERWITHTOLERANCE
st_centroid,ST_CENTROID
st_centroid_agg,ST_CENTROID_AGG
st_closestpoint,ST_CLOSESTPOINT
st_contains,ST_CONTAINS
st_coveredby,ST_COVEREDBY
st_covers,ST_COVERS
st_difference,ST_DIFFERENCE
st_dimension,ST_DIMENSION
st_disjoint,ST_DISJOINT
st_distance,ST_DISTANCE
st_dwithin,ST_DWITHIN
st_equals,ST_EQUALS
st_geogfromgeojson,ST_GEOGFROMGEOJSON
st_geogfromkml,ST_GEOGFROMKML
st_geogfromtext,ST_GEOGFROMTEXT
st_geogfromwkb,ST_GEOGFROMWKB
st_geogpoint,ST_GEOGPOINT
st_geogpointfromgeohash,ST_GEOGPOINTFROMGEOHASH
st_geohash,ST_GEOHASH
st_intersection,ST_INTERSECTION
st_intersects,ST_INTERSECTS
st_intersectsbox,ST_INTERSECTSBOX
st_iscollection,ST_ISCOLLECTION
st_isempty,ST_ISEMPTY
st_length,ST_LENGTH
st_makeline,ST_MAKELINE
st_makepolygon,ST_MAKEPOLYGON
st_makepolygonoriented,ST_MAKEPOLYGONORIENTED
st_maxdistance,ST_MAXDISTANCE
st_numpoints,ST_NUMPOINTS
st_perimeter,ST_PERIMETER
st_simplify,ST_SIMPLIFY
st_snaptogrid,ST_SNAPTOGRID
st_touches,ST_TOUCHES
st_unaryunion,ST_UNARYUNION
st_union,ST_UNION
st_union_agg,ST_UNION_AGG
st_within,ST_WITHIN
st_x,ST_X
st_y,ST_Y
starts_with,STARTS_WITH
stddev_pop,STDDEV_POP
stddev_samp,STDDEV_SAMP
string,STRING
string_agg,STRING_AGG
strpos,STRPOS
substr,SUBSTR
sum,SUM
tan,TAN
tanh,TANH
time,TIME
time_add,TIME_ADD
time_diff,TIME_DIFF
time_sub,TIME_SUB
time_trunc,TIME_TRUNC
timestamp,TIMESTAMP
timestamp_add,TIMESTAMP_ADD
timestamp_diff,TIMESTAMP_DIFF
timestamp_from_unix_micros,TIMESTAMP_FROM_UNIX_MICROS
timestamp_from_unix_millis,TIMESTAMP_FROM_UNIX_MILLIS
timestamp_from_unix_seconds,TIMESTAMP_FROM_UNIX_SECONDS
timestamp_micros,TIMESTAMP_MICROS
timestamp_millis,TIMESTAMP_MILLIS
timestamp_seconds,TIMESTAMP_SECONDS
timestamp_sub,TIMESTAMP_SUB
timestamp_trunc,TIMESTAMP_TRUNC
to_base32,TO_BASE32
to_base64,TO_BASE64
to_code_points,TO_CODE_POINTS
to_hex,TO_HEX
to_json_string,TO_JSON_STRING
to_proto,TO_PROTO
trim,TRIM
trunc,TRUNC
unix_date,UNIX_DATE
unix_micros,UNIX_MICROS
unix_millis,UNIX_MILLIS
unix_seconds,UNIX_SECONDS
upper,UPPER
var_pop,VAR_POP
var_samp,VAR_SAMP";
    let mut m = HashMap::with_capacity(270);
    for line in csv_data.lines() {
        let mut parts = line.splitn(2, ',');
        let func = match parts.next() {
            Some(f) => f,
            None => continue,
        };
        let sql_func = match parts.next() {
            Some(f) => f,
            None => continue,
        };
        let camel = to_camel_case(func);
        m.insert(camel, format!("{}(%s)", sql_func));
    }
    m
}

/// Built-in functions: Logica name → SQL template.
/// These override bulk functions for Logica-specific semantics.
// Note: SomeValue uses ANY_VALUE in Rust vs ARRAY_AGG(... IGNORE NULLS LIMIT 1)[OFFSET(0)] in Python.
pub(crate) fn base_built_in_functions() -> HashMap<&'static str, &'static str> {
    let mut m = HashMap::new();
    m.insert("ToFloat64", "CAST(%s AS FLOAT64)");
    m.insert("ToInt64", "CAST(%s AS INT64)");
    m.insert("ToUInt64", "CAST(%s AS UINT64)");
    m.insert("ToString", "CAST(%s AS STRING)");
    m.insert("1", "MIN(%s)");
    m.insert("Agg+", "SUM(%s)");
    m.insert("Agg++", "ARRAY_CONCAT_AGG(%s)");
    // `Count=` counts the distinct values, exactly, on every engine.
    m.insert("Count", "COUNT(DISTINCT %s)");
    m.insert("ExactCount", "COUNT(DISTINCT %s)");
    m.insert("List", "ARRAY_AGG(%s)");
    m.insert("Set", "ARRAY_AGG(DISTINCT %s)");
    m.insert("SomeValue", "ANY_VALUE(%s)");
    m.insert("Max", "MAX(%s)");
    m.insert("Min", "MIN(%s)");
    m.insert("Avg", "AVG(%s)");
    m.insert("Sum", "SUM(%s)");
    m.insert("Array", "ARRAY_AGG(%s)");
    // The values joined with `,`, as text; null when they all are (SQLite's
    // GROUP_CONCAT, which the other dialects follow).
    m.insert("StringAgg", "STRING_AGG(CAST({0} AS STRING), ',')");
    m.insert("Median", "APPROX_QUANTILES(%s, 2)[OFFSET(1)]");
    m.insert("!", "NOT %s");
    m.insert("-", "- %s");
    m.insert("Concat", "ARRAY_CONCAT({0}, {1})");
    m.insert("DateAddDay", "DATE_ADD({0}, INTERVAL {1} DAY)");
    m.insert("DateDiffDay", "DATE_DIFF({0}, {1}, DAY)");
    m.insert("Element", "(CASE WHEN {1} < 0 THEN NULL ELSE {0}[SAFE_OFFSET({1})] END)");
    m.insert("IsNull", "(%s IS NULL)");
    m.insert("Join", "ARRAY_TO_STRING(%s)");
    // A backslash escapes `%`, `_` and itself in a pattern on every engine;
    // without ESCAPE, only PostgreSQL and Spark would read it so.
    m.insert("Like", "({0} LIKE {1} ESCAPE '\\')");
    m.insert("Range", "GENERATE_ARRAY(0, %s - 1)");
    m.insert("RangeOf", "GENERATE_ARRAY(0, ARRAY_LENGTH(%s) - 1)");
    m.insert("Size", "ARRAY_LENGTH(%s)");
    m.insert("Sort", "ARRAY(SELECT x FROM UNNEST(%s) as x ORDER BY x)");
    m.insert("Split", "SPLIT({0}, {1})");
    m.insert("TimestampAddDays", "TIMESTAMP_ADD({0}, INTERVAL {1} DAY)");
    m.insert("Unique", "ARRAY(SELECT DISTINCT x FROM UNNEST(%s) as x ORDER BY x)");
    m.insert("ValueOfUnnested", "%s");
    m.insert("MagicalEntangle", "{0}");
    m.insert("Container", "%s");
    m.insert("Constraint", "%s");
    m.insert("Aggr", "%s");
    m.insert("Abs", "ABS(%s)");
    m.insert("Exp", "EXP(%s)");
    m.insert("Log", "LOG(%s)");
    m.insert("Sin", "SIN(%s)");
    m.insert("Cos", "COS(%s)");
    m.insert("Sqrt", "SQRT(%s)");
    m.insert("Floor", "FLOOR(%s)");
    m.insert("Ceiling", "CEIL(%s)");
    m.insert("Round", "ROUND(%s)");
    m.insert("Pow", "POW({0}, {1})");
    m.insert("Length", "LENGTH(%s)");
    m.insert("Replace", "REPLACE({0}, {1}, {2})");
    m.insert("Substr", "SUBSTR({0}, {1}, {2})");
    m.insert("Upper", "UPPER(%s)");
    m.insert("Lower", "LOWER(%s)");
    m.insert("Trim", "TRIM(%s)");
    // Functions written so they run, and agree, on every engine; a dialect
    // overrides those its SQL lacks.
    m.insert("StartsWith", "(SUBSTR({0}, 1, LENGTH({1})) = {1})");
    m.insert("EndsWith", "(LENGTH({1}) <= LENGTH({0}) AND SUBSTR({0}, LENGTH({0}) - LENGTH({1}) + 1, LENGTH({1})) = {1})");
    m.insert("Strpos", "STRPOS({0}, {1})");
    m.insert("Lpad", "LPAD({0}, {1}, {2})");
    m.insert("Rpad", "RPAD({0}, {1}, {2})");
    m.insert("Repeat", "REPEAT({0}, {1})");
    m.insert("Ifnull", "COALESCE({0}, {1})");
    m.insert("RegexpContains", "REGEXP_LIKE({0}, {1})");
    m.insert("RegexpReplace", "REGEXP_REPLACE({0}, {1}, {2})");
    m.insert("RegexpExtract", "REGEXP_EXTRACT({0}, {1})");
    m.insert("Trunc", "(CASE WHEN {0} < 0 THEN CEIL({0}) ELSE FLOOR({0}) END)");
    m.insert("Div", "CAST((CASE WHEN (({0}) < 0) <> (({1}) < 0) THEN CEIL(CAST({0} AS DOUBLE) / NULLIF({1}, 0)) ELSE FLOOR(CAST({0} AS DOUBLE) / NULLIF({1}, 0)) END) AS BIGINT)");
    m
}

/// Built-in infix operators: Logica operator → SQL template.
fn base_infix_operators() -> HashMap<&'static str, &'static str> {
    let mut m = HashMap::new();
    m.insert("==", "%s = %s");
    m.insert("!=", "%s != %s");
    m.insert("<=", "%s <= %s");
    m.insert("<", "%s < %s");
    m.insert(">=", "%s >= %s");
    m.insert(">", "%s > %s");
    m.insert("+", "(%s) + (%s)");
    m.insert("-", "(%s) - (%s)");
    m.insert("*", "(%s) * (%s)");
    // A division by zero has no value, on every engine (not an error, an
    // infinity or a NaN).
    m.insert("/", "(%s) / NULLIF(%s, 0)");
    m.insert("^", "POW(%s, %s)");
    m.insert("%", "MOD(%s, NULLIF(%s, 0))");
    m.insert("++", "CONCAT(%s, %s)");
    m.insert("||", "%s OR %s");
    m.insert("&&", "%s AND %s");
    m.insert("in", "%s IN UNNEST(%s)");
    m.insert("is", "%s IS %s");
    m.insert("is not", "%s IS NOT %s");
    m
}


/// Callback for translating subquery predicates.
pub trait SubqueryTranslator {
    fn translate_table(
        &self,
        predicate: &str,
        external_vocabulary: Option<&HashMap<String, String>>,
    ) -> CompileResult<String>;

    /// Translate a combine sub-rule to SQL (inline subquery).
    fn translate_rule(
        &self,
        rule: &Json,
        external_vocabulary: &HashMap<String, String>,
        external_types: &HashMap<String, Type>,
        is_combine: bool,
    ) -> CompileResult<String>;

    /// PostgreSQL CAST type for a combine subquery result, derived from type
    /// inference. Default: none (no CAST). Overridden by program-backed translators.
    fn combine_psql_type(&self, _combine: &Json) -> Option<String> {
        None
    }

    /// PostgreSQL type of a predicate's column, when type inference knows it.
    /// Default: none.
    fn column_psql_type(&self, _predicate: &str, _column: &str) -> Option<String> {
        None
    }

    /// The inferred type of a predicate's column. Default: unknown.
    fn column_type(&self, _predicate: &str, _column: &str) -> Option<Type> {
        None
    }

    /// Note a record type a query builds, for dialects that declare record
    /// types (PostgreSQL). Default: nothing to do.
    fn register_record_type(&self, _ty: &Type) {}
}

/// Expression-to-SQL translator.
// Remaining missing fields from Python QL:
//   - debug_undefined_variables: bool (for development)
//   - convert_to_json: bool (for JSON output mode)
//   - custom_udfs: HashMap<String, String> (for UDF support)
pub struct ExprTranslator<'a> {
    pub vocabulary: HashMap<String, String>,
    pub dialect: &'a dyn Dialect,
    built_in_functions: HashMap<String, String>,
    built_in_infix_operators: HashMap<String, String>,
    pub flag_values: &'a HashMap<String, String>,
    pub subquery_translator: Option<&'a dyn SubqueryTranslator>,
    /// The value field name based on compilation mode ("logica_value" or "synalog_value")
    pub value_field: &'static str,
    /// The types of the rule's variables that are known: a column of a
    /// table, an element of a list. A record built from them has their types.
    pub variable_types: HashMap<String, Type>,
    /// The type a list or record literal is expected to have where it is
    /// written, by the address of its node: an empty list has no type of its
    /// own (`[]`), nor a record holding one.
    type_hints: std::cell::RefCell<HashMap<usize, Type>>,
}

impl<'a> ExprTranslator<'a> {
    pub fn new(
        vocabulary: HashMap<String, String>,
        dialect: &'a dyn Dialect,
        flag_values: &'a HashMap<String, String>,
    ) -> Self {
        Self::new_with_value_field(vocabulary, dialect, flag_values, "logica_value")
    }

    pub fn new_with_value_field(
        vocabulary: HashMap<String, String>,
        dialect: &'a dyn Dialect,
        flag_values: &'a HashMap<String, String>,
        value_field: &'static str,
    ) -> Self {
        // Layer: bulk functions → base built-in (overrides bulk) → dialect (overrides all).
        let mut functions = bulk_built_in_functions();
        for (k, v) in base_built_in_functions() {
            functions.insert(k.to_string(), v.to_string());
        }
        for (k, v) in dialect.built_in_functions() {
            functions.insert(k.to_string(), v.to_string());
        }

        let mut infix: HashMap<String, String> = base_infix_operators()
            .into_iter()
            .map(|(k, v)| (k.to_string(), v.to_string()))
            .collect();
        for (k, v) in dialect.infix_operators() {
            infix.insert(k.to_string(), v.to_string());
        }

        // CleanOperatorsAndFunctions: remove entries with empty/None values
        // (dialect overrides can set a value to "" to disable a function)
        functions.retain(|_, v| !v.is_empty());
        infix.retain(|_, v| !v.is_empty());

        ExprTranslator {
            vocabulary,
            dialect,
            built_in_functions: functions,
            built_in_infix_operators: infix,
            variable_types: HashMap::new(),
            type_hints: std::cell::RefCell::new(HashMap::new()),
            flag_values,
            subquery_translator: None,
            value_field,
        }
    }

    /// Convert a Logica expression AST node to an SQL string.
    /// Uses an iterative task/result stack instead of recursion.
    pub fn convert_to_sql(&self, expression: &Json) -> CompileResult<String> {
        self.convert_to_sql_expecting(expression, &Type::Any)
    }

    /// `convert_to_sql` of a value whose type the context knows (a column's).
    pub fn convert_to_sql_expecting(&self, expression: &Json, expected: &Type) -> CompileResult<String> {
        self.hint_types(expression, expected);
        // Combiner kinds that operate on pre-evaluated sub-expression results.
        enum CK {
            /// Apply a SQL template with positional args ({0}, {1} or %s).
            Template(String),
            /// Apply a SQL template and wrap result in parentheses (infix operators).
            TemplateParens(String),
            /// Format as array literal.
            ArrayLiteral(String),
            /// Format as record/struct literal with given (field name, type) pairs.
            Record(Vec<(String, Type)>),
            /// Subscript access. sub_str=Some → pop 1; None → pop 2.
            Subscript { sub_str: Option<String>, record_is_table: bool },
            /// Build CASE WHEN ... THEN ... ELSE ... END.
            Implication { has_otherwise: bool },
            /// SqlExpr: first arg is template, rest are substituted.
            /// Vec contains (positional_count, named_arg_keys) for substitution.
            SqlExpr { positional_count: usize, named_keys: Vec<String> },
            /// CAST(arg AS type) or TRY_CAST.
            Cast(String),
            /// FlagValue lookup.
            FlagValue,
            /// Generic SQL function call: NAME(arg1, arg2, ...).
            FunctionCall(String),
            /// User predicate subquery.
            UserPredicate(String),
            /// Analytic/window function template.
            Analytic(String),
            /// Join N results with ", ".
            JoinComma,
            /// Lower `Format(fmt, args…)` to a `||` concatenation chain for
            /// engines without a printf-style function (PrestoDB). The first
            /// result is the format-string literal; the rest fill its `%s`
            /// placeholders.
            FormatConcat,
        }

        enum Task<'b> {
            Eval(&'b Json),
            Combine(CK, usize),
        }

        let mut tasks: Vec<Task> = vec![Task::Eval(expression)];
        let mut results: Vec<String> = Vec::new();

        while let Some(task) = tasks.pop() {
            match task {
                Task::Eval(expr) => {
                    if !expr.is_object() {
                        return Err(CompileError::new(
                            format!("Expected object expression, got: {}", expr.to_string_fmt(false)), ""));
                    }
                    let obj = expr.as_object();

                    // ── Variable ──
                    if let Some(var) = obj.get("variable") {
                        let mut sql = self.convert_variable(var)?;
                        // A null where a list is expected is a null list.
                        if sql == "null" {
                            if let Some(Type::List(element)) = self.type_hints.borrow().get(&node_key(expr)) {
                                if let Some(typed) = self.dialect.typed_array(&sql, element) {
                                    sql = typed;
                                }
                            }
                        }
                        results.push(sql);
                        continue;
                    }

                    // ── Literal ──
                    if let Some(lit) = obj.get("literal") {
                        let lo = lit.as_object();
                        if let Some(n) = lo.get("the_number") {
                            let text = if n.is_int() {
                                n.as_int().to_string()
                            } else if n.is_object() {
                                n.as_object().get("number")
                                    .map(|num| num.as_str().to_string())
                                    .unwrap_or_else(|| n.to_string_fmt(false))
                            } else {
                                n.to_string_fmt(false)
                            };
                            results.push(if text.contains('.') { self.dialect.float_literal(&text) } else { text });
                            continue;
                        }
                        if let Some(s) = lo.get("the_string") {
                            let str_val = if s.is_string() { s.as_str() }
                                else if s.is_object() {
                                    s.as_object().get("the_string").map(|v| v.as_str()).unwrap_or("")
                                } else { "" };
                            results.push(self.dialect.str_literal(str_val));
                            continue;
                        }
                        if let Some(b) = lo.get("the_bool") {
                            let val = if b.is_string() { b.as_str() }
                                else if b.is_object() {
                                    b.as_object().get("the_bool").map(|v| v.as_str()).unwrap_or("false")
                                } else { "false" };
                            results.push(if val == "true" { "true" } else { "false" }.to_string());
                            continue;
                        }
                        if lo.contains_key("the_null") || lo.contains_key("null") {
                            // A null where a list is expected is a null list.
                            let typed = match self.type_hints.borrow().get(&node_key(expr)) {
                                Some(Type::List(element)) => self.dialect.typed_array("null", element),
                                _ => None,
                            };
                            results.push(typed.unwrap_or_else(|| "null".to_string()));
                            continue;
                        }
                        if let Some(list) = lo.get("the_list") {
                            if let Some(elements) = list.as_object().get("element").filter(|e| !e.as_array().is_empty()) {
                                let elems = elements.as_array();
                                let n = elems.len();
                                tasks.push(Task::Combine(CK::ArrayLiteral(self.dialect.array_phrase().to_string()), n));
                                for e in elems.iter().rev() {
                                    tasks.push(Task::Eval(e));
                                }
                            } else {
                                let hinted = match self.type_hints.borrow().get(&node_key(expr)) {
                                    Some(Type::List(element)) => self.dialect.typed_array(&self.dialect.empty_array_literal(), element),
                                    _ => None,
                                };
                                results.push(hinted.unwrap_or_else(|| self.dialect.empty_array_literal()));
                            }
                            continue;
                        }
                        if let Some(pred) = lo.get("the_predicate") {
                            results.push(self.dialect.predicate_literal(
                                pred.as_object()["predicate_name"].as_str()));
                            continue;
                        }
                        if let Some(record) = lo.get("the_record") {
                            let fvs = record.as_object()["field_value"].as_array();
                            let mut fields: Vec<(String, Type)> = Vec::with_capacity(fvs.len());
                            let mut exprs: Vec<&Json> = Vec::with_capacity(fvs.len());
                            for fv in fvs {
                                let fo = fv.as_object();
                                let val = &fo["value"];
                                let e = val.as_object().get("expression").unwrap_or(val);
                                fields.push((fo["field"].as_str().to_string(), self.value_type(e)));
                                exprs.push(e);
                            }
                            self.hinted_fields(expr, &mut fields);
                            let n = exprs.len();
                            tasks.push(Task::Combine(CK::Record(fields), n));
                            for e in exprs.into_iter().rev() {
                                tasks.push(Task::Eval(e));
                            }
                            continue;
                        }
                        if let Some(sym) = lo.get("the_symbol") {
                            results.push(sym.as_object()["symbol"].as_str().to_string());
                            continue;
                        }
                        return Err(CompileError::new("Unknown literal type", ""));
                    }

                    // ── Call ──
                    if let Some(call) = obj.get("call") {
                        let co = call.as_object();
                        let pred_name = co["predicate_name"].as_str();

                        // Text (by its form or its column's type) or a whole number to
                        // an integer: no fraction to round.
                        if pred_name == "ToInt64" {
                            if let Some(template) = self.dialect.int64_of_text() {
                                let fvs = co["record"].as_object()["field_value"].as_array();
                                let arg = fvs.first()
                                    .and_then(|fv| fv.as_object()["value"].as_object().get("expression"));
                                if let Some(arg) = arg.filter(|a| is_text_expression(a) || is_whole_number_literal(a) || self.value_type(a) == Type::String) {
                                    tasks.push(Task::Combine(CK::Template(template.to_string()), 1));
                                    tasks.push(Task::Eval(arg));
                                    continue;
                                }
                            }
                        }

                        // The least and greatest of booleans: false before true.
                        if pred_name == "Min" || pred_name == "Max" {
                            let fvs = co["record"].as_object()["field_value"].as_array();
                            if let (1, Some((min, max))) = (fvs.len(), self.dialect.boolean_min_max()) {
                                let arg = fvs[0].as_object()["value"].as_object().get("expression");
                                if let Some(arg) = arg.filter(|a| self.value_type(a) == Type::Bool) {
                                    let template = if pred_name == "Min" { min } else { max };
                                    tasks.push(Task::Combine(CK::Template(template.to_string()), 1));
                                    tasks.push(Task::Eval(arg));
                                    continue;
                                }
                            }
                        }

                        // Greatest and Least are null when an argument is,
                        // also where the engine's skip nulls.
                        if (pred_name == "Greatest" || pred_name == "Least") && self.dialect.greatest_skips_nulls() {
                            let fvs = co["record"].as_object()["field_value"].as_array();
                            let args: Vec<&Json> = fvs.iter()
                                .filter_map(|fv| fv.as_object()["value"].as_object().get("expression"))
                                .collect();
                            if args.len() > 1 {
                                let n = args.len();
                                let any_null = (0..n).map(|i| format!("{{{}}} IS NULL", i)).collect::<Vec<_>>().join(" OR ");
                                let all = (0..n).map(|i| format!("{{{}}}", i)).collect::<Vec<_>>().join(", ");
                                let function = if pred_name == "Greatest" { "GREATEST" } else { "LEAST" };
                                let template = format!("(CASE WHEN {} THEN NULL ELSE {}({}) END)", any_null, function, all);
                                tasks.push(Task::Combine(CK::Template(template), n));
                                for arg in args.into_iter().rev() {
                                    tasks.push(Task::Eval(arg));
                                }
                                continue;
                            }
                        }

                        if pred_name == "Round" {
                            let fvs = co["record"].as_object()["field_value"].as_array();
                            if fvs.len() == 2 {
                                let template = crate::compiler::dialects::round_to_digits_template(self.dialect);
                                let args: Vec<&Json> = fvs.iter()
                                    .filter_map(|fv| fv.as_object()["value"].as_object().get("expression"))
                                    .collect();
                                tasks.push(Task::Combine(CK::Template(template.to_string()), 2));
                                for arg in args.into_iter().rev() {
                                    tasks.push(Task::Eval(arg));
                                }
                                continue;
                            }
                        }

                        // A number as text: the same text on every engine.
                        if pred_name == "ToString" {
                            if let Some(template) = self.dialect.number_to_string() {
                                let fvs = co["record"].as_object()["field_value"].as_array();
                                let arg = fvs.first()
                                    .and_then(|fv| fv.as_object()["value"].as_object().get("expression"));
                                if let Some(arg) = arg.filter(|a| self.value_type(a) == Type::Number) {
                                    tasks.push(Task::Combine(CK::Template(template.to_string()), 1));
                                    tasks.push(Task::Eval(arg));
                                    continue;
                                }
                            }
                        }

                        // A boolean as text is "true" or "false", also where
                        // the engine stores it as 1 or 0 (SQLite).
                        if pred_name == "ToString" {
                            if let Some(template) = self.dialect.boolean_to_string() {
                                let fvs = co["record"].as_object()["field_value"].as_array();
                                let arg = fvs.first()
                                    .and_then(|fv| fv.as_object()["value"].as_object().get("expression"));
                                if let Some(arg) = arg.filter(|a| is_boolean_expression(a)) {
                                    tasks.push(Task::Combine(CK::Template(template.to_string()), 1));
                                    tasks.push(Task::Eval(arg));
                                    continue;
                                }
                            }
                        }

                        // Concatenating an empty list written out changes
                        // nothing, and Trino and Presto cannot type `ARRAY[]`.
                        if pred_name == "ArrayConcat" {
                            let fvs = co["record"].as_object()["field_value"].as_array();
                            let is_empty_list = |fv: &Json| {
                                fv.as_object()["value"].as_object().get("expression")
                                    .and_then(|a| a.as_object().get("literal"))
                                    .and_then(|l| l.as_object().get("the_list"))
                                    .and_then(|l| l.as_object().get("element"))
                                    .is_some_and(|e| e.as_array().is_empty())
                            };
                            if fvs.len() == 2 && (is_empty_list(&fvs[0]) || is_empty_list(&fvs[1])) {
                                let kept = if is_empty_list(&fvs[0]) { &fvs[1] } else { &fvs[0] };
                                if let Some(e) = kept.as_object()["value"].as_object().get("expression") {
                                    tasks.push(Task::Eval(e));
                                    continue;
                                }
                            }
                        }

                        // The size of a list written out is known: `Size([])`
                        // is 0 (PostgreSQL cannot type a lone empty array).
                        if pred_name == "Size" {
                            let fvs = co["record"].as_object()["field_value"].as_array();
                            if fvs.len() == 1 {
                                let arg = fvs[0].as_object()["value"].as_object().get("expression");
                                let list = arg
                                    .and_then(|a| a.as_object().get("literal"))
                                    .and_then(|l| l.as_object().get("the_list"))
                                    .and_then(|l| l.as_object().get("element"));
                                if let Some(elements) = list {
                                    results.push(elements.as_array().len().to_string());
                                    continue;
                                }
                            }
                        }

                        // Analytic/window functions
                        if Self::is_analytic_function(pred_name) {
                            let fvs = co["record"].as_object()["field_value"].as_array();
                            // Validate: analytic functions need 3 args, Window variants need 4
                            let is_window = pred_name.starts_with("Window");
                            let expected = if is_window { 4 } else { 3 };
                            if fvs.len() != expected {
                                return Err(CompileError::new(
                                    format!("{} requires {} arguments, got {}", pred_name, expected, fvs.len()), ""));
                            }
                            let get_expr = |idx: usize| -> CompileResult<&Json> {
                                fvs.get(idx)
                                    .and_then(|fv| fv.as_object()["value"].as_object().get("expression"))
                                    .ok_or_else(|| CompileError::new(
                                        format!("{} missing argument {}", pred_name, idx), ""))
                            };
                            let template = Self::analytic_template(pred_name).to_string();
                            let num_args = expected;
                            tasks.push(Task::Combine(CK::Analytic(template), num_args));
                            // Push in reverse arg order
                            if is_window {
                                tasks.push(Task::Eval(get_expr(3)?));
                            }
                            // arg2: order_by (list expansion)
                            {
                                let expr2 = get_expr(2)?;
                                let mut handled = false;
                                if let Some(lit) = expr2.as_object().get("literal") {
                                    if let Some(the_list) = lit.as_object().get("the_list") {
                                        if let Some(elements) = the_list.as_object().get("element") {
                                            let elems = elements.as_array();
                                            tasks.push(Task::Combine(CK::JoinComma, elems.len()));
                                            for e in elems.iter().rev() {
                                                tasks.push(Task::Eval(e));
                                            }
                                        } else {
                                            results.push(String::new());
                                        }
                                        handled = true;
                                    }
                                }
                                if !handled {
                                    tasks.push(Task::Eval(expr2));
                                }
                            }
                            // arg1: partition_by (list expansion)
                            {
                                let expr1 = get_expr(1)?;
                                let mut handled = false;
                                if let Some(lit) = expr1.as_object().get("literal") {
                                    if let Some(the_list) = lit.as_object().get("the_list") {
                                        if let Some(elements) = the_list.as_object().get("element") {
                                            let elems = elements.as_array();
                                            tasks.push(Task::Combine(CK::JoinComma, elems.len()));
                                            for e in elems.iter().rev() {
                                                tasks.push(Task::Eval(e));
                                            }
                                        } else {
                                            results.push(String::new());
                                        }
                                        handled = true;
                                    }
                                }
                                if !handled {
                                    tasks.push(Task::Eval(expr1));
                                }
                            }
                            // arg0: aggregant
                            tasks.push(Task::Eval(get_expr(0)?));
                            continue;
                        }

                        // Extract and sort args
                        let fvs = co["record"].as_object()["field_value"].as_array();
                        let mut indexed: Vec<(i64, &Json)> = Vec::with_capacity(fvs.len());
                        let mut named: Vec<(&str, &Json)> = Vec::new();
                        for fv in fvs {
                            let fo = fv.as_object();
                            let field = &fo["field"];
                            let value = &fo["value"];
                            let e = value.as_object().get("expression").unwrap_or(value);
                            if field.is_int() {
                                indexed.push((field.as_int(), e));
                            } else {
                                named.push((field.as_str(), e));
                            }
                        }
                        indexed.sort_by_key(|(i, _)| *i);
                        let num_args = indexed.len() + named.len();

                        // Determine combiner based on function type
                        if pred_name == "SqlExpr" {
                            // Validate: first positional arg must be a string literal template.
                            if indexed.is_empty() {
                                return Err(CompileError::new(
                                    "SqlExpr requires at least one positional argument", ""));
                            }
                            let first_arg = indexed[0].1;
                            let is_string_lit = first_arg.as_object()
                                .get("literal")
                                .and_then(|lit| lit.as_object().get("the_string"))
                                .is_some();
                            if !is_string_lit {
                                return Err(CompileError::new(
                                    "SqlExpr must have first argument be a string literal", ""));
                            }
                            // SqlExpr(template, {field1: val1, field2: val2})
                            // Python's GenericSqlExpression extracts the record fields
                            // individually and uses template.format(**args).
                            // We need to decompose the second arg's record into individual
                            // named fields rather than evaluating it as a whole record.
                            let mut sql_expr_named_keys: Vec<String> = Vec::new();
                            let mut sql_expr_evals: Vec<&Json> = Vec::new();

                            // Template is always the first indexed arg
                            if !indexed.is_empty() {
                                sql_expr_evals.push(indexed[0].1);
                            }

                            // Check if second indexed arg is a record - decompose it
                            if indexed.len() > 1 {
                                let second_arg = indexed[1].1;
                                let second_obj = if second_arg.is_object() {
                                    Some(second_arg.as_object())
                                } else {
                                    None
                                };
                                let record = second_obj.and_then(|o| o.get("record"));
                                if let Some(rec) = record {
                                    // Extract individual field values from the record
                                    if let Some(fvs_inner) = rec.as_object().get("field_value") {
                                        for fv_inner in fvs_inner.as_array() {
                                            let fo_inner = fv_inner.as_object();
                                            let field_name = fo_inner["field"].as_str().to_string();
                                            let val = &fo_inner["value"];
                                            let e = val.as_object().get("expression").unwrap_or(val);
                                            sql_expr_named_keys.push(field_name);
                                            sql_expr_evals.push(e);
                                        }
                                    }
                                } else {
                                    // Not a record - treat as positional arg
                                    sql_expr_evals.push(second_arg);
                                }
                            }

                            // Any remaining indexed args beyond index 1
                            for (_, e) in indexed.iter().skip(2) {
                                sql_expr_evals.push(e);
                            }

                            let positional_count = sql_expr_evals.len().saturating_sub(1).saturating_sub(sql_expr_named_keys.len());

                            tasks.push(Task::Combine(CK::SqlExpr {
                                positional_count,
                                named_keys: sql_expr_named_keys,
                            }, sql_expr_evals.len()));

                            // Push evaluations in reverse order
                            for e in sql_expr_evals.iter().rev() {
                                tasks.push(Task::Eval(e));
                            }
                            continue;
                        } else if pred_name == "Cast" || pred_name == "TryCast" {
                            tasks.push(Task::Combine(CK::Cast(pred_name.to_string()), num_args));
                        } else if pred_name == "FlagValue" {
                            // Validate: FlagValue argument must be a string literal.
                            if indexed.len() != 1 {
                                return Err(CompileError::new(
                                    "FlagValue requires exactly 1 argument", ""));
                            }
                            let flag_arg = indexed[0].1;
                            let is_string_lit = flag_arg.as_object()
                                .get("literal")
                                .and_then(|lit| lit.as_object().get("the_string"))
                                .is_some();
                            if !is_string_lit {
                                return Err(CompileError::new(
                                    "FlagValue argument must be a string literal", ""));
                            }
                            tasks.push(Task::Combine(CK::FlagValue, num_args));
                        // Use IF(...) to match Python's output (required for golden tests)
                        } else if pred_name == "If" && num_args == 3 {
                            // CASE: PostgreSQL has no IF.
                            tasks.push(Task::Combine(CK::Template(
                                "(CASE WHEN {0} THEN {1} ELSE {2} END)".to_string()), 3));
                        // Handle Array/ArgMin/ArgMax with arrow argument for SQLite
                        // Arrow expressions are converted to records {arg: ..., value: ...}
                        } else if (pred_name == "Array" || pred_name == "ArgMin" || pred_name == "ArgMax")
                                  && num_args == 1
                                  && !indexed.is_empty() {
                            let first_arg = indexed[0].1;

                            // Check if first arg is a record with "arg" and "value" fields (arrow)
                            // or MagicalEntangle wrapping such a record
                            let mut arg_expr: Option<Json> = None;
                            let mut value_expr: Option<Json> = None;
                            let mut entangle_var: Option<Json> = None;

                            // Helper to extract arg/value from a record
                            fn extract_arrow_record(obj: &crate::parser::JsonObject) -> (Option<Json>, Option<Json>) {
                                let mut arg = None;
                                let mut val = None;
                                if let Some(rec) = obj.get("record") {
                                    if let Some(fvs) = rec.as_object().get("field_value") {
                                        for fv in fvs.as_array() {
                                            let fo = fv.as_object();
                                            let field = fo.get("field").map(|f| f.as_str()).unwrap_or("");
                                            if let Some(v) = fo.get("value") {
                                                let e = v.as_object().get("expression").unwrap_or(v);
                                                if field == "arg" {
                                                    arg = Some(e.clone());
                                                } else if field == "value" {
                                                    val = Some(e.clone());
                                                }
                                            }
                                        }
                                    }
                                }
                                (arg, val)
                            }

                            let first_obj = first_arg.as_object();

                            // Direct record with arg/value
                            if first_obj.contains_key("record") {
                                let (a, v) = extract_arrow_record(first_obj);
                                arg_expr = a;
                                value_expr = v;
                            }
                            // MagicalEntangle wrapping - first arg is the record
                            else if let Some(call) = first_obj.get("call") {
                                let co = call.as_object();
                                if co.get("predicate_name").map(|p| p.as_str()) == Some("MagicalEntangle") {
                                    if let Some(rec) = co.get("record") {
                                        if let Some(fvs) = rec.as_object().get("field_value") {
                                            for fv in fvs.as_array() {
                                                let fo = fv.as_object();
                                                let field_idx = fo.get("field").and_then(|f| if f.is_int() { Some(f.as_int()) } else { None });
                                                if field_idx == Some(0) {
                                                    if let Some(val) = fo.get("value") {
                                                        let expr = val.as_object().get("expression").unwrap_or(val);
                                                        let (a, v) = extract_arrow_record(expr.as_object());
                                                        arg_expr = a;
                                                        value_expr = v;
                                                    }
                                                } else if field_idx == Some(1) {
                                                    if let Some(val) = fo.get("value") {
                                                        entangle_var = Some(val.as_object().get("expression").unwrap_or(val).clone());
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            if let (Some(arg_e), Some(val_e)) = (&arg_expr, &value_expr) {
                                // Handle arrow syntax (i -> expr) for Array/ArgMin/ArgMax
                                let dialect_name = self.dialect.name();
                                let arg_sql = self.convert_to_sql(arg_e)?;
                                let value_sql = self.convert_to_sql(val_e)?;

                                if dialect_name == "sqlite" {
                                    // For SQLite: Array({arg: a, value: v})
                                    // With MagicalEntangle:
                                    //   ArgMin(JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', a, 'value', v), cor), "$.value"),
                                    //          JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', a, 'value', v), cor), "$.arg"), null)
                                    // Without MagicalEntangle:
                                    //   ArgMin(v, a, null)
                                    let (final_value, final_arg) = if let Some(evar) = &entangle_var {
                                        // With correlation: use JSON_OBJECT structure
                                        let evar_sql = self.convert_to_sql(evar)?;
                                        let json_obj = format!("JSON_OBJECT('arg', {}, 'value', {})", arg_sql, value_sql);
                                        let entangled = format!("MagicalEntangle({}, {})", json_obj, evar_sql);
                                        let extract_value = format!("JSON_EXTRACT({}, \"$.value\")", entangled);
                                        let extract_arg = format!("JSON_EXTRACT({}, \"$.arg\")", entangled);
                                        (extract_value, extract_arg)
                                    } else {
                                        // No correlation: just use value and arg directly
                                        (value_sql.clone(), arg_sql.clone())
                                    };

                                    let result_sql = if pred_name == "Array" {
                                        format!("ArgMin({}, {}, null)", final_value, final_arg)
                                    } else if pred_name == "ArgMin" {
                                        format!("JSON_EXTRACT(ArgMin({}, {}, 1), '$[0]')", final_value, final_arg)
                                    } else { // ArgMax
                                        format!("JSON_EXTRACT(ArgMax({}, {}, 1), '$[0]')", final_value, final_arg)
                                    };
                                    results.push(result_sql);
                                    continue;
                                } else if dialect_name == "bigquery" {
                                    // For BigQuery:
                                    // Array(i -> v) => ARRAY_AGG(v order by [i][offset(0)])
                                    // ArgMin(i -> v) => ARRAY_AGG(v order by [i][offset(0)] limit 1)[OFFSET(0)]
                                    // ArgMax(i -> v) => ARRAY_AGG(v order by [i][offset(0)] desc limit 1)[OFFSET(0)]
                                    let result_sql = if pred_name == "Array" {
                                        format!("ARRAY_AGG({} order by [{}][offset(0)])", value_sql, arg_sql)
                                    } else if pred_name == "ArgMin" {
                                        format!("ARRAY_AGG({} order by [{}][offset(0)] limit 1)[OFFSET(0)]", value_sql, arg_sql)
                                    } else { // ArgMax
                                        format!("ARRAY_AGG({} order by  [{}][offset(0)] desc limit 1)[OFFSET(0)]", value_sql, arg_sql)
                                    };
                                    results.push(result_sql);
                                    continue;
                                } else if dialect_name == "duckdb" {
                                    // For DuckDB:
                                    // Array(i -> v) => ARRAY_AGG(v order by i)
                                    // ArgMin(i -> v) => argmin(i, v) (built-in function)
                                    // ArgMax(i -> v) => argmax(i, v) (built-in function)
                                    let result_sql = if pred_name == "Array" {
                                        format!("ARRAY_AGG({} order by {})", value_sql, arg_sql)
                                    } else if pred_name == "ArgMin" {
                                        format!("argmin({}, {})", arg_sql, value_sql)
                                    } else { // ArgMax
                                        format!("argmax({}, {})", arg_sql, value_sql)
                                    };
                                    results.push(result_sql);
                                    continue;
                                } else if dialect_name == "psql" {
                                    // For PostgreSQL, only handle Array specially
                                    // ArgMin/ArgMax use complex library definitions with record wrapping
                                    if pred_name == "Array" {
                                        results.push(format!("ARRAY_AGG({} order by {})", value_sql, arg_sql));
                                        continue;
                                    }
                                    // Fall through for ArgMin/ArgMax to use library
                                } else if dialect_name == "trino" || dialect_name == "presto" {
                                    // For Trino, Presto:
                                    // Array(i -> v) => ARRAY_AGG(v order by i)
                                    // ArgMin(i -> v) => (ARRAY_AGG(i order by v))[1]
                                    // ArgMax(i -> v) => (ARRAY_AGG(i order by v desc))[1]
                                    let result_sql = if pred_name == "Array" {
                                        format!("ARRAY_AGG({} order by {})", value_sql, arg_sql)
                                    } else if pred_name == "ArgMin" {
                                        format!("(ARRAY_AGG({} order by {}))[1]", arg_sql, value_sql)
                                    } else { // ArgMax
                                        format!("(ARRAY_AGG({} order by {} desc))[1]", arg_sql, value_sql)
                                    };
                                    results.push(result_sql);
                                    continue;
                                } else if dialect_name == "databricks" {
                                    // Spark/Databricks COLLECT_LIST has no in-aggregate ORDER BY,
                                    // so collect STRUCT pairs and sort the resulting array:
                                    // Array(i -> v)  => sort by arg, project value
                                    // ArgMin(i -> v) => sort by value asc, take first arg
                                    // ArgMax(i -> v) => sort by value desc, take first arg
                                    let result_sql = if pred_name == "Array" {
                                        format!(
                                            "TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT({} AS arg, {} AS value))), s -> s.value)",
                                            arg_sql, value_sql
                                        )
                                    } else if pred_name == "ArgMin" {
                                        format!(
                                            "SORT_ARRAY(COLLECT_LIST(STRUCT({} AS value, {} AS arg)))[0].arg",
                                            value_sql, arg_sql
                                        )
                                    } else { // ArgMax
                                        format!(
                                            "SORT_ARRAY(COLLECT_LIST(STRUCT({} AS value, {} AS arg)), false)[0].arg",
                                            value_sql, arg_sql
                                        )
                                    };
                                    results.push(result_sql);
                                    continue;
                                }
                                // Fall through for other dialects
                            }
                            // Fall through to default handling if not arrow or not SQLite
                            if let Some(tmpl) = self.built_in_functions.get(pred_name) {
                                tasks.push(Task::Combine(CK::Template(tmpl.clone()), num_args));
                            } else {
                                tasks.push(Task::Combine(CK::FunctionCall(pred_name.to_string()), num_args));
                            }
                            for (_, e) in indexed.iter().rev() {
                                tasks.push(Task::Eval(e));
                            }
                            continue;
                        } else if num_args == 2 && self.built_in_infix_operators.contains_key(pred_name) {
                            // When we have exactly 2 args and the predicate is an infix operator,
                            // prefer the infix template (e.g. `-` with left/right should be
                            // subtraction, not unary negation).
                            let tmpl = &self.built_in_infix_operators[pred_name];
                            tasks.push(Task::Combine(CK::TemplateParens(tmpl.clone()), 2));
                        } else if pred_name == "Format" && self.dialect.format_uses_concat() {
                            // PrestoDB has no FORMAT/printf function; lower
                            // `Format("…%s…", a, …)` to a `||` concat chain.
                            tasks.push(Task::Combine(CK::FormatConcat, num_args));
                        } else if let Some(tmpl) = self.built_in_functions.get(pred_name) {
                            // Validate arity range for built-in functions.
                            if let Some((min_arity, max_arity)) = Self::built_in_function_arity_range(pred_name) {
                                if num_args < min_arity || num_args > max_arity {
                                    return Err(CompileError::new(
                                        format!(
                                            "Built-in function {} expects {}-{} arguments, got {}",
                                            pred_name, min_arity, max_arity, num_args
                                        ),
                                        "",
                                    ));
                                }
                            }
                            tasks.push(Task::Combine(CK::Template(tmpl.clone()), num_args));
                        } else if self.built_in_infix_operators.contains_key(pred_name) {
                            if pred_name.chars().next().map(|c| c.is_ascii_uppercase()).unwrap_or(false) {
                                tasks.push(Task::Combine(CK::FunctionCall(pred_name.to_ascii_uppercase()), num_args));
                            } else {
                                return Err(CompileError::new(
                                    format!("Unknown function or predicate: {}", pred_name), ""));
                            }
                        } else if let Some(translator) = self.subquery_translator {
                            if let Ok(table) = translator.translate_table(pred_name, Some(&self.vocabulary)) {
                                if fvs.is_empty() {
                                    results.push(format!("(SELECT {} FROM {})", self.value_field, table));
                                    continue;
                                }
                                tasks.push(Task::Combine(CK::UserPredicate(table), num_args));
                            } else if pred_name.chars().next().map(|c| c.is_ascii_uppercase()).unwrap_or(false) {
                                tasks.push(Task::Combine(CK::FunctionCall(pred_name.to_ascii_uppercase()), num_args));
                            } else {
                                return Err(CompileError::new(
                                    format!("Unknown function or predicate: {}", pred_name), ""));
                            }
                        } else if pred_name.chars().next().map(|c| c.is_ascii_uppercase()).unwrap_or(false) {
                            tasks.push(Task::Combine(CK::FunctionCall(pred_name.to_ascii_uppercase()), num_args));
                        } else {
                            return Err(CompileError::new(
                                format!("Unknown function or predicate: {}", pred_name), ""));
                        }

                        // Push arg evaluations in reverse order (first arg evaluated first)
                        for (_, e) in named.iter().rev() {
                            tasks.push(Task::Eval(e));
                        }
                        for (_, e) in indexed.iter().rev() {
                            tasks.push(Task::Eval(e));
                        }
                        continue;
                    }

                    // ── Record ──
                    if let Some(record) = obj.get("record") {
                        let fvs = record.as_object()["field_value"].as_array();
                        let mut fields: Vec<(String, Type)> = Vec::with_capacity(fvs.len());
                        let mut exprs: Vec<&Json> = Vec::with_capacity(fvs.len());
                        for fv in fvs {
                            let fo = fv.as_object();
                            let val = &fo["value"];
                            let e = val.as_object().get("expression").unwrap_or(val);
                            fields.push((fo["field"].as_str().to_string(), self.value_type(e)));
                            exprs.push(e);
                        }
                        self.hinted_fields(expr, &mut fields);
                        let n = exprs.len();
                        tasks.push(Task::Combine(CK::Record(fields), n));
                        for e in exprs.into_iter().rev() {
                            tasks.push(Task::Eval(e));
                        }
                        continue;
                    }

                    // ── Subscript ──
                    if let Some(sub) = obj.get("subscript") {
                        let so = sub.as_object();
                        let subscript = &so["subscript"];
                        let record_expr = &so["record"];

                        let sub_str = if subscript.is_object() {
                            subscript.as_object().get("literal").and_then(|lit| {
                                let lo = lit.as_object();
                                if let Some(s) = lo.get("the_string") {
                                    Some(s.as_str().to_string())
                                } else if let Some(n) = lo.get("the_number") {
                                    Some(n.as_int().to_string())
                                } else if let Some(sym) = lo.get("the_symbol") {
                                    Some(sym.as_object()["symbol"].as_str().to_string())
                                } else {
                                    None
                                }
                            })
                        } else {
                            Some(subscript.as_str().to_string())
                        };

                        // Optimization 1: if subscripting a record literal, return the field directly.
                        // Matches Python's optimization in ConvertToSql subscript handling.
                        if let Some(ref sub_field) = sub_str {
                            if let Some(rec) = record_expr.as_object().get("record") {
                                if let Some(fvs) = rec.as_object().get("field_value") {
                                    let mut found = false;
                                    for fv in fvs.as_array() {
                                        let fo = fv.as_object();
                                        if fo["field"].as_str() == sub_field {
                                            tasks.push(Task::Eval(
                                                fo["value"].as_object().get("expression")
                                                    .unwrap_or(&fo["value"])
                                            ));
                                            found = true;
                                            break;
                                        }
                                    }
                                    if found {
                                        continue;
                                    }
                                }
                            }

                            // Optimization 2: SubIfStruct — push subscript into implication branches.
                            // If all consequences are records, extract the field from each branch.
                            if let Some(impl_expr) = record_expr.as_object().get("implication") {
                                if let Some(new_expr) = sub_if_struct(impl_expr, sub_field) {
                                    tasks.push(Task::Eval(
                                        // Leak is safe: expression lives for duration of convert_to_sql
                                        Box::leak(Box::new(new_expr))
                                    ));
                                    continue;
                                }
                            }
                        }

                        // record_is_table is true only if:
                        // 1. record_expr is a simple variable
                        // 2. That variable is in the vocabulary
                        // 3. The vocabulary value is a simple table reference (no dot),
                        //    NOT a column reference like "table.column"
                        let record_is_table = record_expr.as_object().get("variable")
                            .and_then(|v| self.vocabulary.get(v.as_object()["var_name"].as_str()))
                            .map(|sql_ref| !sql_ref.contains('.'))
                            .unwrap_or(false);

                        if sub_str.is_some() {
                            tasks.push(Task::Combine(CK::Subscript { sub_str, record_is_table }, 1));
                            tasks.push(Task::Eval(record_expr));
                        } else {
                            tasks.push(Task::Combine(CK::Subscript { sub_str: None, record_is_table }, 2));
                            tasks.push(Task::Eval(subscript));
                            tasks.push(Task::Eval(record_expr));
                        }
                        continue;
                    }

                    // ── Implication ──
                    if let Some(imp) = obj.get("implication") {
                        let io = imp.as_object();
                        let conditions = io["if_then"].as_array();
                        let has_otherwise = io.contains_key("otherwise");
                        let num_args = 2 * conditions.len() + if has_otherwise { 1 } else { 0 };
                        tasks.push(Task::Combine(CK::Implication { has_otherwise }, num_args));
                        if let Some(otherwise) = io.get("otherwise") {
                            tasks.push(Task::Eval(otherwise));
                        }
                        for ct in conditions.iter().rev() {
                            let cto = ct.as_object();
                            tasks.push(Task::Eval(&cto["consequence"]));
                            tasks.push(Task::Eval(&cto["condition"]));
                        }
                        continue;
                    }

                    // ── Aggregation ──
                    if let Some(agg) = obj.get("aggregation") {
                        if let Some(inner) = agg.as_object().get("expression") {
                            tasks.push(Task::Eval(inner));
                            continue;
                        }
                    }

                    // ── Combine ──
                    if let Some(combine) = obj.get("combine") {
                        results.push(self.convert_combine(combine)?);
                        continue;
                    }

                    // ── Unknown ──
                    let meaningful: Vec<&String> = obj.keys()
                        .filter(|k| *k != "expression_heritage" && *k != "type")
                        .collect();
                    if meaningful.is_empty() {
                        return Err(CompileError::new("Empty expression", ""));
                    }
                    return Err(CompileError::new(
                        format!("Unknown expression type: {:?}", meaningful), ""));
                }

                Task::Combine(kind, n) => {
                    let start = results.len() - n;
                    let args: Vec<String> = results.drain(start..).collect();
                    match kind {
                        CK::Template(template) => {
                            results.push(apply_template(&template, &args));
                        }
                        CK::TemplateParens(template) => {
                            let r = if template.contains("{left}") || template.contains("{right}") {
                                template.replace("{left}", &args[0]).replace("{right}", &args[1])
                            } else {
                                apply_template(&template, &args)
                            };
                            results.push(format!("({})", r));
                        }
                        // Note: PostgreSQL type suffixes (::type[]) are handled via type inference
                        // when enabled. The convert_to_json mode uses JSON array format.
                        CK::ArrayLiteral(array_phrase) => {
                            let items_str = args.join(", ");
                            results.push(if args.is_empty() {
                                self.dialect.empty_array_literal()
                            } else if array_phrase.contains("%s") {
                                array_phrase.replace("%s", &items_str)
                            } else if array_phrase.is_empty() {
                                format!("[{}]", items_str)
                            } else {
                                format!("{}({})", array_phrase, items_str)
                            });
                        }
                        // Note: PostgreSQL ROW type casting is handled via type inference.
                        // JSON_OBJECT style output is dialect-specific (handled in Dialect trait).
                        CK::Record(fields) => {
                            let pairs: Vec<(&str, &str, &Type)> = fields.iter()
                                .zip(args.iter())
                                .map(|((f, t), v)| (f.as_str(), v.as_str(), t))
                                .collect();
                            if let Some(st) = self.subquery_translator {
                                st.register_record_type(&Type::Record {
                                    fields: fields.iter().cloned().collect(),
                                    is_opened: false,
                                });
                            }
                            results.push(self.dialect.record_literal(&pairs));
                        }
                        // Subscript optimizations (record literal extraction, SubIfStruct) are in Eval phase above.
                        CK::Subscript { sub_str, record_is_table } => {
                            let (record_sql, sub_final) = if let Some(s) = sub_str {
                                (&args[0], s)
                            } else {
                                (&args[0], args[1].clone())
                            };
                            results.push(self.dialect.subscript(record_sql, &sub_final, record_is_table));
                        }
                        CK::Implication { has_otherwise } => {
                            let mut sql = "CASE".to_string();
                            let cond_count = if has_otherwise { n - 1 } else { n };
                            for i in (0..cond_count).step_by(2) {
                                sql.push_str(&format!(" WHEN {} THEN {}", args[i], args[i + 1]));
                            }
                            if has_otherwise {
                                sql.push_str(&format!(" ELSE {}", args[n - 1]));
                            }
                            sql.push_str(" END");
                            results.push(sql);
                        }
                        // Validation in Eval phase checks first arg is string literal.
                        CK::SqlExpr { positional_count, named_keys } => {
                            if args.is_empty() {
                                return Err(CompileError::new(
                                    "SqlExpr requires at least one argument", ""));
                            }
                            // Strip an optional DuckDB E'...' escape-string prefix before
                            // un-quoting, so SqlExpr templates aren't treated as data literals.
                            let template_src = args[0].strip_prefix('E').unwrap_or(&args[0]);
                            let template = template_src.trim_matches('\'').trim_matches('"');
                            let mut result = template.to_string();
                            // Substitute positional args: {0}, {1}, ...
                            // args layout: [template, positional..., named...]
                            let positional_args = &args[1..1 + positional_count];
                            for (i, arg) in positional_args.iter().enumerate() {
                                result = result.replace(&format!("{{{}}}", i), arg);
                            }
                            // Substitute named args: {name}, ...
                            let named_args = &args[1 + positional_count..];
                            for (key, arg) in named_keys.iter().zip(named_args.iter()) {
                                result = result.replace(&format!("{{{}}}", key), arg);
                            }
                            results.push(result);
                        }
                        CK::Cast(func) => {
                            if args.len() != 2 {
                                return Err(CompileError::new(
                                    format!("{} requires 2 arguments", func), ""));
                            }
                            let type_name = args[1].trim_matches('\'').trim_matches('"');
                            results.push(if func == "TryCast" {
                                format!("TRY_CAST({} AS {})", args[0], type_name)
                            } else {
                                format!("CAST({} AS {})", args[0], type_name)
                            });
                        }
                        // Validation in Eval phase checks arg is string literal.
                        CK::FlagValue => {
                            if args.is_empty() {
                                return Err(CompileError::new(
                                    "FlagValue requires an argument", ""));
                            }
                            let flag_name = args[0].trim_matches('\'').trim_matches('"');
                            if let Some(value) = self.flag_values.get(flag_name) {
                                results.push(self.dialect.str_literal(value));
                            } else {
                                return Err(CompileError::new(
                                    format!("Undefined flag: {}", flag_name), ""));
                            }
                        }
                        CK::FunctionCall(sql_name) => {
                            results.push(format!("{}({})", sql_name, args.join(", ")));
                        }
                        CK::UserPredicate(table) => {
                            let conditions: Vec<String> = args.iter().enumerate()
                                .map(|(i, a)| format!("col{} = {}", i, a))
                                .collect();
                            results.push(format!("(SELECT {} FROM {} WHERE {})",
                                self.value_field, table, conditions.join(" AND ")));
                        }
                        CK::Analytic(template) => {
                            let mut result = template.clone();
                            for (i, arg) in args.iter().enumerate() {
                                result = result.replace(&format!("{{{}}}", i), arg);
                            }
                            results.push(result);
                        }
                        CK::JoinComma => {
                            results.push(args.join(", "));
                        }
                        CK::FormatConcat => {
                            // args[0] is the format-string literal; args[1..]
                            // are the SQL expressions for its placeholders.
                            let fmt_sql = &args[0];
                            let values = &args[1..];
                            if !(fmt_sql.len() >= 2
                                && fmt_sql.starts_with('\'')
                                && fmt_sql.ends_with('\''))
                            {
                                return Err(CompileError::new(
                                    "Format on this engine requires a literal format string",
                                    "",
                                ));
                            }
                            // Strip the surrounding quotes and undo SQL '' escaping.
                            let inner = fmt_sql[1..fmt_sql.len() - 1].replace("''", "'");
                            let pieces = format_pieces(&inner).map_err(|e| CompileError::new(e, ""))?;
                            let wanted = pieces.iter().filter(|p| matches!(p, FormatPiece::Spec { .. })).count();
                            if wanted != values.len() {
                                return Err(CompileError::new(
                                    format!(
                                        "Format expects {} argument(s) for its placeholders, got {}",
                                        wanted,
                                        values.len()
                                    ),
                                    "",
                                ));
                            }
                            let mut parts: Vec<String> = Vec::new();
                            let mut next = values.iter();
                            for piece in &pieces {
                                match piece {
                                    FormatPiece::Text(text) => parts.push(self.dialect.str_literal(text)),
                                    FormatPiece::Spec { .. } => {
                                        let value = next.next().expect("counted");
                                        parts.push(piece.render(value, |t| self.dialect.str_literal(t)));
                                    }
                                }
                            }
                            results.push(if parts.is_empty() {
                                self.dialect.str_literal("")
                            } else {
                                parts.join(" || ")
                            });
                        }
                    }
                }
            }
        }

        debug_assert_eq!(results.len(), 1);
        Ok(results.pop().unwrap_or_default())
    }

    /// Returns (min_arity, max_arity) for built-in functions.
    /// Matches Python's BuiltInFunctionArityRange().
    fn built_in_function_arity_range(f: &str) -> Option<(usize, usize)> {
        match f {
            "If" => Some((3, 3)),
            "RegexpExtract" | "Like" | "ParseTimestamp" | "FormatTimestamp"
            | "TimestampAddDays" | "Split" | "Element" | "Concat"
            | "DateAddDay" | "DateDiffDay" | "Join" | "MagicalEntangle"
            | "ArrayConcat" => Some((2, 2)),
            _ => None, // Skip validation for functions with variable arity
        }
    }

    fn convert_variable(&self, var: &Json) -> CompileResult<String> {
        let var_name = var.as_object()["var_name"].as_str();
        if let Some(sql) = self.vocabulary.get(var_name) {
            Ok(sql.clone())
        } else {
            Err(CompileError::new(
                format!("Undefined variable: {} (vocab: {:?})", var_name, self.vocabulary.keys().collect::<Vec<_>>()), var_name))
        }
    }

    /// Convert a combine (subquery) expression to SQL.
    ///
    /// PostgreSQL requires aggregating (combine) subqueries to be explicitly CAST to
    /// their result type, matching logica's `combine_psql_type` behavior
    /// (see logica compiler/expr_translate.py). The type is derived from the
    /// aggregation operator and its operand.
    fn convert_combine(&self, combine: &Json) -> CompileResult<String> {
        let translator = self.subquery_translator.ok_or_else(|| {
            CompileError::new("Combine expressions require a subquery translator", "")
        })?;
        if let Some(sql) = self.combine_of_lists(combine)? {
            return Ok(sql);
        }
        let sql = translator.translate_rule(combine, &self.vocabulary, &self.variable_types, true)?;
        if self.dialect.name() == "psql" {
            if let Some(ty) = translator.combine_psql_type(combine) {
                return Ok(format!("CAST(({}) AS {})", sql, ty));
            }
        }
        Ok(format!("({})", sql))
    }

    /// This translator with variables of a lambda added to its vocabulary.
    fn scoped(&self, names: &[(String, String)]) -> ExprTranslator<'a> {
        let mut vocabulary = self.vocabulary.clone();
        for (variable, sql) in names {
            vocabulary.insert(variable.clone(), sql.clone());
        }
        ExprTranslator {
            vocabulary,
            dialect: self.dialect,
            built_in_functions: self.built_in_functions.clone(),
            built_in_infix_operators: self.built_in_infix_operators.clone(),
            variable_types: self.variable_types.clone(),
            type_hints: std::cell::RefCell::new(self.type_hints.borrow().clone()),
            flag_values: self.flag_values,
            subquery_translator: self.subquery_translator,
            value_field: self.value_field,
        }
    }

    /// A combine over the elements of lists of the enclosing rule's row
    /// (`combine Max= y :- y in l, y > 1`), on Trino, Presto and Spark: a
    /// subquery unnesting a column of the outer query and filtering it is not
    /// supported on Trino and Presto ("Given correlated subquery is not
    /// supported"), nor on Spark an aggregate of both the outer row and the
    /// elements (`ArgMax= i -> Element(l, i)`). Its values are an array built
    /// with lambdas: `FILTER` for the conditions, `TRANSFORM` (and `FLATTEN`
    /// for several lists) for the values. Trino and Spark aggregate the array
    /// in a subquery that unnests it unfiltered, which they support; Presto
    /// supports none, and applies array functions (as Trino and Spark do for
    /// ArgMax, ArgMin and Array). None
    /// when the combine reads a table or aggregates otherwise.
    fn combine_of_lists(&self, combine: &Json) -> CompileResult<Option<String>> {
        let engine = self.dialect.name();
        if engine != "trino" && engine != "presto" && engine != "databricks" {
            return Ok(None);
        }
        let co = combine.as_object();
        let Some(body) = co.get("body") else { return Ok(None) };
        let Some(conjuncts) = body.as_object().get("conjunction")
            .and_then(|c| c.as_object().get("conjunct")) else { return Ok(None) };
        let basis = Self::basis_functions(self.dialect);
        let mut lists: Vec<(String, Json)> = Vec::new();
        let mut conditions: Vec<Json> = Vec::new();
        for conjunct in conjuncts.as_array().iter() {
            let c = conjunct.as_object();
            if let Some(inclusion) = c.get("inclusion") {
                let io = inclusion.as_object();
                let variable = io.get("element")
                    .and_then(|e| e.as_object().get("variable"))
                    .map(|v| v.as_object()["var_name"].as_str().to_string());
                match variable {
                    Some(v) if !self.vocabulary.contains_key(&v) && lists.iter().all(|(w, _)| *w != v) => {
                        lists.push((v, io["list"].clone()));
                    }
                    _ => return Ok(None),
                }
            } else if let Some(predicate) = c.get("predicate") {
                let name = predicate.as_object()["predicate_name"].as_str().to_string();
                if !basis.contains(&name) {
                    return Ok(None);
                }
                conditions.push(crate::json_obj! { "call" => predicate.clone() });
            } else {
                return Ok(None);
            }
        }
        if lists.is_empty() {
            return Ok(None);
        }
        let head = co["head"].as_object();
        let fields = head["record"].as_object()["field_value"].as_array();
        if fields.len() != 1 {
            return Ok(None);
        }
        let Some(call) = fields[0].as_object()["value"].as_object().get("aggregation")
            .and_then(|a| a.as_object().get("expression"))
            .and_then(|e| e.as_object().get("call")) else { return Ok(None) };
        let aggregate = call.as_object()["predicate_name"].as_str().to_string();
        let arguments = call.as_object()["record"].as_object()["field_value"].as_array();
        if arguments.len() != 1 {
            return Ok(None);
        }
        let argument = arguments[0].as_object()["value"].as_object()["expression"].clone();
        // The argument's parts: `key -> value` for ArgMax, ArgMin and Array.
        let paired = matches!(aggregate.as_str(), "ArgMax" | "ArgMin" | "Array");
        let parts: Vec<Json> = if paired {
            let Some(arrow) = argument.as_object().get("call")
                .filter(|c| c.as_object()["predicate_name"].as_str() == "->") else { return Ok(None) };
            arrow.as_object()["record"].as_object()["field_value"].as_array().iter()
                .map(|fv| fv.as_object()["value"].as_object()["expression"].clone())
                .collect()
        } else if matches!(aggregate.as_str(), "Agg+" | "Avg" | "Max" | "Min" | "Count" | "List" | "Set") {
            vec![argument.clone()]
        } else {
            return Ok(None);
        };

        let names: Vec<(String, String)> = lists.iter().enumerate()
            .map(|(i, (v, _))| (v.clone(), format!("synalog_u{}", i)))
            .collect();
        let scoped = self.scoped(&names);
        let mut list_sql = Vec::new();
        for (_, list) in &lists {
            list_sql.push(scoped.convert_to_sql(list)?);
        }
        let mut condition_sql = Vec::new();
        for condition in &conditions {
            condition_sql.push(scoped.convert_to_sql(condition)?);
        }
        let n = lists.len();
        let spark = engine == "databricks";
        let array = |items: &str| if spark { format!("ARRAY({})", items) } else { format!("ARRAY[{}]", items) };
        let empty = array("");
        let values = |value: &str| -> String {
            let last = &names[n - 1].1;
            let source = format!("COALESCE({}, {})", list_sql[n - 1], empty);
            let filtered = if condition_sql.is_empty() {
                source
            } else {
                format!("FILTER({}, {} -> {})", source, last, condition_sql.join(" AND "))
            };
            let mut sql = format!("TRANSFORM({}, {} -> {})", filtered, last, value);
            for i in (0..n - 1).rev() {
                sql = format!("FLATTEN(TRANSFORM(COALESCE({}, {}), {} -> {}))", list_sql[i], empty, names[i].1, sql);
            }
            sql
        };
        let mut arrays = Vec::new();
        for part in &parts {
            arrays.push(values(&scoped.convert_to_sql(part)?));
        }

        if engine != "presto" && !paired {
            // The aggregate of the unnested array, as in any combine.
            let columns: Vec<String> = (0..arrays.len()).map(|i| format!("synalog_c{}", i)).collect();
            let variables: Vec<(String, String)> = columns.iter()
                .map(|c| (format!("{} # array", c), format!("synalog_p.{}", c)))
                .collect();
            let variable = |i: usize| crate::json_obj! {
                "variable" => crate::json_obj! { "var_name" => variables[i].0.clone() }
            };
            let argument = variable(0);
            let aggregation = crate::json_obj! { "call" => crate::json_obj! {
                "predicate_name" => aggregate.clone(),
                "record" => crate::json_obj! { "field_value" => Json::Array(vec![
                    crate::json_obj! { "field" => 0i64, "value" => crate::json_obj! { "expression" => argument } },
                ].into()) },
            } };
            let sql = self.scoped(&variables).convert_to_sql(&aggregation)?;
            if spark {
                return Ok(Some(format!(
                    "(SELECT {} FROM LATERAL (SELECT explode({}) AS {}) AS synalog_p)",
                    sql, arrays[0], columns[0])));
            }
            return Ok(Some(format!(
                "(SELECT {} FROM UNNEST({}) AS synalog_p({}))",
                sql, arrays.join(", "), columns.join(", "))));
        }

        // Presto, and a key with its value elsewhere: array functions, each
        // array bound once to a lambda's parameter.
        let bind = |items: &str, name: &str, body: String| -> String {
            format!("ELEMENT_AT(TRANSFORM({}, {} -> {}), 1)", array(items), name, body)
        };
        let known = |array: &str| format!("FILTER({}, synalog_v -> synalog_v IS NOT NULL)", array);
        let sql = match aggregate.as_str() {
            "Agg+" => bind(&known(&arrays[0]), "synalog_a", "IF(CARDINALITY(synalog_a) = 0, NULL, ARRAY_SUM(synalog_a))".to_string()),
            "Avg" => bind(&known(&arrays[0]), "synalog_a", "IF(CARDINALITY(synalog_a) = 0, NULL, ARRAY_AVERAGE(synalog_a))".to_string()),
            "Max" => format!("ARRAY_MAX({})", known(&arrays[0])),
            "Min" => format!("ARRAY_MIN({})", known(&arrays[0])),
            "Count" => format!("CARDINALITY(ARRAY_DISTINCT({}))", known(&arrays[0])),
            "List" => bind(&arrays[0], "synalog_a", "IF(CARDINALITY(synalog_a) = 0, NULL, synalog_a)".to_string()),
            "Set" => bind(&arrays[0], "synalog_a", "IF(CARDINALITY(synalog_a) = 0, NULL, ARRAY_DISTINCT(synalog_a))".to_string()),
            _ => {
                // The positions of the values sorted by the key: descending
                // for ArgMax, nulls last.
                let (before, after) = if aggregate == "ArgMax" { (">", "<") } else { ("<", ">") };
                let (key, value) = if aggregate == "Array" { ("synalog_a", "synalog_b") } else { ("synalog_b", "synalog_a") };
                let order = format!(
                    "ARRAY_SORT(SEQUENCE(1, CARDINALITY({k})), (synalog_i, synalog_j) -> \
                     IF({i} IS NULL AND {j} IS NULL, 0, IF({i} IS NULL, 1, IF({j} IS NULL, -1, \
                     IF({i} {b} {j}, -1, IF({i} {a} {j}, 1, 0))))))",
                    k = key, b = before, a = after,
                    i = format!("ELEMENT_AT({}, synalog_i)", key), j = format!("ELEMENT_AT({}, synalog_j)", key));
                let picked = if aggregate == "Array" {
                    format!("TRANSFORM({}, synalog_i -> ELEMENT_AT({}, synalog_i))", order, value)
                } else {
                    format!("ELEMENT_AT({}, ELEMENT_AT({}, 1))", value, order)
                };
                bind(&arrays[0], "synalog_a", bind(&arrays[1], "synalog_b",
                    format!("IF(CARDINALITY(synalog_a) = 0, NULL, {})", picked)))
            }
        };
        Ok(Some(sql))
    }

    /// Convert expression to SQL for GROUP BY context.
    /// Wraps string literals with `|| ''` and number literals with `+ 0`
    /// to satisfy PostgreSQL/DuckDB GROUP BY constraints.
    /// Matches Python's ConvertToSqlForGroupBy().
    pub fn convert_to_sql_for_group_by(&self, expression: &Json) -> CompileResult<String> {
        if let Some(lit) = expression.as_object().get("literal") {
            if lit.as_object().contains_key("the_string") {
                return Ok(format!("({} || '')", self.convert_to_sql(expression)?));
            }
            if lit.as_object().contains_key("the_number") {
                return Ok(format!("{} + 0", self.convert_to_sql(expression)?));
            }
        }
        self.convert_to_sql(expression)
    }

    fn is_analytic_function(name: &str) -> bool {
        matches!(name,
            "CumulativeSum" | "CumulativeMax" | "CumulativeMin" |
            "WindowSum" | "WindowMax" | "WindowMin"
        )
    }

    fn analytic_template(name: &str) -> &'static str {
        match name {
            "CumulativeSum" =>
                "SUM({0}) OVER (PARTITION BY {1} ORDER BY {2} ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)",
            "CumulativeMax" =>
                "MAX({0}) OVER (PARTITION BY {1} ORDER BY {2} ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)",
            "CumulativeMin" =>
                "MIN({0}) OVER (PARTITION BY {1} ORDER BY {2} ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)",
            "WindowSum" =>
                "SUM({0}) OVER (PARTITION BY {1} ORDER BY {2} ROWS BETWEEN {3} PRECEDING AND CURRENT ROW)",
            "WindowMax" =>
                "MAX({0}) OVER (PARTITION BY {1} ORDER BY {2} ROWS BETWEEN {3} PRECEDING AND CURRENT ROW)",
            "WindowMin" =>
                "MIN({0}) OVER (PARTITION BY {1} ORDER BY {2} ROWS BETWEEN {3} PRECEDING AND CURRENT ROW)",
            _ => unreachable!(),
        }
    }

    /// Return the set of all "basis" function names that the ExprTranslator can
    /// handle natively (without needing subquery translation).
    /// Matches Python's `QL.BasisFunctions()`.
    pub fn basis_functions(dialect: &dyn Dialect) -> HashSet<String> {
        let mut names = HashSet::new();
        // Bulk functions
        for k in bulk_built_in_functions().keys() {
            names.insert(k.clone());
        }
        // Base built-in functions
        for k in base_built_in_functions().keys() {
            names.insert(k.to_string());
        }
        // Dialect-specific built-in functions
        for (k, _) in dialect.built_in_functions() {
            names.insert(k.to_string());
        }
        // Base infix operators
        for k in base_infix_operators().keys() {
            names.insert(k.to_string());
        }
        // Dialect-specific infix operators
        for (k, _) in dialect.infix_operators() {
            names.insert(k.to_string());
        }
        // Analytic functions
        names.insert("CumulativeSum".to_string());
        names.insert("CumulativeMax".to_string());
        names.insert("CumulativeMin".to_string());
        names.insert("WindowSum".to_string());
        names.insert("WindowMax".to_string());
        names.insert("WindowMin".to_string());
        // Special predicates handled inline
        names.insert("SqlExpr".to_string());
        names.insert("Cast".to_string());
        names.insert("TryCast".to_string());
        names.insert("FlagValue".to_string());
        names.insert("If".to_string());
        names.insert("Container".to_string());
        names.insert("In".to_string());
        names.insert("ValueOfUnnested".to_string());
        names.insert("MagicalEntangle".to_string());
        // Note: `=` is NOT a built-in function. It's a library predicate defined as
        // `=(left:, right:) = right :- left == right;` and must be inlined via
        // inline_predicate_values (like Python's InlinePredicateValues).
        names
    }
}

/// Apply a SQL template with positional arguments.
/// Supports `%s` (single substitution) and `{0}`, `{1}` (indexed).
fn apply_template(template: &str, args: &[String]) -> String {
    if template.contains("{0}") || template.contains("{1}") || template.contains("{2}") {
        let mut result = template.to_string();
        for (i, arg) in args.iter().enumerate() {
            result = result.replace(&format!("{{{}}}", i), arg);
        }
        result
    } else {
        // %s substitution: like Python's `f % ', '.join(args_list)`
        // If there's exactly one %s, join all args with ", " (Python behavior).
        // If there are multiple %s, replace one at a time.
        let pct_s_count = template.matches("%s").count();
        if pct_s_count == 1 && args.len() > 1 {
            // Single %s with multiple args: join all args
            template.replacen("%s", &args.join(", "), 1)
        } else {
            let mut result = String::with_capacity(template.len() + args.iter().map(|a| a.len()).sum::<usize>());
            let mut arg_idx = 0;
            let mut chars = template.chars().peekable();
            while let Some(c) = chars.next() {
                if c == '%' && chars.peek() == Some(&'s') {
                    chars.next(); // consume 's'
                    if arg_idx < args.len() {
                        result.push_str(&args[arg_idx]);
                        arg_idx += 1;
                    } else {
                        result.push_str("%s");
                    }
                } else {
                    result.push(c);
                }
            }
            result
        }
    }
}

/// SubIfStruct: optimize subscript of an implication.
/// If all consequences (and the otherwise) are syntactic records, push the subscript
/// into each branch and return a new implication expression. Returns None if not all
/// branches are records.
/// Matches Python's SubIfStruct() in expr_translate.py.
fn sub_if_struct(implication: &Json, subscript: &str) -> Option<Json> {
    let impl_obj = implication.as_object();
    let if_thens = impl_obj.get("if_then")?.as_array();
    let otherwise = impl_obj.get("otherwise")?;

    // Check that all consequences are records
    for if_then in if_thens {
        if !if_then.as_object().get("consequence")?.as_object().contains_key("record") {
            return None;
        }
    }
    if !otherwise.as_object().contains_key("record") {
        return None;
    }

    // Helper to extract a field value from a record's field_value array
    let get_field = |record_expr: &Json| -> Option<Json> {
        let fvs = record_expr.as_object().get("record")?
            .as_object().get("field_value")?.as_array();
        for fv in fvs {
            let fo = fv.as_object();
            if fo["field"].as_str() == subscript {
                return fo["value"].as_object().get("expression").cloned();
            }
        }
        None
    };

    // Build new if_thens with the field extracted from each consequence
    let mut new_if_thens = Vec::new();
    for if_then in if_thens {
        let ito = if_then.as_object();
        let consequence = ito.get("consequence")?;
        let field_expr = get_field(consequence)?;
        let mut new_it = crate::parser::JsonObject::new();
        new_it.insert("condition".into(), ito["condition"].clone());
        new_it.insert("consequence".into(), field_expr);
        new_if_thens.push(Json::Object(new_it));
    }

    let new_otherwise = get_field(otherwise)?;

    let mut new_impl = crate::parser::JsonObject::new();
    new_impl.insert("if_then".into(), Json::Array(new_if_thens));
    new_impl.insert("otherwise".into(), new_otherwise);

    let mut result = crate::parser::JsonObject::new();
    result.insert("implication".into(), Json::Object(new_impl));
    Some(Json::Object(result))
}

#[cfg(test)]
#[path = "expr_translate_test.rs"]
mod expr_translate_test;

/// A part of a printf-style format string: text, or a placeholder.
#[derive(Debug, PartialEq)]
enum FormatPiece {
    Text(String),
    /// `%[-0][width][.precision](s|d|f)`.
    Spec { left: bool, zero: bool, width: usize, precision: Option<usize>, conversion: char },
}

/// The pieces of a format string, for an engine without printf, which
/// renders each placeholder in SQL: `%s`, `%d`, `%f`, with a width, `0` or
/// `-` padding and a precision, and `%%`.
fn format_pieces(format: &str) -> Result<Vec<FormatPiece>, String> {
    let mut pieces = Vec::new();
    let mut text = String::new();
    let mut chars = format.chars().peekable();
    while let Some(c) = chars.next() {
        if c != '%' {
            text.push(c);
            continue;
        }
        if chars.peek() == Some(&'%') {
            chars.next();
            text.push('%');
            continue;
        }
        let (mut left, mut zero) = (false, false);
        while let Some(&f) = chars.peek() {
            match f {
                '-' => left = true,
                '0' => zero = true,
                _ => break,
            }
            chars.next();
        }
        let mut width = 0;
        while let Some(d) = chars.peek().and_then(|c| c.to_digit(10)) {
            width = width * 10 + d as usize;
            chars.next();
        }
        let mut precision = None;
        if chars.peek() == Some(&'.') {
            chars.next();
            let mut p = 0;
            while let Some(d) = chars.peek().and_then(|c| c.to_digit(10)) {
                p = p * 10 + d as usize;
                chars.next();
            }
            precision = Some(p);
        }
        let conversion = match chars.next() {
            Some(c @ ('s' | 'd' | 'f')) => c,
            other => {
                return Err(format!(
                    "Format on this engine supports %s, %d and %f placeholders (with a width, 0 or - padding and a precision), not %{}",
                    other.map(String::from).unwrap_or_default()
                ))
            }
        };
        if !text.is_empty() {
            pieces.push(FormatPiece::Text(std::mem::take(&mut text)));
        }
        pieces.push(FormatPiece::Spec { left, zero: zero && !left, width, precision, conversion });
    }
    if !text.is_empty() {
        pieces.push(FormatPiece::Text(text));
    }
    Ok(pieces)
}

impl FormatPiece {
    /// The SQL text of a placeholder applied to `value`.
    fn render(&self, value: &str, literal: impl Fn(&str) -> String) -> String {
        let FormatPiece::Spec { left, zero, width, precision, conversion } = self else {
            return String::new();
        };
        let text = match conversion {
            'd' => format!("CAST(CAST({} AS BIGINT) AS VARCHAR)", value),
            'f' => {
                let p = precision.unwrap_or(6);
                // The cast rounds to the precision, and keeps its zeros.
                format!("CAST(CAST({v} AS DECIMAL(38, {p})) AS VARCHAR)", v = value, p = p)
            }
            _ => value.to_string(),
        };
        if *width == 0 {
            return text;
        }
        // Padded to the width, never cut: LPAD and RPAD truncate.
        let pad = |padded: String| format!("(CASE WHEN LENGTH({t}) >= {w} THEN {t} ELSE {padded} END)", t = text, w = width, padded = padded);
        if *left {
            pad(format!("RPAD({}, {}, {})", text, width, literal(" ")))
        } else if *zero && *conversion != 's' {
            // Zeros go after the sign: -0042.
            pad(format!(
                "(CASE WHEN {v} < 0 THEN {minus} || LPAD(SUBSTR({t}, 2), {w1}, {zero}) ELSE LPAD({t}, {w}, {zero}) END)",
                v = value, t = text, w = width, w1 = width - 1, minus = literal("-"), zero = literal("0")
            ))
        } else {
            pad(format!("LPAD({}, {}, {})", text, width, literal(" ")))
        }
    }
}

#[cfg(test)]
mod format_tests {
    use super::*;

    #[test]
    fn format_pieces_read_every_placeholder() {
        let pieces = format_pieces("%s-%05d|%-3s|%.2f%%").unwrap();
        assert_eq!(pieces.len(), 8, "{:?}", pieces);
        assert_eq!(pieces[0], FormatPiece::Spec { left: false, zero: false, width: 0, precision: None, conversion: 's' });
        assert_eq!(pieces[2], FormatPiece::Spec { left: false, zero: true, width: 5, precision: None, conversion: 'd' });
        assert_eq!(pieces[4], FormatPiece::Spec { left: true, zero: false, width: 3, precision: None, conversion: 's' });
        assert_eq!(pieces[6], FormatPiece::Spec { left: false, zero: false, width: 0, precision: Some(2), conversion: 'f' });
        assert_eq!(pieces[7], FormatPiece::Text("%".to_string()));
    }

    #[test]
    fn format_pieces_refuse_other_conversions() {
        assert!(format_pieces("%x").is_err());
    }
}

impl<'a> ExprTranslator<'a> {
    /// The type of a value, from its form and the types of the rule's
    /// variables: a typed dialect declares a record's field types
    /// (`CAST(ROW(x) AS ROW(a double))`), and a number declared text comes
    /// back as text. `Any` when unknown.
    pub fn value_type(&self, expr: &Json) -> Type {
        if !expr.is_object() {
            return Type::Any;
        }
        let o = expr.as_object();
        if let Some(rec) = o.get("record") {
            return self.record_type(rec);
        }
        if let Some(lit) = o.get("literal") {
            let lo = lit.as_object();
            if let Some(rec) = lo.get("the_record") {
                return self.record_type(rec);
            }
            if let Some(list) = lo.get("the_list") {
                let element = list.as_object().get("element").map(|e| {
                    e.as_array().iter().map(|x| self.value_type(x)).find(|t| *t != Type::Any)
                });
                return Type::List(Box::new(element.flatten().unwrap_or(Type::Any)));
            }
            if lo.contains_key("the_number") {
                return Type::Number;
            }
            if lo.contains_key("the_bool") {
                return Type::Bool;
            }
            if lo.contains_key("the_string") {
                return Type::String;
            }
            return Type::Any;
        }
        if let Some(v) = o.get("variable") {
            let n = &v.as_object()["var_name"];
            let name = if n.is_string() { n.as_str().to_string() } else { n.to_string() };
            return self.variable_types.get(&name).cloned().unwrap_or(Type::Any);
        }
        if let Some(sub) = o.get("subscript") {
            let so = sub.as_object();
            let field = so.get("subscript")
                .and_then(|s| s.as_object().get("literal"))
                .and_then(|l| l.as_object().get("the_symbol"))
                .map(|s| s.as_object()["symbol"].as_str().to_string());
            if let (Some(field), Some(record)) = (field, so.get("record")) {
                if let Type::Record { fields, .. } = self.value_type(record) {
                    return fields.get(&field).cloned().unwrap_or(Type::Any);
                }
            }
            return Type::Any;
        }
        if let Some(imp) = o.get("implication") {
            let io = imp.as_object();
            let branches = io.get("if_then").map(|b| b.as_array().clone()).unwrap_or_default();
            let consequences = branches
                .iter()
                .filter_map(|b| b.as_object().get("consequence").cloned())
                .chain(io.get("otherwise").cloned());
            return consequences.map(|c| self.value_type(&c)).find(|t| *t != Type::Any).unwrap_or(Type::Any);
        }
        if is_boolean_expression(expr) {
            return Type::Bool;
        }
        if is_text_expression(expr) {
            return Type::String;
        }
        let Some(call) = o.get("call").filter(|c| c.is_object()) else { return Type::Any };
        let name = call.as_object()["predicate_name"].as_str().to_string();
        match name.as_str() {
            "+" | "-" | "*" | "/" | "%" | "^" | "Length" | "Size" | "ToInt64" | "ToFloat64" | "Abs"
            | "Round" | "Floor" | "Ceil" | "Sqrt" | "Exp" | "Log" | "Pow" | "Sin" | "Cos" => Type::Number,
            "Split" => Type::List(Box::new(Type::String)),
            "Range" => Type::List(Box::new(Type::Number)),
            "Coalesce" | "Least" | "Greatest" | "ArrayConcat" | "ValueOfUnnested" => call.as_object()
                .get("record")
                .and_then(|r| r.as_object().get("field_value"))
                .map(|fvs| {
                    fvs.as_array().iter()
                        .filter_map(|fv| fv.as_object()["value"].as_object().get("expression").cloned())
                        .map(|e| self.value_type(&e))
                        .find(|t| *t != Type::Any)
                        .unwrap_or(Type::Any)
                })
                .unwrap_or(Type::Any),
            // A value tied to a combine's rows: the value's type.
            "MagicalEntangle" => call.as_object()
                .get("record")
                .and_then(|r| r.as_object().get("field_value"))
                .and_then(|fvs| fvs.as_array().first().cloned())
                .and_then(|fv| fv.as_object()["value"].as_object().get("expression").cloned())
                .map(|e| self.value_type(&e))
                .unwrap_or(Type::Any),
            "Element" => match call.as_object()
                .get("record")
                .and_then(|r| r.as_object().get("field_value"))
                .and_then(|fvs| fvs.as_array().first().cloned())
                .and_then(|fv| fv.as_object()["value"].as_object().get("expression").cloned())
                .map(|e| self.value_type(&e))
            {
                Some(Type::List(inner)) => *inner,
                _ => Type::Any,
            },
            _ => Type::Any,
        }
    }

    /// Note the type each list and record literal inside `expr` is expected
    /// to have: `expected` for `expr` itself, the field types of the record a
    /// value is in, the other list of an `ArrayConcat`, text for `Join`.
    fn hint_types(&self, expr: &Json, expected: &Type) {
        if !expr.is_object() {
            return;
        }
        let o = expr.as_object();
        let literal = o.get("literal").filter(|l| l.is_object()).map(|l| l.as_object());
        let record = o.get("record").or_else(|| literal.and_then(|l| l.get("the_record")));
        let is_null = literal.is_some_and(|l| l.contains_key("the_null") || l.contains_key("null"));
        let is_list_variable = (o.contains_key("variable") || is_null) && matches!(expected, Type::List(_));
        if literal.is_some_and(|l| l.contains_key("the_list")) || record.is_some() || is_list_variable {
            if *expected != Type::Any {
                self.type_hints.borrow_mut().entry(node_key(expr)).or_insert_with(|| expected.clone());
            }
        }
        if let Some(rec) = record {
            let fields = match expected {
                Type::Record { fields, .. } => Some(fields),
                _ => None,
            };
            for fv in rec.as_object()["field_value"].as_array() {
                let fo = fv.as_object();
                let val = &fo["value"];
                let e = val.as_object().get("expression").unwrap_or(val);
                let t = fo.get("field").filter(|f| f.is_string())
                    .and_then(|f| fields.and_then(|fs| fs.get(f.as_str())))
                    .cloned().unwrap_or(Type::Any);
                self.hint_types(e, &t);
            }
            return;
        }
        if let Some(list) = literal.and_then(|l| l.get("the_list")) {
            let element = match expected {
                Type::List(e) => (**e).clone(),
                _ => Type::Any,
            };
            if let Some(elements) = list.as_object().get("element") {
                for e in elements.as_array() {
                    self.hint_types(e, &element);
                }
            }
            return;
        }
        if let Some(call) = o.get("call").filter(|c| c.is_object()) {
            let c = call.as_object();
            let name = c.get("predicate_name").filter(|n| n.is_string()).map(|n| n.as_str()).unwrap_or("");
            let args: Vec<&Json> = c.get("record")
                .and_then(|r| r.as_object().get("field_value"))
                .map(|fvs| fvs.as_array().iter().map(|fv| {
                    let val = &fv.as_object()["value"];
                    val.as_object().get("expression").unwrap_or(val)
                }).collect())
                .unwrap_or_default();
            let text_list = Type::List(Box::new(Type::String));
            for (i, a) in args.iter().enumerate() {
                let t = match name {
                    // A list given with another takes the other's type.
                    "ArrayConcat" => {
                        let other = args.get(1 - i.min(1)).map(|x| self.value_type(x));
                        match other {
                            Some(Type::List(e)) if *e != Type::Any => Type::List(e),
                            _ if matches!(expected, Type::List(_)) => expected.clone(),
                            _ => text_list.clone(),
                        }
                    }
                    "Join" if i == 0 => text_list.clone(),
                    // Any list will do: its size or an element of none.
                    "Size" | "Element" if i == 0 => text_list.clone(),
                    _ => Type::Any,
                };
                self.hint_types(a, &t);
            }
            return;
        }
        if let Some(imp) = o.get("implication").filter(|i| i.is_object()) {
            let io = imp.as_object();
            if let Some(branches) = io.get("if_then") {
                for b in branches.as_array() {
                    if let Some(c) = b.as_object().get("consequence") {
                        self.hint_types(c, expected);
                    }
                }
            }
            if let Some(other) = io.get("otherwise") {
                self.hint_types(other, expected);
            }
        }
    }

    /// The field types of a record literal, completed by the type its place
    /// expects where its own say nothing (an empty list).
    fn hinted_fields(&self, expr: &Json, fields: &mut [(String, Type)]) {
        if let Some(Type::Record { fields: expected, .. }) = self.type_hints.borrow().get(&node_key(expr)) {
            for (name, t) in fields.iter_mut() {
                if has_any(t) {
                    if let Some(e) = expected.get(name) {
                        *t = e.clone();
                    }
                }
            }
        }
    }

    fn record_type(&self, record: &Json) -> Type {
        let mut fields = HashMap::new();
        for fv in record.as_object()["field_value"].as_array() {
            let fo = fv.as_object();
            let Some(field) = fo.get("field").filter(|f| f.is_string()) else { continue };
            let val = &fo["value"];
            let e = val.as_object().get("expression").unwrap_or(val);
            fields.insert(field.as_str().to_string(), self.value_type(e));
        }
        Type::Record { fields, is_opened: false }
    }
}

/// The key of an expression node among type hints: its address.
fn node_key(expr: &Json) -> usize {
    expr as *const Json as usize
}

/// Whether a type is unknown, or a list of unknowns.
fn has_any(t: &Type) -> bool {
    match t {
        Type::Any => true,
        Type::List(e) => has_any(e),
        _ => false,
    }
}

/// Whether an expression is a number literal without a fraction (`65536`).
fn is_whole_number_literal(expr: &Json) -> bool {
    expr.is_object()
        && expr.as_object().get("literal")
            .and_then(|l| l.as_object().get("the_number"))
            .map(|n| if n.is_object() { n.as_object()["number"].as_str().to_string() } else { n.to_string() })
            .is_some_and(|n| n.trim_start_matches('-').bytes().all(|b| b.is_ascii_digit()))
}

/// Whether an expression is a boolean by its form: a boolean literal, a
/// comparison, a connective, a membership or a null test.
fn is_boolean_expression(expr: &Json) -> bool {
    if !expr.is_object() {
        return false;
    }
    let o = expr.as_object();
    if let Some(literal) = o.get("literal") {
        return literal.is_object() && literal.as_object().contains_key("the_bool");
    }
    let Some(call) = o.get("call").filter(|c| c.is_object()) else { return false };
    call.as_object().get("predicate_name").is_some_and(|name| {
        matches!(
            name.as_str(),
            "==" | "!=" | "<" | ">" | "<=" | ">=" | "&&" | "||" | "!" | "in" | "is" | "is not" | "IsNull" | "Like"
                | "ILike" | "StartsWith" | "EndsWith" | "RegexpContains"
        )
    })
}

/// Whether an expression is text by its form: a string literal, or a call
/// of a function returning text.
fn is_text_expression(expr: &Json) -> bool {
    if !expr.is_object() {
        return false;
    }
    let o = expr.as_object();
    if let Some(literal) = o.get("literal") {
        return literal.is_object() && literal.as_object().contains_key("the_string");
    }
    let Some(call) = o.get("call").filter(|c| c.is_object()) else { return false };
    call.as_object().get("predicate_name").is_some_and(|name| {
        matches!(name.as_str(), "Substr" | "ToString" | "++" | "Upper" | "Lower" | "Format" | "Join"
            | "Replace" | "Trim" | "Lpad" | "Rpad" | "Repeat"
            | "RegexpExtract" | "RegexpReplace" | "FlagValue")
    })
}
