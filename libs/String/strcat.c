/* $Id$ */

#include <FBString/Strcat.h>

#include <stdlib.h>
#include <string.h>

char* FBStrcat(const char* a, const char* b){
	char* str = malloc(strlen(a) + strlen(b) + 1);
	strcpy(str, a);
	strcpy(str + strlen(a), b);
	return str;
}
