grep -rnw '/path/to/somewhere' -e 'search_term'

rg 'search_term'

find . -name "*.txt" -exec grep -H "search_term" {} +
