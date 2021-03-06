% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kaleido.R
\name{kaleido}
\alias{kaleido}
\title{Static image exporting via kaleido}
\usage{
kaleido(...)
}
\arguments{
\item{...}{not currently used.}
}
\value{
an environment which contains:
\itemize{
\item \code{transform()}: a function to convert plots objects into static images,
with the following arguments:
\itemize{
\item \code{p}: a plot object.
\item \code{file}: a file path with a suitable file extension (png, jpg, jpeg,
webp, svg, or pdf).
\item \code{width}, \code{height}: The width/height of the exported image in layout
pixels. If \code{scale} is 1, this will also be the width/height of the
exported image in physical pixels.
\item \code{scale}: The scale factor to use when exporting the figure. A scale
factor larger than 1.0 will increase the image resolution with
respect to the figure's layout pixel dimensions. Whereas as
scale factor of less than 1.0 will decrease the image resolution.
}
\item \code{shutdown()}: a function for shutting down any currently running subprocesses
that were launched via \code{transform()}
\item \code{scope}: a reference to the underlying \code{kaleido.scopes.plotly.PlotlyScope}
python object. Modify this object to customize the underlying Chromium
subprocess and/or configure other details such as URL to plotly.js, MathJax, etc.
}
}
\description{
Static image exporting via \href{https://github.com/plotly/Kaleido/}{the kaleido python package}. \code{kaleido()} imports
kaleido into a \pkg{reticulate}d Python session and returns a \verb{$transform()}
method for converting R plots into static images (see examples below).
}
\section{Installation}{


\code{kaleido()} requires \href{https://github.com/plotly/Kaleido/}{the kaleido python package} to be usable via the \pkg{reticulate} package. Here is a recommended way to do the installation:\preformatted{install.packages('reticulate')
reticulate::install_miniconda()
reticulate::conda_install('r-reticulate', 'python-kaleido')
reticulate::conda_install('r-reticulate', 'plotly', channel = 'plotly')
reticulate::use_miniconda('r-reticulate')
}
}

\examples{

\dontrun{
  scope <- kaleido()
  tmp <- tempfile(fileext = ".png")
  scope$transform(plot_ly(x = 1:10), tmp)
  file.show(tmp)
  # Remove and garbage collect to remove 
  # R/Python objects and shutdown subprocesses
  rm(scope); gc()
}

}
