{
  lib,
  buildNpmPackage,
  fetchurl,
  nodejs_22,
}:

buildNpmPackage rec {
  pname = "cf";
  version = "1.0.0-beta.10";

  src = fetchurl {
    url = "https://registry.npmjs.org/cf/-/cf-${version}.tgz";
    hash = "sha256-0Wc7uZ/6A+PwPDeKWakBxPDrzXiHqqmTa74BLRFvKEo=";
  };

  postPatch = ''
    cp ${./package.json} package.json
    cp ${./package-lock.json} package-lock.json
  '';

  npmDepsHash = "sha256-bhdS6FK38gW5POtlGBtPKQDPjvveGo4qGQAZYkXgxYw=";

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
