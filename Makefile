OUTDIR = out
TEX = xelatex -output-directory=$(OUTDIR) -shell-escape
DEPS = $(wildcard *.tex blocks/*.tex)

.PHONY: all
all: $(OUTDIR)/main.pdf

$(OUTDIR)/%.pdf: %.tex $(DEPS) | $(OUTDIR)
	@$(TEX) $< -o $@

$(OUTDIR):
	@mkdir -p $@

.PHONY: clean
clean:
	@rm -rf $(OUTDIR) svg-inkscape/
