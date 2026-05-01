## Installation

To install the package, use `install_github()` from the `remotes` package or `pkg_install()` from the `pak` package:

```r
pak::pkg_install('yea-hung/readmarkdown')
```

## Example

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

Read the table:

```r
read_markdown(markdown_table)
```

Equivalently, read the table using using native piping:

```r
markdown_table |> read_markdown()
```

## Details

This package uses base R.
