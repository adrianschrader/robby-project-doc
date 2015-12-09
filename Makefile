filename-doc=document
directory-doc=./
directory-code=../robby-project

.PHONY: all doc code

all: code doc

code:
	mkdir -p code
	cp ${directory-code}/*.java code/

doc:
	cd ${directory-doc} && latexmk -pdf -xelatex -shell-escape -use-make ${filename-doc}.tex

clean:
	cd ${directory-doc} && latexmk -c
	rm -f ${directory-doc}${filename-doc}.{ps,log,aux,out,dvi,bbl,blg,toc,fls,fdb_latexmk,.bbl,.dvi,.pygtex}
	rm -rf **/*.{ps,log,aux,out,dvi,bbl,blg,toc,fls,fdb_latexmk,nav,snm,vrb,.pygtex,.minted}
	rm -rf _minted-document code
