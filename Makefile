RESUBMISSION = JAMIO/resubmission/application_note.docx\
							 JAMIO/resubmission/supplement.pdf\
							 JAMIO/resubmission/supplement_tracked_changes.pdf
							 # JAMIO/resubmission/application_note_tracked_changes.docx # made by hand in MS Word

.PHONY: all

all: $(RESUBMISSION)

application_note.docx : application_note.qmd template.docx references.bib .check_R
	quarto render $<

supplement.pdf JAMIO/resubmission/supplement.tex &: supplement.qmd references.bib setup.R .check_R
	@# this relies on the the supplement.qmd yaml having `keep-tex: true`
	quarto render $<
	mv supplement.tex JAMIO/resubmission/supplement.tex

JAMIO/resubmission/supplement_tracked_changes.pdf : JAMIO/resubmission/supplement.tex JAMIO/submission/supplement.tex
	latexdiff JAMIO/submission/supplement.tex JAMIO/resubmission/supplement.tex > $(basename $@).tex
	latexmk -pdf $(basename $@).tex
	latexmk -c $(basename $@).tex
	mv supplement_tracked_changes.pdf $@

JAMIO/resubmission/application_note.docx: application_note.docx
	cp $< $@

JAMIO/resubmission/supplement.pdf : supplement.pdf
	cp $< $@

.check_R : setup.R
	Rscript --vanilla $<
	@touch $@
