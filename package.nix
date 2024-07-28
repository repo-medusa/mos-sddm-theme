{ stdenvNoCC }: stdenvNoCC.mkDerivation {
    name = "mos-sddm-theme";
    version = "0.1";

    src = ./.;
    installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
    '';
}
