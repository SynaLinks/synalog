// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Translation of an assertion statement into the rules that look for its
//! counterexamples.
//!
//! A statement `∀ x̄, F` holds on a database when no assignment of `x̄`
//! falsifies `F`. The translation builds the predicate of those assignments:
//! it negates `F`, pushes the negation down to the atoms, and writes each
//! alternative of the result as one rule. The assertion holds when that predicate
//! is empty, and each of its rows is a counterexample.
//!
//! ```text
//! ∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z
//!
//! Assert_Ancestor_transitive(x: x, y: y, z: z) distinct :-
//!   Ancestor(x: x, y: y), Ancestor(x: y, y: z), ~Ancestor(x: x, y: z);
//! ```
//!
//! ## Reading a statement against named columns
//!
//! Statements are positional, Synalog predicates are not: the arguments of
//! `Ancestor x y` are the columns of `Ancestor` in the order its first rule
//! declares them. A predicate applied to all its columns is a relation; applied
//! to all but the last, it is a function returning that last column
//! (`Posterior h e` is the `p` of `Posterior(h:, e:, p:)`).
//!
//! ## What cannot be translated
//!
//! Counterexamples are searched in the database, so every variable must be
//! bound by a predicate: `∀ x, x > 0` ranges over nothing and is refused.
//! An equation between functions is checked where both sides are defined.

use std::collections::{HashMap, HashSet};

use super::parse::{BinOp, Expr};

/// Columns of every predicate a statement may refer to, in declaration order.
pub type Schema = HashMap<String, Vec<String>>;

/// Equality between computed numbers is checked up to this distance.
const TOLERANCE: &str = "0.000000001";

/// More alternatives than this and the statement is refused.
const MAX_ALTERNATIVES: usize = 64;

/// The rules that find the counterexamples of a statement.
#[derive(Debug, Clone, PartialEq)]
pub struct Translation {
    /// The predicate holding the counterexamples.
    pub predicate: String,
    /// Its columns: the universally quantified variables of the statement.
    pub columns: Vec<String>,
    /// Synalog source of `predicate` and its helpers.
    pub rules: String,
}

/// Why a statement has no translation.
#[derive(Debug, Clone, PartialEq)]
pub enum TranslateError {
    /// It refers to predicates that are not defined (yet).
    Missing(Vec<String>),
    /// It contradicts the program: wrong number of arguments, a formula used
    /// as a value, ...
    Invalid(String),
    /// It is well-formed but outside what can be checked on a database.
    Unsupported(String),
}

type Result<T> = std::result::Result<T, TranslateError>;

fn invalid<T>(message: impl Into<String>) -> Result<T> {
    Err(TranslateError::Invalid(message.into()))
}

fn unsupported<T>(message: impl Into<String>) -> Result<T> {
    Err(TranslateError::Unsupported(message.into()))
}

/// A formula with negations pushed down to the literals.
#[derive(Debug, Clone)]
enum Nnf {
    And(Vec<Nnf>),
    Or(Vec<Nnf>),
    Lit(Lit),
}

#[derive(Debug, Clone)]
enum Lit {
    Atom { pred: String, args: Vec<Expr>, positive: bool },
    Cmp { op: BinOp, left: Expr, right: Expr },
    /// Nothing satisfies `inner`. `params` are its variables bound outside.
    NotExists { inner: Box<Nnf>, params: Vec<String> },
}

/// Translate `statement` into the rules of its counterexamples. `prefix` names
/// the counterexample predicate and prefixes its helpers.
pub fn translate(statement: &Expr, schema: &Schema, prefix: &str) -> Result<Translation> {
    let mut missing = Vec::new();
    collect_missing(statement, schema, &mut missing);
    if !missing.is_empty() {
        return Err(TranslateError::Missing(missing));
    }

    let mut resolver = Resolver::default();
    // The leading universal quantifiers name the counterexample's columns.
    let mut body = statement;
    let mut columns = Vec::new();
    while let Expr::Forall(vars, inner) = body {
        for var in vars {
            let name = variable_name(var);
            resolver.scope.push((var.clone(), name.clone()));
            columns.push(name);
        }
        body = inner;
    }
    let body = resolver.resolve(body)?;
    // Unbound lowercase names are universally quantified too.
    columns.extend(resolver.implicit);

    let violation = nnf(&body, true);
    let mut emitter = Emitter {
        schema,
        prefix,
        helpers: 0,
        fresh: 0,
        rules: Vec::new(),
    };
    let head: Vec<String> = if columns.is_empty() {
        vec!["violated: 1".to_string()]
    } else {
        columns.iter().map(|c| format!("{}: {}", c, c)).collect()
    };
    let mut rules = Vec::new();
    for conjunct in dnf(&violation)? {
        let body = emitter.conjunct(&conjunct, &columns)?;
        if body.is_empty() {
            return unsupported("the statement is false whatever the data");
        }
        rules.push(format!("{}({}) distinct :- {};", prefix, head.join(", "), body.join(", ")));
    }
    if rules.is_empty() {
        return unsupported("the statement is true whatever the data");
    }
    emitter.rules.extend(rules);

    Ok(Translation {
        predicate: prefix.to_string(),
        columns: if columns.is_empty() { vec!["violated".to_string()] } else { columns },
        rules: emitter.rules.join("\n"),
    })
}

/// True if `name` is written like a predicate (initial uppercase letter).
fn is_predicate_name(name: &str) -> bool {
    name.chars().next().is_some_and(|c| c.is_uppercase())
}

/// A statement variable as a Synalog variable: lowercase initial, ASCII.
fn variable_name(var: &str) -> String {
    let mut name = String::new();
    for c in var.chars() {
        match c {
            '\'' => name.push_str("_p"),
            c if c.is_ascii_alphanumeric() || c == '_' => name.push(c),
            c => name.push_str(&format!("_u{:x}", c as u32)),
        }
    }
    if !name.chars().next().is_some_and(|c| c.is_ascii_lowercase()) {
        name.insert_str(0, "v_");
    }
    name
}

/// Collect the predicates `expr` names that `schema` does not define. Names
/// bound by a quantifier are variables whatever their case.
fn collect_missing(expr: &Expr, schema: &Schema, missing: &mut Vec<String>) {
    fn walk(expr: &Expr, schema: &Schema, bound: &mut Vec<String>, missing: &mut Vec<String>) {
        match expr {
            Expr::Forall(vars, body) | Expr::Exists(vars, body) | Expr::Sum(vars, body) => {
                bound.extend(vars.iter().cloned());
                walk(body, schema, bound, missing);
                bound.truncate(bound.len() - vars.len());
            }
            Expr::Not(inner) | Expr::Neg(inner) => walk(inner, schema, bound, missing),
            Expr::Binary(_, left, right) => {
                walk(left, schema, bound, missing);
                walk(right, schema, bound, missing);
            }
            Expr::App(name, args) => {
                if is_predicate_name(name)
                    && !bound.contains(name)
                    && !schema.contains_key(name)
                    && !missing.contains(name)
                {
                    missing.push(name.clone());
                }
                for arg in args {
                    walk(arg, schema, bound, missing);
                }
            }
            Expr::Var(_) | Expr::Num(_) | Expr::Str(_) => {}
        }
    }
    walk(expr, schema, &mut Vec::new(), missing);
}

/// Turns bare names into variables and gives every bound variable a name of
/// its own, so that later passes never have to track scopes.
#[derive(Default)]
struct Resolver {
    /// Statement name -> Synalog variable, innermost last.
    scope: Vec<(String, String)>,
    /// Unbound lowercase names, in order of appearance.
    implicit: Vec<String>,
    renamed: usize,
}

impl Resolver {
    fn resolve(&mut self, expr: &Expr) -> Result<Expr> {
        Ok(match expr {
            Expr::Forall(vars, body) => {
                let (vars, body) = self.bind(vars, body)?;
                Expr::Forall(vars, Box::new(body))
            }
            Expr::Exists(vars, body) => {
                let (vars, body) = self.bind(vars, body)?;
                Expr::Exists(vars, Box::new(body))
            }
            Expr::Sum(vars, body) => {
                let (vars, body) = self.bind(vars, body)?;
                Expr::Sum(vars, Box::new(body))
            }
            Expr::Not(inner) => Expr::Not(Box::new(self.resolve(inner)?)),
            Expr::Neg(inner) => Expr::Neg(Box::new(self.resolve(inner)?)),
            Expr::Binary(op, left, right) => {
                Expr::Binary(*op, Box::new(self.resolve(left)?), Box::new(self.resolve(right)?))
            }
            Expr::App(name, args) => {
                let bound = self.scope.iter().rev().find(|(n, _)| n == name).map(|(_, v)| v.clone());
                if let Some(var) = bound {
                    if !args.is_empty() {
                        return invalid(format!("'{}' is a variable and cannot be applied", name));
                    }
                    return Ok(Expr::Var(var));
                }
                if !is_predicate_name(name) {
                    if !args.is_empty() {
                        return invalid(format!(
                            "'{}' is not a predicate: a raw table has no declared columns, \
                             wrap it in a predicate to state an assertion about it",
                            name
                        ));
                    }
                    let var = variable_name(name);
                    if !self.implicit.contains(&var) {
                        self.implicit.push(var.clone());
                    }
                    return Ok(Expr::Var(var));
                }
                let args = args.iter().map(|a| self.resolve(a)).collect::<Result<_>>()?;
                Expr::App(name.clone(), args)
            }
            Expr::Var(_) | Expr::Num(_) | Expr::Str(_) => expr.clone(),
        })
    }

    fn bind(&mut self, vars: &[String], body: &Expr) -> Result<(Vec<String>, Expr)> {
        let mut names = Vec::new();
        for var in vars {
            self.renamed += 1;
            let name = format!("{}__{}", variable_name(var), self.renamed);
            self.scope.push((var.clone(), name.clone()));
            names.push(name);
        }
        let body = self.resolve(body);
        self.scope.truncate(self.scope.len() - vars.len());
        Ok((names, body?))
    }
}

/// Variables occurring free in a resolved expression, in order of appearance.
fn free_vars(expr: &Expr) -> Vec<String> {
    fn walk(expr: &Expr, bound: &mut Vec<String>, out: &mut Vec<String>) {
        match expr {
            Expr::Forall(vars, body) | Expr::Exists(vars, body) | Expr::Sum(vars, body) => {
                bound.extend(vars.iter().cloned());
                walk(body, bound, out);
                bound.truncate(bound.len() - vars.len());
            }
            Expr::Not(inner) | Expr::Neg(inner) => walk(inner, bound, out),
            Expr::Binary(_, left, right) => {
                walk(left, bound, out);
                walk(right, bound, out);
            }
            Expr::App(_, args) => args.iter().for_each(|a| walk(a, bound, out)),
            Expr::Var(name) => {
                if !bound.contains(name) && !out.contains(name) {
                    out.push(name.clone());
                }
            }
            Expr::Num(_) | Expr::Str(_) => {}
        }
    }
    let mut out = Vec::new();
    walk(expr, &mut Vec::new(), &mut out);
    out
}

/// Negation normal form of `expr`, or of its negation when `negate`.
fn nnf(expr: &Expr, negate: bool) -> Nnf {
    match expr {
        Expr::Not(inner) => nnf(inner, !negate),
        Expr::Binary(BinOp::And, left, right) => {
            let parts = vec![nnf(left, negate), nnf(right, negate)];
            if negate { Nnf::Or(parts) } else { Nnf::And(parts) }
        }
        Expr::Binary(BinOp::Or, left, right) => {
            let parts = vec![nnf(left, negate), nnf(right, negate)];
            if negate { Nnf::And(parts) } else { Nnf::Or(parts) }
        }
        Expr::Binary(BinOp::Implies, left, right) => {
            let parts = vec![nnf(left, !negate), nnf(right, negate)];
            if negate { Nnf::And(parts) } else { Nnf::Or(parts) }
        }
        Expr::Binary(BinOp::Iff, left, right) => {
            let forward = Expr::Binary(BinOp::Implies, left.clone(), right.clone());
            let backward = Expr::Binary(BinOp::Implies, right.clone(), left.clone());
            nnf(&Expr::Binary(BinOp::And, Box::new(forward), Box::new(backward)), negate)
        }
        Expr::Binary(op, left, right) if op.is_comparison() => {
            let op = if negate { negated(*op) } else { *op };
            Nnf::Lit(Lit::Cmp { op, left: (**left).clone(), right: (**right).clone() })
        }
        // `∃ x̄, F` true: its variables are just more variables of the rule.
        // `∃ x̄, F` false: nothing satisfies `F`.
        Expr::Exists(_, body) if !negate => nnf(body, false),
        Expr::Exists(_, body) => Nnf::Lit(Lit::NotExists {
            inner: Box::new(nnf(body, false)),
            params: free_vars(expr),
        }),
        // `∀ x̄, F` false: some `x̄` falsifies `F`. True: none does.
        Expr::Forall(_, body) if negate => nnf(body, true),
        Expr::Forall(_, body) => Nnf::Lit(Lit::NotExists {
            inner: Box::new(nnf(body, true)),
            params: free_vars(expr),
        }),
        Expr::App(pred, args) => Nnf::Lit(Lit::Atom {
            pred: pred.clone(),
            args: args.clone(),
            positive: !negate,
        }),
        // Not a formula: reported when the literal is written out.
        other => Nnf::Lit(Lit::Cmp { op: BinOp::Add, left: other.clone(), right: other.clone() }),
    }
}

fn negated(op: BinOp) -> BinOp {
    match op {
        BinOp::Eq => BinOp::Ne,
        BinOp::Ne => BinOp::Eq,
        BinOp::Lt => BinOp::Ge,
        BinOp::Ge => BinOp::Lt,
        BinOp::Gt => BinOp::Le,
        BinOp::Le => BinOp::Gt,
        other => other,
    }
}

/// The alternatives of a formula, each a conjunction of literals.
fn dnf(formula: &Nnf) -> Result<Vec<Vec<Lit>>> {
    let alternatives = match formula {
        Nnf::Lit(lit) => vec![vec![lit.clone()]],
        Nnf::Or(parts) => {
            let mut all = Vec::new();
            for part in parts {
                all.extend(dnf(part)?);
            }
            all
        }
        Nnf::And(parts) => {
            let mut all: Vec<Vec<Lit>> = vec![Vec::new()];
            for part in parts {
                let mut next = Vec::new();
                for prefix in &all {
                    for alternative in dnf(part)? {
                        let mut joined = prefix.clone();
                        joined.extend(alternative);
                        next.push(joined);
                    }
                }
                if next.len() > MAX_ALTERNATIVES {
                    return unsupported("the statement has too many alternatives");
                }
                all = next;
            }
            all
        }
    };
    if alternatives.len() > MAX_ALTERNATIVES {
        return unsupported("the statement has too many alternatives");
    }
    Ok(alternatives)
}

/// Writes rules. One conjunction of literals becomes one rule body.
struct Emitter<'a> {
    schema: &'a Schema,
    prefix: &'a str,
    helpers: usize,
    fresh: usize,
    /// Helper rules, in dependency order.
    rules: Vec<String>,
}

/// The body of a rule under construction.
#[derive(Default)]
struct Body {
    /// Positive atoms, which bind variables.
    atoms: Vec<String>,
    /// Comparisons and negations, which only filter.
    filters: Vec<String>,
    /// Variables bound by a positive atom.
    bound: HashSet<String>,
    /// Variables used by a filter, which must end up bound.
    used: Vec<String>,
}

impl Emitter<'_> {
    fn fresh_var(&mut self) -> String {
        self.fresh += 1;
        format!("s__{}", self.fresh)
    }

    fn helper(&mut self) -> String {
        self.helpers += 1;
        format!("{}_{}", self.prefix, self.helpers)
    }

    fn columns(&self, pred: &str) -> &[String] {
        &self.schema[pred]
    }

    /// Write `lits` as a rule body whose head exposes `head_vars`.
    fn conjunct(&mut self, lits: &[Lit], head_vars: &[String]) -> Result<Vec<String>> {
        let mut body = Body::default();
        // Positive atoms first: they bind what the other literals use.
        for lit in lits {
            if let Lit::Atom { pred, args, positive: true } = lit {
                let atom = self.relation(pred, args, &mut body)?;
                body.atoms.push(atom);
            }
        }
        for lit in lits {
            match lit {
                Lit::Atom { positive: true, .. } => {}
                Lit::Atom { pred, args, positive: false } => {
                    // Its arguments must be bound outside the negation.
                    let mut inner = Body::default();
                    let atom = self.relation(pred, args, &mut inner)?;
                    body.atoms.append(&mut inner.atoms);
                    body.bound.extend(inner.bound.iter().filter(|v| v.starts_with("s__")).cloned());
                    body.used.extend(args.iter().flat_map(free_vars));
                    body.filters.push(format!("~{}", atom));
                }
                Lit::Cmp { op, left, right } => {
                    if !op.is_comparison() {
                        return invalid(format!("'{}' is a value, not a formula", show(left)));
                    }
                    let filter = self.comparison(*op, left, right, &mut body)?;
                    body.filters.push(filter);
                }
                Lit::NotExists { inner, params } => {
                    let helper = self.helper();
                    let head = if params.is_empty() {
                        "holds: 1".to_string()
                    } else {
                        params.iter().map(|p| format!("{}: {}", p, p)).collect::<Vec<_>>().join(", ")
                    };
                    for conjunct in dnf(inner)? {
                        let inner_body = self.conjunct(&conjunct, params)?;
                        if inner_body.is_empty() {
                            return unsupported("a quantifier ranges over no predicate");
                        }
                        self.rules.push(format!(
                            "{}({}) distinct :- {};",
                            helper,
                            head,
                            inner_body.join(", ")
                        ));
                    }
                    body.used.extend(params.iter().cloned());
                    body.filters.push(format!("~{}({})", helper, head));
                }
            }
        }

        for var in head_vars.iter().chain(body.used.iter()) {
            if !body.bound.contains(var) {
                return unsupported(format!(
                    "variable '{}' is not bound by a predicate, so it has no values to check",
                    var.split("__").next().unwrap_or(var)
                ));
            }
        }
        body.atoms.append(&mut body.filters);
        Ok(body.atoms)
    }

    /// `pred` applied to all its columns.
    fn relation(&mut self, pred: &str, args: &[Expr], body: &mut Body) -> Result<String> {
        let columns = self.columns(pred).to_vec();
        if args.len() != columns.len() {
            return invalid(format!(
                "'{}' has {} column{} ({}) but is applied to {} argument{}",
                pred,
                columns.len(),
                if columns.len() == 1 { "" } else { "s" },
                columns.join(", "),
                args.len(),
                if args.len() == 1 { "" } else { "s" },
            ));
        }
        self.atom(pred, &columns, args, None, body)
    }

    /// Write `pred(col: arg, ...)`, with `value` bound to the column after
    /// the arguments when given.
    fn atom(
        &mut self,
        pred: &str,
        columns: &[String],
        args: &[Expr],
        value: Option<&str>,
        body: &mut Body,
    ) -> Result<String> {
        let mut fields = Vec::new();
        for (column, arg) in columns.iter().zip(args) {
            let term = self.term(arg, body)?;
            if let Expr::Var(var) = arg {
                body.bound.insert(var.clone());
            }
            fields.push(format!("{}: {}", column, term));
        }
        if let Some(value) = value {
            fields.push(format!("{}: {}", columns[args.len()], value));
            body.bound.insert(value.to_string());
        }
        Ok(format!("{}({})", pred, fields.join(", ")))
    }

    /// Write a value. Functions and sums it reads become atoms of `body`.
    fn term(&mut self, expr: &Expr, body: &mut Body) -> Result<String> {
        match expr {
            Expr::Var(name) => Ok(name.clone()),
            Expr::Num(n) => Ok(n.clone()),
            Expr::Str(s) => {
                if s.contains('"') || s.contains('\n') {
                    return unsupported("string literals cannot hold quotes or line breaks");
                }
                Ok(format!("\"{}\"", s))
            }
            Expr::Neg(inner) => Ok(format!("(-{})", self.term(inner, body)?)),
            Expr::Binary(op, left, right) if op.is_arithmetic() => {
                let symbol = match op {
                    BinOp::Add => "+",
                    BinOp::Sub => "-",
                    BinOp::Mul => "*",
                    _ => "/",
                };
                Ok(format!("({} {} {})", self.term(left, body)?, symbol, self.term(right, body)?))
            }
            Expr::App(pred, args) => {
                let columns = self.columns(pred).to_vec();
                if args.len() + 1 != columns.len() {
                    return invalid(format!(
                        "'{}' is used as a value: it must be applied to {} argument{} \
                         (its columns but the last: {}), not {}",
                        pred,
                        columns.len().saturating_sub(1),
                        if columns.len() == 2 { "" } else { "s" },
                        columns.join(", "),
                        args.len(),
                    ));
                }
                let value = self.fresh_var();
                let atom = self.atom(pred, &columns, args, Some(&value), body)?;
                body.atoms.push(atom);
                Ok(value)
            }
            Expr::Sum(vars, summand) => {
                let helper = self.helper();
                let mut inner = Body::default();
                let value = self.term(summand, &mut inner)?;
                if inner.atoms.is_empty() {
                    return unsupported("a sum ranges over no predicate");
                }
                let groups: Vec<String> =
                    free_vars(summand).into_iter().filter(|v| !vars.contains(v)).collect();
                for var in vars.iter().chain(groups.iter()) {
                    if !inner.bound.contains(var) {
                        return unsupported(format!(
                            "variable '{}' of a sum is not bound by a predicate",
                            var.split("__").next().unwrap_or(var)
                        ));
                    }
                }
                let mut head: Vec<String> = groups.iter().map(|g| format!("{}: {}", g, g)).collect();
                head.push(format!("total? += {}", value));
                self.rules.push(format!(
                    "{}({}) distinct :- {};",
                    helper,
                    head.join(", "),
                    inner.atoms.join(", ")
                ));
                let total = self.fresh_var();
                let mut fields: Vec<String> = groups.iter().map(|g| format!("{}: {}", g, g)).collect();
                fields.push(format!("total: {}", total));
                body.atoms.push(format!("{}({})", helper, fields.join(", ")));
                body.bound.extend(groups);
                body.bound.insert(total.clone());
                Ok(total)
            }
            other => invalid(format!("'{}' is a formula, not a value", show(other))),
        }
    }

    fn comparison(&mut self, op: BinOp, left: &Expr, right: &Expr, body: &mut Body) -> Result<String> {
        let l = self.term(left, body)?;
        let r = self.term(right, body)?;
        body.used.extend(free_vars(left));
        body.used.extend(free_vars(right));
        // Computed numbers are compared up to a tolerance: a sum of floats
        // that should be 1 is rarely exactly 1.
        let approximate = is_computed(left) || is_computed(right);
        Ok(match op {
            BinOp::Eq if approximate => format!("Abs({} - {}) <= {}", l, r, TOLERANCE),
            BinOp::Ne if approximate => format!("Abs({} - {}) > {}", l, r, TOLERANCE),
            BinOp::Eq => format!("{} == {}", l, r),
            BinOp::Ne => format!("{} != {}", l, r),
            BinOp::Lt => format!("{} < {}", l, r),
            BinOp::Le => format!("{} <= {}", l, r),
            BinOp::Gt => format!("{} > {}", l, r),
            _ => format!("{} >= {}", l, r),
        })
    }
}

/// True if `expr` is the result of a computation on numbers.
fn is_computed(expr: &Expr) -> bool {
    match expr {
        Expr::Sum(..) | Expr::Neg(_) => true,
        Expr::Binary(op, ..) => op.is_arithmetic(),
        Expr::Num(n) => n.contains('.'),
        _ => false,
    }
}

/// A short rendering of an expression for error messages.
fn show(expr: &Expr) -> String {
    match expr {
        Expr::App(name, args) if args.is_empty() => name.clone(),
        Expr::App(name, _) => format!("{} ...", name),
        Expr::Var(name) => name.split("__").next().unwrap_or(name).to_string(),
        Expr::Num(n) => n.clone(),
        Expr::Str(s) => format!("\"{}\"", s),
        Expr::Forall(..) => "∀ ...".into(),
        Expr::Exists(..) => "∃ ...".into(),
        Expr::Sum(..) => "∑ ...".into(),
        Expr::Not(_) => "¬ ...".into(),
        Expr::Neg(_) => "- ...".into(),
        Expr::Binary(op, ..) if op.is_comparison() => "a comparison".into(),
        Expr::Binary(op, ..) if op.is_arithmetic() => "an arithmetic expression".into(),
        Expr::Binary(..) => "a compound formula".into(),
    }
}

#[cfg(test)]
mod tests {
    use super::super::parse::parse;
    use super::*;

    fn schema() -> Schema {
        let mut schema = Schema::new();
        for (pred, columns) in [
            ("Parent", vec!["x", "y"]),
            ("Ancestor", vec!["x", "y"]),
            ("Prior", vec!["h", "p"]),
            ("Joint", vec!["h", "e", "p"]),
            ("Evidence", vec!["e", "p"]),
            ("Posterior", vec!["h", "e", "p"]),
        ] {
            schema.insert(pred.to_string(), columns.into_iter().map(String::from).collect());
        }
        schema
    }

    fn rules(statement: &str) -> String {
        translate(&parse(statement).unwrap(), &schema(), "Assert").unwrap().rules
    }

    fn error(statement: &str) -> TranslateError {
        translate(&parse(statement).unwrap(), &schema(), "Assert").unwrap_err()
    }

    #[test]
    fn test_implication_chain() {
        assert_eq!(
            rules("∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z"),
            "Assert(x: x, y: y, z: z) distinct :- \
             Ancestor(x: x, y: y), Ancestor(x: y, y: z), ~Ancestor(x: x, y: z);"
        );
    }

    #[test]
    fn test_unbound_names_are_universal() {
        assert_eq!(
            rules("Ancestor x y → Ancestor y z → Ancestor x z"),
            rules("∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z"),
        );
    }

    #[test]
    fn test_negated_atom() {
        assert_eq!(rules("∀ x, ¬ Ancestor x x"), "Assert(x: x) distinct :- Ancestor(x: x, y: x);");
    }

    #[test]
    fn test_existential_conclusion_becomes_a_helper() {
        assert_eq!(
            rules("∀ x y, Ancestor x y → ∃ w, Parent x w"),
            "Assert_1(x: x) distinct :- Parent(x: x, y: w__1);\n\
             Assert(x: x, y: y) distinct :- Ancestor(x: x, y: y), ~Assert_1(x: x);"
        );
    }

    #[test]
    fn test_conjunctive_conclusion_gives_one_rule_per_way_to_fail() {
        assert_eq!(
            rules("∀ h e, 0 ≤ Posterior h e ∧ Posterior h e ≤ 1"),
            "Assert(h: h, e: e) distinct :- Posterior(h: h, e: e, p: s__1), 0 > s__1;\n\
             Assert(h: h, e: e) distinct :- Posterior(h: h, e: e, p: s__2), s__2 > 1;"
        );
    }

    #[test]
    fn test_equation_between_functions() {
        assert_eq!(
            rules("∀ h e, Posterior h e = Joint h e / Evidence e"),
            "Assert(h: h, e: e) distinct :- Posterior(h: h, e: e, p: s__1), \
             Joint(h: h, e: e, p: s__2), Evidence(e: e, p: s__3), \
             Abs(s__1 - (s__2 / s__3)) > 0.000000001;"
        );
    }

    #[test]
    fn test_sum_becomes_an_aggregating_helper() {
        assert_eq!(
            rules("∀ e, ∑ h, Posterior h e = 1"),
            "Assert_1(e: e, total? += s__1) distinct :- Posterior(h: h__1, e: e, p: s__1);\n\
             Assert(e: e) distinct :- Assert_1(e: e, total: s__2), Abs(s__2 - 1) > 0.000000001;"
        );
    }

    #[test]
    fn test_closed_statement() {
        assert_eq!(
            rules("∃ x, Ancestor x x"),
            "Assert_1(holds: 1) distinct :- Ancestor(x: x__1, y: x__1);\n\
             Assert(violated: 1) distinct :- ~Assert_1(holds: 1);"
        );
    }

    #[test]
    fn test_constants() {
        assert_eq!(
            rules("∀ y, Parent \"a\" y → y ≠ \"a\""),
            "Assert(y: y) distinct :- Parent(x: \"a\", y: y), y == \"a\";"
        );
    }

    #[test]
    fn test_missing_predicates() {
        assert_eq!(
            error("∀ x y, Ancestor x y → Descendant y x ∧ Known x"),
            TranslateError::Missing(vec!["Descendant".into(), "Known".into()])
        );
    }

    #[test]
    fn test_wrong_number_of_arguments() {
        let TranslateError::Invalid(message) = error("∀ x, Ancestor x → Parent x x") else {
            panic!("expected an invalid statement");
        };
        assert!(message.contains("'Ancestor' has 2 columns (x, y)"), "{message}");

        let TranslateError::Invalid(message) = error("∀ h, Posterior h = 1") else {
            panic!("expected an invalid statement");
        };
        assert!(message.contains("used as a value"), "{message}");
    }

    #[test]
    fn test_raw_table_is_refused() {
        let TranslateError::Invalid(message) = error("∀ x y, Ancestor x y → parent x y") else {
            panic!("expected an invalid statement");
        };
        assert!(message.contains("raw table"), "{message}");
    }

    #[test]
    fn test_unbound_variable_is_unsupported() {
        let TranslateError::Unsupported(message) = error("∀ x, x > 0") else {
            panic!("expected an unsupported statement");
        };
        assert!(message.contains("variable 'x' is not bound"), "{message}");

        // `y` ranges over nothing: there is no finite set of y to look at.
        let TranslateError::Unsupported(message) = error("∀ x y, Ancestor x x → Parent x y") else {
            panic!("expected an unsupported statement");
        };
        assert!(message.contains("variable 'y' is not bound"), "{message}");
    }
}
