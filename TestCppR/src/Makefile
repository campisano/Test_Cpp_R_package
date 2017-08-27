#Makefile for building the C language shared libray for the TestCppR demonstration package.

CXX=g++
CXXFLAGS=		-c -fPIC -pipe -std=c++11 -pedantic -Wall -Wextra

OBJECTS =		TestCppR.o

TestCppR.so:	$(OBJECTS)
	R CMD SHLIB -o TestCppR.so $(OBJECTS)

.c.o:
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm *.o *.so
