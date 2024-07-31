{ lib, pkgs }: pkgs.stdenvNoCC.mkDerivation {
    pname = "mos-sddm-theme";
    version = "0.1";

    src = ./mos;

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/share/sddm/themes/mos-sddm-theme"
      cp -r * "$out/share/sddm/themes/mos-sddm-theme"

      runHook postInstall
    '';
  meta = {
    description = "A custom SDDM theme";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
