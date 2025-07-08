	.set noreorder
	.set volatile
	.set noat
	.set nomacro
	.text
	.section	.rodata
$LC1:
	.string	"LBM_allocateGrid: could not allocate %.1f MByte\n"
	.text
	.align 2
	.globl LBM_allocateGrid
	.ent LBM_allocateGrid
LBM_allocateGrid:
	.eflag 48
	.frame $15,48,$26,0
	.mask 0x4008000,-48
$LFB6:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!1
	lda $29,0($29)		!gpdisp!1
$LBM_allocateGrid..ng:
	lda $30,-48($30)
	.cfi_def_cfa_offset 48
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -48
	.cfi_offset 15, -40
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,32($15)
	ldah $1,6($31)
	lda $1,6784($1)
	stq $1,16($15)
	ldq $2,16($15)
	ldah $1,198($31)
	lda $1,23872($1)
	addq $2,$1,$1
	sll $1,4,$1
	stq $1,24($15)
	ldq $16,24($15)
	ldq $27,malloc($29)		!literal!2
	jsr $26,($27),0		!lituse_jsr!2
	ldah $29,0($26)		!gpdisp!3
	lda $29,0($29)		!gpdisp!3
	mov $0,$1
	mov $1,$2
	ldq $1,32($15)
	stq $2,0($1)
	ldq $1,32($15)
	ldq $1,0($1)
	bne $1,$L2
	ldq $1,24($15)
	lda $2,-1($31)
	cmple $1,$2,$2
	bne $2,$L3
	stq $1,40($15)
	ldt $f11,40($15)
	cvtqt $f11,$f10
	trapb
	br $31,$L4
$L3:
	srl $1,1,$2
	and $1,1,$1
	bis $2,$1,$2
	stq $2,40($15)
	ldt $f10,40($15)
	cvtqt $f10,$f11
	trapb
	addt/su $f11,$f11,$f10
	trapb
$L4:
	ldah $1,$LC0($29)		!gprelhigh
	ldt $f11,$LC0($1)		!gprellow
	divt/su $f10,$f11,$f12
	trapb
	cpys $f12,$f12,$f17
	ldah $1,$LC1($29)		!gprelhigh
	lda $16,$LC1($1)		!gprellow
	ldq $27,printf($29)		!literal!4
	jsr $26,($27),0		!lituse_jsr!4
	ldah $29,0($26)		!gpdisp!5
	lda $29,0($29)		!gpdisp!5
	lda $16,1($31)
	ldq $27,exit($29)		!literal!6
	jsr $26,($27),exit		!lituse_jsr!6
$L2:
	ldq $1,32($15)
	ldq $2,0($1)
	ldq $1,16($15)
	s8addq $1,0,$1
	addq $2,$1,$2
	ldq $1,32($15)
	stq $2,0($1)
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,48($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE6:
	.end LBM_allocateGrid
	.align 2
	.globl LBM_freeGrid
	.ent LBM_freeGrid
LBM_freeGrid:
	.eflag 48
	.frame $15,48,$26,0
	.mask 0x4008000,-48
$LFB7:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!7
	lda $29,0($29)		!gpdisp!7
$LBM_freeGrid..ng:
	lda $30,-48($30)
	.cfi_def_cfa_offset 48
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -48
	.cfi_offset 15, -40
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,32($15)
	ldah $1,6($31)
	lda $1,6784($1)
	stq $1,16($15)
	ldq $1,32($15)
	ldq $2,0($1)
	ldq $1,16($15)
	s8addq $1,0,$1
	subq $31,$1,$1
	addq $2,$1,$1
	mov $1,$16
	ldq $27,free($29)		!literal!8
	jsr $26,($27),free		!lituse_jsr!8
	ldah $29,0($26)		!gpdisp!9
	lda $29,0($29)		!gpdisp!9
	ldq $1,32($15)
	stq $31,0($1)
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,48($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE7:
	.end LBM_freeGrid
	.align 2
	.globl LBM_initializeGrid
	.ent LBM_initializeGrid
LBM_initializeGrid:
	.eflag 48
	.frame $15,48,$26,0
	.mask 0x4008000,-48
$LFB8:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!10
	lda $29,0($29)		!gpdisp!10
$LBM_initializeGrid..ng:
	lda $30,-48($30)
	.cfi_def_cfa_offset 48
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -48
	.cfi_offset 15, -40
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,32($15)
	ldah $1,-6($31)
	lda $1,-6784($1)
	stl $1,16($15)
	br $31,$L7
$L8:
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC2($29)		!gprelhigh
	ldt $f10,$LC2($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	ldah $2,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($2)		!gprellow
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,32($15)
	addq $2,$1,$1
	stq $1,24($15)
	ldq $1,24($15)
	stl $31,0($1)
	ldl $1,16($15)
	addl $1,20,$1
	stl $1,16($15)
$L7:
	ldl $2,16($15)
	ldah $1,403($31)
	lda $1,-11009($1)
	cmple $2,$1,$1
	bne $1,$L8
	bis $31,$31,$31
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,48($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE8:
	.end LBM_initializeGrid
	.align 2
	.globl LBM_swapGrids
	.ent LBM_swapGrids
$LBM_swapGrids..ng:
LBM_swapGrids:
	.eflag 48
	.frame $15,48,$26,0
	.mask 0x4008000,-48
$LFB9:
	.cfi_startproc
	lda $30,-48($30)
	.cfi_def_cfa_offset 48
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -48
	.cfi_offset 15, -40
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 0
	stq $16,32($15)
	stq $17,40($15)
	ldq $1,32($15)
	ldq $1,0($1)
	stq $1,16($15)
	ldq $1,40($15)
	ldq $2,0($1)
	ldq $1,32($15)
	stq $2,0($1)
	ldq $1,40($15)
	ldq $2,16($15)
	stq $2,0($1)
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,48($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE9:
	.end LBM_swapGrids
	.section	.rodata
$LC5:
	.string	"rb"
	.text
	.align 2
	.globl LBM_loadObstacleFile
	.ent LBM_loadObstacleFile
LBM_loadObstacleFile:
	.eflag 48
	.frame $15,64,$26,0
	.mask 0x4008000,-64
$LFB10:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!11
	lda $29,0($29)		!gpdisp!11
$LBM_loadObstacleFile..ng:
	lda $30,-64($30)
	.cfi_def_cfa_offset 64
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -64
	.cfi_offset 15, -56
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,48($15)
	stq $17,56($15)
	ldah $1,$LC5($29)		!gprelhigh
	lda $17,$LC5($1)		!gprellow
	ldq $16,56($15)
	ldq $27,fopen($29)		!literal!12
	jsr $26,($27),0		!lituse_jsr!12
	ldah $29,0($26)		!gpdisp!13
	lda $29,0($29)		!gpdisp!13
	mov $0,$1
	stq $1,32($15)
	stl $31,24($15)
	br $31,$L11
$L17:
	stl $31,20($15)
	br $31,$L12
$L16:
	stl $31,16($15)
	br $31,$L13
$L15:
	ldq $16,32($15)
	ldq $27,fgetc($29)		!literal!14
	jsr $26,($27),0		!lituse_jsr!14
	ldah $29,0($26)		!gpdisp!15
	lda $29,0($29)		!gpdisp!15
	mov $0,$1
	cmpeq $1,46,$1
	bne $1,$L14
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,48($15)
	addq $2,$1,$1
	stq $1,40($15)
	ldq $1,40($15)
	ldl $1,0($1)
	bis $1,1,$1
	addl $31,$1,$2
	ldq $1,40($15)
	stl $2,0($1)
$L14:
	ldl $1,16($15)
	addl $1,1,$1
	stl $1,16($15)
$L13:
	ldl $1,16($15)
	cmple $1,99,$1
	bne $1,$L15
	ldq $16,32($15)
	ldq $27,fgetc($29)		!literal!16
	jsr $26,($27),0		!lituse_jsr!16
	ldah $29,0($26)		!gpdisp!17
	lda $29,0($29)		!gpdisp!17
	ldl $1,20($15)
	addl $1,1,$1
	stl $1,20($15)
$L12:
	ldl $1,20($15)
	cmple $1,99,$1
	bne $1,$L16
	ldq $16,32($15)
	ldq $27,fgetc($29)		!literal!18
	jsr $26,($27),0		!lituse_jsr!18
	ldah $29,0($26)		!gpdisp!19
	lda $29,0($29)		!gpdisp!19
	ldl $1,24($15)
	addl $1,1,$1
	stl $1,24($15)
$L11:
	ldl $1,24($15)
	cmple $1,129,$1
	bne $1,$L17
	ldq $16,32($15)
	ldq $27,fclose($29)		!literal!20
	jsr $26,($27),0		!lituse_jsr!20
	ldah $29,0($26)		!gpdisp!21
	lda $29,0($29)		!gpdisp!21
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,64($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE10:
	.end LBM_loadObstacleFile
	.align 2
	.globl LBM_initializeSpecialCellsForLDC
	.ent LBM_initializeSpecialCellsForLDC
$LBM_initializeSpecialCellsForLDC..ng:
LBM_initializeSpecialCellsForLDC:
	.eflag 48
	.frame $15,64,$26,0
	.mask 0x4008000,-64
$LFB11:
	.cfi_startproc
	lda $30,-64($30)
	.cfi_def_cfa_offset 64
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -64
	.cfi_offset 15, -56
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 0
	stq $16,48($15)
	lda $1,-2($31)
	stl $1,24($15)
	br $31,$L19
$L28:
	stl $31,20($15)
	br $31,$L20
$L27:
	stl $31,16($15)
	br $31,$L21
$L26:
	ldl $1,16($15)
	beq $1,$L22
	ldl $1,16($15)
	cmpeq $1,99,$1
	bne $1,$L22
	ldl $1,20($15)
	beq $1,$L22
	ldl $1,20($15)
	cmpeq $1,99,$1
	bne $1,$L22
	ldl $1,24($15)
	beq $1,$L22
	ldl $1,24($15)
	cmpeq $1,129,$1
	beq $1,$L23
$L22:
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,48($15)
	addq $2,$1,$1
	stq $1,40($15)
	ldq $1,40($15)
	ldl $1,0($1)
	bis $1,1,$1
	addl $31,$1,$2
	ldq $1,40($15)
	stl $2,0($1)
	br $31,$L24
$L23:
	ldl $1,24($15)
	cmpeq $1,1,$1
	bne $1,$L25
	ldl $1,24($15)
	cmpeq $1,128,$1
	beq $1,$L24
$L25:
	ldl $1,16($15)
	cmple $1,1,$1
	bne $1,$L24
	ldl $1,16($15)
	cmple $1,97,$1
	beq $1,$L24
	ldl $1,20($15)
	cmple $1,1,$1
	bne $1,$L24
	ldl $1,20($15)
	cmple $1,97,$1
	beq $1,$L24
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,48($15)
	addq $2,$1,$1
	stq $1,32($15)
	ldq $1,32($15)
	ldl $1,0($1)
	bis $1,2,$1
	addl $31,$1,$2
	ldq $1,32($15)
	stl $2,0($1)
$L24:
	ldl $1,16($15)
	addl $1,1,$1
	stl $1,16($15)
$L21:
	ldl $1,16($15)
	cmple $1,99,$1
	bne $1,$L26
	ldl $1,20($15)
	addl $1,1,$1
	stl $1,20($15)
$L20:
	ldl $1,20($15)
	cmple $1,99,$1
	bne $1,$L27
	ldl $1,24($15)
	addl $1,1,$1
	stl $1,24($15)
$L19:
	ldl $1,24($15)
	cmple $1,131,$1
	bne $1,$L28
	bis $31,$31,$31
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,64($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE11:
	.end LBM_initializeSpecialCellsForLDC
	.align 2
	.globl LBM_initializeSpecialCellsForChannel
	.ent LBM_initializeSpecialCellsForChannel
$LBM_initializeSpecialCellsForChannel..ng:
LBM_initializeSpecialCellsForChannel:
	.eflag 48
	.frame $15,64,$26,0
	.mask 0x4008000,-64
$LFB12:
	.cfi_startproc
	lda $30,-64($30)
	.cfi_def_cfa_offset 64
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -64
	.cfi_offset 15, -56
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 0
	stq $16,48($15)
	lda $1,-2($31)
	stl $1,24($15)
	br $31,$L30
$L38:
	stl $31,20($15)
	br $31,$L31
$L37:
	stl $31,16($15)
	br $31,$L32
$L36:
	ldl $1,16($15)
	beq $1,$L33
	ldl $1,16($15)
	cmpeq $1,99,$1
	bne $1,$L33
	ldl $1,20($15)
	beq $1,$L33
	ldl $1,20($15)
	cmpeq $1,99,$1
	beq $1,$L34
$L33:
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,48($15)
	addq $2,$1,$1
	stq $1,32($15)
	ldq $1,32($15)
	ldl $1,0($1)
	bis $1,1,$1
	addl $31,$1,$2
	ldq $1,32($15)
	stl $2,0($1)
	ldl $1,24($15)
	beq $1,$L35
	ldl $1,24($15)
	cmpeq $1,129,$1
	beq $1,$L34
$L35:
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,48($15)
	addq $2,$1,$1
	ldl $1,0($1)
	and $1,1,$1
	addl $31,$1,$1
	bne $1,$L34
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,48($15)
	addq $2,$1,$1
	stq $1,40($15)
	ldq $1,40($15)
	ldl $1,0($1)
	bis $1,4,$1
	addl $31,$1,$2
	ldq $1,40($15)
	stl $2,0($1)
$L34:
	ldl $1,16($15)
	addl $1,1,$1
	stl $1,16($15)
$L32:
	ldl $1,16($15)
	cmple $1,99,$1
	bne $1,$L36
	ldl $1,20($15)
	addl $1,1,$1
	stl $1,20($15)
$L31:
	ldl $1,20($15)
	cmple $1,99,$1
	bne $1,$L37
	ldl $1,24($15)
	addl $1,1,$1
	stl $1,24($15)
$L30:
	ldl $1,24($15)
	cmple $1,131,$1
	bne $1,$L38
	bis $31,$31,$31
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,64($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE12:
	.end LBM_initializeSpecialCellsForChannel
	.align 2
	.globl LBM_performStreamCollideBGK
	.ent LBM_performStreamCollideBGK
LBM_performStreamCollideBGK:
	.eflag 48
	.frame $15,80,$26,0
	.mask 0x4008000,-80
$LFB13:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!22
	lda $29,0($29)		!gpdisp!22
$LBM_performStreamCollideBGK..ng:
	lda $30,-80($30)
	.cfi_def_cfa_offset 80
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -80
	.cfi_offset 15, -72
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,64($15)
	stq $17,72($15)
	stl $31,16($15)
	br $31,$L40
$L44:
	ldl $1,16($15)
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldl $1,0($1)
	and $1,1,$1
	addl $31,$1,$1
	beq $1,$L41
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,-1998($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,2001($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $1,16($15)
	subl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $1,16($15)
	addl $1,23,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,-3($31)
	lda $1,-3386($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,3($31)
	lda $1,3397($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,-2010($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,-1971($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,1988($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,2027($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,-3($31)
	lda $1,-5378($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,3($31)
	lda $1,1405($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,-3($31)
	lda $1,-1380($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,3($31)
	lda $1,5403($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,-3($31)
	lda $1,-3394($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,3($31)
	lda $1,3389($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,-3($31)
	lda $1,-3356($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,3($31)
	lda $1,3427($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,72($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	br $31,$L42
$L41:
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,48($15)
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,24($15)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,32($15)
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,40($15)
	ldt $f12,24($15)
	ldt $f11,48($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,24($15)
	ldt $f12,32($15)
	ldt $f11,48($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,32($15)
	ldt $f12,40($15)
	ldt $f11,48($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,40($15)
	ldl $1,16($15)
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldl $1,0($1)
	and $1,2,$1
	addl $31,$1,$1
	beq $1,$L43
	ldah $1,$LC6($29)		!gprelhigh
	ldt $f10,$LC6($1)		!gprellow
	stt $f10,24($15)
	ldah $1,$LC7($29)		!gprelhigh
	ldt $f10,$LC7($1)		!gprellow
	stt $f10,32($15)
	stt $f31,40($15)
$L43:
	ldt $f10,24($15)
	mult/su $f10,$f10,$f12
	trapb
	ldt $f10,32($15)
	mult/su $f10,$f10,$f11
	trapb
	addt/su $f12,$f11,$f13
	trapb
	ldt $f10,40($15)
	mult/su $f10,$f10,$f11
	trapb
	addt/su $f13,$f11,$f12
	trapb
	ldah $1,$LC8($29)		!gprelhigh
	ldt $f11,$LC8($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,56($15)
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC10($29)		!gprelhigh
	ldt $f10,$LC10($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f14,$LC11($1)		!gprellow
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC12($29)		!gprelhigh
	ldt $f10,$LC12($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,32($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f10,32($15)
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,2001($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC12($29)		!gprelhigh
	ldt $f10,$LC12($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,32($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	subt/su $f11,$f10,$f14
	trapb
	ldt $f10,32($15)
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,-1998($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC12($29)		!gprelhigh
	ldt $f10,$LC12($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,24($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f10,24($15)
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,23,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC12($29)		!gprelhigh
	ldt $f10,$LC12($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,24($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	subt/su $f11,$f10,$f14
	trapb
	ldt $f10,24($15)
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	subl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC12($29)		!gprelhigh
	ldt $f10,$LC12($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,40($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f10,40($15)
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3397($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC12($29)		!gprelhigh
	ldt $f10,$LC12($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,40($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	subt/su $f11,$f10,$f14
	trapb
	ldt $f10,40($15)
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3386($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f11,24($15)
	ldt $f10,32($15)
	addt/su $f11,$f10,$f14
	trapb
	ldt $f15,24($15)
	ldt $f10,32($15)
	addt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,2027($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f11,32($15)
	ldt $f10,24($15)
	subt/su $f11,$f10,$f14
	trapb
	ldt $f15,32($15)
	ldt $f10,24($15)
	subt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,1988($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f11,24($15)
	ldt $f10,32($15)
	subt/su $f11,$f10,$f14
	trapb
	ldt $f15,24($15)
	ldt $f10,32($15)
	subt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,-1971($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f10,24($15)
	cpysn $f10,$f10,$f11
	ldt $f10,32($15)
	subt/su $f11,$f10,$f14
	trapb
	ldt $f10,24($15)
	cpysn $f10,$f10,$f15
	ldt $f10,32($15)
	subt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,-2010($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f11,32($15)
	ldt $f10,40($15)
	addt/su $f11,$f10,$f14
	trapb
	ldt $f15,32($15)
	ldt $f10,40($15)
	addt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,5403($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f11,32($15)
	ldt $f10,40($15)
	subt/su $f11,$f10,$f14
	trapb
	ldt $f15,32($15)
	ldt $f10,40($15)
	subt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-1380($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f11,40($15)
	ldt $f10,32($15)
	subt/su $f11,$f10,$f14
	trapb
	ldt $f15,40($15)
	ldt $f10,32($15)
	subt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,1405($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f10,32($15)
	cpysn $f10,$f10,$f11
	ldt $f10,40($15)
	subt/su $f11,$f10,$f14
	trapb
	ldt $f10,32($15)
	cpysn $f10,$f10,$f15
	ldt $f10,40($15)
	subt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-5378($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f11,24($15)
	ldt $f10,40($15)
	addt/su $f11,$f10,$f14
	trapb
	ldt $f15,24($15)
	ldt $f10,40($15)
	addt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3427($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f11,24($15)
	ldt $f10,40($15)
	subt/su $f11,$f10,$f14
	trapb
	ldt $f15,24($15)
	ldt $f10,40($15)
	subt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3356($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f11,40($15)
	ldt $f10,24($15)
	subt/su $f11,$f10,$f14
	trapb
	ldt $f15,40($15)
	ldt $f10,24($15)
	subt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3389($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldah $1,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,48($15)
	ldah $1,$LC15($29)		!gprelhigh
	ldt $f10,$LC15($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f10,24($15)
	cpysn $f10,$f10,$f11
	ldt $f10,40($15)
	subt/su $f11,$f10,$f14
	trapb
	ldt $f10,24($15)
	cpysn $f10,$f10,$f15
	ldt $f10,40($15)
	subt/su $f15,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f15
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f14
	trapb
	ldt $f11,56($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3394($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,72($15)
	addq $2,$1,$1
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
$L42:
	ldl $1,16($15)
	addl $1,20,$1
	stl $1,16($15)
$L40:
	ldl $2,16($15)
	ldah $1,397($31)
	lda $1,-17793($1)
	cmple $2,$1,$1
	bne $1,$L44
	bis $31,$31,$31
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,80($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE13:
	.end LBM_performStreamCollideBGK
	.align 2
	.globl LBM_performStreamCollideTRT
	.ent LBM_performStreamCollideTRT
LBM_performStreamCollideTRT:
	.eflag 48
	.frame $15,736,$26,0
	.mask 0x4008000,-736
$LFB14:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!23
	lda $29,0($29)		!gpdisp!23
$LBM_performStreamCollideTRT..ng:
	lda $30,-736($30)
	.cfi_def_cfa_offset 736
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -736
	.cfi_offset 15, -728
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,720($15)
	stq $17,728($15)
	ldah $1,$LC16($29)		!gprelhigh
	ldt $f10,$LC16($1)		!gprellow
	stt $f10,48($15)
	stl $31,16($15)
	br $31,$L46
$L50:
	ldl $1,16($15)
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldl $1,0($1)
	and $1,1,$1
	addl $31,$1,$1
	beq $1,$L47
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,-1998($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,2001($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $1,16($15)
	subl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $1,16($15)
	addl $1,23,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,-3($31)
	lda $1,-3386($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,3($31)
	lda $1,3397($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,-2010($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,-1971($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,1988($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $1,16($15)
	lda $1,2027($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,-3($31)
	lda $1,-5378($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,3($31)
	lda $1,1405($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,-3($31)
	lda $1,-1380($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,3($31)
	lda $1,5403($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,-3($31)
	lda $1,-3394($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,3($31)
	lda $1,3389($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,-3($31)
	lda $1,-3356($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$2
	ldl $3,16($15)
	ldah $1,3($31)
	lda $1,3427($1)
	addl $3,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $3,728($15)
	addq $3,$1,$1
	ldt $f10,0($2)
	stt $f10,0($1)
	br $31,$L48
$L47:
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,56($15)
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,24($15)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,32($15)
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,40($15)
	ldt $f12,24($15)
	ldt $f11,56($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,24($15)
	ldt $f12,32($15)
	ldt $f11,56($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,32($15)
	ldt $f12,40($15)
	ldt $f11,56($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,40($15)
	ldl $1,16($15)
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldl $1,0($1)
	and $1,2,$1
	addl $31,$1,$1
	beq $1,$L49
	ldah $1,$LC6($29)		!gprelhigh
	ldt $f10,$LC6($1)		!gprellow
	stt $f10,24($15)
	ldah $1,$LC7($29)		!gprelhigh
	ldt $f10,$LC7($1)		!gprellow
	stt $f10,32($15)
	stt $f31,40($15)
$L49:
	ldt $f10,24($15)
	mult/su $f10,$f10,$f12
	trapb
	ldt $f10,32($15)
	mult/su $f10,$f10,$f11
	trapb
	addt/su $f12,$f11,$f13
	trapb
	ldt $f10,40($15)
	mult/su $f10,$f10,$f11
	trapb
	addt/su $f13,$f11,$f12
	trapb
	ldah $1,$LC8($29)		!gprelhigh
	ldt $f11,$LC8($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,64($15)
	ldt $f11,56($15)
	ldah $1,$LC2($29)		!gprelhigh
	ldt $f10,$LC2($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f13,$LC11($1)		!gprellow
	ldt $f10,64($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,392($15)
	ldt $f11,56($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,32($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f10,32($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,64($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,408($15)
	ldt $f10,408($15)
	stt $f10,400($15)
	ldt $f11,56($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,24($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f10,24($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,64($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,424($15)
	ldt $f10,424($15)
	stt $f10,416($15)
	ldt $f11,56($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,40($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f10,40($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,64($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,440($15)
	ldt $f10,440($15)
	stt $f10,432($15)
	ldt $f11,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,24($15)
	ldt $f10,32($15)
	addt/su $f13,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,24($15)
	ldt $f11,32($15)
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,64($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,472($15)
	ldt $f10,472($15)
	stt $f10,448($15)
	ldt $f11,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,32($15)
	ldt $f10,24($15)
	subt/su $f13,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,32($15)
	ldt $f11,24($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,64($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,464($15)
	ldt $f10,464($15)
	stt $f10,456($15)
	ldt $f11,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,32($15)
	ldt $f10,40($15)
	addt/su $f13,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,32($15)
	ldt $f11,40($15)
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,64($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,504($15)
	ldt $f10,504($15)
	stt $f10,480($15)
	ldt $f11,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,32($15)
	ldt $f10,40($15)
	subt/su $f13,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,32($15)
	ldt $f11,40($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,64($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,496($15)
	ldt $f10,496($15)
	stt $f10,488($15)
	ldt $f11,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,24($15)
	ldt $f10,40($15)
	addt/su $f13,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,24($15)
	ldt $f11,40($15)
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,64($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,536($15)
	ldt $f10,536($15)
	stt $f10,512($15)
	ldt $f11,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,24($15)
	ldt $f10,40($15)
	subt/su $f13,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f13
	trapb
	ldt $f14,24($15)
	ldt $f11,40($15)
	subt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,64($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,528($15)
	ldt $f10,528($15)
	stt $f10,520($15)
	stt $f31,552($15)
	ldt $f12,56($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f12,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,32($15)
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,560($15)
	ldt $f10,560($15)
	cpysn $f10,$f10,$f10
	stt $f10,568($15)
	ldt $f12,56($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f12,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,24($15)
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,576($15)
	ldt $f10,576($15)
	cpysn $f10,$f10,$f10
	stt $f10,584($15)
	ldt $f12,56($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f12,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,40($15)
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,592($15)
	ldt $f10,592($15)
	cpysn $f10,$f10,$f10
	stt $f10,600($15)
	ldt $f12,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f12,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,24($15)
	ldt $f10,32($15)
	addt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,608($15)
	ldt $f10,608($15)
	cpysn $f10,$f10,$f10
	stt $f10,632($15)
	ldt $f12,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f12,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,32($15)
	ldt $f10,24($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,616($15)
	ldt $f10,616($15)
	cpysn $f10,$f10,$f10
	stt $f10,624($15)
	ldt $f12,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f12,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,32($15)
	ldt $f10,40($15)
	addt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,640($15)
	ldt $f10,640($15)
	cpysn $f10,$f10,$f10
	stt $f10,664($15)
	ldt $f12,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f12,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,32($15)
	ldt $f10,40($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,648($15)
	ldt $f10,648($15)
	cpysn $f10,$f10,$f10
	stt $f10,656($15)
	ldt $f12,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f12,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,24($15)
	ldt $f10,40($15)
	addt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,672($15)
	ldt $f10,672($15)
	cpysn $f10,$f10,$f10
	stt $f10,696($15)
	ldt $f12,56($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f12,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,24($15)
	ldt $f10,40($15)
	subt/su $f13,$f10,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,680($15)
	ldt $f10,680($15)
	cpysn $f10,$f10,$f10
	stt $f10,688($15)
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	stt $f10,72($15)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,88($15)
	ldt $f10,88($15)
	stt $f10,80($15)
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,104($15)
	ldt $f10,104($15)
	stt $f10,96($15)
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,120($15)
	ldt $f10,120($15)
	stt $f10,112($15)
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,152($15)
	ldt $f10,152($15)
	stt $f10,128($15)
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,144($15)
	ldt $f10,144($15)
	stt $f10,136($15)
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,184($15)
	ldt $f10,184($15)
	stt $f10,160($15)
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,176($15)
	ldt $f10,176($15)
	stt $f10,168($15)
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,216($15)
	ldt $f10,216($15)
	stt $f10,192($15)
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,208($15)
	ldt $f10,208($15)
	stt $f10,200($15)
	stt $f31,232($15)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,240($15)
	ldt $f10,240($15)
	cpysn $f10,$f10,$f10
	stt $f10,248($15)
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,256($15)
	ldt $f10,256($15)
	cpysn $f10,$f10,$f10
	stt $f10,264($15)
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,272($15)
	ldt $f10,272($15)
	cpysn $f10,$f10,$f10
	stt $f10,280($15)
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,288($15)
	ldt $f10,288($15)
	cpysn $f10,$f10,$f10
	stt $f10,312($15)
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,296($15)
	ldt $f10,296($15)
	cpysn $f10,$f10,$f10
	stt $f10,304($15)
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,320($15)
	ldt $f10,320($15)
	cpysn $f10,$f10,$f10
	stt $f10,344($15)
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,328($15)
	ldt $f10,328($15)
	cpysn $f10,$f10,$f10
	stt $f10,336($15)
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,352($15)
	ldt $f10,352($15)
	cpysn $f10,$f10,$f10
	stt $f10,376($15)
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC17($29)		!gprelhigh
	ldt $f11,$LC17($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,360($15)
	ldt $f10,360($15)
	cpysn $f10,$f10,$f10
	stt $f10,368($15)
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldt $f11,72($15)
	ldt $f10,392($15)
	subt/su $f11,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f10,$LC18($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,80($15)
	ldt $f10,400($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,240($15)
	ldt $f10,560($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,2001($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,88($15)
	ldt $f10,408($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,248($15)
	ldt $f10,568($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,-1998($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,96($15)
	ldt $f10,416($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,256($15)
	ldt $f10,576($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,23,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,104($15)
	ldt $f10,424($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,264($15)
	ldt $f10,584($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	subl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,112($15)
	ldt $f10,432($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,272($15)
	ldt $f10,592($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3397($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,120($15)
	ldt $f10,440($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,280($15)
	ldt $f10,600($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3386($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,128($15)
	ldt $f10,448($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,288($15)
	ldt $f10,608($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,2027($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,136($15)
	ldt $f10,456($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,296($15)
	ldt $f10,616($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,1988($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,144($15)
	ldt $f10,464($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,304($15)
	ldt $f10,624($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,-1971($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,152($15)
	ldt $f10,472($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,312($15)
	ldt $f10,632($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	lda $1,-2010($1)
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,160($15)
	ldt $f10,480($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,320($15)
	ldt $f10,640($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,5403($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,168($15)
	ldt $f10,488($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,328($15)
	ldt $f10,648($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-1380($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,176($15)
	ldt $f10,496($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,336($15)
	ldt $f10,656($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,1405($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,184($15)
	ldt $f10,504($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,344($15)
	ldt $f10,664($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-5378($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,192($15)
	ldt $f10,512($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,352($15)
	ldt $f10,672($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3427($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,200($15)
	ldt $f10,520($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,360($15)
	ldt $f10,680($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3356($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,208($15)
	ldt $f10,528($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,368($15)
	ldt $f10,688($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3389($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,720($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldt $f12,216($15)
	ldt $f10,536($15)
	subt/su $f12,$f10,$f13
	trapb
	ldah $1,$LC18($29)		!gprelhigh
	ldt $f12,$LC18($1)		!gprellow
	mult/su $f13,$f12,$f10
	trapb
	subt/su $f11,$f10,$f12
	trapb
	ldt $f11,376($15)
	ldt $f10,696($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,48($15)
	mult/su $f13,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3394($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,728($15)
	addq $2,$1,$1
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
$L48:
	ldl $1,16($15)
	addl $1,20,$1
	stl $1,16($15)
$L46:
	ldl $2,16($15)
	ldah $1,397($31)
	lda $1,-17793($1)
	cmple $2,$1,$1
	bne $1,$L50
	bis $31,$31,$31
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,736($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE14:
	.end LBM_performStreamCollideTRT
	.align 2
	.globl LBM_handleInOutFlow
	.ent LBM_handleInOutFlow
LBM_handleInOutFlow:
	.eflag 48
	.frame $15,160,$26,0
	.mask 0x4008000,-160
$LFB15:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!24
	lda $29,0($29)		!gpdisp!24
$LBM_handleInOutFlow..ng:
	lda $30,-160($30)
	.cfi_def_cfa_offset 160
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -160
	.cfi_offset 15, -152
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,144($15)
	stl $31,16($15)
	br $31,$L52
$L53:
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3392($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3393($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3394($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3395($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3396($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3397($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3398($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3399($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3400($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3401($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3402($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3403($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3404($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3405($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3406($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3407($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3408($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3409($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3410($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,24($15)
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6784($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6785($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6786($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6787($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6788($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6789($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6790($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6791($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6792($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6793($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6794($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6795($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6796($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6797($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6798($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6799($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6800($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6801($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,6($31)
	lda $1,6802($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,56($15)
	ldt $f10,24($15)
	addt/su $f10,$f10,$f12
	trapb
	ldt $f11,56($15)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,88($15)
	ldl $4,16($15)
	addl $31,$4,$2
	mov $2,$1
	addq $1,$1,$1
	addq $1,$2,$1
	sll $1,4,$3
	addq $1,$3,$1
	sll $1,8,$3
	addq $1,$3,$1
	sll $1,16,$3
	addq $1,$3,$1
	addq $1,$1,$1
	addq $1,$2,$1
	srl $1,32,$1
	addl $31,$1,$1
	sra $1,3,$2
	addl $31,$4,$1
	sra $1,31,$1
	subl $2,$1,$1
	addl $31,$1,$1
	bis $31,$1,$4
	addl $31,$4,$3
	mov $3,$2
	s4addq $2,0,$1
	mov $1,$2
	addq $2,$3,$2
	s8addq $2,0,$1
	mov $1,$2
	addq $2,$3,$2
	sll $2,10,$1
	subq $1,$2,$1
	sll $1,5,$1
	addq $1,$3,$1
	s4addq $1,0,$1
	addq $1,$3,$1
	s8addq $1,0,$1
	addq $1,$3,$1
	sll $1,5,$1
	subq $1,$3,$1
	srl $1,32,$1
	addl $31,$1,$1
	sra $1,5,$2
	addl $31,$4,$1
	sra $1,31,$1
	subl $2,$1,$2
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	subl $4,$1,$1
	addl $31,$1,$1
	stq $1,152($15)
	ldt $f10,152($15)
	cvtqt $f10,$f11
	trapb
	ldah $1,$LC19($29)		!gprelhigh
	ldt $f10,$LC19($1)		!gprellow
	divt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f11,$LC11($1)		!gprellow
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,128($15)
	ldl $4,16($15)
	addl $31,$4,$3
	mov $3,$1
	s4addq $1,0,$1
	addq $1,$3,$1
	sll $1,7,$1
	subq $1,$3,$1
	s8addq $1,0,$1
	addq $1,$3,$1
	s4addq $1,0,$2
	addq $1,$2,$1
	s4addq $1,0,$1
	addq $1,$3,$1
	s8addq $1,0,$1
	addq $1,$3,$1
	s8addq $1,0,$2
	subq $2,$1,$2
	sll $2,4,$1
	mov $1,$2
	addq $2,$3,$2
	s4addq $2,0,$1
	subq $1,$2,$1
	srl $1,32,$1
	addl $31,$1,$1
	sra $1,7,$2
	addl $31,$4,$1
	sra $1,31,$1
	subl $2,$1,$1
	addl $31,$1,$1
	bis $31,$1,$4
	addl $31,$4,$3
	mov $3,$2
	s4addq $2,0,$1
	mov $1,$2
	addq $2,$3,$2
	s8addq $2,0,$1
	mov $1,$2
	addq $2,$3,$2
	sll $2,10,$1
	subq $1,$2,$1
	sll $1,5,$1
	addq $1,$3,$1
	s4addq $1,0,$1
	addq $1,$3,$1
	s8addq $1,0,$1
	addq $1,$3,$1
	sll $1,5,$1
	subq $1,$3,$1
	srl $1,32,$1
	addl $31,$1,$1
	sra $1,5,$2
	addl $31,$4,$1
	sra $1,31,$1
	subl $2,$1,$2
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	subl $4,$1,$1
	addl $31,$1,$1
	stq $1,152($15)
	ldt $f10,152($15)
	cvtqt $f10,$f11
	trapb
	ldah $1,$LC19($29)		!gprelhigh
	ldt $f10,$LC19($1)		!gprellow
	divt/su $f11,$f10,$f12
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f11,$LC11($1)		!gprellow
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,136($15)
	stt $f31,96($15)
	stt $f31,104($15)
	ldt $f10,128($15)
	mult/su $f10,$f10,$f12
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	subt/su $f10,$f12,$f11
	trapb
	ldah $1,$LC20($29)		!gprelhigh
	ldt $f10,$LC20($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f10,136($15)
	mult/su $f10,$f10,$f13
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	subt/su $f10,$f13,$f11
	trapb
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,112($15)
	ldt $f10,96($15)
	mult/su $f10,$f10,$f12
	trapb
	ldt $f10,104($15)
	mult/su $f10,$f10,$f11
	trapb
	addt/su $f12,$f11,$f13
	trapb
	ldt $f10,112($15)
	mult/su $f10,$f10,$f11
	trapb
	addt/su $f13,$f11,$f12
	trapb
	ldah $1,$LC8($29)		!gprelhigh
	ldt $f11,$LC8($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,120($15)
	ldt $f11,88($15)
	ldah $1,$LC2($29)		!gprelhigh
	ldt $f10,$LC2($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f13,$LC11($1)		!gprellow
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,104($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,104($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,104($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,104($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,96($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,96($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,96($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,96($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,112($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,112($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,112($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,112($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,96($15)
	ldt $f10,104($15)
	addt/su $f11,$f10,$f13
	trapb
	ldt $f14,96($15)
	ldt $f10,104($15)
	addt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,104($15)
	ldt $f10,96($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,104($15)
	ldt $f10,96($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,96($15)
	ldt $f10,104($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,96($15)
	ldt $f10,104($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f10,96($15)
	cpysn $f10,$f10,$f11
	ldt $f10,104($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,96($15)
	cpysn $f10,$f10,$f14
	ldt $f10,104($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,104($15)
	ldt $f10,112($15)
	addt/su $f11,$f10,$f13
	trapb
	ldt $f14,104($15)
	ldt $f10,112($15)
	addt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,104($15)
	ldt $f10,112($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,104($15)
	ldt $f10,112($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,112($15)
	ldt $f10,104($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,112($15)
	ldt $f10,104($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f10,104($15)
	cpysn $f10,$f10,$f11
	ldt $f10,112($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,104($15)
	cpysn $f10,$f10,$f14
	ldt $f10,112($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,96($15)
	ldt $f10,112($15)
	addt/su $f11,$f10,$f13
	trapb
	ldt $f14,96($15)
	ldt $f10,112($15)
	addt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,96($15)
	ldt $f10,112($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,96($15)
	ldt $f10,112($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,112($15)
	ldt $f10,96($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,112($15)
	ldt $f10,96($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f10,96($15)
	cpysn $f10,$f10,$f11
	ldt $f10,112($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,96($15)
	cpysn $f10,$f10,$f14
	ldt $f10,112($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,20,$1
	stl $1,16($15)
$L52:
	ldl $2,16($15)
	ldah $1,3($31)
	lda $1,3391($1)
	cmple $2,$1,$1
	bne $1,$L53
	ldah $1,394($31)
	lda $1,-21184($1)
	stl $1,16($15)
	br $31,$L54
$L55:
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3392($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3391($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3390($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3389($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3388($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3387($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3386($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3385($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3384($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3383($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3382($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3381($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3380($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3379($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3378($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3377($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3376($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3375($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3374($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,24($15)
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3389($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3388($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3385($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3384($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3383($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3382($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3377($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3376($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3375($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3374($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,32($15)
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3391($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3390($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3385($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3384($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3383($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3382($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3381($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3380($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3379($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3378($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,40($15)
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3387($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3386($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3381($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3380($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3379($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3378($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3377($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3376($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3375($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-3($31)
	lda $1,-3374($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,48($15)
	ldt $f12,32($15)
	ldt $f11,24($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,32($15)
	ldt $f12,40($15)
	ldt $f11,24($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,40($15)
	ldt $f12,48($15)
	ldt $f11,24($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,48($15)
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6784($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6783($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6782($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6781($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6780($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6779($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6778($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6777($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6776($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6775($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6774($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6773($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6772($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6771($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6770($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6769($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6768($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6767($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6766($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,56($15)
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6781($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6780($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6777($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6776($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6775($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6774($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6769($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6768($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6767($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6766($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,64($15)
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6783($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6782($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6777($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6776($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6775($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6774($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6773($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6772($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6771($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6770($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,72($15)
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6779($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6778($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6773($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6772($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6771($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6770($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6769($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6768($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6767($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,16($15)
	ldah $1,-6($31)
	lda $1,-6766($1)
	addl $2,$1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,80($15)
	ldt $f12,64($15)
	ldt $f11,56($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,64($15)
	ldt $f12,72($15)
	ldt $f11,56($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,72($15)
	ldt $f12,80($15)
	ldt $f11,56($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,80($15)
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	stt $f10,88($15)
	ldt $f10,32($15)
	addt/su $f10,$f10,$f12
	trapb
	ldt $f11,64($15)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,96($15)
	ldt $f10,40($15)
	addt/su $f10,$f10,$f12
	trapb
	ldt $f11,72($15)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,104($15)
	ldt $f10,48($15)
	addt/su $f10,$f10,$f12
	trapb
	ldt $f11,80($15)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,112($15)
	ldt $f10,96($15)
	mult/su $f10,$f10,$f12
	trapb
	ldt $f10,104($15)
	mult/su $f10,$f10,$f11
	trapb
	addt/su $f12,$f11,$f13
	trapb
	ldt $f10,112($15)
	mult/su $f10,$f10,$f11
	trapb
	addt/su $f13,$f11,$f12
	trapb
	ldah $1,$LC8($29)		!gprelhigh
	ldt $f11,$LC8($1)		!gprellow
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,120($15)
	ldt $f11,88($15)
	ldah $1,$LC2($29)		!gprelhigh
	ldt $f10,$LC2($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f13,$LC11($1)		!gprellow
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,104($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,104($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,104($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,104($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,96($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,96($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,96($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,96($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,112($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,112($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC3($29)		!gprelhigh
	ldt $f10,$LC3($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f13,112($15)
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f10,$LC14($1)		!gprellow
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,112($15)
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,96($15)
	ldt $f10,104($15)
	addt/su $f11,$f10,$f13
	trapb
	ldt $f14,96($15)
	ldt $f10,104($15)
	addt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,104($15)
	ldt $f10,96($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,104($15)
	ldt $f10,96($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,96($15)
	ldt $f10,104($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,96($15)
	ldt $f10,104($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f10,96($15)
	cpysn $f10,$f10,$f11
	ldt $f10,104($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,96($15)
	cpysn $f10,$f10,$f14
	ldt $f10,104($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,104($15)
	ldt $f10,112($15)
	addt/su $f11,$f10,$f13
	trapb
	ldt $f14,104($15)
	ldt $f10,112($15)
	addt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,104($15)
	ldt $f10,112($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,104($15)
	ldt $f10,112($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,112($15)
	ldt $f10,104($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,112($15)
	ldt $f10,104($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f10,104($15)
	cpysn $f10,$f10,$f11
	ldt $f10,112($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,104($15)
	cpysn $f10,$f10,$f14
	ldt $f10,112($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,96($15)
	ldt $f10,112($15)
	addt/su $f11,$f10,$f13
	trapb
	ldt $f14,96($15)
	ldt $f10,112($15)
	addt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,96($15)
	ldt $f10,112($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,96($15)
	ldt $f10,112($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f11,112($15)
	ldt $f10,96($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f14,112($15)
	ldt $f10,96($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldt $f11,88($15)
	ldah $1,$LC4($29)		!gprelhigh
	ldt $f10,$LC4($1)		!gprellow
	mult/su $f11,$f10,$f12
	trapb
	ldt $f10,96($15)
	cpysn $f10,$f10,$f11
	ldt $f10,112($15)
	subt/su $f11,$f10,$f13
	trapb
	ldt $f10,96($15)
	cpysn $f10,$f10,$f14
	ldt $f10,112($15)
	subt/su $f14,$f10,$f11
	trapb
	ldah $1,$LC13($29)		!gprelhigh
	ldt $f10,$LC13($1)		!gprellow
	mult/su $f11,$f10,$f14
	trapb
	ldah $1,$LC14($29)		!gprelhigh
	ldt $f11,$LC14($1)		!gprellow
	addt/su $f14,$f11,$f10
	trapb
	mult/su $f13,$f10,$f11
	trapb
	ldah $1,$LC11($29)		!gprelhigh
	ldt $f10,$LC11($1)		!gprellow
	addt/su $f11,$f10,$f13
	trapb
	ldt $f10,120($15)
	subt/su $f13,$f10,$f11
	trapb
	ldl $1,16($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,144($15)
	addq $2,$1,$1
	mult/su $f12,$f11,$f10
	trapb
	stt $f10,0($1)
	ldl $1,16($15)
	addl $1,20,$1
	stl $1,16($15)
$L54:
	ldl $2,16($15)
	ldah $1,397($31)
	lda $1,-17793($1)
	cmple $2,$1,$1
	bne $1,$L55
	bis $31,$31,$31
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,160($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE15:
	.end LBM_handleInOutFlow
	.section	.rodata
$LC23:
	.string	"LBM_showGridStatistics:\n\tnObstacleCells: %7i nAccelCells: %7i nFluidCells: %7i\n\tminRho: %8.6f maxRho: %8.6f Mass: %e\n\tminU  : %8.6f maxU  : %8.6f\n\n"
	.text
	.align 2
	.globl LBM_showGridStatistics
	.ent LBM_showGridStatistics
LBM_showGridStatistics:
	.eflag 48
	.frame $15,192,$26,0
	.mask 0x4008000,-160
	.fmask 0x4,-144
$LFB16:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!25
	lda $29,0($29)		!gpdisp!25
$LBM_showGridStatistics..ng:
	lda $30,-192($30)
	.cfi_def_cfa_offset 192
	stq $26,32($30)
	stq $15,40($30)
	stt $f2,48($30)
	.cfi_offset 26, -160
	.cfi_offset 15, -152
	.cfi_offset 34, -144
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,176($15)
	stl $31,64($15)
	stl $31,68($15)
	stl $31,72($15)
	ldah $1,$LC21($29)		!gprelhigh
	ldt $f10,$LC21($1)		!gprellow
	stt $f10,80($15)
	ldah $1,$LC22($29)		!gprelhigh
	ldt $f10,$LC22($1)		!gprellow
	stt $f10,88($15)
	ldah $1,$LC21($29)		!gprelhigh
	ldt $f10,$LC21($1)		!gprellow
	stt $f10,96($15)
	ldah $1,$LC22($29)		!gprelhigh
	ldt $f10,$LC22($1)		!gprellow
	stt $f10,104($15)
	stt $f31,112($15)
	stl $31,120($15)
	br $31,$L57
$L69:
	ldl $1,120($15)
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $1,120($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,128($15)
	ldt $f12,128($15)
	ldt $f11,96($15)
	cmptlt/su $f12,$f11,$f10
	trapb
	fbeq $f10,$L58
	ldt $f10,128($15)
	stt $f10,96($15)
$L58:
	ldt $f11,128($15)
	ldt $f12,104($15)
	cmptlt/su $f12,$f11,$f10
	trapb
	fbeq $f10,$L60
	ldt $f10,128($15)
	stt $f10,104($15)
$L60:
	ldt $f12,112($15)
	ldt $f11,128($15)
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,112($15)
	ldl $1,120($15)
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldl $1,0($1)
	and $1,1,$1
	addl $31,$1,$1
	beq $1,$L62
	ldl $1,64($15)
	addl $1,1,$1
	stl $1,64($15)
	br $31,$L63
$L62:
	ldl $1,120($15)
	addl $1,19,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldl $1,0($1)
	and $1,2,$1
	addl $31,$1,$1
	beq $1,$L64
	ldl $1,68($15)
	addl $1,1,$1
	stl $1,68($15)
	br $31,$L65
$L64:
	ldl $1,72($15)
	addl $1,1,$1
	stl $1,72($15)
$L65:
	ldl $1,120($15)
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $1,120($15)
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,136($15)
	ldl $1,120($15)
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $1,120($15)
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,144($15)
	ldl $1,120($15)
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $1,120($15)
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $1,120($15)
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $1,120($15)
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,176($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,152($15)
	ldt $f10,136($15)
	mult/su $f10,$f10,$f12
	trapb
	ldt $f10,144($15)
	mult/su $f10,$f10,$f11
	trapb
	addt/su $f12,$f11,$f13
	trapb
	ldt $f10,152($15)
	mult/su $f10,$f10,$f11
	trapb
	addt/su $f13,$f11,$f12
	trapb
	ldt $f10,128($15)
	mult/su $f10,$f10,$f11
	trapb
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,160($15)
	ldt $f12,160($15)
	ldt $f11,80($15)
	cmptlt/su $f12,$f11,$f10
	trapb
	fbeq $f10,$L66
	ldt $f10,160($15)
	stt $f10,80($15)
$L66:
	ldt $f11,160($15)
	ldt $f12,88($15)
	cmptlt/su $f12,$f11,$f10
	trapb
	fbeq $f10,$L63
	ldt $f10,160($15)
	stt $f10,88($15)
$L63:
	ldl $1,120($15)
	addl $1,20,$1
	stl $1,120($15)
$L57:
	ldl $2,120($15)
	ldah $1,397($31)
	lda $1,-17793($1)
	cmple $2,$1,$1
	bne $1,$L69
	ldt $f16,80($15)
	ldq $27,sqrt($29)		!literal!26
	jsr $26,($27),0		!lituse_jsr!26
	ldah $29,0($26)		!gpdisp!27
	lda $29,0($29)		!gpdisp!27
	cpys $f0,$f0,$f2
	ldt $f16,88($15)
	ldq $27,sqrt($29)		!literal!28
	jsr $26,($27),0		!lituse_jsr!28
	ldah $29,0($26)		!gpdisp!29
	lda $29,0($29)		!gpdisp!29
	cpys $f0,$f0,$f10
	ldl $3,72($15)
	ldl $2,68($15)
	ldl $1,64($15)
	stt $f10,16($30)
	stt $f2,8($30)
	ldt $f10,112($15)
	stt $f10,0($30)
	ldt $f21,104($15)
	ldt $f20,96($15)
	mov $3,$19
	mov $2,$18
	mov $1,$17
	ldah $1,$LC23($29)		!gprelhigh
	lda $16,$LC23($1)		!gprellow
	ldq $27,printf($29)		!literal!30
	jsr $26,($27),0		!lituse_jsr!30
	ldah $29,0($26)		!gpdisp!31
	lda $29,0($29)		!gpdisp!31
	bis $31,$31,$31
	mov $15,$30
	ldq $26,32($30)
	ldt $f2,48($30)
	ldq $15,40($30)
	lda $30,192($30)
	.cfi_restore 15
	.cfi_restore 34
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE16:
	.end LBM_showGridStatistics
	.align 2
	.ent storeValue
storeValue:
	.eflag 48
	.frame $15,64,$26,0
	.mask 0x4008000,-64
$LFB17:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!32
	lda $29,0($29)		!gpdisp!32
$storeValue..ng:
	lda $30,-64($30)
	.cfi_def_cfa_offset 64
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -64
	.cfi_offset 15, -56
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,48($15)
	stq $17,56($15)
	lda $1,1($31)
	stl $1,32($15)
	lda $1,32($15)
	ldq_u $2,0($1)
	extbl $2,$1,$1
	and $1,0xff,$1
	bne $1,$L75
	ldq $1,56($15)
	stq $1,24($15)
	stq $31,16($15)
	br $31,$L76
$L77:
	lda $2,3($31)
	ldq $1,16($15)
	subq $2,$1,$1
	ldq $2,24($15)
	addq $2,$1,$1
	lda $2,1($1)
	ldq_u $1,0($1)
	extqh $1,$2,$1
	sra $1,56,$1
	lda $3,36($15)
	ldq $2,16($15)
	addq $3,$2,$3
	bis $31,$1,$4
	ldq_u $2,0($3)
	mov $3,$1
	mskbl $2,$1,$2
	insbl $4,$1,$1
	bis $1,$2,$1
	stq_u $1,0($3)
	ldq $1,16($15)
	lda $1,1($1)
	stq $1,16($15)
$L76:
	ldq $1,16($15)
	cmpule $1,3,$1
	bne $1,$L77
	lda $1,36($15)
	ldq $19,48($15)
	lda $18,1($31)
	lda $17,4($31)
	mov $1,$16
	ldq $27,fwrite($29)		!literal!33
	jsr $26,($27),0		!lituse_jsr!33
	ldah $29,0($26)		!gpdisp!34
	lda $29,0($29)		!gpdisp!34
	br $31,$L79
$L75:
	ldq $19,48($15)
	lda $18,1($31)
	lda $17,4($31)
	ldq $16,56($15)
	ldq $27,fwrite($29)		!literal!35
	jsr $26,($27),0		!lituse_jsr!35
	ldah $29,0($26)		!gpdisp!36
	lda $29,0($29)		!gpdisp!36
$L79:
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,64($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE17:
	.end storeValue
	.align 2
	.ent loadValue
loadValue:
	.eflag 48
	.frame $15,64,$26,0
	.mask 0x4008000,-64
$LFB18:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!37
	lda $29,0($29)		!gpdisp!37
$loadValue..ng:
	lda $30,-64($30)
	.cfi_def_cfa_offset 64
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -64
	.cfi_offset 15, -56
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,48($15)
	stq $17,56($15)
	lda $1,1($31)
	stl $1,32($15)
	lda $1,32($15)
	ldq_u $2,0($1)
	extbl $2,$1,$1
	and $1,0xff,$1
	bne $1,$L81
	ldq $1,56($15)
	stq $1,24($15)
	lda $1,36($15)
	ldq $19,48($15)
	lda $18,1($31)
	lda $17,4($31)
	mov $1,$16
	ldq $27,fread($29)		!literal!38
	jsr $26,($27),0		!lituse_jsr!38
	ldah $29,0($26)		!gpdisp!39
	lda $29,0($29)		!gpdisp!39
	stq $31,16($15)
	br $31,$L82
$L83:
	lda $2,3($31)
	ldq $1,16($15)
	subq $2,$1,$1
	ldq $3,24($15)
	ldq $2,16($15)
	addq $3,$2,$3
	lda $2,36($15)
	addq $2,$1,$1
	lda $2,1($1)
	ldq_u $1,0($1)
	extqh $1,$2,$1
	sra $1,56,$1
	bis $31,$1,$4
	ldq_u $2,0($3)
	mov $3,$1
	mskbl $2,$1,$2
	insbl $4,$1,$1
	bis $1,$2,$1
	stq_u $1,0($3)
	ldq $1,16($15)
	lda $1,1($1)
	stq $1,16($15)
$L82:
	ldq $1,16($15)
	cmpule $1,3,$1
	bne $1,$L83
	br $31,$L85
$L81:
	ldq $19,48($15)
	lda $18,1($31)
	lda $17,4($31)
	ldq $16,56($15)
	ldq $27,fread($29)		!literal!40
	jsr $26,($27),0		!lituse_jsr!40
	ldah $29,0($26)		!gpdisp!41
	lda $29,0($29)		!gpdisp!41
$L85:
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,64($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE18:
	.end loadValue
	.section	.rodata
$LC24:
	.string	"wb"
$LC25:
	.string	"w"
$LC26:
	.string	"%e %e %e\n"
	.text
	.align 2
	.globl LBM_storeVelocityField
	.ent LBM_storeVelocityField
LBM_storeVelocityField:
	.eflag 48
	.frame $15,96,$26,0
	.mask 0x4008000,-96
$LFB19:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!42
	lda $29,0($29)		!gpdisp!42
$LBM_storeVelocityField..ng:
	lda $30,-96($30)
	.cfi_def_cfa_offset 96
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -96
	.cfi_offset 15, -88
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,64($15)
	stq $17,72($15)
	mov $18,$1
	stl $1,80($15)
	ldl $1,80($15)
	beq $1,$L87
	ldah $1,$LC24($29)		!gprelhigh
	lda $1,$LC24($1)		!gprellow
	br $31,$L88
$L87:
	ldah $1,$LC25($29)		!gprelhigh
	lda $1,$LC25($1)		!gprellow
$L88:
	mov $1,$17
	ldq $16,72($15)
	ldq $27,fopen($29)		!literal!43
	jsr $26,($27),0		!lituse_jsr!43
	ldah $29,0($26)		!gpdisp!44
	lda $29,0($29)		!gpdisp!44
	mov $0,$1
	stq $1,32($15)
	stl $31,24($15)
	br $31,$L89
$L96:
	stl $31,20($15)
	br $31,$L90
$L95:
	stl $31,16($15)
	br $31,$L91
$L94:
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	cvtts/su $f11,$f10
	trapb
	sts $f10,40($15)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	cvtts/su $f11,$f10
	trapb
	sts $f10,44($15)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	cvtts/su $f11,$f10
	trapb
	sts $f10,48($15)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,64($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	cvtts/su $f11,$f10
	trapb
	sts $f10,52($15)
	lds $f12,44($15)
	lds $f11,40($15)
	divs/su $f12,$f11,$f10
	trapb
	sts $f10,44($15)
	lds $f12,48($15)
	lds $f11,40($15)
	divs/su $f12,$f11,$f10
	trapb
	sts $f10,48($15)
	lds $f12,52($15)
	lds $f11,40($15)
	divs/su $f12,$f11,$f10
	trapb
	sts $f10,52($15)
	ldl $1,80($15)
	beq $1,$L92
	lda $1,44($15)
	mov $1,$17
	ldq $16,32($15)
	ldq $27,storeValue($29)		!literal!45
	jsr $26,($27),storeValue		!lituse_jsr!45
	ldah $29,0($26)		!gpdisp!46
	lda $29,0($29)		!gpdisp!46
	lda $1,48($15)
	mov $1,$17
	ldq $16,32($15)
	ldq $27,storeValue($29)		!literal!47
	jsr $26,($27),storeValue		!lituse_jsr!47
	ldah $29,0($26)		!gpdisp!48
	lda $29,0($29)		!gpdisp!48
	lda $1,52($15)
	mov $1,$17
	ldq $16,32($15)
	ldq $27,storeValue($29)		!literal!49
	jsr $26,($27),storeValue		!lituse_jsr!49
	ldah $29,0($26)		!gpdisp!50
	lda $29,0($29)		!gpdisp!50
	br $31,$L93
$L92:
	lds $f10,44($15)
	cvtsts $f10,$f11
	trapb
	lds $f10,48($15)
	cvtsts $f10,$f12
	trapb
	lds $f10,52($15)
	cvtsts $f10,$f13
	trapb
	cpys $f13,$f13,$f20
	cpys $f12,$f12,$f19
	cpys $f11,$f11,$f18
	ldah $1,$LC26($29)		!gprelhigh
	lda $17,$LC26($1)		!gprellow
	ldq $16,32($15)
	ldq $27,fprintf($29)		!literal!51
	jsr $26,($27),0		!lituse_jsr!51
	ldah $29,0($26)		!gpdisp!52
	lda $29,0($29)		!gpdisp!52
$L93:
	ldl $1,16($15)
	addl $1,1,$1
	stl $1,16($15)
$L91:
	ldl $1,16($15)
	cmple $1,99,$1
	bne $1,$L94
	ldl $1,20($15)
	addl $1,1,$1
	stl $1,20($15)
$L90:
	ldl $1,20($15)
	cmple $1,99,$1
	bne $1,$L95
	ldl $1,24($15)
	addl $1,1,$1
	stl $1,24($15)
$L89:
	ldl $1,24($15)
	cmple $1,129,$1
	bne $1,$L96
	ldq $16,32($15)
	ldq $27,fclose($29)		!literal!53
	jsr $26,($27),0		!lituse_jsr!53
	ldah $29,0($26)		!gpdisp!54
	lda $29,0($29)		!gpdisp!54
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,96($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE19:
	.end LBM_storeVelocityField
	.section	.rodata
$LC28:
	.string	"r"
$LC29:
	.string	"%f %f %f\n"
$LC30:
	.string	"LBM_compareVelocityField: maxDiff = %e  \n\n"
	.text
	.align 2
	.globl LBM_compareVelocityField
	.ent LBM_compareVelocityField
LBM_compareVelocityField:
	.eflag 48
	.frame $15,144,$26,0
	.mask 0x4008000,-144
$LFB20:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!55
	lda $29,0($29)		!gpdisp!55
$LBM_compareVelocityField..ng:
	lda $30,-144($30)
	.cfi_def_cfa_offset 144
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -144
	.cfi_offset 15, -136
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,112($15)
	stq $17,120($15)
	mov $18,$1
	stl $1,128($15)
	ldah $1,$LC27($29)		!gprelhigh
	lds $f10,$LC27($1)		!gprellow
	sts $f10,28($15)
	ldl $1,128($15)
	beq $1,$L98
	ldah $1,$LC5($29)		!gprelhigh
	lda $1,$LC5($1)		!gprellow
	br $31,$L99
$L98:
	ldah $1,$LC28($29)		!gprelhigh
	lda $1,$LC28($1)		!gprellow
$L99:
	mov $1,$17
	ldq $16,120($15)
	ldq $27,fopen($29)		!literal!56
	jsr $26,($27),0		!lituse_jsr!56
	ldah $29,0($26)		!gpdisp!57
	lda $29,0($29)		!gpdisp!57
	mov $0,$1
	stq $1,32($15)
	stl $31,24($15)
	br $31,$L100
$L109:
	stl $31,20($15)
	br $31,$L101
$L108:
	stl $31,16($15)
	br $31,$L102
$L107:
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	addt/su $f12,$f11,$f10
	trapb
	stt $f10,40($15)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,3,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,4,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,48($15)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,1,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,2,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,7,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,8,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,9,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,10,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,56($15)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,5,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f12,0($1)
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,6,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,11,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,12,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,13,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,14,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,15,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,16,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	subt/su $f12,$f10,$f11
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,17,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f10,0($1)
	addt/su $f11,$f10,$f12
	trapb
	ldl $2,20($15)
	bis $31,$2,$1
	addl $1,$1,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	ldl $2,16($15)
	addl $2,$1,$1
	addl $31,$1,$3
	ldl $2,24($15)
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s8addl $1,0,$1
	subl $1,$2,$1
	sll $1,4,$1
	addl $1,$2,$1
	sll $1,4,$1
	addl $31,$1,$1
	addl $3,$1,$1
	addl $31,$1,$1
	bis $31,$1,$2
	bis $31,$2,$1
	s4addl $1,0,$1
	addl $1,$2,$1
	s4addl $1,0,$1
	addl $31,$1,$1
	addl $1,18,$1
	addl $31,$1,$1
	s8addq $1,0,$1
	ldq $2,112($15)
	addq $2,$1,$1
	ldt $f11,0($1)
	subt/su $f12,$f11,$f10
	trapb
	stt $f10,64($15)
	ldt $f12,48($15)
	ldt $f11,40($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,48($15)
	ldt $f12,56($15)
	ldt $f11,40($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,56($15)
	ldt $f12,64($15)
	ldt $f11,40($15)
	divt/su $f12,$f11,$f10
	trapb
	stt $f10,64($15)
	ldl $1,128($15)
	beq $1,$L103
	lda $1,88($15)
	mov $1,$17
	ldq $16,32($15)
	ldq $27,loadValue($29)		!literal!58
	jsr $26,($27),loadValue		!lituse_jsr!58
	ldah $29,0($26)		!gpdisp!59
	lda $29,0($29)		!gpdisp!59
	lda $1,92($15)
	mov $1,$17
	ldq $16,32($15)
	ldq $27,loadValue($29)		!literal!60
	jsr $26,($27),loadValue		!lituse_jsr!60
	ldah $29,0($26)		!gpdisp!61
	lda $29,0($29)		!gpdisp!61
	lda $1,96($15)
	mov $1,$17
	ldq $16,32($15)
	ldq $27,loadValue($29)		!literal!62
	jsr $26,($27),loadValue		!lituse_jsr!62
	ldah $29,0($26)		!gpdisp!63
	lda $29,0($29)		!gpdisp!63
	br $31,$L104
$L103:
	lda $3,96($15)
	lda $2,92($15)
	lda $1,88($15)
	mov $3,$20
	mov $2,$19
	mov $1,$18
	ldah $1,$LC29($29)		!gprelhigh
	lda $17,$LC29($1)		!gprellow
	ldq $16,32($15)
	ldq $27,__isoc99_fscanf($29)		!literal!64
	jsr $26,($27),0		!lituse_jsr!64
	ldah $29,0($26)		!gpdisp!65
	lda $29,0($29)		!gpdisp!65
$L104:
	lds $f11,88($15)
	cvtsts $f11,$f10
	trapb
	ldt $f12,48($15)
	subt/su $f12,$f10,$f11
	trapb
	cvtts/su $f11,$f10
	trapb
	sts $f10,72($15)
	lds $f11,92($15)
	cvtsts $f11,$f10
	trapb
	ldt $f12,56($15)
	subt/su $f12,$f10,$f11
	trapb
	cvtts/su $f11,$f10
	trapb
	sts $f10,76($15)
	lds $f11,96($15)
	cvtsts $f11,$f10
	trapb
	ldt $f12,64($15)
	subt/su $f12,$f10,$f11
	trapb
	cvtts/su $f11,$f10
	trapb
	sts $f10,80($15)
	lds $f10,72($15)
	muls/su $f10,$f10,$f13
	trapb
	lds $f10,76($15)
	muls/su $f10,$f10,$f11
	trapb
	adds/su $f13,$f11,$f12
	trapb
	lds $f10,80($15)
	muls/su $f10,$f10,$f11
	trapb
	adds/su $f12,$f11,$f10
	trapb
	sts $f10,84($15)
	lds $f10,84($15)
	cvtsts $f10,$f11
	trapb
	lds $f10,28($15)
	cvtsts $f10,$f12
	trapb
	cmptlt/su $f12,$f11,$f10
	trapb
	fbeq $f10,$L105
	lds $f10,84($15)
	sts $f10,28($15)
$L105:
	ldl $1,16($15)
	addl $1,1,$1
	stl $1,16($15)
$L102:
	ldl $1,16($15)
	cmple $1,99,$1
	bne $1,$L107
	ldl $1,20($15)
	addl $1,1,$1
	stl $1,20($15)
$L101:
	ldl $1,20($15)
	cmple $1,99,$1
	bne $1,$L108
	ldl $1,24($15)
	addl $1,1,$1
	stl $1,24($15)
$L100:
	ldl $1,24($15)
	cmple $1,129,$1
	bne $1,$L109
	lds $f10,28($15)
	cvtsts $f10,$f11
	trapb
	cpys $f11,$f11,$f16
	ldq $27,sqrt($29)		!literal!66
	jsr $26,($27),0		!lituse_jsr!66
	ldah $29,0($26)		!gpdisp!67
	lda $29,0($29)		!gpdisp!67
	cpys $f0,$f0,$f10
	cpys $f10,$f10,$f17
	ldah $1,$LC30($29)		!gprelhigh
	lda $16,$LC30($1)		!gprellow
	ldq $27,printf($29)		!literal!68
	jsr $26,($27),0		!lituse_jsr!68
	ldah $29,0($26)		!gpdisp!69
	lda $29,0($29)		!gpdisp!69
	ldq $16,32($15)
	ldq $27,fclose($29)		!literal!70
	jsr $26,($27),0		!lituse_jsr!70
	ldah $29,0($26)		!gpdisp!71
	lda $29,0($29)		!gpdisp!71
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,144($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE20:
	.end LBM_compareVelocityField
	.section	.rodata
	.align 3
$LC0:
	.long	0
	.long	1093664768
	.align 3
$LC2:
	.long	1431655765
	.long	1070945621
	.align 3
$LC3:
	.long	477218588
	.long	1068265927
	.align 3
$LC4:
	.long	477218588
	.long	1067217351
	.align 3
$LC6:
	.long	1202590843
	.long	1064598241
	.align 3
$LC7:
	.long	-755914244
	.long	1063281229
	.align 3
$LC8:
	.long	0
	.long	1073217536
	.align 3
$LC9:
	.long	1717986918
	.long	-1074895258
	.align 3
$LC10:
	.long	-858993460
	.long	1071959244
	.align 3
$LC11:
	.long	0
	.long	1072693248
	.align 3
$LC12:
	.long	-1145324613
	.long	1069267899
	.align 3
$LC13:
	.long	0
	.long	1074921472
	.align 3
$LC14:
	.long	0
	.long	1074266112
	.align 3
$LC15:
	.long	-1145324613
	.long	1068219323
	.align 3
$LC16:
	.long	1810275495
	.long	1068559605
	.align 3
$LC17:
	.long	0
	.long	1071644672
	.align 3
$LC18:
	.long	858993459
	.long	1073689395
	.align 3
$LC19:
	.long	0
	.long	1078509568
	.align 3
$LC20:
	.long	1202590843
	.long	1065646817
	.align 3
$LC21:
	.long	966823146
	.long	1177108057
	.align 3
$LC22:
	.long	966823146
	.long	-970375591
	.align 2
$LC27:
	.long	-246811958
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
