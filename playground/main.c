#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "main.h"

char *call_go()
{
    GoString go_msg = GetHelloWorldFromGo(); // not null terminated.

    char *c_msg = malloc(go_msg.n + 1); // check failure, todo.

    memcpy(c_msg, go_msg.p, go_msg.n);
    c_msg[go_msg.n] = '\0'; // make null terminated.

    return c_msg; // this needs to be free'd later.
}
