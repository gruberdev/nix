{
  stdenv,
  lib,
}:
stdenv.mkDerivation rec {
  pname = "sf-pro-rounded";
  version = "1.0";

  dontUnpack = true;

  installPhase = ''
        mkdir -p $out/share/fonts/conf.d

        cat > $out/share/fonts/conf.d/10-sf-pro-rounded.conf << 'EOF'
    <?xml version='1.0'?>
    <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
    <fontconfig>
      <alias>
        <family>SF Pro Rounded</family>
        <prefer>
          <family>SF Pro Rounded</family>
        </prefer>
      </alias>

      <match target="pattern">
        <test qual="any" name="family">
          <string>SF Pro Rounded</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
          <string>SF Pro Rounded</string>
        </edit>
      </match>
    </fontconfig>
    EOF
  '';

  meta = with lib; {
    description = "SF Pro Rounded fontconfig configuration";
    platforms = platforms.all;
    maintainers = [];
  };
}
