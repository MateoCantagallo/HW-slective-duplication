.text
.globl _start
.ent _start
_start:
    .frame $sp, 0, $26
    # Call main with argc, argv from stack
    ldq $16, 0($sp)      # argc
    addq $sp, 8, $17     # argv
    jsr $26, main
    # Exit with return code from main
    mov $0, $16          # exit code
    ldiq $0, 1           # SYS_exit
    callsys
.end _start
