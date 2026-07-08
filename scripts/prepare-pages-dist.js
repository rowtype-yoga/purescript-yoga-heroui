import { existsSync, mkdirSync, readdirSync, readFileSync, rmSync, statSync, writeFileSync } from "node:fs";
import { basename, join } from "node:path";
import { pathToFileURL } from "node:url";
import { build } from "vite";
import { parseAst } from "rollup/parseAst";
import tailwindcss from "@tailwindcss/vite";

const distDir = "dist";
const depsDir = join(distDir, "deps");
const userDir = join(distDir, "user");
const cacheKey = process.env.GITHUB_SHA || String(Date.now());
const productionDefines = { "process.env.NODE_ENV": JSON.stringify("production") };

mkdirSync(userDir, { recursive: true });
mkdirSync(depsDir, { recursive: true });
await buildHeroStyles();
await buildDependencyBundles();

patchFile(join(distDir, "index.html"), patchIndexHtml);

for (const path of walk(distDir)) {
  if (!path.endsWith(".js")) continue;
  if (isYogaStoriesBrowserFile(path)) {
    patchFile(path, patchJavaScript);
  }
  if (isOutputFile(path)) {
    patchFile(path, patchOutputDependencyImports);
  }
  if (isDependencyFile(path)) {
    patchFile(path, patchDependencyImports);
  }
}

assertBrowserModuleGraph();
await assertBrowserModulesLink();

async function buildHeroStyles() {
  if (!existsSync("heroui-styles.css")) return;
  await build({
    configFile: false,
    plugins: [tailwindcss()],
    build: {
      outDir: userDir,
      emptyOutDir: false,
      rollupOptions: {
        input: "heroui-styles.css",
        output: { assetFileNames: "[name][extname]" }
      }
    }
  });
}

async function buildDependencyBundles() {
  const entryDir = ".tmp-pages-deps";
  rmSync(entryDir, { recursive: true, force: true });
  mkdirSync(entryDir, { recursive: true });

  writeFileSync(join(entryDir, "heroui.js"), "export * from \"@heroui/react\";\n");
  writeFileSync(join(entryDir, "react-dom.js"), reactDomEntry());
  writeFileSync(join(entryDir, "react-dom-client.js"), reactDomClientEntry());
  writeFileSync(join(entryDir, "react-dom-server.js"), reactDomServerEntry());

  await build({
    configFile: false,
    define: productionDefines,
    build: {
      outDir: depsDir,
      emptyOutDir: false,
      lib: {
        entry: { heroui: join(entryDir, "heroui.js") },
        formats: ["es"]
      },
      rollupOptions: {
        external: ["react", "react-dom", "react-dom/client", "react-dom/server"],
        onwarn: ignoreClientDirectiveWarning,
        output: { entryFileNames: "[name].js", chunkFileNames: "[name]-[hash].js" }
      }
    }
  });

  await build({
    configFile: false,
    define: productionDefines,
    build: {
      outDir: depsDir,
      emptyOutDir: false,
      lib: {
        entry: {
          "react-dom": join(entryDir, "react-dom.js"),
          "react-dom-client": join(entryDir, "react-dom-client.js"),
          "react-dom-server": join(entryDir, "react-dom-server.js")
        },
        formats: ["es"]
      },
      rollupOptions: {
        external: ["react"],
        onwarn: ignoreClientDirectiveWarning,
        output: { entryFileNames: "[name].js", chunkFileNames: "[name]-[hash].js" }
      }
    }
  });

  writeReactShim();
  rmSync(entryDir, { recursive: true, force: true });
}

function reactDomEntry() {
  return dependencyEntry("ReactDOM", "react-dom", [
    "__DOM_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE",
    "createPortal",
    "flushSync",
    "preconnect",
    "prefetchDNS",
    "preinit",
    "preinitModule",
    "preload",
    "preloadModule",
    "requestFormReset",
    "unstable_batchedUpdates",
    "useFormState",
    "useFormStatus",
    "version"
  ]);
}

function reactDomClientEntry() {
  return dependencyEntry("ReactDOMClient", "react-dom/client", [
    "createRoot",
    "hydrateRoot",
    "version"
  ]);
}

function reactDomServerEntry() {
  return dependencyEntry("ReactDOMServer", "react-dom/server", [
    "renderToReadableStream",
    "renderToStaticMarkup",
    "renderToString",
    "resume",
    "version"
  ]);
}

function dependencyEntry(namespace, specifier, exportNames) {
  const exports = exportNames.map(name => `export const ${name} = ${namespace}.${name};`).join("\n");
  return `import * as ${namespace} from \"${specifier}\";\nexport default ${namespace}.default ?? ${namespace};\n${exports}\n`;
}

function ignoreClientDirectiveWarning(warning, warn) {
  if (warning.code === "MODULE_LEVEL_DIRECTIVE") return;
  warn(warning);
}

function writeReactShim() {
  const reactChunk = findReactChunk();
  const reactModulePath = `../assets/${reactChunk}?v=${cacheKey}`;
  const namedExports = [
    "Activity",
    "Children",
    "Component",
    "Fragment",
    "Profiler",
    "PureComponent",
    "StrictMode",
    "Suspense",
    "__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE",
    "__COMPILER_RUNTIME",
    "act",
    "cache",
    "cacheSignal",
    "captureOwnerStack",
    "cloneElement",
    "createContext",
    "createElement",
    "createRef",
    "forwardRef",
    "isValidElement",
    "lazy",
    "memo",
    "startTransition",
    "unstable_useCacheRefresh",
    "use",
    "useActionState",
    "useCallback",
    "useContext",
    "useDebugValue",
    "useDeferredValue",
    "useEffect",
    "useEffectEvent",
    "useId",
    "useImperativeHandle",
    "useInsertionEffect",
    "useLayoutEffect",
    "useMemo",
    "useOptimistic",
    "useReducer",
    "useRef",
    "useState",
    "useSyncExternalStore",
    "useTransition",
    "version"
  ];
  const exportLines = namedExports.map(name => `export const ${name} = ReactModule.${name};`).join("\n");
  writeFileSync(
    join(depsDir, "react.js"),
    `import { r as ReactModule, R as ReactDefault } from "${reactModulePath}";\nexport default ReactDefault;\n${exportLines}\n`
  );
}

function findReactChunk() {
  for (const path of walk(join(distDir, "assets"))) {
    if (!path.endsWith(".js")) continue;
    const text = readFileSync(path, "utf8");
    if (text.includes("react.transitional.element") && text.includes(" as r")) {
      return basename(path);
    }
  }
  throw new Error("Could not find the Vite React chunk in dist/assets");
}

function patchIndexHtml(text) {
  return text
    .replace(
      /<script type="module" src="(?:\.\/|\/)user\/yoga-stories-head\.js"><\/script>/g,
      '<link rel="stylesheet" href="./user/heroui-styles.css">'
    )
    .replace(/(src|href)="(\.\/(?:assets|user)\/[^"?]+)"/g, `$1="$2?v=${cacheKey}"`);
}

function isYogaStoriesBrowserFile(path) {
  const normalized = normalizePath(path);
  return normalized.startsWith(`${distDir}/assets/`)
    || normalized.startsWith(`${distDir}/output/YogaStories.UI.Client/`);
}

function isOutputFile(path) {
  return normalizePath(path).startsWith(`${distDir}/output/`);
}

function isDependencyFile(path) {
  return normalizePath(path).startsWith(`${distDir}/deps/`);
}

function patchJavaScript(text) {
  return text
    .replace(/(["'])\.\/(index-[A-Za-z0-9_-]+\.js)\1/g, `$1./$2?v=${cacheKey}$1`)
    .replaceAll("\"/stories.json\"", "new URL(\"./stories.json\", document.baseURI).href")
    .replaceAll("'/stories.json'", "new URL(\"./stories.json\", document.baseURI).href")
    .replaceAll("\"/output/YogaStories.UI.Client/index.js\"", "new URL(\"./output/YogaStories.UI.Client/index.js\", document.baseURI).href")
    .replaceAll("'/output/YogaStories.UI.Client/index.js'", "new URL(\"./output/YogaStories.UI.Client/index.js\", document.baseURI).href")
    .replaceAll("\"/output/\"", "new URL(\"./output/\", document.baseURI).href")
    .replaceAll("'/output/'", "new URL(\"./output/\", document.baseURI).href");
}

function patchOutputDependencyImports(text) {
  return patchBareSpecifiers(text, {
    "@heroui/react": `../../deps/heroui.js?v=${cacheKey}`,
    "react-dom/client": `../../deps/react-dom-client.js?v=${cacheKey}`,
    "react-dom/server": `../../deps/react-dom-server.js?v=${cacheKey}`,
    "react-dom": `../../deps/react-dom.js?v=${cacheKey}`,
    "react": `../../deps/react.js?v=${cacheKey}`
  });
}

function patchDependencyImports(text) {
  return patchBareSpecifiers(text, {
    "react-dom/client": `./react-dom-client.js?v=${cacheKey}`,
    "react-dom/server": `./react-dom-server.js?v=${cacheKey}`,
    "react-dom": `./react-dom.js?v=${cacheKey}`,
    "react": `./react.js?v=${cacheKey}`
  });
}

function patchBareSpecifiers(text, replacements) {
  let result = text;
  for (const [from, to] of Object.entries(replacements)) {
    result = result.replace(new RegExp(`((?:from\\s*|import\\s*\\()\\s*["'])${escapeRegExp(from)}(["'])`, "g"), `$1${to}$2`);
  }
  return result;
}

function escapeRegExp(text) {
  return text.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function assertBrowserModuleGraph() {
  const storiesPath = join(distDir, "stories.json");
  if (!existsSync(storiesPath)) return;

  const stories = JSON.parse(readFileSync(storiesPath, "utf8"));
  const entryPaths = [
    join(distDir, "output/YogaStories.UI.Client/index.js"),
    ...stories.map(story => join(distDir, `output/${story.moduleName}/index.js`))
  ];
  const seen = new Set();
  const failures = [];

  for (const path of entryPaths) {
    visitBrowserModule(path, "<entry>", seen, failures);
  }

  if (failures.length === 0) return;
  throw new Error(`GitHub Pages artifact contains browser module graph errors:\n${failures.join("\n")}`);
}

function visitBrowserModule(path, parent, seen, failures) {
  const normalized = normalizePath(path.split(/[?#]/)[0]);
  if (seen.has(normalized)) return;
  seen.add(normalized);

  if (!existsSync(normalized)) {
    failures.push(`missing ${normalized} imported by ${parent}`);
    return;
  }

  const source = readFileSync(normalized, "utf8");
  if (source.includes("process.env")) {
    failures.push(`process.env reference in ${normalized}`);
  }

  let specifiers;
  try {
    specifiers = importSpecifiers(normalized, source);
  } catch (error) {
    failures.push(`parse ${normalized}: ${error.message}`);
    return;
  }

  for (const specifier of specifiers) {
    if (specifier.startsWith("http") || specifier.startsWith("data:")) continue;
    if (specifier.startsWith("/")) {
      failures.push(`absolute ${specifier} imported by ${normalized}`);
      continue;
    }
    if (!specifier.startsWith(".")) {
      failures.push(`bare ${specifier} imported by ${normalized}`);
      continue;
    }
    visitBrowserModule(resolveBrowserImport(normalized, specifier), normalized, seen, failures);
  }
}

function importSpecifiers(path, source = readFileSync(path, "utf8")) {
  const ast = parseAst(source);
  const specifiers = [];
  visitAst(ast, node => {
    if (isImportNode(node) && node.source?.type === "Literal" && typeof node.source.value === "string") {
      specifiers.push(node.source.value);
    }
  });
  return specifiers;
}

function isImportNode(node) {
  return node.type === "ImportDeclaration"
    || node.type === "ExportNamedDeclaration"
    || node.type === "ExportAllDeclaration"
    || node.type === "ImportExpression";
}

function visitAst(node, f) {
  if (!node || typeof node !== "object") return;
  f(node);
  for (const [key, value] of Object.entries(node)) {
    if (key === "parent") continue;
    if (Array.isArray(value)) {
      for (const item of value) visitAst(item, f);
      continue;
    }
    if (value && typeof value === "object" && typeof value.type === "string") {
      visitAst(value, f);
    }
  }
}

function resolveBrowserImport(importer, specifier) {
  const withoutQuery = specifier.split(/[?#]/)[0];
  const resolved = normalizePath(join(importer, "..", withoutQuery));
  if (/\.[cm]?js$/.test(resolved)) return resolved;
  return `${resolved}.js`;
}

async function assertBrowserModulesLink() {
  const storiesPath = join(distDir, "stories.json");
  if (!existsSync(storiesPath)) return;

  await import("global-jsdom/register");
  const stories = JSON.parse(readFileSync(storiesPath, "utf8"));
  const entryPaths = [
    join(distDir, "output/YogaStories.UI.Client/index.js"),
    ...stories.map(story => join(distDir, `output/${story.moduleName}/index.js`))
  ];

  for (const path of entryPaths) {
    await import(pathToFileURL(path).href);
  }
}

function patchFile(path, f) {
  const before = readFileSync(path, "utf8");
  const after = f(before);
  if (after === before) return;
  writeFileSync(path, after);
}

function* walk(path) {
  if (!existsSync(path)) return;
  const stats = statSync(path);
  if (stats.isFile()) {
    yield path;
    return;
  }
  for (const name of readdirSync(path)) {
    yield* walk(join(path, name));
  }
}

function normalizePath(path) {
  return path.split("\\").join("/");
}
