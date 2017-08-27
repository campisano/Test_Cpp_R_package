# from https://www.nceas.ucsb.edu/scicomp/usecases/CreateRPackageWithC

testWrapper <- function() {
    # loading package
    library(TestCppR)

    # generating test data
    df <- data.frame(10:19, 20:29)

    print("original dataframe:")
    print(df)
    print(paste("rows: ", nrow(df), "cols:" , ncol(df)))

    # calling wrapper function
    tdf <- transposeR(df, TRUE)

    print("transposed dataframe:")
    print(tdf)
    print(paste("rows: ", nrow(tdf), "cols:" , ncol(tdf)))

    print("expected result must be:")
    print(t(df))
}

transposeR <- function(in_2d_dataframe, debug=FALSE) {
    n_rows = as.integer(nrow(in_2d_dataframe))
    n_cols = as.integer(ncol(in_2d_dataframe))

    # convert to unidimensional vector
    in_1d_vector <- as.numeric(as.matrix(in_2d_dataframe))

    if(length(in_1d_vector) != (n_rows * n_cols)) {
        print("length(in_1d_vector) != (n_rows * n_cols)")
        print(paste(length(in_1d_vector), "!=", "(", n_rows, "*", n_cols, ")"))
        return;
    }

    if(debug) {
        print("input 1d vector:")
        print(in_1d_vector)
        print(paste("length: ", length(in_1d_vector)))
    }

    # from http://cran.us.r-project.org/doc/manuals/r-patched/R-exts.html
    #      #Interface-functions-_002eC-and-_002eFortran
    out_1d_vector = .C(
        "transposeCpp",
        in_1d_vector,
        n_rows,
        n_cols,
        out = numeric(length(in_1d_vector))
    )$out

    if(debug) {
        print("output 1d vector:")
        print(out_1d_vector)
        print(paste("length: ", length(out_1d_vector)))
    }

    # transform vector to dataframe
    dim(out_1d_vector) <- c(n_cols, n_rows)

    return(as.data.frame(out_1d_vector))
}
