OUTDIR = out
TEX = xelatex
TEXARGS = -output-directory=$(OUTDIR) -shell-escape
DEPS = $(wildcard *.tex blocks/*.tex)

.PHONY: all
all: $(OUTDIR)/main.pdf

$(OUTDIR)/%.pdf: %.tex $(DEPS) | $(OUTDIR)
	# runs twice, to aways ensure TOC is properly generated
	@$(TEX) $(TEXARGS) $< -o $@
	@$(TEX) $(TEXARGS) $< -o $@

$(OUTDIR):
	@mkdir -p $@

.PHONY: clean
clean:
	@rm -rf $(OUTDIR) svg-inkscape/
