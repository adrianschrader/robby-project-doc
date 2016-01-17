PATH := $(PATH):/Library/TeX/texbin
filename-doc=document
directory-doc=./
directory-code=../robby-project

.PHONY: all doc code clean javadoc

all: code doc

code:
	mkdir -p code
	cp ${directory-code}/*.java code/

doc:
	cd ${directory-doc} && latexmk -pdf -xelatex -shell-escape ${filename-doc}.tex

clean:
	cd ${directory-doc} && latexmk -c
	rm -f ${directory-doc}${filename-doc}.{ps,log,aux,out,dvi,bbl,blg,toc,fls,fdb_latexmk,.bbl,.dvi,.pygtex}
	rm -rf **/*.{ps,log,aux,out,dvi,bbl,blg,toc,fls,fdb_latexmk,nav,snm,vrb,.pygtex,.minted}
	rm -rf _minted-document code

javadoc:
	cd ../../ && javadoc -d github/robby-project-doc/javadoc/ github.robby-project
