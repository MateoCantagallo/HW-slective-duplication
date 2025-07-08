	.set noreorder
	.set volatile
	.set noat
	.set nomacro
	.text
	.align 2
	.globl main
	.ent main
$main..ng:
main:
	.eflag 48
	.frame $15,32,$26,0
	.mask 0x4008000,-32
$LFB0:
	.cfi_startproc
	lda $30,-32($30)
	.cfi_def_cfa_offset 32
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -32
	.cfi_offset 15, -24
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 0
	stl $31,16($15)
	lda $1,3($31)
	stl $1,20($15)
	lda $1,3($31)
	stl $1,24($15)
	stl $31,28($15)
	br $31,$L2
$L3:
	ldl $1,28($15)
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	stl $1,16($15)
	ldl $1,28($15)
	addl $31,$1,$1
	addl $1,1,$1
	addl $31,$1,$1
	stl $1,28($15)
$L2:
	ldl $1,28($15)
	addl $31,$1,$1
	lda $2,9999($31)
	cmple $1,$2,$1
	bne $1,$L3
	stl $31,28($15)
	br $31,$L4
$L5:
	ldl $1,28($15)
	addl $31,$1,$1
	ldl $2,20($15)
	subl $2,$1,$1
	stl $1,20($15)
	ldl $1,28($15)
	addl $31,$1,$1
	addl $1,1,$1
	addl $31,$1,$1
	stl $1,28($15)
$L4:
	ldl $1,28($15)
	addl $31,$1,$1
	lda $2,9999($31)
	cmple $1,$2,$1
	bne $1,$L5
	stl $31,28($15)
	br $31,$L6
$L7:
	ldl $1,28($15)
	addl $31,$1,$1
	ldl $2,24($15)
	mull $2,$1,$1
	stl $1,24($15)
	ldl $1,28($15)
	addl $31,$1,$1
	addl $1,1,$1
	addl $31,$1,$1
	stl $1,28($15)
$L6:
	ldl $1,28($15)
	addl $31,$1,$1
	cmple $1,9,$1
	bne $1,$L7
	mov $31,$1
	mov $1,$0
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,32($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE0:
	.end main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
