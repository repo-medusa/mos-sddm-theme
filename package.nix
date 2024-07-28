{ stdenvNoCC }: stdenvNoCC.mkDerivation {
    pname = "mos-sddm-theme";
    version = "0.1";

    src = ./.;

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/share/sddm/themes/"
      cp -r catppuccin/ "$out/share/sddm/themes/mos-sddm-theme"

      runHook postInstall
    '';
}
