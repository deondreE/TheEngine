#include "sandbox.hpp"
#include "util/dictionary.hpp"

#include <stdio.h>

using namespace util;

int main(void) 
{
	Dictionary<int, DictionaryAccessor::Dynamic, 0> dynamic_dict;
	dynamic_dict.print_type();
	Dictionary<int, DictionaryAccessor::Fixed, 256> fixed_dict;
	fixed_dict.print_type();
	printf("Testing this thing\n");
	return 0;
}