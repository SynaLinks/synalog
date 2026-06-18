# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""Command-line interface for synalog, built on click and rich.

One-shot mode (like ``logica``):

    synalog program.l print Predicate ...   print compiled SQL
    synalog program.l run Predicate ...     execute and print a table
    synalog program.l run Predicate --csv   execute and print CSV

Both ``print`` and ``run`` validate the whole program first and abort with the
verifier's errors if it is invalid.

``-`` as the file reads the program from stdin; ``-c PROGRAM`` passes the
program text inline (like ``python -c``), replacing FILE. ``--engine``
overrides the program's ``@Engine`` annotation. ``--load table=path`` loads a
csv/tsv/json/jsonl/parquet file as a table before running. ``import
path.to.file.Pred;`` statements resolve ``path/to/file.l`` against the
program file's directory, then the current directory (override with
``--import-root``).

Interactive mode (like ``python``): run ``synalog`` with no arguments; the
options above also apply to the session.
"""

from __future__ import annotations

import csv
import json
import os
import re
import sys
import urllib.parse

import click
from rich import box
from rich.console import Console
from rich.syntax import Syntax
from rich.table import Table
from rich.text import Text

from . import __version__
from ._synalog import SUPPORTED_ENGINES, check, compile, parse, search
from .runners import RunnerUnavailable, run_sql

DEFAULT_ENGINE = "duckdb"

COMMANDS = ("print", "run")

out = Console()
err = Console(stderr=True)


def print_error(message: object) -> None:
    err.print(str(message), style="red", markup=False, highlight=False, soft_wrap=True)


def fail(message: object) -> None:
    print_error(message)
    sys.exit(1)


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------


def read_source(file: str) -> str:
    if file == "-":
        return sys.stdin.read()
    try:
        with open(file, encoding="utf-8") as f:
            return f.read()
    except OSError as e:
        fail(e)


def _dotenv_dirs(args: tuple[str, ...], inline: str | None) -> list[str]:
    """Directories to look for a `.env`: the program file's, then the cwd.

    When a FILE argument names a real file (not stdin, not an inline program,
    not a subcommand), its directory is the project root and wins; the current
    directory is always searched too so subcommands and `-c`/stdin still pick up
    a local `.env`.
    """
    dirs: list[str] = []
    if inline is None and args and args[0] != "-" and os.path.isfile(args[0]):
        dirs.append(os.path.dirname(os.path.abspath(args[0])))
    dirs.append(os.getcwd())
    return dirs


def import_roots(file: str | None, flag_roots: tuple[str, ...]) -> list[str]:
    """Directories where `import` statements look up .l files.

    Explicit --import-root flags win; otherwise the program file's directory
    and the current directory are searched, in that order.
    """
    if flag_roots:
        return list(flag_roots)
    roots = []
    if file and file != "-":
        roots.append(os.path.dirname(os.path.abspath(file)))
    roots.append(os.getcwd())
    return roots


def program_engine(source: str, roots: list[str]) -> str | None:
    """Return the engine declared via @Engine, or None."""
    ast = json.loads(parse(source, import_root=roots))
    for rule in ast.get("rule", []):
        head = rule.get("head", {})
        if head.get("predicate_name") != "@Engine":
            continue
        for field_value in head.get("record", {}).get("field_value", []):
            literal = (
                field_value.get("value", {}).get("expression", {}).get("literal", {})
            )
            name = literal.get("the_string", {}).get("the_string")
            if name:
                return name
    return None


def render_table(columns: list[str], rows: list[tuple]) -> Table:
    count = len(rows)
    table = Table(
        box=box.HEAVY_HEAD if out.is_terminal else box.ASCII2,
        caption=f"{count} row" + ("" if count == 1 else "s"),
        caption_justify="left",
    )
    for column in columns:
        table.add_column(column, overflow="fold")
    for row in rows:
        table.add_row(
            *(Text("null", style="dim") if v is None else Text(str(v)) for v in row)
        )
    return table


def print_sql(sql: str) -> None:
    if out.is_terminal:
        out.print(Syntax(sql, "sql", background_color="default"))
    else:
        click.echo(sql)


def _load_callback(ctx, param, value):
    loads = []
    for spec in value:
        table, sep, path = spec.partition("=")
        if not sep or not table or not path:
            raise click.BadParameter(f"expected TABLE=PATH, got '{spec}'")
        if not os.path.isfile(path):
            raise click.BadParameter(f"no such file: {path}")
        loads.append((table, path))
    return loads


# ---------------------------------------------------------------------------
# Saved connections (connect)
# ---------------------------------------------------------------------------

# Engines that connect over the network with a connection string. Local
# engines (sqlite, duckdb) build their connection from --load and take no DSN.
DSN_ENGINES = ("psql", "trino", "presto", "databricks", "bigquery")

_SECRET_QUERY_KEYS = {"access_token", "password", "token", "secret"}


def mask_dsn(dsn: str) -> str:
    """Hide credentials in a connection string for display."""
    try:
        parts = urllib.parse.urlsplit(dsn)
    except ValueError:
        return dsn
    if not parts.scheme:
        return dsn  # bare value (e.g. a bigquery project id)
    netloc = parts.netloc
    if "@" in netloc:
        userinfo, _, host = netloc.rpartition("@")
        if ":" in userinfo:
            user = userinfo.split(":", 1)[0]
            userinfo = f"{user}:***"
        elif userinfo:
            userinfo = "***"  # token-only userinfo (e.g. databricks)
        netloc = f"{userinfo}@{host}"
    query = parts.query
    if query:
        masked = [
            (k, "***" if k.lower() in _SECRET_QUERY_KEYS else v)
            for k, v in urllib.parse.parse_qsl(query, keep_blank_values=True)
        ]
        query = urllib.parse.urlencode(masked, safe="/")
    return urllib.parse.urlunsplit(
        (parts.scheme, netloc, parts.path, query, parts.fragment)
    )


def cmd_connect(args: tuple[str, ...]) -> int:
    """Manage saved connection strings for remote engines.

    \b
    synalog connect                     list saved connections (credentials hidden)
    synalog connect <engine> <dsn>      save a connection string for an engine
    synalog connect <engine>            show the saved connection for an engine
    synalog connect remove <engine>     forget a saved connection
    """
    from . import config

    if not args:
        connections = config.load_connections()
        if not connections:
            click.echo("No saved connections.")
            return 0
        for engine, dsn in sorted(connections.items()):
            click.echo(f"{engine}\t{mask_dsn(dsn)}")
        return 0

    if args[0] == "remove":
        if len(args) != 2:
            raise click.UsageError("usage: synalog connect remove <engine>")
        if config.remove_connection(args[1]):
            click.echo(f"Removed saved connection for {args[1]}.")
            return 0
        fail(f"No saved connection for {args[1]}.")

    engine = args[0]
    if engine not in DSN_ENGINES:
        fail(
            f"'{engine}' does not use a connection string;"
            f" engines that do: {', '.join(DSN_ENGINES)}"
        )
    if len(args) == 1:
        dsn = config.saved_connection(engine)
        if dsn is None:
            click.echo(f"No saved connection for {engine}.")
        else:
            click.echo(mask_dsn(dsn))
        return 0
    if len(args) > 2:
        raise click.UsageError("usage: synalog connect <engine> <dsn>")
    config.save_connection(engine, args[1])
    click.echo(f"Saved {engine} connection to {config.config_dir()}/connections.json")
    return 0


# ---------------------------------------------------------------------------
# Schema introspection (introspect)
# ---------------------------------------------------------------------------


def cmd_introspect(args: tuple[str, ...], dsn: str | None) -> int:
    """Print `# Tables` predicates learned from a database schema.

    \b
    synalog introspect <engine>          introspect the saved connection
    synalog introspect <engine> <dsn>    introspect an explicit connection string

    The DSN is resolved like everywhere else: the argument here (or --dsn) wins,
    then SYNALOG_<ENGINE>_DSN, then the saved connection. Output goes to stdout,
    so redirect it into a file:  synalog introspect psql > tables.l
    """
    from .introspect import INTROSPECTABLE, introspect

    if not args or len(args) > 2:
        raise click.UsageError("usage: synalog introspect <engine> [dsn]")
    engine = args[0]
    if engine not in INTROSPECTABLE:
        fail(
            f"'{engine}' cannot be introspected;"
            f" engines with a catalog: {', '.join(INTROSPECTABLE)}"
        )
    explicit = args[1] if len(args) > 1 else dsn
    try:
        text = introspect(engine, explicit)
    except (ValueError, RunnerUnavailable, OSError) as e:
        fail(e)
    except Exception as e:  # surface a driver/server error without a traceback
        fail(f"{type(e).__name__}: {e}")
    click.echo(text, nl=False)
    return 0


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------


@click.command()
@click.version_option(__version__, prog_name="synalog")
@click.argument("args", nargs=-1, metavar="[FILE] [COMMAND] [PREDICATES]...")
@click.option(
    "-c",
    "--command",
    "inline",
    metavar="PROGRAM",
    help="Pass the program text inline instead of FILE, like python -c.",
)
@click.option(
    "--engine",
    type=click.Choice(sorted(SUPPORTED_ENGINES)),
    help="Target SQL dialect (default: the program's @Engine,"
    f" else {DEFAULT_ENGINE}).",
)
@click.option("--limit", type=int, help="Limit result rows.")
@click.option("--offset", type=int, help="Skip result rows.")
@click.option(
    "--csv",
    "as_csv",
    is_flag=True,
    help="With run: print results as CSV instead of a rendered table.",
)
@click.option(
    "--search",
    "search_pattern",
    metavar="REGEX",
    help="With print/run: keep only rows where some column matches"
    " the regular expression REGEX (engine-native regex, not SQL LIKE).",
)
@click.option(
    "--dsn",
    help="Connection string for the remote engine (psql/trino/presto/databricks/"
    "bigquery); falls back to SYNALOG_<ENGINE>_DSN, then the saved connection.",
)
@click.option(
    "--import-root",
    "import_root",
    multiple=True,
    metavar="DIR",
    help="Directory where 'import' statements look up .l files (repeatable;"
    " default: the program file's directory, then the current directory).",
)
@click.option(
    "--load",
    "loads",
    multiple=True,
    metavar="TABLE=PATH",
    callback=_load_callback,
    help="Load a csv/tsv/json/jsonl/parquet file as TABLE before running"
    " (repeatable).",
)
def main(args, inline, engine, limit, offset, as_csv, search_pattern, dsn,
         import_root, loads):
    """Synalog: logic programming compiling to SQL.

    \b
    One-shot commands, in logica's FILE-first order:
      synalog program.l print Predicate ...   print compiled SQL
      synalog program.l run Predicate ...     execute and print a table
      synalog program.l run Predicate --csv   execute and print CSV
      synalog connect ENGINE DSN              save a remote engine connection
      synalog introspect ENGINE               print Tables predicates for a schema

    print and run validate the whole program first, aborting with the verifier's
    errors if it is invalid.

    Add --search REGEX to print/run to keep only rows where some
    column matches REGEX (engine-native regex, not a SQL LIKE pattern), e.g.
    'synalog program.l run Customers --search "(?i)acme"'.

    '-' as FILE reads the program from stdin; -c PROGRAM passes the program
    text inline instead of FILE. With no arguments, starts an interactive
    session (the options apply to it too).

    A '.env' file at the project root (the program file's directory, then the
    current directory) is loaded automatically; real environment variables take
    precedence over it.
    """
    from . import config

    config.load_dotenv(*_dotenv_dirs(args, inline))
    if args and args[0] == "connect" and inline is None:
        sys.exit(cmd_connect(args[1:]))
    if args and args[0] == "introspect" and inline is None:
        sys.exit(cmd_introspect(args[1:], dsn))
    if inline is None:
        if not args:
            sys.exit(Repl(engine, dsn, import_roots(None, import_root), loads).run())
        file = args[0]
        if len(args) < 2:
            raise click.UsageError(f"missing command (one of: {', '.join(COMMANDS)})")
        command, predicates = args[1], args[2:]
        source = read_source(file)
    else:
        if not args:
            raise click.UsageError(f"missing command (one of: {', '.join(COMMANDS)})")
        file, (command, predicates) = None, (args[0], args[1:])
        source = inline
    if command not in COMMANDS:
        if inline is not None and (command == "-" or os.path.exists(command)):
            raise click.UsageError("FILE and -c are mutually exclusive.")
        raise click.UsageError(
            f"unknown command '{command}' (one of: {', '.join(COMMANDS)})"
        )
    if inline is not None and predicates and os.path.exists(predicates[0]):
        raise click.UsageError("FILE and -c are mutually exclusive.")
    if not predicates:
        raise click.UsageError("Missing argument 'PREDICATES...'.")
    if as_csv and command != "run":
        raise click.UsageError("--csv applies to run only")

    roots = import_roots(file, import_root)

    def compile_pred(predicate: str, eng: str | None) -> str:
        """Compile a predicate to SQL, applying --search when given."""
        if search_pattern is not None:
            return search(
                source,
                predicate,
                search_pattern,
                limit=limit,
                offset=offset,
                engine=eng,
                import_root=roots,
            )
        return compile(
            source,
            predicate,
            limit=limit,
            offset=offset,
            engine=eng,
            import_root=roots,
        )

    def validate_or_fail(eng: str | None) -> None:
        """Run the verifier over the whole program; abort on any error."""
        errors = check(source, engine=eng, import_root=roots)
        if errors:
            for error in errors:
                print_error(error)
            sys.exit(1)

    try:
        if command == "print":
            validate_or_fail(engine)
            for predicate in predicates:
                sql = compile_pred(predicate, engine)
                print_sql(sql.rstrip(";\n") + ";")
        else:  # run
            resolved = engine or program_engine(source, roots) or DEFAULT_ENGINE
            validate_or_fail(resolved)
            for predicate in predicates:
                sql = compile_pred(predicate, resolved)
                columns, rows = run_sql(resolved, sql, dsn=dsn, loads=loads)
                if as_csv:
                    writer = csv.writer(sys.stdout)
                    writer.writerow(columns)
                    writer.writerows(rows)
                else:
                    out.print(render_table(columns, rows))
    except (ValueError, RunnerUnavailable, OSError) as e:
        fail(e)


# ---------------------------------------------------------------------------
# REPL
# ---------------------------------------------------------------------------

REPL_HELP = """\
Type a rule ending with ';' to add it to the program.
Type a predicate name to compile and run it.

Commands:
  .help              show this message
  .show              show the current program
  .sql <Pred>        print the SQL compiled for a predicate
  .search <Pred> <re> run <Pred>, keeping rows where a column matches regex <re>
  .engine <name>     switch engine ({engines})
  .load <tbl> <path> load a csv/tsv/json/jsonl/parquet file as a table
  .clear             discard the program and loaded tables
  .exit              leave (also Ctrl-D)
"""

_PREDICATE_QUERY = re.compile(r"^[A-Z][A-Za-z0-9_]*;?$")


class Repl:
    def __init__(
        self,
        engine: str | None,
        dsn: str | None,
        roots: list[str],
        loads: list[tuple[str, str]],
    ):
        self.statements: list[str] = []
        self.engine = engine or DEFAULT_ENGINE
        self.dsn = dsn
        self.roots = roots
        self.loads = list(loads)

    @property
    def source(self) -> str:
        return "\n".join(self.statements)

    def run(self) -> int:
        try:
            import readline  # noqa: F401  (line editing + history)
        except ImportError:
            pass

        out.print(
            f"Synalog {__version__} on [bold]{self.engine}[/bold]"
            " — type .help for help",
            highlight=False,
        )
        while True:
            try:
                line = input(">>> ")
            except EOFError:
                print()
                return 0
            except KeyboardInterrupt:
                print("\nKeyboardInterrupt")
                continue
            try:
                if not self.dispatch(line):
                    return 0
            except KeyboardInterrupt:
                print("\nKeyboardInterrupt")

    def dispatch(self, line: str) -> bool:
        """Handle one input line; returns False to leave the REPL."""
        stripped = line.strip()
        if not stripped:
            return True
        if stripped.startswith("."):
            return self.command(stripped)
        if _PREDICATE_QUERY.match(stripped):
            self.query(stripped.rstrip(";"))
            return True
        self.add_statement(self.read_statement(line))
        return True

    def read_statement(self, first_line: str) -> str:
        """Keep reading continuation lines until the statement ends with ';'."""
        lines = [first_line]
        while not lines[-1].rstrip().endswith(";"):
            try:
                lines.append(input("... "))
            except EOFError:
                print()
                break
        return "\n".join(lines)

    def add_statement(self, statement: str) -> None:
        candidate = self.source + "\n" + statement if self.statements else statement
        try:
            errors = check(candidate, engine=self.engine, import_root=self.roots)
        except ValueError as e:
            # An import is only "used" once a later rule references it; in an
            # interactive session that rule comes after, so defer this check.
            if "imported but not used" in str(e):
                self.statements.append(statement)
                return
            print_error(e)
            return
        if errors:
            for error in errors:
                print_error(error)
            return
        self.statements.append(statement)

    def query(self, predicate: str, pattern: str | None = None) -> None:
        try:
            if pattern is None:
                sql = compile(
                    self.source, predicate, engine=self.engine, import_root=self.roots
                )
            else:
                sql = search(
                    self.source,
                    predicate,
                    pattern,
                    engine=self.engine,
                    import_root=self.roots,
                )
            columns, rows = run_sql(self.engine, sql, dsn=self.dsn, loads=self.loads)
        except (ValueError, RunnerUnavailable, OSError) as e:
            print_error(e)
            return
        except Exception as e:  # driver errors: report, keep the session alive
            print_error(f"{type(e).__name__}: {e}")
            return
        out.print(render_table(columns, rows))

    def command(self, line: str) -> bool:
        name, _, argument = line.partition(" ")
        argument = argument.strip()
        if name in (".exit", ".quit"):
            return False
        if name == ".help":
            click.echo(REPL_HELP.format(engines=", ".join(SUPPORTED_ENGINES)), nl=False)
        elif name == ".show":
            for table, path in self.loads:
                click.echo(f"# loaded: {table} <- {path}")
            click.echo(self.source if self.statements else "(empty program)")
        elif name == ".sql":
            if not argument:
                print_error("usage: .sql <Predicate>")
            else:
                try:
                    print_sql(
                        compile(
                            self.source,
                            argument,
                            engine=self.engine,
                            import_root=self.roots,
                        )
                    )
                except ValueError as e:
                    print_error(e)
        elif name == ".search":
            predicate, _, pattern = argument.partition(" ")
            pattern = pattern.strip()
            if not predicate or not pattern:
                print_error("usage: .search <Predicate> <regex>")
            else:
                self.query(predicate, pattern)
        elif name == ".engine":
            if argument not in SUPPORTED_ENGINES:
                print_error(
                    f"unknown engine '{argument}';"
                    f" supported: {', '.join(SUPPORTED_ENGINES)}"
                )
            else:
                self.engine = argument
        elif name == ".load":
            table, _, path = argument.partition(" ")
            path = path.strip()
            if not table or not path:
                print_error("usage: .load <table> <path>")
            elif not os.path.exists(path):
                print_error(f"no such file: {path}")
            else:
                # replace an earlier load of the same table
                self.loads = [(t, p) for t, p in self.loads if t != table]
                self.loads.append((table, path))
        elif name == ".clear":
            self.statements = []
            self.loads = []
        else:
            print_error(f"unknown command '{name}' — try .help")
        return True


if __name__ == "__main__":
    main()
