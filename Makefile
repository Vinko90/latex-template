DOC:=$(wildcard *.tex)
FIGURES:=$(wildcard figures/*)
DEPS:=$(wildcard */*.tex)
DEPS+=$(wildcard */*/*.tex)
TMPDIR?=output

PDF:=$(TMPDIR)/$(subst .tex,.pdf,$(DOC))
PDFLATEX=max_print_line=9999 texfot pdflatex -output-directory=$(TMPDIR) -file-line-error

all: $(PDF)

$(PDF): $(DOC) $(DEPS) $(FIGURES)
	@mkdir -p $(TMPDIR)
	-$(PDFLATEX) -interaction=batchmode $<
	-$(PDFLATEX) -interaction=batchmode $<
	$(PDFLATEX) -interaction=nonstopmode -file-line-error $<

check: $(DOC) $(DEPS)
	lacheck $<

clean:
	rm -rf output/*

.PHONY: all clean
