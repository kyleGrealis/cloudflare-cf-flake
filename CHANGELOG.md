# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

---

## [1.0.0-beta.9] - 2026-09-30

### Added
- Initial standalone Nix flake for Cloudflare unified CLI (`cf`).
- Derivation packaging `cf@1.0.0-beta.9` using `buildNpmPackage`.
- Overlay and default package definitions for multi-system support (`flake-utils`).
- Development shell with `nodejs_22` and `npm-check-updates`.
- Minimal README with usage instructions, flake integration, and project origin.
- Project decision log (`DECISIONS.md`) and initial release changelog (`CHANGELOG.md`).
