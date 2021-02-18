
Creating the VIM Cheatsheet
===========================

I was looking for a cheatsheet to help me remember how to use text objects in
vim.  I just couldnt seem to find just the right one.  I decided to create
my own and using markdown as the source with HTML and PDF as the output.

So begins an adventure in using pandoc and latex.

I have used pandoc in the past to convert markdown to HTML.  It was simple
to use even with a CSS style sheet.  However, creating a pdf from markdown
means a trip down the Latex Lane.  Not for the faint of heart.

Their are many site that present an introduction to Latex. They make it
look so simple.  

    \documentclass[12pt]{article}

    \title{This is the title}
    \author{Author One \\ Author Two}
    \date{29 November 2017}

    \begin{document}
    \maketitle

    This is the content of this document.

    This is the 2nd paragraph.
    \end{document}

I started to layout my cheatsheet in markdown using the table extensions but
soon found out things did not flow through latex to PDF very well.  Tables were
a big problem.

I dropped back to going directly with Latex and soon found the options of
tables to be overwhelming; table, tabular tabularx, tabu just to mention a few. 
I might as well write the whole thing in HTML as get lost in Latex Lane.

And, again pandoc did not like these table packages. Under the hood pandoc uses
the pdflatex program and a latex template to create the PDF. The template
did not support any of the Latex packages I wanted to use.

Back to markdown with no tables.  As for markdown-to-pdf the pandoc latex
template created weird margins and sections numbers.  However pandoc allows you
to supply your own template.  With lots of Latex investigation I created a
Latex template and was able to successfully pass it to pandoc to create the
PDF format I wanted.

The document flow is:

* create the source document in Markdown with indents for code blocks  

* convert from Markdown to HTML with pandoc and a CSS style sheet  
    $ pandoc -s -c md.css -f markdown -t html -o vim_sheet.html vim_sheet.md

* convert from Markdown to PDF with pandoc using pdflatex and latex template  
    $ pandoc -s -f markdown -t latex --template=cheat.tex -o vim_sheet.tex vim_sheet.md

* for debugging convert from Markdown to LATEX to PDF in a two-step process  
    $ pandoc -s -f markdown -t latex --template=cheat.tex -o vim_sheet.tex vim_sheet.md  
    $ pdflatex vim_sheet.tex  


Sample of the source Markdown document

    Motions
    -------
    [count] {motion}

        h j k l move cursor
        gj gk   move cursor one screen line (good of wrapped lines)
        +       beginning of next/previous line 
        <enter> beginning of next line
        H M L   top middle bottom of screen
        w W     beginning of next word, <shift> -->, <ctrl> -->
        e E     end of next word
        b B     backwards to start of last word, <shift> <--, <ctrl> <--

Latex Template
--------------
When I created the Latex template (cheat.tex) I wanted to control the margins
and have section/subsection headers with no numbers.  I started with the pandoc
Latex template by;

    $ pandoc -D latex > cheat.tex


I deleted a bunch of the preamble in the template then added margin control
using the geometry package.

    \usepackage{geometry}
    \geometry{
         letterpaper, 
        left=0.5in,
        right=0.5in,
        top=0.75in,
        bottom=0.75in
    }

I also added section formatting using the titlesec package.

    \usepackage{titlesec}

    \titleformat{\section}[hang]{\Large\bfseries}{\thesection}{0pt}{}
    \titleformat{\subsection}[hang]{\Large\bfseries}{\thesubsection}{0pt}{}

    \titlespacing{\section}{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
    \renewcommand\thesection{}
    \renewcommand\thesubsection{}

The tricky bit here is that to get rid of section/subsection numbers. This is
done by  redefining \thesection and \thesubsection as empty.  

Normally \thesection  is defined as {\arabic{section}}, in other words a number.
By setting it to empty {} it will not show the section number.  In normal
Latex we would simple use the numberless \section* instead of \section but with
pandoc filling in the body of the tex document this is not an option.


All the Files
-------------
This is all wrapped up in a makefile, so "make html" and "make pdf" produce
the final documents.

Source Document  
[Markdown File](vim_sheet.md)  

Styling Templates  --(used by pandoc during the document built  
[CSS Style Sheet](md.css)  
[Latex Template File](cheat.tex)  

Makefile for building output documents  
   targets = html, pdf, twostep, viewhtml, viewpdf, clean, superclean, doc
[Makefile](Makefile)  

Output Documents  
[HTML Document](vim_sheet.html)  
[PDF Document](vim_sheet.pdf)  
[Intermediate Latex Document](vim_sheet.tex)  

[Build Workflow HowTo](howto.md) (this document)  


Latex/Pandoc Install
--------------------

I did not install the full Latex system. It is huge.  I only installed the Ubuntu
recommend package and one extra package.

I am running Linux Mint so here are the commands

    $ sudo apt-get install pandoc
    $ sudo apt-get install texlive 
    $ sudo apt-get install texlive-latex-extra


2017/11/28  

