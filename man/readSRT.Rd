\name{readSRT}
\alias{readSRT}
\title{Read a Subtitle File}
\description{
}
\usage{
readSRT(file, text = readLines(file, ...), ...)
}
\arguments{
  \item{file}{the name of a file or a connection object}
  \item{text}{the contents of the subtitles.}
  \item{\dots}{additional arguments passed to \code{\link{readLines}}.
   This can be used to identify the encoding, for example.}
}
\value{
  A data frame with three elements
  \item{text}{the text for the subtitle}
  \item{start}{a POSIXct object giving the start of the subtitle.}
  \item{end}{a POSIXct object identifying the end of the subtitle.}
}
\author{
Duncan Temple Lang
}

\seealso{
  \link{\code{}}
}
\examples{
f = system.file("sampleDocs", "no-indexes.srt", package = "RSRT")
a = readSRT(f)
dim(a)
head(a)


f = system.file("sampleDocs", "utf-8.srt", package = "RSRT")
a = readSRT(f)
dim(a)
head(a)


f = system.file("sampleDocs", "windows-1252.srt", package = "RSRT")
con = file(f, encoding = "windows-1252")
a = readSRT(con)
dim(a)
head(a)


f = system.file("sampleDocs", "CHG05Apr2015_803.srt", package = "RSRT")
a = readSRT(f, encoding = "UTF-16")


con = file(f, encoding = "UTF-16")
a = readSRT(con)
close(con)
}
\keyword{IO} 
