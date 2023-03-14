OUTDIR = out
TEX = latexmk
TEXARGS = -output-directory=$(OUTDIR) -shell-escape -xelatex
DEPS = $(wildcard *.tex blocks/*.tex)

.PHONY: all
all: $(OUTDIR)/main.pdf

$(OUTDIR)/%.pdf: %.tex $(DEPS) | $(OUTDIR)
	@$(TEX) $(TEXARGS) $<

$(OUTDIR):
	@mkdir -p $@

.PHONY: clean
clean:
	@rm -rf $(OUTDIR) svg-inkscape/
