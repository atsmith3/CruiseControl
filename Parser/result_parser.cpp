#include <iostream>
#include <cassert>
#include <string>
#include <cstdio>
#include <cstdlib>
#include <regex>
#include <vector>
#include <fstream>
#include <algorithm>
#include <unistd.h>
#include <math.h>

bool is_space(char i) {return i == ' ' || i == '\t';}

typedef struct loop_info_t{
  int line_num;
  int lower_bound;
  int upper_bound;
  char index;
  bool innermost;
}loop_info;

std::vector<loop_info_t> loops;
unsigned int identifier;

std::regex data(".*none.*");

std::string convert_csv(std::string line);

int main(int argc, char** argv) {
  int c = 0;
  extern char* optarg;
  extern int optind, opterr, optopt;
  char fi[256] = {0};
  char fo[256] = {0};
  std::string line;
 
  
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

  std::fstream fin;
  fin.open(fi, std::fstream::in);
  std::fstream fout;
  fout.open(fo, std::fstream::out);

  while(!fin.eof()) {
    getline(fin, line);
    if(regex_match(line, data)) {
      line = convert_csv(line);
      fout << line << '\n';
    }
  }

  fin.close();
  fout.close();
  return 0;
}

std::string convert_csv(std::string line) {
  /* Remove Spaces */
  line.erase(std::remove_if(line.begin(), line.end(), is_space), line.end());
  std::replace(line.begin(), line.end(), '|', ',');
  return line;
}
