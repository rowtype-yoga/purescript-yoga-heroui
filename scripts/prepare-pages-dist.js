import { existsSync, mkdirSync, readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { build } from "vite";
import tailwindcss from "@tailwindcss/vite";

const distDir = "dist";
const userDir = join(distDir, "user");

mkdirSync(userDir, { recursive: true });
await buildHeroStyles();

patchFile(join(distDir, "index.html"), patchIndexHtml);

for (const path of walk(distDir)) {
  if (!path.endsWith(".js")) continue;
  if (!isYogaStoriesBrowserFile(path)) continue;
  patchFile(path, patchJavaScript);
}

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

function patchIndexHtml(text) {
  return text.replace(
    /<script type="module" src="(?:\.\/|\/)user\/yoga-stories-head\.js"><\/script>/g,
    '<link rel="stylesheet" href="./user/heroui-styles.css">'
  );
}

function isYogaStoriesBrowserFile(path) {
  const normalized = path.split("\\").join("/");
  return normalized.startsWith(`${distDir}/assets/`)
    || normalized.startsWith(`${distDir}/output/YogaStories.UI.Client/`);
}

function patchJavaScript(text) {
  return text
    .replaceAll("\"/stories.json\"", "new URL(\"./stories.json\", document.baseURI).href")
    .replaceAll("'/stories.json'", "new URL(\"./stories.json\", document.baseURI).href")
    .replaceAll("\"/output/YogaStories.UI.Client/index.js\"", "new URL(\"./output/YogaStories.UI.Client/index.js\", document.baseURI).href")
    .replaceAll("'/output/YogaStories.UI.Client/index.js'", "new URL(\"./output/YogaStories.UI.Client/index.js\", document.baseURI).href")
    .replaceAll("\"/output/\"", "new URL(\"./output/\", document.baseURI).href")
    .replaceAll("'/output/'", "new URL(\"./output/\", document.baseURI).href");
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
