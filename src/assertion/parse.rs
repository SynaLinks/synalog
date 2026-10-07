// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Parser for assertion statements.
//!
//! A statement is a first-order formula with arithmetic and sums, written in
//! the syntax of a Lean proposition:
//!
//! ```text
//! ∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z
//! ∀ e, ∑ h, Posterior h e = 1
//! ```
//!
//! Operator precedence follows Lean and Mathlib, so a statement means here what
//! it means there: application binds tightest, then `* /`, `+ -`, comparisons,
//! `¬`, `∧`, `∨`, `→` and `↔`. A quantifier's body extends as far as it can; a
//! sum's body stops before `+` and comparisons, as Mathlib's `∑ x, f x` does.
//!
//! Every symbol has an ASCII spelling (`forall`, `exists`, `sum`, `not`, `/\`,
//! `\/`, `->`, `<->`, `!=`, `<=`, `>=`).

/// A parsed statement. Formulas and terms share one tree: which one a node is
/// follows from where it stands, and is decided by the translator.
#[derive(Debug, Clone, PartialEq)]
pub enum Expr {
    Forall(Vec<String>, Box<Expr>),
    Exists(Vec<String>, Box<Expr>),
    /// `∑ vars, body`.
    Sum(Vec<String>, Box<Expr>),
    Not(Box<Expr>),
    Neg(Box<Expr>),
    Binary(BinOp, Box<Expr>, Box<Expr>),
    /// A name applied to arguments: `Ancestor x y`. A bare name has none.
    App(String, Vec<Expr>),
    /// A variable. The parser never produces it: the translator resolves bare
    /// names into variables once it knows what is bound.
    Var(String),
    Num(String),
    Str(String),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum BinOp {
    Iff,
    Implies,
    Or,
    And,
    Eq,
    Ne,
    Lt,
    Le,
    Gt,
    Ge,
    Add,
    Sub,
    Mul,
    Div,
}

impl BinOp {
    pub fn is_comparison(self) -> bool {
        matches!(self, BinOp::Eq | BinOp::Ne | BinOp::Lt | BinOp::Le | BinOp::Gt | BinOp::Ge)
    }

    pub fn is_arithmetic(self) -> bool {
        matches!(self, BinOp::Add | BinOp::Sub | BinOp::Mul | BinOp::Div)
    }

    /// Left and right binding powers.
    fn binding_power(self) -> (u8, u8) {
        match self {
            BinOp::Iff => (20, 21),
            // `→`, `∨`, `∧` associate to the right.
            BinOp::Implies => (25, 25),
            BinOp::Or => (30, 30),
            BinOp::And => (35, 35),
            BinOp::Eq | BinOp::Ne | BinOp::Lt | BinOp::Le | BinOp::Gt | BinOp::Ge => (50, 51),
            BinOp::Add | BinOp::Sub => (65, 66),
            BinOp::Mul | BinOp::Div => (70, 71),
        }
    }
}

/// Binding power of `¬`'s operand: it reaches over comparisons, not over `∧`.
const NOT_POWER: u8 = 40;
/// Binding power of a sum's body: it reaches over `*` and `/`, not over `+`.
const SUM_POWER: u8 = 67;
/// Binding power of unary minus.
const NEG_POWER: u8 = 75;

/// A statement that does not parse.
#[derive(Debug, Clone, PartialEq)]
pub struct SyntaxError {
    pub message: String,
    /// Character offset in the statement.
    pub offset: usize,
}

impl std::fmt::Display for SyntaxError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{} (at character {})", self.message, self.offset + 1)
    }
}

#[derive(Debug, Clone, PartialEq)]
enum Token {
    Ident(String),
    Num(String),
    Str(String),
    Forall,
    Exists,
    Sum,
    Not,
    Op(BinOp),
    LParen,
    RParen,
    Comma,
    Colon,
    /// `∈`, to say that bounded binders are not supported.
    In,
}

impl Token {
    fn describe(&self) -> String {
        match self {
            Token::Ident(s) => format!("'{}'", s),
            Token::Num(s) => format!("'{}'", s),
            Token::Str(s) => format!("\"{}\"", s),
            Token::Forall => "'∀'".into(),
            Token::Exists => "'∃'".into(),
            Token::Sum => "'∑'".into(),
            Token::Not => "'¬'".into(),
            Token::Op(_) => "an operator".into(),
            Token::LParen => "'('".into(),
            Token::RParen => "')'".into(),
            Token::Comma => "','".into(),
            Token::Colon => "':'".into(),
            Token::In => "'∈'".into(),
        }
    }
}

/// Symbols, longest first so that `<->` wins over `<` and `->` over `-`.
const SYMBOLS: &[(&str, Token)] = &[
    ("<->", Token::Op(BinOp::Iff)),
    ("↔", Token::Op(BinOp::Iff)),
    ("->", Token::Op(BinOp::Implies)),
    ("→", Token::Op(BinOp::Implies)),
    ("/\\", Token::Op(BinOp::And)),
    ("∧", Token::Op(BinOp::And)),
    ("\\/", Token::Op(BinOp::Or)),
    ("∨", Token::Op(BinOp::Or)),
    ("!=", Token::Op(BinOp::Ne)),
    ("≠", Token::Op(BinOp::Ne)),
    ("<=", Token::Op(BinOp::Le)),
    ("≤", Token::Op(BinOp::Le)),
    (">=", Token::Op(BinOp::Ge)),
    ("≥", Token::Op(BinOp::Ge)),
    ("==", Token::Op(BinOp::Eq)),
    ("=", Token::Op(BinOp::Eq)),
    ("<", Token::Op(BinOp::Lt)),
    (">", Token::Op(BinOp::Gt)),
    ("+", Token::Op(BinOp::Add)),
    ("-", Token::Op(BinOp::Sub)),
    ("*", Token::Op(BinOp::Mul)),
    ("/", Token::Op(BinOp::Div)),
    ("∀", Token::Forall),
    ("∃", Token::Exists),
    ("∑", Token::Sum),
    ("Σ", Token::Sum),
    ("¬", Token::Not),
    ("∈", Token::In),
    ("(", Token::LParen),
    (")", Token::RParen),
    (",", Token::Comma),
    (":", Token::Colon),
];

fn tokenize(text: &str) -> Result<Vec<(Token, usize)>, SyntaxError> {
    let chars: Vec<char> = text.chars().collect();
    let mut tokens = Vec::new();
    let mut i = 0;
    'next: while i < chars.len() {
        let c = chars[i];
        if c.is_whitespace() {
            i += 1;
            continue;
        }
        for (symbol, token) in SYMBOLS {
            let len = symbol.chars().count();
            if i + len <= chars.len() && chars[i..i + len].iter().copied().eq(symbol.chars()) {
                tokens.push((token.clone(), i));
                i += len;
                continue 'next;
            }
        }
        if c == '"' {
            let start = i;
            i += 1;
            let mut value = String::new();
            loop {
                match chars.get(i) {
                    Some('"') => break,
                    Some(&ch) => value.push(ch),
                    None => {
                        return Err(SyntaxError {
                            message: "unclosed string".into(),
                            offset: start,
                        });
                    }
                }
                i += 1;
            }
            i += 1;
            tokens.push((Token::Str(value), start));
        } else if c.is_ascii_digit() {
            let start = i;
            while i < chars.len() && chars[i].is_ascii_digit() {
                i += 1;
            }
            if i + 1 < chars.len() && chars[i] == '.' && chars[i + 1].is_ascii_digit() {
                i += 1;
                while i < chars.len() && chars[i].is_ascii_digit() {
                    i += 1;
                }
            }
            tokens.push((Token::Num(chars[start..i].iter().collect()), start));
        } else if c.is_alphabetic() || c == '_' {
            let start = i;
            while i < chars.len() && (chars[i].is_alphanumeric() || chars[i] == '_' || chars[i] == '\'') {
                i += 1;
            }
            let word: String = chars[start..i].iter().collect();
            let token = match word.as_str() {
                "forall" => Token::Forall,
                "exists" => Token::Exists,
                "sum" => Token::Sum,
                "not" => Token::Not,
                _ => Token::Ident(word),
            };
            tokens.push((token, start));
        } else {
            return Err(SyntaxError {
                message: format!("unexpected character '{}'", c),
                offset: i,
            });
        }
    }
    Ok(tokens)
}

struct Parser {
    tokens: Vec<(Token, usize)>,
    pos: usize,
    /// Offset reported when the statement ends too early.
    end: usize,
}

impl Parser {
    fn peek(&self) -> Option<&Token> {
        self.tokens.get(self.pos).map(|(t, _)| t)
    }

    fn offset(&self) -> usize {
        self.tokens.get(self.pos).map(|(_, o)| *o).unwrap_or(self.end)
    }

    fn error<T>(&self, message: impl Into<String>) -> Result<T, SyntaxError> {
        Err(SyntaxError {
            message: message.into(),
            offset: self.offset(),
        })
    }

    fn unexpected<T>(&self, expected: &str) -> Result<T, SyntaxError> {
        match self.peek() {
            Some(token) => self.error(format!("expected {}, found {}", expected, token.describe())),
            None => self.error(format!("expected {}, found the end of the statement", expected)),
        }
    }

    fn expr(&mut self, min_power: u8) -> Result<Expr, SyntaxError> {
        let mut left = self.prefix()?;
        while let Some(Token::Op(op)) = self.peek() {
            let op = *op;
            let (left_power, right_power) = op.binding_power();
            if left_power < min_power {
                break;
            }
            self.pos += 1;
            let right = self.expr(right_power)?;
            left = Expr::Binary(op, Box::new(left), Box::new(right));
        }
        Ok(left)
    }

    fn prefix(&mut self) -> Result<Expr, SyntaxError> {
        match self.peek() {
            Some(Token::Forall) => {
                self.pos += 1;
                let vars = self.binders("∀")?;
                Ok(Expr::Forall(vars, Box::new(self.expr(0)?)))
            }
            Some(Token::Exists) => {
                self.pos += 1;
                let vars = self.binders("∃")?;
                Ok(Expr::Exists(vars, Box::new(self.expr(0)?)))
            }
            Some(Token::Sum) => {
                self.pos += 1;
                let vars = self.binders("∑")?;
                Ok(Expr::Sum(vars, Box::new(self.expr(SUM_POWER)?)))
            }
            Some(Token::Not) => {
                self.pos += 1;
                Ok(Expr::Not(Box::new(self.expr(NOT_POWER)?)))
            }
            Some(Token::Op(BinOp::Sub)) => {
                self.pos += 1;
                Ok(Expr::Neg(Box::new(self.expr(NEG_POWER)?)))
            }
            _ => self.application(),
        }
    }

    /// The variables a quantifier or sum binds, up to its comma. Type
    /// ascriptions (`(x y : α)`, `x : α`) are accepted and ignored.
    fn binders(&mut self, symbol: &str) -> Result<Vec<String>, SyntaxError> {
        let mut vars = Vec::new();
        loop {
            match self.peek() {
                Some(Token::Ident(name)) => {
                    vars.push(name.clone());
                    self.pos += 1;
                }
                Some(Token::LParen) => {
                    self.pos += 1;
                    while let Some(Token::Ident(name)) = self.peek() {
                        vars.push(name.clone());
                        self.pos += 1;
                    }
                    if self.peek() == Some(&Token::Colon) {
                        while !matches!(self.peek(), Some(Token::RParen) | None) {
                            self.pos += 1;
                        }
                    }
                    if self.peek() != Some(&Token::RParen) {
                        return self.unexpected("')'");
                    }
                    self.pos += 1;
                }
                Some(Token::Colon) => {
                    while !matches!(self.peek(), Some(Token::Comma) | None) {
                        self.pos += 1;
                    }
                }
                Some(Token::In) => {
                    return self.error(format!(
                        "bounded binders ('{} x ∈ s, ...') are not supported",
                        symbol
                    ));
                }
                Some(Token::Comma) => {
                    if vars.is_empty() {
                        return self.error(format!("'{}' binds no variable", symbol));
                    }
                    self.pos += 1;
                    return Ok(vars);
                }
                _ => return self.unexpected("a variable or ','"),
            }
        }
    }

    fn application(&mut self) -> Result<Expr, SyntaxError> {
        // Only a bare name takes arguments: `(P x y)` is already applied.
        let bare = matches!(self.peek(), Some(Token::Ident(_)));
        let head = self.atom()?;
        let Expr::App(name, _) = &head else {
            return Ok(head);
        };
        if !bare {
            return Ok(head);
        }
        let name = name.clone();
        let mut args = Vec::new();
        while matches!(
            self.peek(),
            Some(Token::Ident(_) | Token::Num(_) | Token::Str(_) | Token::LParen)
        ) {
            args.push(self.atom()?);
        }
        Ok(Expr::App(name, args))
    }

    fn atom(&mut self) -> Result<Expr, SyntaxError> {
        match self.peek().cloned() {
            Some(Token::Ident(name)) => {
                self.pos += 1;
                Ok(Expr::App(name, Vec::new()))
            }
            Some(Token::Num(n)) => {
                self.pos += 1;
                Ok(Expr::Num(n))
            }
            Some(Token::Str(s)) => {
                self.pos += 1;
                Ok(Expr::Str(s))
            }
            Some(Token::LParen) => {
                self.pos += 1;
                let inner = self.expr(0)?;
                if self.peek() != Some(&Token::RParen) {
                    return self.unexpected("')'");
                }
                self.pos += 1;
                Ok(inner)
            }
            _ => self.unexpected("a formula"),
        }
    }
}

/// Parse an assertion statement.
pub fn parse(text: &str) -> Result<Expr, SyntaxError> {
    let tokens = tokenize(text)?;
    let mut parser = Parser {
        tokens,
        pos: 0,
        end: text.chars().count(),
    };
    let expr = parser.expr(0)?;
    if parser.peek().is_some() {
        return parser.unexpected("the end of the statement");
    }
    Ok(expr)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn name(n: &str) -> Expr {
        Expr::App(n.into(), vec![])
    }

    fn app(n: &str, args: &[&str]) -> Expr {
        Expr::App(n.into(), args.iter().map(|a| name(a)).collect())
    }

    fn bin(op: BinOp, l: Expr, r: Expr) -> Expr {
        Expr::Binary(op, Box::new(l), Box::new(r))
    }

    #[test]
    fn a_parenthesized_application_keeps_its_arguments() {
        assert_eq!(parse("(P x y)").unwrap(), app("P", &["x", "y"]));
        assert_eq!(parse("((P x y))").unwrap(), app("P", &["x", "y"]));
        assert_eq!(parse("P (x) (y)").unwrap(), app("P", &["x", "y"]));
    }

    #[test]
    fn test_implication_is_right_associative() {
        let expr = parse("∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z").unwrap();
        let expected = Expr::Forall(
            vec!["x".into(), "y".into(), "z".into()],
            Box::new(bin(
                BinOp::Implies,
                app("Ancestor", &["x", "y"]),
                bin(BinOp::Implies, app("Ancestor", &["y", "z"]), app("Ancestor", &["x", "z"])),
            )),
        );
        assert_eq!(expr, expected);
    }

    #[test]
    fn test_ascii_spelling_is_the_same_statement() {
        let unicode = parse("∀ x, ¬ P x ∧ (Q x ∨ R x) ↔ ∃ y, S x y ∧ x ≠ y").unwrap();
        let ascii = parse("forall x, not P x /\\ (Q x \\/ R x) <-> exists y, S x y /\\ x != y").unwrap();
        assert_eq!(unicode, ascii);
    }

    #[test]
    fn test_and_binds_tighter_than_or_and_implies() {
        let expr = parse("A ∧ B ∨ C → D").unwrap();
        let expected = bin(
            BinOp::Implies,
            bin(BinOp::Or, bin(BinOp::And, name("A"), name("B")), name("C")),
            name("D"),
        );
        assert_eq!(expr, expected);
    }

    #[test]
    fn test_not_reaches_over_a_comparison_only() {
        let expr = parse("¬ x = y ∧ P x").unwrap();
        let expected = bin(
            BinOp::And,
            Expr::Not(Box::new(bin(BinOp::Eq, name("x"), name("y")))),
            app("P", &["x"]),
        );
        assert_eq!(expr, expected);
    }

    #[test]
    fn test_sum_body_stops_before_a_comparison() {
        // As in Mathlib: `∑ h, f h = 1` is `(∑ h, f h) = 1`.
        let expr = parse("∀ e, ∑ h, Posterior h e = 1").unwrap();
        let expected = Expr::Forall(
            vec!["e".into()],
            Box::new(bin(
                BinOp::Eq,
                Expr::Sum(vec!["h".into()], Box::new(app("Posterior", &["h", "e"]))),
                Expr::Num("1".into()),
            )),
        );
        assert_eq!(expr, expected);
    }

    #[test]
    fn test_sum_body_includes_a_product() {
        let expr = parse("sum h, Prior h * Likelihood h e").unwrap();
        let expected = Expr::Sum(
            vec!["h".into()],
            Box::new(bin(BinOp::Mul, app("Prior", &["h"]), app("Likelihood", &["h", "e"]))),
        );
        assert_eq!(expr, expected);
    }

    #[test]
    fn test_arithmetic_precedence() {
        let expr = parse("P h e = J h e / E e + 1").unwrap();
        let expected = bin(
            BinOp::Eq,
            app("P", &["h", "e"]),
            bin(
                BinOp::Add,
                bin(BinOp::Div, app("J", &["h", "e"]), app("E", &["e"])),
                Expr::Num("1".into()),
            ),
        );
        assert_eq!(expr, expected);
    }

    #[test]
    fn test_literals_and_parenthesised_arguments() {
        let expr = parse("Likelihood \"sick\" (x) 0.95").unwrap();
        let expected = Expr::App(
            "Likelihood".into(),
            vec![Expr::Str("sick".into()), name("x"), Expr::Num("0.95".into())],
        );
        assert_eq!(expr, expected);
    }

    #[test]
    fn test_type_ascriptions_are_ignored() {
        let plain = parse("∀ x y, P x y").unwrap();
        assert_eq!(parse("∀ (x y : String), P x y").unwrap(), plain);
        assert_eq!(parse("∀ x y : String, P x y").unwrap(), plain);
        assert_eq!(parse("∀ (x : α) (y : β), P x y").unwrap(), plain);
    }

    #[test]
    fn test_syntax_errors_say_where() {
        let err = parse("∀ x, P x →").unwrap_err();
        assert_eq!(err.offset, 10);
        assert!(err.message.contains("end of the statement"), "{}", err.message);

        let err = parse("∀ x, (P x").unwrap_err();
        assert!(err.message.contains("expected ')'"), "{}", err.message);

        let err = parse("P x ; Q x").unwrap_err();
        assert_eq!(err.offset, 4);

        let err = parse("∑ h ∈ S, P h = 1").unwrap_err();
        assert!(err.message.contains("bounded binders"), "{}", err.message);

        let err = parse("P x Q y )").unwrap_err();
        assert!(err.message.contains("end of the statement"), "{}", err.message);
    }
}
