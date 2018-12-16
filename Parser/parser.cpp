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

bool is_space(char i) {return i == ' ' || i == '\t';}

char* output_file_format = "%s_%u.c";

typedef struct loop_info_t{
  int line_num;
  int lower_bound;
  int upper_bound;
  char index;
  bool innermost;
}loop_info;

std::vector<loop_info_t> loops;
unsigned int identifier;

std::regex loop(".*for.*");
std::regex begin_region(".*BEGIN_LOOP_PARSER.*");
std::regex end_region(".*END_LOOP_PARSER.*");

char get_indexer(std::string line);
int get_upper_bound(std::string line);
int get_lower_bound(std::string line);
void print_loop_info(loop_info l);

int main(int argc, char** argv) {
  int c = 0;
  extern char* optarg;
  extern int optind, opterr, optopt;
  char fi[256] = {0};
  char fo[256] = {0};
  char fnames[256] = {0};
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
  fin.open(fi, std::fstream::in);

  loop_info new_loop;
  bool roi = false;

  while(!fin.eof()) {
    getline(fin, line);
    line_count++;
    if(regex_match(line, begin_region)) {
      std::cout << "Entering ROI" << '\n';
      roi = true;
    }
    if(regex_match(line, end_region)) {
      std::cout << "Leaving ROI" << '\n';
      roi = false;
    }

    if(regex_match(line, loop) && roi) {
      new_loop.line_num = line_count;
      new_loop.lower_bound = get_lower_bound(line);
      new_loop.upper_bound = get_upper_bound(line);
      new_loop.index = get_indexer(line);
      loops.push_back(new_loop);
      std::cout << line << '\n';
    }
  }

  for(auto i : loops) {
    print_loop_info(i);
  }
  
  fin.close();
  fout.close();

  return 0;
}

char get_indexer(std::string line) {
  /* Remove Spaces */
  line.erase(std::remove_if(line.begin(), line.end(), is_space), line.end());

  /* Parse for the indexing var */
  std::string delimiter_left = "for(";
  std::string delimiter_right = "=";

  size_t pos = 0;
  if((pos = line.find(delimiter_left)) != std::string::npos) {
    line.erase(0, pos + delimiter_left.length());
    if((pos = line.find(delimiter_right)) != std::string::npos) {
      line.erase(pos);
    }
  }
  return line.c_str()[0];
}

int get_upper_bound(std::string line) {
  /* Remove Spaces */
  line.erase(std::remove_if(line.begin(), line.end(), is_space), line.end());

  /* Parse for the indexing var */
  std::string delimiter_left = "<";
  std::string delimiter_right = ";";

  size_t pos = 0;
  if((pos = line.find(delimiter_left)) != std::string::npos) {
    line.erase(0, pos + delimiter_left.length());
    if((pos = line.find(delimiter_right)) != std::string::npos) {
      line.erase(pos);
    }
  }
  return (int)std::stoi(line,0,10);
}

int get_lower_bound(std::string line) {
  /* Remove Spaces */
  line.erase(std::remove_if(line.begin(), line.end(), is_space), line.end());

  /* Parse for the indexing var */
  std::string delimiter_left = "=";
  std::string delimiter_right = ";";

  size_t pos = 0;
  if((pos = line.find(delimiter_left)) != std::string::npos) {
    line.erase(0, pos + delimiter_left.length());
    if((pos = line.find(delimiter_right)) != std::string::npos) {
      line.erase(pos);
    }
  }
  return (int)std::stoi(line,0,10);
}

void print_loop_info(loop_info l) {
  std::cout << l.line_num << " " << l.lower_bound << " " << l.upper_bound << " " << l.index << '\n';
}
