#!/bin/bash
rm parser
clang++ -g -std=c++11 -Lm -Lliwbstdc++ parser.cpp -o parser
