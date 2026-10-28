// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! The intersection of two types: the reference the type inference's
//! `intersect` is tested against.
//!
//! A type refines another ([`le`]) when its values are values of the other:
//! everything refines `any`; `number` and `string` refine `atomic`; a list
//! refines a list whose elements its own refine; a record refines an opened
//! record having at least its fields, each refined, and a closed record
//! having exactly its fields. [`meet`] is the intersection, and Verus proves
//! it is the greatest common refinement: the type it returns refines both,
//! and every type refining both refines it. When it returns `None`, no type
//! refines both.
//!
//! Refinement is a preorder ([`lemma_le_refl`], [`lemma_le_trans`]), so the
//! intersection is a meet-semilattice operation: idempotent, commutative,
//! associative and monotone ([`lemma_meet_idem`], [`lemma_meet_comm`],
//! [`lemma_meet_assoc`], [`lemma_meet_mono`]), with [`lemma_meet_lb`] its
//! defining universal property.
//!
//! Field names are numbers here (the test names them).

use vstd::prelude::*;

verus! {

pub enum Ty {
    Any,
    Atomic,
    Number,
    Str,
    Bool,
    List(Box<Ty>),
    /// The fields, and whether the record is opened.
    Record(Box<Fields>, bool),
}

pub enum Fields {
    Nil,
    Cons(u64, Box<Ty>, Box<Fields>),
}

pub open spec fn lookup(fs: Fields, k: u64) -> Option<Ty>
    decreases fs,
{
    match fs {
        Fields::Nil => None,
        Fields::Cons(k2, t, rest) => if k2 == k { Some(*t) } else { lookup(*rest, k) },
    }
}

pub open spec fn has_field(fs: Fields, k: u64) -> bool {
    lookup(fs, k) is Some
}

pub open spec fn get(fs: Fields, k: u64) -> Ty {
    lookup(fs, k).unwrap()
}

/// Every field named once, every type well formed.
pub open spec fn wf(t: Ty) -> bool
    decreases t,
{
    match t {
        Ty::List(e) => wf(*e),
        Ty::Record(fs, _) => wf_fields(*fs),
        _ => true,
    }
}

pub open spec fn wf_fields(fs: Fields) -> bool
    decreases fs,
{
    match fs {
        Fields::Nil => true,
        Fields::Cons(k, t, rest) => !has_field(*rest, k) && wf(*t) && wf_fields(*rest),
    }
}

/// `a` refines `b`.
pub open spec fn le(a: Ty, b: Ty) -> bool
    decreases b,
{
    match b {
        Ty::Any => true,
        Ty::Atomic => a is Atomic || a is Number || a is Str,
        Ty::Number => a is Number,
        Ty::Str => a is Str,
        Ty::Bool => a is Bool,
        Ty::List(eb) => match a {
            Ty::List(ea) => le(*ea, *eb),
            _ => false,
        },
        Ty::Record(fb, open_b) => match a {
            Ty::Record(fa, open_a) => fields_le(*fa, *fb) && (open_b || (!open_a && forall|k: u64| #[trigger] has_field(*fa, k) ==> has_field(*fb, k))),
            _ => false,
        },
    }
}

/// Every field of `fb` is one of `fa`, which refines it.
pub open spec fn fields_le(fa: Fields, fb: Fields) -> bool
    decreases fb,
{
    match fb {
        Fields::Nil => true,
        Fields::Cons(k, tb, rest) => match lookup(fa, k) {
            Some(ta) => le(ta, *tb) && fields_le(fa, *rest),
            None => false,
        },
    }
}

/// `c` is the greatest type refining both `a` and `b`.
pub open spec fn glb(c: Ty, a: Ty, b: Ty) -> bool {
    &&& le(c, a)
    &&& le(c, b)
    &&& forall|d: Ty| #[trigger] le(d, a) && le(d, b) ==> le(d, c)
}

/// `d` refines the field `k` of `fa` and of `fb`, each that has it.
pub open spec fn below(d: Ty, fa: Fields, fb: Fields, k: u64) -> bool {
    &&& has_field(fa, k) ==> le(d, get(fa, k))
    &&& has_field(fb, k) ==> le(d, get(fb, k))
}

pub open spec fn field_glb(t: Ty, fa: Fields, fb: Fields, k: u64) -> bool {
    &&& below(t, fa, fb, k)
    &&& forall|d: Ty| #[trigger] below(d, fa, fb, k) ==> le(d, t)
}

/// A measure for the recursion.
pub open spec fn size(t: Ty) -> nat
    decreases t,
{
    match t {
        Ty::List(e) => size(*e) + 1,
        Ty::Record(fs, _) => size_fields(*fs) + 2,
        _ => 1,
    }
}

pub open spec fn size_fields(fs: Fields) -> nat
    decreases fs,
{
    match fs {
        Fields::Nil => 0,
        Fields::Cons(_, t, rest) => size(*t) + size_fields(*rest) + 1,
    }
}

// ---------------------------------------------------------------------------
// Lemmas
// ---------------------------------------------------------------------------

proof fn lemma_lookup_size(fs: Fields, k: u64)
    requires has_field(fs, k),
    ensures size(get(fs, k)) < size_fields(fs),
    decreases fs,
{
    if let Fields::Cons(k2, _, rest) = fs {
        if k2 != k {
            lemma_lookup_size(*rest, k);
        }
    }
}

proof fn lemma_wf_get(fs: Fields, k: u64)
    requires wf_fields(fs), has_field(fs, k),
    ensures wf(get(fs, k)),
    decreases fs,
{
    if let Fields::Cons(k2, _, rest) = fs {
        if k2 != k {
            lemma_wf_get(*rest, k);
        }
    }
}

/// With every field of `fb` named once, `fields_le` is field by field.
proof fn lemma_fields_le(fa: Fields, fb: Fields)
    requires wf_fields(fb),
    ensures fields_le(fa, fb) <==> forall|k: u64| #[trigger] has_field(fb, k) ==> has_field(fa, k) && le(get(fa, k), get(fb, k)),
    decreases fb,
{
    if let Fields::Cons(k, tb, rest) = fb {
        lemma_fields_le(fa, *rest);
        if fields_le(fa, fb) {
            assert forall|j: u64| #[trigger] has_field(fb, j) implies has_field(fa, j) && le(get(fa, j), get(fb, j)) by {
                if j != k {
                    assert(has_field(*rest, j));
                }
            }
        }
        if forall|j: u64| #[trigger] has_field(fb, j) ==> has_field(fa, j) && le(get(fa, j), get(fb, j)) {
            assert(has_field(fb, k));
            assert forall|j: u64| #[trigger] has_field(*rest, j) implies has_field(fa, j) && le(get(fa, j), get(*rest, j)) by {
                assert(j != k);
                assert(has_field(fb, j));
            }
        }
    }
}

proof fn lemma_le_refl(t: Ty)
    requires wf(t),
    ensures le(t, t),
    decreases size(t),
{
    match t {
        Ty::List(e) => lemma_le_refl(*e),
        Ty::Record(fs, _) => {
            lemma_fields_le(*fs, *fs);
            assert forall|k: u64| #[trigger] has_field(*fs, k) implies has_field(*fs, k) && le(get(*fs, k), get(*fs, k)) by {
                lemma_wf_get(*fs, k);
                lemma_lookup_size(*fs, k);
                lemma_le_refl(get(*fs, k));
            }
        },
        _ => {},
    }
}

// ---------------------------------------------------------------------------
// Executable reference
// ---------------------------------------------------------------------------

pub fn clone_ty(t: &Ty) -> (r: Ty)
    ensures r == *t,
    decreases t,
{
    match t {
        Ty::Any => Ty::Any,
        Ty::Atomic => Ty::Atomic,
        Ty::Number => Ty::Number,
        Ty::Str => Ty::Str,
        Ty::Bool => Ty::Bool,
        Ty::List(e) => Ty::List(Box::new(clone_ty(e))),
        Ty::Record(fs, open) => Ty::Record(Box::new(clone_fields(fs)), *open),
    }
}

pub fn clone_fields(fs: &Fields) -> (r: Fields)
    ensures r == *fs,
    decreases fs,
{
    match fs {
        Fields::Nil => Fields::Nil,
        Fields::Cons(k, t, rest) => Fields::Cons(*k, Box::new(clone_ty(t)), Box::new(clone_fields(rest))),
    }
}

fn find<'a>(fs: &'a Fields, k: u64) -> (r: Option<&'a Ty>)
    ensures
        match r {
            Some(t) => lookup(*fs, k) == Some(*t),
            None => !has_field(*fs, k),
        },
    decreases fs,
{
    match fs {
        Fields::Nil => None,
        Fields::Cons(k2, t, rest) => if *k2 == k { Some(&**t) } else { find(rest, k) },
    }
}

/// Every field of `fa` is one of `fb`.
fn subset(fa: &Fields, fb: &Fields) -> (r: bool)
    ensures r <==> forall|k: u64| #[trigger] has_field(*fa, k) ==> has_field(*fb, k),
    decreases fa,
{
    match fa {
        Fields::Nil => true,
        Fields::Cons(k, _, rest) => {
            let here = find(fb, *k).is_some();
            let rest_subset = subset(rest, fb);
            let r = here && rest_subset;
            proof {
                if !here {
                    assert(has_field(*fa, *k));
                }
                if r {
                    assert forall|j: u64| #[trigger] has_field(*fa, j) implies has_field(*fb, j) by {
                        if j != *k {
                            assert(has_field(**rest, j));
                        }
                    }
                }
                if !rest_subset {
                    let j = choose|j: u64| #[trigger] has_field(**rest, j) && !has_field(*fb, j);
                    if j != *k {
                        assert(has_field(*fa, j));
                    }
                }
            }
            r
        },
    }
}

/// The fields of `fb`, each intersected with that of `fa` when it has it.
fn merge(fa: &Fields, fb: &Fields) -> (r: Option<Fields>)
    requires wf_fields(*fa), wf_fields(*fb),
    ensures
        match r {
            Some(m) => {
                &&& wf_fields(m)
                &&& forall|k: u64| #[trigger] has_field(m, k) <==> has_field(*fb, k)
                &&& forall|k: u64| #[trigger] has_field(*fb, k) ==> field_glb(get(m, k), *fa, *fb, k)
            },
            None => exists|k: u64| #[trigger] has_field(*fb, k) && has_field(*fa, k) && forall|d: Ty| !#[trigger] below(d, *fa, *fb, k),
        },
    decreases size_fields(*fa) + size_fields(*fb),
{
    match fb {
        Fields::Nil => Some(Fields::Nil),
        Fields::Cons(k, tb, rest) => {
            let rest_m = match merge(fa, rest) {
                Some(m) => m,
                None => {
                    proof {
                        let j = choose|j: u64| #[trigger] has_field(**rest, j) && has_field(*fa, j) && forall|d: Ty| !#[trigger] below(d, *fa, **rest, j);
                        assert(j != *k);
                        assert forall|d: Ty| !#[trigger] below(d, *fa, *fb, j) by {
                            assert(!below(d, *fa, **rest, j));
                        }
                        assert(has_field(*fb, j));
                    }
                    return None;
                },
            };
            let t = match find(fa, *k) {
                Some(ta) => {
                    proof {
                        lemma_lookup_size(*fa, *k);
                        lemma_wf_get(*fa, *k);
                    }
                    match meet(ta, tb) {
                        Some(c) => c,
                        None => {
                            proof {
                                assert(has_field(*fb, *k) && has_field(*fa, *k));
                                assert forall|d: Ty| !#[trigger] below(d, *fa, *fb, *k) by {
                                    if below(d, *fa, *fb, *k) {
                                        assert(le(d, *ta) && le(d, **tb));
                                    }
                                }
                            }
                            return None;
                        },
                    }
                },
                None => {
                    proof {
                        lemma_le_refl(**tb);
                    }
                    clone_ty(tb)
                },
            };
            let m = Fields::Cons(*k, Box::new(t), Box::new(rest_m));
            proof {
                assert forall|j: u64| #[trigger] has_field(m, j) <==> has_field(*fb, j) by {
                    if j != *k {
                        assert(has_field(m, j) == has_field(rest_m, j));
                    }
                }
                assert forall|j: u64| #[trigger] has_field(*fb, j) implies field_glb(get(m, j), *fa, *fb, j) by {
                    if j != *k {
                        assert(has_field(**rest, j));
                        assert(field_glb(get(rest_m, j), *fa, **rest, j));
                        assert forall|d: Ty| #[trigger] below(d, *fa, *fb, j) implies le(d, get(m, j)) by {
                            assert(below(d, *fa, **rest, j));
                        }
                    } else {
                        assert forall|d: Ty| #[trigger] below(d, *fa, *fb, j) implies le(d, get(m, j)) by {
                            if has_field(*fa, j) {
                                assert(le(d, get(*fa, j)) && le(d, **tb));
                            }
                        }
                    }
                }
            }
            Some(m)
        },
    }
}

/// The fields of `fa` that `fb` does not have, then `m`.
fn add_missing(fa: &Fields, fb: &Fields, m: Fields) -> (r: Fields)
    requires
        wf_fields(*fa),
        wf_fields(m),
        forall|k: u64| #[trigger] has_field(m, k) <==> has_field(*fb, k),
    ensures
        wf_fields(r),
        forall|k: u64| #[trigger] has_field(r, k) <==> has_field(*fb, k) || has_field(*fa, k),
        forall|k: u64| #[trigger] has_field(m, k) ==> lookup(r, k) == lookup(m, k),
        forall|k: u64| #[trigger] has_field(*fa, k) && !has_field(*fb, k) ==> lookup(r, k) == lookup(*fa, k),
    decreases fa,
{
    match fa {
        Fields::Nil => m,
        Fields::Cons(k, ta, rest) => {
            let r = add_missing(rest, fb, m);
            if find(fb, *k).is_some() {
                proof {
                    assert forall|j: u64| #[trigger] has_field(r, j) <==> has_field(*fb, j) || has_field(*fa, j) by {
                        if j != *k {
                            assert(has_field(*fa, j) == has_field(**rest, j));
                        }
                    }
                    assert forall|j: u64| #[trigger] has_field(*fa, j) && !has_field(*fb, j) implies lookup(r, j) == lookup(*fa, j) by {
                        assert(j != *k);
                        assert(has_field(**rest, j));
                        assert(lookup(*fa, j) == lookup(**rest, j));
                    }
                }
                r
            } else {
                let out = Fields::Cons(*k, Box::new(clone_ty(ta)), Box::new(r));
                proof {
                    assert(!has_field(**rest, *k));
                    assert forall|j: u64| #[trigger] has_field(out, j) <==> has_field(*fb, j) || has_field(*fa, j) by {
                        if j != *k {
                            assert(has_field(*fa, j) == has_field(**rest, j));
                            assert(has_field(out, j) == has_field(r, j));
                        }
                    }
                    assert forall|j: u64| #[trigger] has_field(m, j) implies lookup(out, j) == lookup(m, j) by {
                        assert(j != *k);
                    }
                    assert forall|j: u64| #[trigger] has_field(*fa, j) && !has_field(*fb, j) implies lookup(out, j) == lookup(*fa, j) by {
                        if j != *k {
                            assert(has_field(**rest, j));
                            assert(lookup(*fa, j) == lookup(**rest, j));
                        }
                    }
                }
                out
            }
        },
    }
}

/// The intersection of `a` and `b`, if any type refines both.
pub fn meet(a: &Ty, b: &Ty) -> (r: Option<Ty>)
    requires wf(*a), wf(*b),
    ensures
        match r {
            Some(c) => wf(c) && glb(c, *a, *b),
            None => forall|d: Ty| !(#[trigger] le(d, *a) && le(d, *b)),
        },
    decreases size(*a) + size(*b),
{
    match (a, b) {
        (Ty::Any, _) => {
            proof {
                lemma_le_refl(*b);
            }
            Some(clone_ty(b))
        },
        (_, Ty::Any) => {
            proof {
                lemma_le_refl(*a);
            }
            Some(clone_ty(a))
        },
        (Ty::Bool, Ty::Bool) => Some(Ty::Bool),
        (Ty::Atomic, Ty::Atomic) => Some(Ty::Atomic),
        (Ty::Number, Ty::Number) | (Ty::Number, Ty::Atomic) | (Ty::Atomic, Ty::Number) => Some(Ty::Number),
        (Ty::Str, Ty::Str) | (Ty::Str, Ty::Atomic) | (Ty::Atomic, Ty::Str) => Some(Ty::Str),
        (Ty::List(ea), Ty::List(eb)) => match meet(ea, eb) {
            Some(c) => {
                let l = Ty::List(Box::new(c));
                proof {
                    assert forall|d: Ty| #[trigger] le(d, *a) && le(d, *b) implies le(d, l) by {
                        if let Ty::List(ed) = d {
                            assert(le(*ed, **ea) && le(*ed, **eb));
                        }
                    }
                }
                Some(l)
            },
            None => {
                proof {
                    assert forall|d: Ty| !(#[trigger] le(d, *a) && le(d, *b)) by {
                        if let Ty::List(ed) = d {
                            assert(!(le(*ed, **ea) && le(*ed, **eb)));
                        }
                    }
                }
                None
            },
        },
        (Ty::Record(fa, open_a), Ty::Record(fb, open_b)) => meet_records(fa, *open_a, fb, *open_b, Ghost(*a), Ghost(*b)),
        _ => None,
    }
}

fn meet_records(fa: &Fields, open_a: bool, fb: &Fields, open_b: bool, Ghost(a): Ghost<Ty>, Ghost(b): Ghost<Ty>) -> (r: Option<Ty>)
    requires
        a == Ty::Record(Box::new(*fa), open_a),
        b == Ty::Record(Box::new(*fb), open_b),
        wf(a),
        wf(b),
    ensures
        match r {
            Some(c) => wf(c) && glb(c, a, b),
            None => forall|d: Ty| !(#[trigger] le(d, a) && le(d, b)),
        },
    decreases size_fields(*fa) + size_fields(*fb) + 1,
{
    proof {
        lemma_fields_le_record(a, b);
    }
    // The fields a common refinement has: those of an opened record are a
    // floor, those of a closed one exactly its own.
    if !open_a && !subset(fb, fa) {
        proof {
            let k = choose|k: u64| #[trigger] has_field(*fb, k) && !has_field(*fa, k);
            assert forall|d: Ty| !(#[trigger] le(d, a) && le(d, b)) by {
                if le(d, a) && le(d, b) {
                    lemma_fields_le_record(d, a);
                    lemma_fields_le_record(d, b);
                }
            }
        }
        return None;
    }
    if !open_b && !subset(fa, fb) {
        proof {
            let k = choose|k: u64| #[trigger] has_field(*fa, k) && !has_field(*fb, k);
            assert forall|d: Ty| !(#[trigger] le(d, a) && le(d, b)) by {
                if le(d, a) && le(d, b) {
                    lemma_fields_le_record(d, a);
                    lemma_fields_le_record(d, b);
                }
            }
        }
        return None;
    }
    let merged = if open_a { merge(fa, fb) } else { merge(fb, fa) };
    let m = match merged {
        Some(m) => m,
        None => {
            proof {
                let (x, y) = if open_a { (*fa, *fb) } else { (*fb, *fa) };
                let k = choose|k: u64| #[trigger] has_field(y, k) && has_field(x, k) && forall|d: Ty| !#[trigger] below(d, x, y, k);
                assert forall|d: Ty| !(#[trigger] le(d, a) && le(d, b)) by {
                    if le(d, a) && le(d, b) {
                        lemma_fields_le_record(d, a);
                        lemma_fields_le_record(d, b);
                        if let Ty::Record(fd, _) = d {
                            assert(below(get(*fd, k), x, y, k));
                        }
                    }
                }
            }
            return None;
        },
    };
    let fields = if open_a && open_b { add_missing(fa, fb, m) } else { m };
    let c = Ty::Record(Box::new(fields), open_a && open_b);
    proof {
        assert forall|k: u64| #[trigger] has_field(fields, k) <==> has_field(*fa, k) || has_field(*fb, k) by {}
        // Each field of `c` is the greatest refining those of `a` and `b`.
        assert forall|k: u64| #[trigger] has_field(fields, k) implies field_glb(get(fields, k), *fa, *fb, k) by {
            if open_a && open_b {
                if has_field(*fb, k) {
                    assert(has_field(m, k));
                    assert(lookup(fields, k) == lookup(m, k));
                    assert(field_glb(get(m, k), *fa, *fb, k));
                } else {
                    assert(get(fields, k) == get(*fa, k));
                    lemma_wf_get(*fa, k);
                    lemma_le_refl(get(*fa, k));
                }
            } else if open_a {
                assert(has_field(*fb, k));
                assert(field_glb(get(m, k), *fa, *fb, k));
            } else {
                assert(has_field(*fa, k));
                assert(field_glb(get(m, k), *fb, *fa, k));
                assert(below(get(fields, k), *fa, *fb, k));
                assert forall|d: Ty| #[trigger] below(d, *fa, *fb, k) implies le(d, get(fields, k)) by {
                    assert(below(d, *fb, *fa, k));
                }
            }
        }
        lemma_fields_le_record(c, a);
        lemma_fields_le_record(c, b);
        assert forall|k: u64| #[trigger] has_field(*fa, k) implies has_field(fields, k) && le(get(fields, k), get(*fa, k)) by {
            assert(below(get(fields, k), *fa, *fb, k));
        }
        assert forall|k: u64| #[trigger] has_field(*fb, k) implies has_field(fields, k) && le(get(fields, k), get(*fb, k)) by {
            assert(below(get(fields, k), *fa, *fb, k));
        }
        assert(le(c, a));
        assert(le(c, b));
        assert forall|d: Ty| #[trigger] le(d, a) && le(d, b) implies le(d, c) by {
            lemma_fields_le_record(d, a);
            lemma_fields_le_record(d, b);
            lemma_fields_le_record(d, c);
            if let Ty::Record(fd, _) = d {
                assert forall|k: u64| #[trigger] has_field(fields, k) implies has_field(*fd, k) && le(get(*fd, k), get(fields, k)) by {
                    assert(below(get(*fd, k), *fa, *fb, k));
                }
            }
        }
    }
    Some(c)
}

// ---------------------------------------------------------------------------
// The lattice laws
// ---------------------------------------------------------------------------

/// Refinement is transitive: `le` is a preorder (with [`lemma_le_refl`]).
pub proof fn lemma_le_trans(a: Ty, b: Ty, c: Ty)
    requires wf(a), wf(b), wf(c), le(a, b), le(b, c),
    ensures le(a, c),
    decreases size(c),
{
    match c {
        Ty::List(ec) => {
            if let (Ty::List(ea), Ty::List(eb)) = (a, b) {
                lemma_le_trans(*ea, *eb, *ec);
            }
        },
        Ty::Record(fc, open_c) => {
            if let (Ty::Record(fa, open_a), Ty::Record(fb, _)) = (a, b) {
                lemma_fields_le_record(a, b);
                lemma_fields_le_record(b, c);
                lemma_fields_le_record(a, c);
                // Each field of `c` is a field of `b` (which refines it) and so
                // a field of `a`, whose type refines `b`'s, hence `c`'s.
                assert forall|k: u64| #[trigger] has_field(*fc, k) implies
                    has_field(*fa, k) && le(get(*fa, k), get(*fc, k)) by {
                    lemma_lookup_size(*fc, k);
                    lemma_wf_get(*fa, k);
                    lemma_wf_get(*fb, k);
                    lemma_wf_get(*fc, k);
                    lemma_le_trans(get(*fa, k), get(*fb, k), get(*fc, k));
                }
                // A closed `c` forced `b` closed with no extra fields, which
                // forced `a` closed with no fields outside `b`'s, hence none
                // outside `c`'s.
                assert(open_c || (!open_a && forall|k: u64|
                    #[trigger] has_field(*fa, k) ==> has_field(*fc, k)));
            }
        },
        _ => {},
    }
}

/// Two types refine each other: equal as far as refinement can tell.
pub open spec fn equiv(a: Ty, b: Ty) -> bool {
    le(a, b) && le(b, a)
}

/// What [`meet`] guarantees of its result — a greatest common refinement, or a
/// proof that none exists. Stating the laws over this lets every caller of the
/// proved `meet` inherit them.
pub open spec fn is_meet(r: Option<Ty>, a: Ty, b: Ty) -> bool {
    match r {
        Some(c) => wf(c) && glb(c, a, b),
        None => forall|d: Ty| !(#[trigger] le(d, a) && le(d, b)),
    }
}

/// The greatest common refinement is unique up to `equiv`.
pub proof fn lemma_glb_unique(c: Ty, c2: Ty, a: Ty, b: Ty)
    requires glb(c, a, b), glb(c2, a, b),
    ensures equiv(c, c2),
{
    assert(le(c, a) && le(c, b));
    assert(le(c2, a) && le(c2, b));
}

/// Intersection is commutative: `meet(a, b)` and `meet(b, a)` agree on whether
/// a common refinement exists, and it is the same type up to `equiv`.
pub proof fn lemma_meet_comm(r1: Option<Ty>, r2: Option<Ty>, a: Ty, b: Ty)
    requires is_meet(r1, a, b), is_meet(r2, b, a),
    ensures
        (r1 is Some) == (r2 is Some),
        r1 matches Some(c1) ==> (r2 matches Some(c2) ==> equiv(c1, c2)),
{
    match r1 {
        Some(c1) => {
            // `c1` refines both, so `meet(b, a)` cannot report "none".
            assert(le(c1, a) && le(c1, b));
            match r2 {
                Some(c2) => {
                    // `meet(b, a)` makes c2 a glb of (b, a) — the same as (a, b).
                    assert(glb(c2, a, b));
                    lemma_glb_unique(c1, c2, a, b);
                },
                None => assert(!(le(c1, b) && le(c1, a))),
            }
        },
        None => {
            match r2 {
                Some(c2) => {
                    assert(le(c2, b) && le(c2, a));
                    assert(!(le(c2, a) && le(c2, b)));
                },
                None => {},
            }
        },
    }
}

/// Intersection is idempotent: `meet(a, a)` is `a` (up to `equiv`).
pub proof fn lemma_meet_idem(r: Option<Ty>, a: Ty)
    requires wf(a), is_meet(r, a, a),
    ensures r is Some, r matches Some(c) ==> equiv(c, a),
{
    lemma_le_refl(a);
    // `a` is a greatest common refinement of `a` with itself.
    assert(glb(a, a, a));
    if let Some(c) = r {
        lemma_glb_unique(c, a, a, a);
    }
}

/// A type refines an intersection exactly when it refines both sides. The
/// defining universal property, specialized to the proved `meet`.
pub proof fn lemma_meet_lb(c: Ty, a: Ty, b: Ty, x: Ty)
    requires wf(a), wf(b), wf(c), wf(x), glb(c, a, b),
    ensures le(x, c) <==> (le(x, a) && le(x, b)),
{
    if le(x, c) {
        lemma_le_trans(x, c, a);
        lemma_le_trans(x, c, b);
    }
}

/// Intersection is monotone: refining one side refines the intersection.
pub proof fn lemma_meet_mono(c1: Ty, c2: Ty, a1: Ty, a2: Ty, b: Ty)
    requires
        wf(a1), wf(a2), wf(b), wf(c1), wf(c2),
        le(a1, a2), glb(c1, a1, b), glb(c2, a2, b),
    ensures le(c1, c2),
{
    // `c1` refines `a1`, hence `a2`, and refines `b`: a common refinement of
    // `a2` and `b`, so below their greatest, `c2`.
    assert(le(c1, a1) && le(c1, b));
    lemma_le_trans(c1, a1, a2);
}

/// Intersection is associative: `meet(meet(a, b), c)` and `meet(a, meet(b, c))`
/// agree on existence and, when both exist, are equal up to `equiv` — both are
/// the greatest refinement of all three.
pub proof fn lemma_meet_assoc(
    ab: Ty, bc: Ty, l: Option<Ty>, r: Option<Ty>, a: Ty, b: Ty, c: Ty,
)
    requires
        wf(a), wf(b), wf(c), wf(ab), wf(bc),
        glb(ab, a, b), glb(bc, b, c),
        is_meet(l, ab, c), is_meet(r, a, bc),
    ensures
        (l is Some) == (r is Some),
        l matches Some(cl) ==> (r matches Some(cr) ==> equiv(cl, cr)),
{
    // A lower bound of (ab, c) refines a, b and c, so it refines bc and is a
    // lower bound of (a, bc) — and symmetrically. So neither side is empty
    // without the other, and when both exist each is below the other.
    match l {
        Some(cl) => {
            lemma_meet_lb(ab, a, b, cl);
            lemma_meet_lb(bc, b, c, cl);
            assert(le(cl, a) && le(cl, bc));
            match r {
                Some(cr) => {
                    lemma_meet_lb(bc, b, c, cr);
                    lemma_meet_lb(ab, a, b, cr);
                    assert(le(cr, ab) && le(cr, c));
                    assert(le(cl, cr));
                    assert(le(cr, cl));
                },
                None => assert(!(le(cl, a) && le(cl, bc))),
            }
        },
        None => {
            match r {
                Some(cr) => {
                    lemma_meet_lb(bc, b, c, cr);
                    lemma_meet_lb(ab, a, b, cr);
                    assert(le(cr, ab) && le(cr, c));
                    assert(!(le(cr, ab) && le(cr, c)));
                },
                None => {},
            }
        },
    }
}

/// `le` for a record, field by field.
proof fn lemma_fields_le_record(d: Ty, r: Ty)
    requires r is Record, wf(r),
    ensures
        le(d, r) <==> match (d, r) {
            (Ty::Record(fd, open_d), Ty::Record(fr, open_r)) => {
                &&& forall|k: u64| #[trigger] has_field(*fr, k) ==> has_field(*fd, k) && le(get(*fd, k), get(*fr, k))
                &&& open_r || (!open_d && forall|k: u64| #[trigger] has_field(*fd, k) ==> has_field(*fr, k))
            },
            _ => false,
        },
{
    if let (Ty::Record(fd, _), Ty::Record(fr, _)) = (d, r) {
        lemma_fields_le(*fd, *fr);
    }
}

} // verus!
