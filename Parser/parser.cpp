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

#define FORMAT_STR "%s_%s.c"
#define LOOPUNROLL "#pragma HLS UNROLL factor=8"
char* file_name_text = "files.txt";
char output_file_name[256] = {0};

int permutations = 0;

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
std::string make_identifier(int id, int nl);

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

  std::fstream fin;
  fin.open(fi, std::fstream::in);

  loop_info new_loop;
  bool roi = false;

  while(!fin.eof()) {
    getline(fin, line);
    line_count++;
    if(regex_match(line, begin_region)) {
      roi = true;
    }
    if(regex_match(line, end_region)) {
      roi = false;
    }

    if(regex_match(line, loop) && roi) {
      new_loop.line_num = line_count;
      new_loop.lower_bound = get_lower_bound(line);
      new_loop.upper_bound = get_upper_bound(line);
      new_loop.index = get_indexer(line);
      loops.push_back(new_loop);
      //std::cout << line << '\n';
    }
  }

  fin.close();

  permutations = std::pow(2, (int)loops.size());
  std::string identifier;
  int loop_count = 0;
  std::vector<std::string> output_file_names;

  for(int i = 0; i < permutations; i++) {
    /* Create format string */
    identifier = make_identifier(i, (int)loops.size()); 

    /* Open Output File and Input File */
    sprintf(output_file_name, FORMAT_STR, fo, identifier.c_str()); 
    std::fstream fout;
    fout.open(output_file_name, std::fstream::out);
    std::fstream fin;
    fin.open(fi, std::fstream::in);
    loop_count = 0;

    /* Copy Contents and Print pragmas */
    while(!fin.eof()) {
      getline(fin, line);
      fout << line << '\n';
      if(regex_match(line, begin_region)) {
        roi = true;
      }
      if(regex_match(line, end_region)) {
        roi = false;
      }

      if(regex_match(line, loop) && roi) {
        if((i & (1<<loop_count)) != 0) {
          fout << LOOPUNROLL << '\n';
        }
        loop_count++;
      }
    }

    fout.close();
    fin.close();

    /* Add file to filename vector */
    output_file_names.push_back(std::string(output_file_name));
  }

  std::fstream text;
  text.open(file_name_text, std::fstream::out);
  text << output_file_names.size() << '\n';
  for(auto i : output_file_names){
    text << i << '\n';
  }
  text.close();

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

std::string make_identifier(int id, int nl) {
  std::string ret;
  for(int i = 0; i < nl; i++) {
    if((id & (1 << i)) == 0) ret = ret + "0";
    else ret = ret + "1";
  }
  return ret;
}
