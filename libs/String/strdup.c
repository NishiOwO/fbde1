/* $Id$ */

#include <FBString/Strdup.h>

#include <stdlib.h>
#include <string.h>

char* FBStrdup(const char* a){
	char* str = malloc(strlen(a) + 1);
	strcpy(str, a);
	return str;
}
