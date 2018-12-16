#include <iostream>
#include <cassert>
#include <string>
#include <cstdio>
#include <cstdlib>
#include <regex>
#include <fstream>
#include <unistd.h>


std::regex our_word(".*for.*") ;//\(.*\).*\{.*");


int main(int argc, char** argv) {
  int c = 0;
  extern char* optarg;
  extern int optind, opterr, optopt;
  char fi[256] = {0};
  char fo[256] = {0};
  std::string line;
  int line_count = 0;
 
  
  while ((c = getopt(argc, argv, ":f:o:")) != -1) {
    switch(c) {
      case 'f': 
        strcpy(fi, optarg);
        break;
      case 'o': 
        strcpy(fo, optarg);
        break;
      default:
        assert(false);
        break;
    }
  }

  std::fstream fout;
  fout.open(fo, std::fstream::out);
  std::fstream fin;
  fin.open(f, std::fstream::in);

  while(!fin.eof()) {
    getline(fin, line);
    if(regex_match(line, our_word)) {
      printf("%s\n", line.c_str());
    }
  }
  
  fin.close();
  fout.close();

  return 0;
}
