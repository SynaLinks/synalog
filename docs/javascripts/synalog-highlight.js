/* Synalog code blocks, coloured and wrapped the way Synalemma shows them.
 *
 * zensical.toml sends the fences that hold Synalog source to
 * `<pre class="synalog"><code>`, untouched: Pygments has no Synalog lexer.
 * This script colours them with Synalemma's tokenizer, and formats lines
 * wider than LINE_WIDTH along the code, as Synalemma's wrapSynalog does:
 * after `:-` and after each atom of the body, then inside brackets, one
 * argument per line. Only whitespace changes, and only between tokens.
 * The block never wraps text itself; it scrolls sideways when narrower.
 *
 * The colours are in stylesheets/extra.css (`.syn-*`).
 */
(function () {
  "use strict";

  /** The line width the source is formatted to, in characters. */
  var LINE_WIDTH = 80;
  var INDENT = 2;
  var CLOSERS = { "(": ")", "[": "]", "{": "}" };
  var KEYWORDS = {};
  ["distinct", "if", "else", "in", "not", "and", "or", "true", "false", "null", "max", "min", "sum", "count", "avg", "list", "set", "array"].forEach(function (k) {
    KEYWORDS[k] = true;
  });

  // --- Tokenizer -----------------------------------------------------------

  function tokenize(code) {
    var tokens = [];
    var i = 0;
    var end;
    while (i < code.length) {
      var c = code[i];

      // Comments (# or ##)
      if (c === "#") {
        end = i;
        while (end < code.length && code[end] !== "\n") end++;
        tokens.push({ type: "comment", value: code.slice(i, end) });
        i = end;
        continue;
      }

      // Triple-quoted strings
      if (code.slice(i, i + 3) === '"""') {
        end = code.indexOf('"""', i + 3);
        end = end === -1 ? code.length : end + 3;
        tokens.push({ type: "string", value: code.slice(i, end) });
        i = end;
        continue;
      }

      // Strings (double or single quotes)
      if (c === '"' || c === "'") {
        end = i + 1;
        while (end < code.length && code[end] !== c) {
          if (code[end] === "\\") end++; // skip escaped chars
          end++;
        }
        if (end < code.length) end++; // include the closing quote
        tokens.push({ type: "string", value: code.slice(i, end) });
        i = end;
        continue;
      }

      // Directives (@OrderBy, @Limit, etc.)
      if (c === "@") {
        end = i + 1;
        while (end < code.length && /[a-zA-Z0-9_]/.test(code[end])) end++;
        tokens.push({ type: "directive", value: code.slice(i, end) });
        i = end;
        continue;
      }

      // Numbers
      if (/[0-9]/.test(c)) {
        end = i;
        while (end < code.length && /[0-9.]/.test(code[end])) end++;
        tokens.push({ type: "number", value: code.slice(i, end) });
        i = end;
        continue;
      }

      // Identifiers: keywords, predicates (PascalCase), variables
      if (/[a-zA-Z_]/.test(c)) {
        end = i;
        while (end < code.length && /[a-zA-Z0-9_]/.test(code[end])) end++;
        var word = code.slice(i, end);
        var type = KEYWORDS[word.toLowerCase()] ? "keyword" : /^[A-Z]/.test(word) ? "predicate" : "variable";
        tokens.push({ type: type, value: word });
        i = end;
        continue;
      }

      // Operators
      if (":-?+=!<>~".indexOf(c) !== -1) {
        end = i + 1;
        if ([":-", "?=", "+=", "==", "!=", ">=", "<="].indexOf(code.slice(i, i + 2)) !== -1) end = i + 2;
        tokens.push({ type: "operator", value: code.slice(i, end) });
        i = end;
        continue;
      }

      // Punctuation
      if ("()[]{},.;:|".indexOf(c) !== -1) {
        tokens.push({ type: "punctuation", value: c });
        i++;
        continue;
      }

      // Whitespace and other characters
      tokens.push({ type: "default", value: c });
      i++;
    }
    return tokens;
  }

  // --- Wrapping: Wadler's pretty printer -----------------------------------
  // A group is written on one line when it fits, else every break of the
  // group is taken.

  function text(value) {
    return { kind: "text", value: value };
  }

  function isSpace(value) {
    return value !== undefined && /^[ \t]+$/.test(value);
  }

  /** One line's tokens as a document: where it may break, and how deep. */
  function lineDoc(values) {
    var i = 0;
    function skipSpaces() {
      while (isSpace(values[i])) i++;
    }

    /** Items up to `closer` (left unread), or to the end of the line. */
    function items(closer) {
      var docs = [];
      while (i < values.length) {
        var value = values[i];
        if (value === closer) break;
        i++;
        if (Object.prototype.hasOwnProperty.call(CLOSERS, value)) {
          skipSpaces();
          var inner = items(CLOSERS[value]);
          var closed = values[i] === CLOSERS[value];
          if (closed) i++;
          if (!inner.length) {
            docs.push(text(closed ? value + CLOSERS[value] : value));
            continue;
          }
          var group = [text(value), { kind: "nest", by: INDENT, docs: [{ kind: "line", flat: "" }].concat(inner) }];
          if (closed) group.push({ kind: "line", flat: "" }, text(CLOSERS[value]));
          docs.push({ kind: "group", docs: group });
        } else if (value === ",") {
          docs.push(text(","));
          var spaced = isSpace(values[i]);
          skipSpaces();
          if (i < values.length && values[i] !== closer) docs.push({ kind: "line", flat: spaced ? " " : "" });
        } else if (value === ":-" && closer === null) {
          docs.push(text(":-"));
          skipSpaces();
          if (i < values.length) docs.push({ kind: "nest", by: INDENT, docs: [{ kind: "line", flat: " " }].concat(items(null)) });
        } else if (isSpace(value) && (values[i] === closer || i === values.length)) {
          // spaces before a closing bracket or at the end of the line: dropped
        } else {
          docs.push(text(value));
        }
      }
      return docs;
    }

    var indent = 0;
    while (isSpace(values[i])) indent += values[i++].length;
    var body = items(null);
    return { doc: { kind: "group", docs: [text(new Array(indent + 1).join(" ")), { kind: "nest", by: indent, docs: body }] }, indent: indent };
  }

  /** Whether `next`, then what follows it up to the next break taken, fits in `room`. */
  function fits(next, rest, room) {
    var stack = [next];
    var following = rest.length;
    while (room >= 0) {
      if (!stack.length) {
        if (following === 0) return true;
        stack.push(rest[--following]);
        continue;
      }
      var frame = stack.pop();
      var doc = frame[2];
      if (doc.kind === "text") room -= doc.value.length;
      else if (doc.kind === "line") {
        if (frame[1] === "break") return true;
        room -= doc.flat.length;
      } else {
        var by = doc.kind === "nest" ? doc.by : 0;
        for (var k = doc.docs.length - 1; k >= 0; k--) stack.push([frame[0] + by, frame[1], doc.docs[k]]);
      }
    }
    return false;
  }

  function layout(doc, width) {
    var out = "";
    var column = 0;
    var stack = [[0, "break", doc]];
    while (stack.length) {
      var frame = stack.pop();
      var indent = frame[0];
      var mode = frame[1];
      var current = frame[2];
      if (current.kind === "text") {
        out += current.value;
        column += current.value.length;
      } else if (current.kind === "line") {
        if (mode === "flat") {
          out += current.flat;
          column += current.flat.length;
        } else {
          out += "\n" + new Array(indent + 1).join(" ");
          column = indent;
        }
      } else {
        var by = current.kind === "nest" ? current.by : 0;
        var inner = current.kind === "group" && mode === "break" && fits([indent, "flat", current], stack, width - column) ? "flat" : mode;
        for (var k = current.docs.length - 1; k >= 0; k--) stack.push([indent + by, inner, current.docs[k]]);
      }
    }
    return out;
  }

  /** `tokens` as source no line of which is wider than `width`, where the code allows it. */
  function wrap(tokens, width) {
    var lines = [[]];
    tokens.forEach(function (token) {
      if (token.value === "\n") lines.push([]);
      else lines[lines.length - 1].push(token.value);
    });
    return lines
      .map(function (values) {
        var source = values.join("");
        if (
          source.length <= width ||
          values.some(function (value) {
            return value.indexOf("\n") !== -1;
          })
        )
          return source;
        var line = lineDoc(values);
        // A line indented past the width has no room to be laid out in.
        return line.indent + INDENT * 2 >= width ? source : layout(line.doc, width);
      })
      .join("\n");
  }

  // --- Rendering -----------------------------------------------------------

  function span(type, value) {
    var node = document.createElement("span");
    node.className = "syn-" + type;
    node.textContent = value;
    return node;
  }

  /** A file's `---` header (name, description), as written: it is not code. */
  function header(code, source) {
    var match = /^---\n[\s\S]*?\n---(?=\n|$)/.exec(source);
    if (!match) return source;
    match[0].split("\n").forEach(function (line, index) {
      if (index) code.appendChild(document.createTextNode("\n"));
      var key = /^([A-Za-z_][\w-]*)(:)(.*)$/.exec(line);
      if (!key) return code.appendChild(span("comment", line));
      code.appendChild(span("keyword", key[1]));
      code.appendChild(span("punctuation", key[2]));
      code.appendChild(span("string", key[3]));
    });
    return source.slice(match[0].length);
  }

  function highlight(code) {
    if (code.dataset.synalog) return;
    code.dataset.synalog = "done";
    var source = code.textContent.replace(/\n$/, "");
    code.textContent = "";
    var body = header(code, source);
    tokenize(wrap(tokenize(body), LINE_WIDTH)).forEach(function (token) {
      code.appendChild(token.type === "default" ? document.createTextNode(token.value) : span(token.type, token.value));
    });
  }

  function start() {
    document.querySelectorAll("pre.synalog > code").forEach(highlight);
  }

  // `navigation.instant` swaps the page body without refiring
  // DOMContentLoaded: `document$` fires on every page, when it is there.
  if (window.document$ && typeof window.document$.subscribe === "function") {
    window.document$.subscribe(start);
  } else {
    document.addEventListener("DOMContentLoaded", start);
  }
})();
