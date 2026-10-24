//! The proofs of `synalog_verified` hold: Verus checks them, the graph
//! algorithms the verifier and the compiler call included.
//!
//! Needs Verus on the PATH: `shell/install-verus.sh` installs it.
use std::process::Command;

#[test]
fn verus_proofs_hold() {
    let manifest = concat!(env!("CARGO_MANIFEST_DIR"), "/verified/Cargo.toml");
    // Its own target directory, and none of the toolchain this test runs
    // under: Verus uses the toolchain its release requires.
    // `cargo_args` go to cargo (before any `--`); `verus_args` go to verus
    // after `--`, so `--manifest-path` reaches cargo, not verus.
    let cargo = |cargo_args: &[&str], verus_args: &[&str]| {
        Command::new("cargo")
            .args(cargo_args)
            .args(["--manifest-path", manifest])
            .args(verus_args)
            .env("CARGO_TARGET_DIR", concat!(env!("CARGO_MANIFEST_DIR"), "/target/verus"))
            .env_remove("RUSTUP_TOOLCHAIN")
            .env_remove("RUSTC")
            .env_remove("RUSTC_WRAPPER")
            .env_remove("RUSTFLAGS")
            .env_remove("CARGO")
            .output()
            .expect("cargo runs")
    };
    // Cargo would skip a crate it built already, and Verus with it.
    cargo(&["clean", "-p", "synalog-verified"], &[]);
    // `focus` verifies this crate only, not the pre-verified vstd dependency
    // (re-verifying vstd is slow). One z3 thread keeps peak memory low.
    let output = cargo(&["verus", "focus"], &["--", "--num-threads", "1"]);
    let log = format!("{}{}", String::from_utf8_lossy(&output.stdout), String::from_utf8_lossy(&output.stderr));
    let verified = log.lines().any(|l| l.contains("verification results") && l.contains("0 errors"));
    assert!(
        output.status.success() && verified,
        "Verus did not verify the proofs (install it with shell/install-verus.sh; \
         its bundled z3 needs GLIBC 2.38 / GLIBCXX 3.4.32):\n{log}"
    );
}
