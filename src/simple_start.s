.text
.globl _start
.ent _start
_start:
    # Simple program entry
    ldq $16, 0($sp)      # argc
    addq $sp, 8, $17     # argv  
    jsr $26, main
    mov $0, $16          # exit code
    ldiq $0, 1           # SYS_exit syscall number
    callsys
.end _start
