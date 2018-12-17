#!/bin/bash
rm parser
rm result_parser
clang++ -g -std=c++11 -Lm -Lliwbstdc++ parser.cpp -o parser
clang++ -g -std=c++11 -Lm -Lliwbstdc++ result_parser.cpp -o result_parser
