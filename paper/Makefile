OUTFILES = paper.synctex.gz paper.pdf
JUNKFILES = paper.aux paper.bbl paper.blg paper.dvi paper.fdb_latexmk paper.fls paper.out paper.log paper.xcp
COMPILE = pdflatex -interaction=batchmode -synctex=4 paper.tex

pdf : paper.tex
	rm -f $(OUTFILES)
	$(COMPILE)
	bibtex paper
	$(COMPILE)
	$(COMPILE)
	rm -f $(JUNKFILES)

clean :
	rm -f $(OUTFILES) $(JUNKFILES)