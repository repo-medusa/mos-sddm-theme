{ stdenvNoCC }: stdenvNoCC.mkDerivation {
    name = "mos-sddm-theme";
    src = ./.;
    installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
    '';
}
