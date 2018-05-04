#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "main.h"

int call_go(char * c_string) 
{
    // c string -> go string
    GoString go_string;
    go_string.p = c_string;
    go_string.n = strlen(c_string) - 1;

    return DirenvProxy(go_string);
}

int main(int argc, char **argv) 
{
    int status = call_go(".");
    printf("%i\n", status);
    

    const char* s = getenv("WOW"); 
    printf("PATH :%s\n",(s!=NULL)? s : "getenv returned NULL"); 

    return status;
}

