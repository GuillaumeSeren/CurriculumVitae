LANGS=fr
TARGETS=$(addprefix GuillaumeSeren_,$(LANGS))
PDF_TARGETS=$(addsuffix .pdf,$(TARGETS))
HTML_TARGETS=$(addsuffix .html,$(TARGETS))

all: pdf html

pdf: $(PDF_TARGETS)

html: $(HTML_TARGETS)

frenchcv: GuillaumeSeren_fr.pdf

%.pdf: %.tex
	#lualatex -interaction=batchmode $<
	#lualatex -interaction=batchmode $<
	xelatex -interaction=batchmode $<
	xelatex -interaction=batchmode $<

%.html: %.pdf
	pdf2htmlEX --zoom=2 $<

clean:
	rm -f *.aux *.log *.out *.bcf *.xml
	rm -f *.pdf *.html

