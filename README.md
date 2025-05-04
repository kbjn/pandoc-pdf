# pandoc-pdf

A Docker image for converting Markdown to PDF using Pandoc with LaTeX support.

## Features

- Based on Ubuntu 22.04
- Includes Pandoc 2.19.2 with citeproc and crossref extensions
- Full LaTeX support with XeTeX and LuaTeX
- CJK language support

## Usage

### Building the Docker image

```bash
docker build -t pandoc-pdf .
```

### Converting a Markdown file to PDF

```bash
docker run --rm -v $(pwd):/data pandoc-pdf -f markdown -t pdf -o output.pdf input.md
```

### Using with CJK languages

For documents with CJK (Chinese, Japanese, Korean) content:

```bash
docker run --rm -v $(pwd):/data pandoc-pdf -f markdown -t pdf --pdf-engine=xelatex -V CJKmainfont="Noto Sans CJK JP" -o output.pdf input.md
```

### Using with citations

```bash
docker run --rm -v $(pwd):/data pandoc-pdf -f markdown -t pdf --citeproc --bibliography=references.bib -o output.pdf input.md
```

## Examples

### Basic example

Create a file named `example.md`:

```markdown
# Hello World

This is a test document.

## Section 1

Content for section 1.
```

Convert it to PDF:

```bash
docker run --rm -v $(pwd):/data pandoc-pdf -f markdown -t pdf -o example.pdf example.md
```