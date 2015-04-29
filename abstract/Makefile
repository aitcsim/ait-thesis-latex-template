NAME = abstract

ALLTEX = *.tex
SRC = $(NAME).tex

TARG = $(SRC:.tex=.pdf)

all: $(TARG)

$(TARG): $(SRC) $(ALLTEX)
	pdflatex $(NAME)

clean:
	rm -f *~ *log *nav *aux $(TARG) *.out *.blg *.brf *.bbl *.bak *.dvi \
	      *.toc *.spl
