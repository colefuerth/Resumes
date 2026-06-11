{
  description = "Cole Fuerth's resume";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        texlive = pkgs.texlive.combine {
          inherit (pkgs.texlive)
            scheme-medium
            preprint
            titlesec
            marvosym
            enumitem
            fancyhdr
            babel-english
            fontawesome5
            fira
            fontaxes
            contour
            ulem
            tex-gyre
            ;
        };

        dev-packages = with pkgs; [
          texlab
          zathura
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [ texlive ] ++ dev-packages;
        };

        packages.default = pkgs.stdenvNoCC.mkDerivation {
          name = "Cole_Fuerth_resume.pdf";
          src = ./.;
          buildInputs = [ texlive ];

          TEXMFHOME = "./cache";
          TEXMFVAR = "./cache/var";
          SOURCE_DATE_EPOCH = toString self.lastModified;

          buildPhase = ''
            runHook preBuild
            pdflatex -interaction=nonstopmode -file-line-error Cole_Fuerth_resume.tex
            pdflatex -interaction=nonstopmode -file-line-error Cole_Fuerth_resume.tex
            runHook postBuild
          '';

          installPhase = ''
            runHook preInstall
            install -m644 -D Cole_Fuerth_resume.pdf $out/Cole_Fuerth_resume.pdf
            runHook postInstall
          '';
        };
      });
}
