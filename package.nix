{
  lib,
  buildNpmPackage,
  fetchurl,
  nodejs_22,
}:

buildNpmPackage rec {
  pname = "cf";
  version = "1.0.0-beta.9";

  src = fetchurl {
    url = "https://registry.npmjs.org/cf/-/cf-${version}.tgz";
    hash = "sha256-YHi8F/fj1L3yZ7jebev1g7YL10O3qesW8z3HKDavX08=";
  };

  postPatch = ''
    cp ${./package.json} package.json
    cp ${./package-lock.json} package-lock.json
  '';

  npmDepsHash = "sha256-CGbRY6bflNQelWV5pPAdcBX+Ki3yFXIn2+/1VFcE8lo=";

  nodejs = nodejs_22;
  dontNpmBuild = true;

  meta = with lib; {
    description = "Cloudflare unified agentic CLI";
    homepage = "https://github.com/cloudflare/cf";
    license = with licenses; [ mit asl20 ];
    mainProgram = "cf";
    platforms = platforms.all;
  };
}
