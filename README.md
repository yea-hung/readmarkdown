# Installation

Install *remotes* if you don't already have it:

```r
install.packages('remotes')
```

Install the *markdownfriend* package:

```r
remotes::install_github('yea-hung/markdownfriend')
```

# Example

Define the Markdown table:

```r
markdown_table<-"
| state | capital | area |
| --- | --- | --- |
| California | Sacramento | 163700 |
| Massachusetts | Boston | 10565 |
| Illinois | Springfield | 57914 |
"
```

Load the data:

```r
tt<-read_markdown(markdown_table)
```

