.SUFFIXES: .r .r,v .bib .grn .tbl .output .ditroff

.r.bib: ; mybib $*.r > $*.bib
.r,v.r: ; co $@
.r.tbl:	; tbl $*.r> $*.tbl 
.ditroff.output: ; printdr $*.ditroff
.bib.grn: ; grn -P$(PRINTER) $*.bib > $*.grn

PRINTER=ps

PAGES=0-999

ROFFINPUTS = proposal.r summary.r body.grn levy.cv.tbl black.cv.tbl

proposal.ditroff: $(ROFFINPUTS)
	troff -mprog -o$(PAGES) -P$(PRINTER) -t proposal.r > proposal.ditroff

proposal.t:  $(ROFFINPUTS)
	nroff -mprog -o$(PAGES) -T37  proposal.r | colcrt > proposal.t

body.grn:  body.bib inCore.gr.vax 
	tbl body.bib | grn -P$(PRINTER) > body.grn

clean: 
	rm *.t *.tbl *.grn *.ditroff *.bib
