// In-browser Synalog playground: CodeMirror 6 editor + the compiler shipped to
// WebAssembly (docs/playground/pkg, built from src/wasm.rs). Loaded as a classic
// script on every page; it only does work when #synalog-playground is present.
//
// CodeMirror is loaded at runtime via dynamic import() of a single self-hosted
// bundle (docs/playground/vendor/codemirror.js, produced by
// shell/build-codemirror.sh). A single bundle is required: CodeMirror's
// extension system relies on instanceof, so every package must share ONE copy
// of @codemirror/state — fetching the component packages separately from a CDN
// loads multiple copies and throws "multiple instances of @codemirror/state".

(function () {
  // Capture this script's own URL now (document.currentScript is only valid
  // during initial evaluation) so we can resolve the wasm package relative to it,
  // regardless of which docs page embeds the playground.
  var SELF = document.currentScript && document.currentScript.src;

  // Cache-buster for the wasm + editor bundle. Bump on any rebuild of those
  // assets so the browser can never pair a stale cached glue (synalog.js) with a
  // freshly rebuilt synalog_bg.wasm — a mismatch shows up as
  // "WebAssembly.Table.get(): invalid address N in funcref table of size M".
  var ASSET_V = "20260613a";

  var DEFAULT_PROGRAM = [
    "# Tables",
    "Orders(order_id:, customer_id:, amount:, created_at:) :-",
    "  orders(order_id:, customer_id:, amount:, created_at:);",
    "",
    "# Concepts",
    "@OrderBy(Customer, \"customer_id\");",
    "Customer(customer_id:) distinct :- Orders(customer_id:);",
    "",
    "# Rules",
    "@OrderBy(CustomerRevenue, \"total\", \"desc\");",
    "CustomerRevenue(customer_id:, total? += amount) distinct :-",
    "  Orders(customer_id:, amount:);",
    "",
  ].join("\n");

  function start() {
    var root = document.getElementById("synalog-playground");
    if (!root || root.dataset.pgInit) return; // guard against double-init
    root.dataset.pgInit = "1";
    // Immediate placeholder so the pane is not blank while the wasm compiler
    // (~2.5 MB) and editor bundle download; boot() clears it once mounted.
    root.classList.add("pg");
    root.innerHTML = '<p class="pg-loading">Loading the Synalog compiler…</p>';
    boot(root).catch(function (e) {
      root.innerHTML =
        '<p class="pg-fatal">Failed to load the playground: ' +
        String(e && e.message ? e.message : e) +
        "</p>";
    });
  }

  // zensical/Material ships `navigation.instant`, which swaps the page body
  // without refiring DOMContentLoaded. Subscribe to the `document$` observable
  // so the playground also initialises when reached via instant navigation;
  // fall back to DOMContentLoaded when the observable is absent.
  if (typeof window !== "undefined" && window.document$ && typeof window.document$.subscribe === "function") {
    window.document$.subscribe(start);
  } else {
    document.addEventListener("DOMContentLoaded", start);
  }

  async function boot(root) {
    // CodeMirror is loaded from a single SELF-HOSTED bundle (built by
    // shell/build-codemirror.sh into docs/playground/vendor/codemirror.js).
    // This is deliberate: pulling the component packages individually from a
    // CDN gives multiple @codemirror/state copies, and CodeMirror's extension
    // system relies on instanceof — so a single bundle is the only robust way
    // to guarantee one state instance. It also makes the docs work offline.
    var base = SELF || window.location.href;
    var cmUrl = new URL("../playground/vendor/codemirror.js?v=" + ASSET_V, base).href;

    var loaded = await Promise.all([import(cmUrl), loadWasm()]);
    var cm = loaded[0];
    var wasm = loaded[1];

    var EditorView = cm.EditorView;
    var EditorState = cm.EditorState;
    var StreamLanguage = cm.StreamLanguage;
    var HighlightStyle = cm.HighlightStyle;
    var syntaxHighlighting = cm.syntaxHighlighting;
    var t = cm.tags;

    // A compact stand-in for `basicSetup`: line numbers, history, bracket
    // matching, active-line highlight, code folding and the default keymaps.
    function baseSetup() {
      return [
        cm.lineNumbers(),
        cm.highlightActiveLineGutter(),
        cm.highlightActiveLine(),
        cm.drawSelection(),
        cm.history(),
        cm.indentOnInput(),
        cm.bracketMatching(),
        cm.foldGutter(),
        syntaxHighlighting(cm.defaultHighlightStyle, { fallback: true }),
        cm.keymap.of(
          [].concat(cm.defaultKeymap, cm.historyKeymap, [cm.indentWithTab])
        ),
      ];
    }

    // --- Synalog syntax mode ----------------------------------------------
    var KEYWORDS = /^(distinct|in|is|not|null|if|then|else|import|as|true|false)\b/;
    var synalog = StreamLanguage.define({
      name: "synalog",
      token: function (stream) {
        if (stream.match(/##.*/)) return "docComment";
        if (stream.match(/#.*/)) return "comment";
        if (stream.match(/"(?:[^"\\]|\\.)*"/)) return "string";
        if (stream.match(/@[A-Za-z_]\w*/)) return "meta"; // directive
        if (stream.match(KEYWORDS)) return "keyword";
        if (stream.match(/[A-Z]\w*/)) return "typeName"; // predicate / concept
        if (stream.match(/[a-z_]\w*(?=\s*:)/)) return "propertyName"; // named arg
        if (stream.match(/[0-9]+(\.[0-9]+)?/)) return "number";
        if (stream.match(/:-|\+\+|[+\-*/^%=<>!&|~?,.()[\]{}:]/)) return "operator";
        stream.next();
        return null;
      },
    });

    var highlight = HighlightStyle.define([
      { tag: t.comment, color: "var(--pg-comment)", fontStyle: "italic" },
      { tag: t.docComment, color: "var(--pg-doc)", fontStyle: "italic" },
      { tag: t.string, color: "var(--pg-string)" },
      { tag: t.number, color: "var(--pg-number)" },
      { tag: t.keyword, color: "var(--pg-keyword)", fontWeight: "600" },
      { tag: t.meta, color: "var(--pg-directive)", fontWeight: "600" },
      { tag: t.typeName, color: "var(--pg-predicate)" },
      { tag: t.propertyName, color: "var(--pg-arg)" },
      { tag: t.operator, color: "var(--pg-operator)" },
    ]);

    // --- DOM scaffold ------------------------------------------------------
    root.classList.add("pg");
    root.innerHTML = "";

    var toolbar = el("div", "pg-toolbar");
    var engineSel = el("select", "pg-select");
    engineSel.title = "Target SQL engine";
    var predSel = el("select", "pg-select");
    predSel.title = "Predicate to compile";
    var verifyWrap = el("label", "pg-toggle");
    var verifyBox = document.createElement("input");
    verifyBox.type = "checkbox";
    verifyWrap.appendChild(verifyBox);
    verifyWrap.appendChild(document.createTextNode(" Verify"));
    var runBtn = el("button", "pg-run");
    runBtn.textContent = "Compile";
    // "Explain" hands the current program off to an AI chat (Claude / ChatGPT),
    // mirroring the docs' Summarize button. Built once boot() has wired up the
    // editor so its click handler can read the live source/engine/SQL.
    var explainWrap = buildExplainMenu(function () {
      return buildExplainPrompt(source(), engine(), sqlView, outPane);
    });
    toolbar.appendChild(labeled("Engine", engineSel));
    toolbar.appendChild(labeled("Predicate", predSel));
    toolbar.appendChild(verifyWrap);
    toolbar.appendChild(explainWrap);
    toolbar.appendChild(runBtn);

    var panes = el("div", "pg-panes");
    var editorPane = el("div", "pg-pane pg-editor");
    var outPane = el("div", "pg-pane pg-output");
    // caption + scroll container per pane (editor on top, SQL below)
    var editorScroll = el("div", "pg-scroll");
    var outScroll = el("div", "pg-scroll");
    editorPane.appendChild(caption("Synalog"));
    editorPane.appendChild(editorScroll);
    outPane.appendChild(caption("Compiled SQL"));
    outPane.appendChild(outScroll);
    panes.appendChild(editorPane);
    panes.appendChild(outPane);

    root.appendChild(toolbar);
    root.appendChild(panes);

    // populate engines (duckdb first — it is the default)
    var engines = wasm.supported_engines();
    engines.sort(function (a, b) {
      if (a === "duckdb") return -1;
      if (b === "duckdb") return 1;
      return a.localeCompare(b);
    });
    engines.forEach(function (e) {
      var o = document.createElement("option");
      o.value = o.textContent = e;
      engineSel.appendChild(o);
    });

    // --- editor ------------------------------------------------------------
    var view = new EditorView({
      parent: editorScroll,
      state: EditorState.create({
        doc: DEFAULT_PROGRAM,
        extensions: [
          baseSetup(),
          synalog,
          syntaxHighlighting(highlight),
          EditorView.lineWrapping,
        ],
      }),
    });

    // read-only SQL view
    var sqlView = new EditorView({
      parent: outScroll,
      state: EditorState.create({
        doc: "",
        extensions: [
          baseSetup(),
          cm.sql(),
          syntaxHighlighting(highlight),
          EditorView.lineWrapping,
          EditorState.readOnly.of(true),
          EditorView.editable.of(false),
        ],
      }),
    });

    function source() {
      return view.state.doc.toString();
    }
    function engine() {
      return engineSel.value || "";
    }
    function setSql(text, isError) {
      outPane.classList.toggle("pg-has-error", !!isError);
      sqlView.dispatch({
        changes: { from: 0, to: sqlView.state.doc.length, insert: text },
      });
    }

    // refresh the predicate dropdown from the current source; returns true on
    // a clean parse so callers can decide whether to also compile.
    function refreshPredicates() {
      var prev = predSel.value;
      var names;
      try {
        names = wasm.predicates(source(), engine());
      } catch (e) {
        return false; // parse error — leave the picker as-is
      }
      predSel.innerHTML = "";
      names.forEach(function (n) {
        var o = document.createElement("option");
        o.value = o.textContent = n;
        predSel.appendChild(o);
      });
      if (names.indexOf(prev) !== -1) predSel.value = prev;
      return true;
    }

    function run() {
      var pred = predSel.value;
      if (!pred) {
        if (!refreshPredicates()) {
          // surface the parse error by attempting a compile anyway
          try {
            wasm.predicates(source(), engine());
          } catch (e) {
            setSql(String(e.message || e), true);
            return;
          }
        }
        pred = predSel.value;
        if (!pred) {
          setSql("-- No predicates defined.", true);
          return;
        }
      }

      if (verifyBox.checked) {
        var errors;
        try {
          errors = wasm.check(source(), engine());
        } catch (e) {
          setSql(String(e.message || e), true);
          return;
        }
        if (errors.length) {
          setSql(
            errors
              .map(function (m) {
                return "-- ✗ " + m;
              })
              .join("\n"),
            true
          );
          return;
        }
      }

      try {
        setSql(wasm.compile(source(), pred, engine()), false);
      } catch (e) {
        setSql(String(e.message || e), true);
      }
    }

    // --- events ------------------------------------------------------------
    runBtn.addEventListener("click", run);
    engineSel.addEventListener("change", function () {
      refreshPredicates();
      run();
    });
    predSel.addEventListener("change", run);
    verifyBox.addEventListener("change", run);

    // recompute predicates as you type (debounced); does not auto-compile so
    // typing stays cheap and the SQL pane is not flickering on every keystroke.
    var debounce;
    view.dom.addEventListener("keyup", function () {
      clearTimeout(debounce);
      debounce = setTimeout(refreshPredicates, 300);
    });
    // Ctrl/Cmd-Enter compiles
    view.dom.addEventListener("keydown", function (ev) {
      if ((ev.ctrlKey || ev.metaKey) && ev.key === "Enter") {
        ev.preventDefault();
        run();
      }
    });

    refreshPredicates();
    run();
  }

  // Resolve and initialise the wasm-bindgen module relative to this script.
  // Memoised: the wasm-bindgen init() must run exactly ONCE per page lifetime.
  // With zensical's instant navigation the script is not re-evaluated but boot()
  // runs again on each visit; calling init() a second time re-grows the already
  // populated externref table past its maximum and throws
  // "WebAssembly.Table.grow(): failed to grow table by 4".
  var wasmPromise = null;
  function loadWasm() {
    if (wasmPromise) return wasmPromise;
    wasmPromise = (async function () {
      var base = SELF || window.location.href;
      // javascripts/playground.js -> ../playground/pkg/synalog.js
      var glueUrl = new URL("../playground/pkg/synalog.js?v=" + ASSET_V, base).href;
      var mod = await import(glueUrl);
      // Pass the wasm URL explicitly (same cache-buster) — otherwise the glue
      // resolves synalog_bg.wasm relative to its own URL and drops the query,
      // which could load a stale binary that mismatches the glue.
      var wasmUrl = new URL("../playground/pkg/synalog_bg.wasm?v=" + ASSET_V, base).href;
      await mod.default({ module_or_path: wasmUrl });
      return mod;
    })();
    return wasmPromise;
  }

  function el(tag, cls) {
    var n = document.createElement(tag);
    if (cls) n.className = cls;
    return n;
  }
  function labeled(text, node) {
    var w = el("span", "pg-field");
    var l = el("span", "pg-label");
    l.textContent = text;
    w.appendChild(l);
    w.appendChild(node);
    return w;
  }
  function caption(text) {
    var c = el("div", "pg-caption");
    c.textContent = text;
    return c;
  }

  // AI chat targets for the "Explain" button. Favicons are served via
  // DuckDuckGo's icon proxy — hot-linking claude.ai / chatgpt.com directly is
  // unreliable behind their Cloudflare bot-mitigation (same rationale as
  // javascripts/summarize.js).
  var AI_PROVIDERS = [
    {
      name: "Claude",
      icon: "https://icons.duckduckgo.com/ip3/claude.ai.ico",
      buildUrl: function (prompt) {
        return "https://claude.ai/new?q=" + encodeURIComponent(prompt);
      },
    },
    {
      name: "ChatGPT",
      icon: "https://icons.duckduckgo.com/ip3/chatgpt.com.ico",
      buildUrl: function (prompt) {
        return "https://chatgpt.com/?q=" + encodeURIComponent(prompt);
      },
    },
  ];

  // Compose the chat prompt from the live editor state: the Synalog program,
  // the selected engine, and the compiled SQL when the last compile succeeded.
  function buildExplainPrompt(src, eng, sqlView, outPane) {
    var prompt =
      "I'm working with Synalog, a Datalog-style logic language that compiles " +
      "to SQL. Please explain, step by step and in clear language, what the " +
      "following Synalog program does — the concepts and rules it defines and " +
      "the result it produces.\n\n" +
      "Target SQL engine: " +
      (eng || "(default)") +
      "\n\nSynalog program:\n```\n" +
      src +
      "\n```\n";
    var sql = sqlView.state.doc.toString();
    // Skip the SQL block when the pane is showing a compile/verify error or is
    // empty, so we never feed an error message to the model as if it were SQL.
    if (sql && !outPane.classList.contains("pg-has-error")) {
      prompt += "\nWhich Synalog compiles to this SQL:\n```sql\n" + sql + "\n```\n";
    }
    return prompt;
  }

  // Build the "Explain" pill plus its provider dropdown. getPrompt is called
  // lazily on each provider click so it always reflects the current editor.
  function buildExplainMenu(getPrompt) {
    var wrap = el("div", "pg-explain");

    var button = el("button", "pg-explain-btn");
    button.type = "button";
    button.setAttribute("aria-label", "Explain with AI");
    button.setAttribute("title", "Explain this program with an AI chat");
    button.innerHTML =
      "<span>Explain</span>" +
      '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="currentColor" aria-hidden="true">' +
      '<path d="M7.5 5.6 10 7 8.6 4.5 10 2 7.5 3.4 5 2l1.4 2.5L5 7zm12 9.8L17 14l1.4 2.5L17 19l2.5-1.4L22 19l-1.4-2.5L22 14zM22 2l-2.5 1.4L17 2l1.4 2.5L17 7l2.5-1.4L22 7l-1.4-2.5zm-7.63 5.29c-.39-.39-1.02-.39-1.41 0L1.29 18.96c-.39.39-.39 1.02 0 1.41l2.34 2.34c.39.39 1.02.39 1.41 0L16.7 11.05c.39-.39.39-1.02 0-1.41zm-1.03 5.49-2.12-2.12 2.44-2.44 2.12 2.12z"/>' +
      "</svg>";

    var dropdown = el("div", "pg-explain-dropdown");
    dropdown.style.display = "none";

    AI_PROVIDERS.forEach(function (provider) {
      var option = el("a", "pg-explain-option");
      option.href = "#";
      option.innerHTML =
        '<img src="' +
        provider.icon +
        '" alt="" width="18" height="18" />' +
        "<span>" +
        provider.name +
        "</span>";
      option.addEventListener("click", function (e) {
        e.preventDefault();
        e.stopPropagation();
        window.open(provider.buildUrl(getPrompt()), "_blank", "noopener");
        dropdown.style.display = "none";
      });
      dropdown.appendChild(option);
    });

    button.addEventListener("click", function (e) {
      e.stopPropagation();
      dropdown.style.display =
        dropdown.style.display === "flex" ? "none" : "flex";
    });
    document.addEventListener("click", function () {
      dropdown.style.display = "none";
    });

    wrap.appendChild(button);
    wrap.appendChild(dropdown);
    return wrap;
  }
})();
