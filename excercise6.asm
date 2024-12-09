0:  2A        aload_0             ; Load the "this" object (current object) onto the stack
1:  2B        aload_1             ; Load the first parameter (String) onto the stack
2:  B6 00 07  invokevirtual #7    ; Call the compareToIgnoreCase method
5:  04        iconst_1            ; Always push 1 onto the stack
6:  AC        ireturn             ; Return 1 (the value at the top of the stack)
