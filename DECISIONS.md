# Decisions Log

Architectural and packaging decisions for `cloudflare-cf-flake`.

---

## 2026-09-30: Declarative Packaging with buildNpmPackage and Fixed npmDepsHash

- **Context / Problem**: Cloudflare released the `cf` unified agentic CLI
  on npm (`cf@1.0.0-beta.9`). The tarball ships bundled pre-built JavaScript
  artifacts but requires node runtime dependencies to execute correctly in a
  hermetic Nix store path.
- **Decision Taken**: Package `cf` using Nixpkgs' `buildNpmPackage` with a
  tracked `package.json` and `package-lock.json` copied in `postPatch`, setting
  `dontNpmBuild = true` to preserve the pre-compiled upstream distribution.
- **Rationale / Alternatives Considered**:
  - Direct global `npm install -g cf` is imperative and violates Nix hermeticity.
  - Native source build from GitHub requires monorepo tooling and complex
    multi-package builds not yet stabilized in upstream.
  - `buildNpmPackage` with explicit `npmDepsHash` yields reproducible, fast builds
    across both x86_64-linux and aarch64-linux platforms.
