library(markdown)
library(hamcrest)

test.links <- function() {
  cat(markdownToHTML(text = '[foo](http://google.com "baz")', options = c("fragment_only")))
}