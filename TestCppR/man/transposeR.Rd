\name{transposeR}
\alias{transposeR}
\title{ transposeR wrapper R Function to transposeCpp Cpp Funciton}
\description{
  \code{transposeR} run transposeCpp function
}

\usage{
    transposeR(in_2d_dataframe, debug=FALSE)
}

\arguments{
  \item{ in_2d_dataframe   }{ data.frame - 2D matrix }
  \item{ debug   }{ boolean - TRUE to print debug info, default FALSE }
}

\value{ data.frame - 2D transposed matrix }

\examples{
    print(transposeR(data.frame(10:19, 20:29), TRUE))
}

\keyword{programming}
