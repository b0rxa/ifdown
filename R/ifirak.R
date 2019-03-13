ifirak <- function(..., keep_tex = TRUE, citation_package='natbib'){
  template <- system.file(file.path("rmarkdown", "templates", "ifirak", "resources", "template.tex"),
                          package="ifdown")

  fmt <- rmarkdown::pdf_document(template = template,
                                 keep_tex = keep_tex,
                                 citation_package = citation_package,
                                 ...)
  fmt$inherits <- "pdf_document"
  return(fmt)
}

ifirak2 <- function(..., keep_tex = TRUE, citation_package='natbib'){
  template <- system.file(file.path("rmarkdown", "templates", "ifirak2", "resources", "template.tex"),
                          package="ifdown")

  fmt <- rmarkdown::pdf_document(template = template,
                                 keep_tex = keep_tex,
                                 citation_package = citation_package,
                                 ...)
  fmt$inherits <- "pdf_document"
  return(fmt)
}

ifreport <- function(..., keep_tex = TRUE, citation_package='natbib'){
  template <- system.file(file.path("rmarkdown", "templates", "ifreport", "resources", "template.tex"),
                          package="ifdown")

  fmt <- rmarkdown::pdf_document(template = template,
                                 keep_tex = keep_tex,
                                 citation_package = citation_package,
                                 ...)
  fmt$inherits <- "pdf_document"
  return(fmt)
}


ifreport2 <- function(..., keep_tex = TRUE, citation_package='natbib'){
  template <- system.file(file.path("rmarkdown", "templates", "ifreport2", "resources", "template.tex"),
                          package="ifdown")

  fmt <- rmarkdown::pdf_document(template = template,
                                 keep_tex = keep_tex,
                                 citation_package = citation_package,
                                 ...)
  fmt$inherits <- "pdf_document"
  return(fmt)
}
