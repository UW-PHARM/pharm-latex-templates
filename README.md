# PHARM LaTeX Templates

LaTeX presentation and poster templates for PHARM members.

## Installation
Change directories to your local TeX template root:^[1]
```
$ cd <TeX root>/tex/latex
```
Create the directory if it doesn't exist. Then clone the repository:
```
$ git clone https://github.com/UW-PHARM/pharm-latex-templates.git
```

You may need to run the following:
```
$ sudo texhash
```

## Usage
The classes be used as follows:
```latex
% for poster
\documentclass{pharmposter}

% for presentation
\documentclass{beamer}
\usepackage{pharmpresentation}
```
There are options for portrait/landscape, different poster sizes,
and different slide sizes. Find them by looking at the examples in the repo.

-----

[1]: Here are some common TeX template root folders:
     - macOS: `~/Library/texmf/`
     - Windows: `C:\Users\<username>\texmf\`
     - Linux: `~/.texmf/`
