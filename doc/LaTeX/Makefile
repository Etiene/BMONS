PROJECT=main
TEX=pdflatex
BIBTEX=bibtex
MKINDEX=makeindex
MKGLOSSARY=makeglossaries
BUILDTEX=$(TEX) $(PROJECT).tex

.PHONY: clean clean-all all index glossaire bib pdf 

all: bib glossaire index
	$(BUILDTEX)
	$(BUILDTEX)
	
index: 
	$(MKINDEX) $(PROJECT)

glossaire: 
	$(MKGLOSSARY) $(PROJECT)

bib: pdf
	$(BIBTEX) $(PROJECT)

pdf:
	$(BUILDTEX)

clean-all: clean
	rm -f *.dvi *.ps *.eps *.pdf 

clean:
	rm -f *.log *.bak *.aux *.bbl *.blg *.i* *.toc *.out *~ *.gl* *.xml *.bcf  *.gz

help :
	@echo ""
	@echo "make				- contruit le document"
	@echo "make all			- contruit le document"
	@echo "make index			- contruit l'index"
	@echo "make glossaire			- contruit le glossaire"
	@echo "make bib			- contruit la bibliographie"
	@echo "make pdf			- contruit le document PDF"
	@echo "make clean			- supprime les fichiers LaTeX intermédiaires"
	@echo "make clean-all			- supprime tous les fichiers générés par la compilation"
	@echo "make help			- cette information"
	@echo ""