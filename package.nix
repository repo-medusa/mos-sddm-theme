{ stdenvNoCC }: stdenvNoCC.mkDerivation {
    pname = "mos-sddm-theme";
    version = "0.1";

    src = ./mos;

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/share/sddm/themes/mos-sddm-theme"
      cp -r "$src/" "$out/share/sddm/themes/mos-sddm-theme"

      runHook postInstall
    '';
}
