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
    // (re-verifying vstd is slow and has crashed some CI runners).
    // One z3 thread: parallel solver processes exhaust the CI runner's memory
    // and die mid-query ("too many empty lines" / broken pipe).
    let output = cargo(&["verus", "focus"], &["--", "--num-threads", "1"]);
    let log = format!("{}{}", String::from_utf8_lossy(&output.stdout), String::from_utf8_lossy(&output.stderr));
    assert!(
        output.status.success(),
        "Verus did not verify the proofs (run shell/install-verus.sh if Verus is not installed):\n{log}"
    );
    assert!(log.contains(" 0 errors"), "Verus reported no verification results:\n{log}");
}
