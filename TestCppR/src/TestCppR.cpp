// #include <iostream>

extern "C" {

    void transposeCpp(
        double * p_matrix_in,
        int * p_rows,
        int * p_cols,
        double * p_matrix_out
    )
    {
        // std::cout << __func__ << std::endl;

        int rows = (* p_rows);
        int cols = (* p_cols);
        int i, j, size = rows * cols;

        // std::cout << "p_matrix_in" << std::endl;

        // for (i = 0; i < rows; ++i)
        // {
        //     std::cout << i << ":\t\t";

        //     for (j = 0; j < cols; ++j)
        //     {
        //         std::cout << p_matrix_in[j * rows + i] << '\t';
        //     }

        //     std::cout << std::endl;
        // }

        // from https://stackoverflow.com/a/16743203/846686
        for(int t = 0; t < size; ++t)
        {
            i = t / cols;
            j = t % cols;
            p_matrix_out[t] = p_matrix_in[rows * j + i];
        }

        // std::cout << "p_matrix_out" << std::endl;

        // for (i = 0; i < cols; ++i)
        // {
        //     std::cout << i << ":\t\t";

        //     for (j = 0; j < rows; ++j)
        //     {
        //         std::cout << p_matrix_out[j * cols + i] << '\t';
        //     }

        //     std::cout << std::endl;
        // }
    }
}
