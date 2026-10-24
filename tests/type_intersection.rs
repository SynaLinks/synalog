//! The type inference's `intersect` is the intersection Verus proves the
//! greatest common refinement (`synalog_verified::types::meet`): on random
//! types, both agree on whether two types intersect, and on the type.
use std::collections::HashMap;

use synalog::compiler::type_inference::{intersect, Type};
use synalog_verified::types::{Fields, Ty, meet};

const NAMES: [&str; 4] = ["a", "b", "c", "d"];

struct Random(u64);

impl Random {
    fn below(&mut self, n: u64) -> u64 {
        self.0 ^= self.0 << 13;
        self.0 ^= self.0 >> 7;
        self.0 ^= self.0 << 17;
        self.0 % n
    }

    fn ty(&mut self, depth: u32) -> Type {
        let kinds = if depth == 0 { 5 } else { 8 };
        match self.below(kinds) {
            0 => Type::Any,
            1 => Type::Atomic,
            2 => Type::Number,
            3 => Type::String,
            4 => Type::Bool,
            5 => Type::list(self.ty(depth - 1)),
            _ => {
                let mut fields = HashMap::new();
                for name in NAMES {
                    if self.below(2) == 0 {
                        fields.insert(name.to_string(), self.ty(depth - 1));
                    }
                }
                Type::record(fields, self.below(2) == 0)
            }
        }
    }
}

fn to_ty(t: &Type) -> Ty {
    match t {
        Type::Any => Ty::Any,
        Type::Atomic => Ty::Atomic,
        Type::Number => Ty::Number,
        Type::String => Ty::Str,
        Type::Bool => Ty::Bool,
        Type::List(e) => Ty::List(Box::new(to_ty(e))),
        Type::Record { fields, is_opened } => {
            let mut list = Fields::Nil;
            for (name, field) in fields {
                let id = NAMES.iter().position(|n| n == name).unwrap() as u64;
                list = Fields::Cons(id, Box::new(to_ty(field)), Box::new(list));
            }
            Ty::Record(Box::new(list), *is_opened)
        }
    }
}

/// A type, written the same whatever the order of its fields.
fn written(t: &Ty) -> String {
    match t {
        Ty::Any => "any".into(),
        Ty::Atomic => "atomic".into(),
        Ty::Number => "number".into(),
        Ty::Str => "string".into(),
        Ty::Bool => "bool".into(),
        Ty::List(e) => format!("[{}]", written(e)),
        Ty::Record(fields, opened) => {
            let mut items = Vec::new();
            let mut list = &**fields;
            while let Fields::Cons(id, field, rest) = list {
                items.push(format!("{}: {}", NAMES[*id as usize], written(field)));
                list = rest;
            }
            items.sort();
            format!("{{{}{}}}", items.join(", "), if *opened { ", .." } else { "" })
        }
    }
}

#[test]
fn intersect_is_the_greatest_common_refinement() {
    let mut random = Random(0x5eed_1234_abcd_0001);
    let mut intersecting = 0;
    for _ in 0..20_000 {
        let (a, b) = (random.ty(3), random.ty(3));
        let expected = meet(&to_ty(&a), &to_ty(&b)).map(|c| written(&c));
        let got = intersect(a.clone(), b.clone(), (0, 0)).ok().map(|c| written(&to_ty(&c)));
        assert_eq!(got, expected, "intersect({a}, {b})");
        intersecting += got.is_some() as usize;
    }
    // Both outcomes are exercised.
    assert!(intersecting > 1_000, "{intersecting}");
}
