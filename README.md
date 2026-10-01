# cloudflare-cf-flake

A declarative Nix flake packaging Cloudflare's unified agentic CLI (`cf`).

---

## ⚡ Quick Start

### Run Directly via Nix

```bash
# Run ad-hoc without installing
nix run github:kyleGrealis/cloudflare-cf-flake -- --help

# Check version
nix run github:kyleGrealis/cloudflare-cf-flake -- --version
```

### Install to User Profile (Nix Flakes)

```bash
nix profile install github:kyleGrealis/cloudflare-cf-flake#cf
```

---

## 📦 NixOS / Home Manager Integration

### 1. Add Flake Input

In your system or home-manager `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    cf-cli = {
      url = "github:kyleGrealis/cloudflare-cf-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, cf-cli, ... }: {
    # Reference in home.packages or environment.systemPackages:
    # cf-cli.packages.${system}.cf
  };
}
```

### 2. Add Package to Environment

```nix
home.packages = [
  inputs.cf-cli.packages.${pkgs.system}.cf
];
```

---

## 🔐 Authentication

Authenticate with your Cloudflare account using OAuth or an API token:

```bash
# Browser-based OAuth login
cf auth login

# Or supply an API token via environment variable
export CLOUDFLARE_API_TOKEN="your-token-here"
```

---

## 🛠️ Development

```bash
# Enter development shell with Node.js 22 & tooling
nix develop

# Build locally
nix build .#cf

# Run built binary
./result/bin/cf --help
```

---

## 📖 Origin & Acknowledgments

This package was created by Kyle Grealis with assistance from Gemini 3.7 Flash as a hands-on project to learn declarative Nix flake packaging and `buildNpmPackage` derivation mechanics.

Official upstream CLI source: [cloudflare/cf](https://github.com/cloudflare/cf)
