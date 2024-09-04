// Author: Khoa Nguyen

#include <iostream>

using namespace std;

extern "C" char *hello_world();

int main(int argc, char *argv[])
{
  cout << "What is your name? ";
  char *name = (char *)hello_world();
  cout << "Hello " << name << endl;

  return 0;
} // End of main