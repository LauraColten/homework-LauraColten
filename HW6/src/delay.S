#include "config.h"
    .global      delay
    .section    .text
delay:
        ldi      r26, 5
1:

        ldi      r27, 200
2:

        ldi      r28, 200
3:
        dec r28
        brne 3b
        dec r27
        brne 2b
        dec r26
        brne 1b
        ret
