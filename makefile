
# MD= $(wildcard *.md)
MD= talk.md
PDF=$(MD:.md=.pdf)
# PDF=COOK_SMALTER_HALL_MACRO_FORECASTING_WITH_DL_RWP.pdf exec_summary.pdf info_sheet.pdf
# TEX=skeleton.tex


all: $(PDF)



%.tex: %.md
	pandoc $< "rakeconfig.yaml" --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash-implicit_figures --filter ./.beamer_overlay_filter.py  -t beamer --slide-level=2  -o $@ -V theme:Amsterdam -s   --template=class_presentation.beamer   --include-in-header=header_includes.tex 

%.pdf: %.tex
	latexmk -f -gg -pdf -synctex=1 $<
	open $@



clean:
	echo done
	rm -rf *.toc  *.nav  *.snm *.log *.aux *.fdb_latexmk *.fls *.bbl *.blg *.run.xml *-blx.bib *.out *.synctex.gz skeleton.pdf



