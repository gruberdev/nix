{
  stdenv,
  lib,
}: let
  fontsPath = ../../fonts/monolisa;
  hasFonts = builtins.pathExists fontsPath;
in
  stdenv.mkDerivation rec {
    pname = "monolisa";
    version = "1.0";

    src = lib.cleanSource ./.;

    dontUnpack = true;

    installPhase =
      if hasFonts
      then ''
        mkdir -p $out/share/fonts/opentype
        mkdir -p $out/share/fonts/truetype

        if [ -d "${fontsPath}" ]; then
          find "${fontsPath}" -name "*.otf" -o -name "*.ttf" | while read font; do
            if [[ "$font" == *.otf ]]; then
              cp "$font" $out/share/fonts/opentype/
            else
              cp "$font" $out/share/fonts/truetype/
            fi
          done
        fi
      ''
      else ''
        mkdir -p $out/share/fonts/opentype
        touch $out/share/fonts/opentype/.keep
      '';

    meta = with lib; {
      description = "MonoLisa monospace font family";
      platforms = platforms.all;
      maintainers = [];
    };
  }
