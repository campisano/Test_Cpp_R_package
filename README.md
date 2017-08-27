# Test_Cpp_R_package
Testing a cpp package for R

Test it downloading the code, compile with

```Bash
R CMD build TestCppR
R CMD check TestCppR
```

And run with

```R
# set verbose
options(warn=1);  # warnings printed as they occur
options(keep.source=TRUE);

install.packages(repos=NULL,"TestCppR_0.1.tar.gz")
library(TestCppR)
testWrapper()
```