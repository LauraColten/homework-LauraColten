#include "config.h"
    .global      delay
    .section    .text
delay:
        ldi      r26, 255
1:      dec      r26
        brne     1b
        ret
delay:
        ldi      r27, 255
2:      dec      r27
        brne     1b
        ret
delay:
        ldi      r28, 255
3:      dec      r28
        brne     1b
        ret
delay:
        ldi      r29, 255
4:      dec      r29
        brne     1b
        ret