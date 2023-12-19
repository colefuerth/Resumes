

build:
	pdflatex  -synctex=1 -interaction=nonstopmode -file-line-error -recorder  "Cole_Fuerth_resume.tex"

clean:
	rm -vf *.gz *.aux *.fdb_latexmk *.fls *.log