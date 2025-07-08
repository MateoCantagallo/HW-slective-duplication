	.set noreorder
	.set volatile
	.set noat
	.set nomacro
	.text
	.section	.sbss,"aw"
	.type	srcGrid, @object
	.size	srcGrid, 8
	.align 3
srcGrid:
	.zero	8
	.type	dstGrid, @object
	.size	dstGrid, 8
	.align 3
dstGrid:
	.zero	8
	.section	.rodata
$LC1:
	.string	"timestep: %i\n"
	.text
	.align 2
	.globl main
	.ent main
main:
	.eflag 48
	.frame $15,80,$26,0
	.mask 0x4008000,-80
$LFB6:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!1
	lda $29,0($29)		!gpdisp!1
$main..ng:
	lda $30,-80($30)
	.cfi_def_cfa_offset 80
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -80
	.cfi_offset 15, -72
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	mov $16,$1
	stq $17,72($15)
	stl $1,64($15)
	lda $2,24($15)
	ldl $1,64($15)
	mov $2,$18
	ldq $17,72($15)
	mov $1,$16
	ldq $27,MAIN_parseCommandLine($29)		!literal!2
	jsr $26,($27),MAIN_parseCommandLine		!lituse_jsr!2
	ldah $29,0($26)		!gpdisp!3
	lda $29,0($29)		!gpdisp!3
	lda $1,24($15)
	mov $1,$16
	ldq $27,MAIN_printInfo($29)		!literal!4
	jsr $26,($27),MAIN_printInfo		!lituse_jsr!4
	ldah $29,0($26)		!gpdisp!5
	lda $29,0($29)		!gpdisp!5
	lda $1,24($15)
	mov $1,$16
	ldq $27,MAIN_initialize($29)		!literal!6
	jsr $26,($27),MAIN_initialize		!lituse_jsr!6
	ldah $29,0($26)		!gpdisp!7
	lda $29,0($29)		!gpdisp!7
	lda $1,1($31)
	stl $1,16($15)
	br $31,$L2
$L5:
	ldl $1,44($15)
	zapnot $1,15,$1
	cmpeq $1,1,$1
	beq $1,$L3
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $1,srcGrid($1)		!gprellow
	mov $1,$16
	ldq $27,LBM_handleInOutFlow($29)		!literal!8
	jsr $26,($27),LBM_handleInOutFlow		!lituse_jsr!8
	ldah $29,0($26)		!gpdisp!9
	lda $29,0($29)		!gpdisp!9
$L3:
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $2,srcGrid($1)		!gprellow
	ldah $1,dstGrid($29)		!gprelhigh
	ldq $1,dstGrid($1)		!gprellow
	mov $1,$17
	mov $2,$16
	ldq $27,LBM_performStreamCollideTRT($29)		!literal!10
	jsr $26,($27),LBM_performStreamCollideTRT		!lituse_jsr!10
	ldah $29,0($26)		!gpdisp!11
	lda $29,0($29)		!gpdisp!11
	ldah $1,dstGrid($29)		!gprelhigh
	lda $17,dstGrid($1)		!gprellow
	ldah $1,srcGrid($29)		!gprelhigh
	lda $16,srcGrid($1)		!gprellow
	ldq $27,LBM_swapGrids($29)		!literal!12
	jsr $26,($27),LBM_swapGrids		!lituse_jsr!12
	ldah $29,0($26)		!gpdisp!13
	lda $29,0($29)		!gpdisp!13
	ldl $1,16($15)
	and $1,63,$1
	addl $31,$1,$1
	bne $1,$L4
	ldl $1,16($15)
	mov $1,$17
	ldah $1,$LC1($29)		!gprelhigh
	lda $16,$LC1($1)		!gprellow
	ldq $27,printf($29)		!literal!14
	jsr $26,($27),0		!lituse_jsr!14
	ldah $29,0($26)		!gpdisp!15
	lda $29,0($29)		!gpdisp!15
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $1,srcGrid($1)		!gprellow
	mov $1,$16
	ldq $27,LBM_showGridStatistics($29)		!literal!16
	jsr $26,($27),LBM_showGridStatistics		!lituse_jsr!16
	ldah $29,0($26)		!gpdisp!17
	lda $29,0($29)		!gpdisp!17
$L4:
	ldl $1,16($15)
	addl $1,1,$1
	stl $1,16($15)
$L2:
	ldl $1,24($15)
	ldl $2,16($15)
	cmple $2,$1,$1
	bne $1,$L5
	lda $1,24($15)
	mov $1,$16
	ldq $27,MAIN_finalize($29)		!literal!18
	jsr $26,($27),MAIN_finalize		!lituse_jsr!18
	ldah $29,0($26)		!gpdisp!19
	lda $29,0($29)		!gpdisp!19
	mov $31,$1
	mov $1,$0
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,80($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE6:
	.end main
	.section	.rodata
$LC2:
	.string	"syntax: lbm <time steps> <result file> <0: nil, 1: cmp, 2: str> <0: ldc, 1: channel flow> [<obstacle file>]"
$LC3:
	.string	"MAIN_parseCommandLine: cannot stat obstacle file '%s'\n"
$LC4:
	.string	"MAIN_parseCommandLine:\n\tsize of file '%s' is %i bytes\n\texpected size is %i bytes\n"
$LC5:
	.string	"MAIN_parseCommandLine: cannot stat result file '%s'\n"
	.text
	.align 2
	.globl MAIN_parseCommandLine
	.ent MAIN_parseCommandLine
MAIN_parseCommandLine:
	.eflag 48
	.frame $15,192,$26,0
	.mask 0x4008000,-192
$LFB7:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!20
	lda $29,0($29)		!gpdisp!20
$MAIN_parseCommandLine..ng:
	lda $30,-192($30)
	.cfi_def_cfa_offset 192
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -192
	.cfi_offset 15, -184
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	mov $16,$1
	stq $17,168($15)
	stq $18,176($15)
	stl $1,160($15)
	ldl $1,160($15)
	cmple $1,4,$1
	bne $1,$L8
	ldl $1,160($15)
	cmple $1,6,$1
	bne $1,$L9
$L8:
	ldah $1,$LC2($29)		!gprelhigh
	lda $16,$LC2($1)		!gprellow
	ldq $27,puts($29)		!literal!21
	jsr $26,($27),0		!lituse_jsr!21
	ldah $29,0($26)		!gpdisp!22
	lda $29,0($29)		!gpdisp!22
	lda $16,1($31)
	ldq $27,exit($29)		!literal!23
	jsr $26,($27),exit		!lituse_jsr!23
$L9:
	ldq $1,168($15)
	lda $1,8($1)
	ldq $1,0($1)
	mov $1,$16
	ldq $27,atoi($29)		!literal!24
	jsr $26,($27),0		!lituse_jsr!24
	ldah $29,0($26)		!gpdisp!25
	lda $29,0($29)		!gpdisp!25
	mov $0,$1
	mov $1,$2
	ldq $1,176($15)
	stl $2,0($1)
	ldq $1,168($15)
	ldq $2,16($1)
	ldq $1,176($15)
	stq $2,8($1)
	ldq $1,168($15)
	lda $1,24($1)
	ldq $1,0($1)
	mov $1,$16
	ldq $27,atoi($29)		!literal!26
	jsr $26,($27),0		!lituse_jsr!26
	ldah $29,0($26)		!gpdisp!27
	lda $29,0($29)		!gpdisp!27
	mov $0,$1
	addl $31,$1,$2
	ldq $1,176($15)
	stl $2,16($1)
	ldq $1,168($15)
	lda $1,32($1)
	ldq $1,0($1)
	mov $1,$16
	ldq $27,atoi($29)		!literal!28
	jsr $26,($27),0		!lituse_jsr!28
	ldah $29,0($26)		!gpdisp!29
	lda $29,0($29)		!gpdisp!29
	mov $0,$1
	addl $31,$1,$2
	ldq $1,176($15)
	stl $2,20($1)
	ldl $1,160($15)
	cmpeq $1,6,$1
	beq $1,$L10
	ldq $1,168($15)
	ldq $2,40($1)
	ldq $1,176($15)
	stq $2,24($1)
	ldq $1,176($15)
	ldq $1,24($1)
	lda $17,16($15)
	mov $1,$16
	ldq $27,stat($29)		!literal!30
	jsr $26,($27),0		!lituse_jsr!30
	ldah $29,0($26)		!gpdisp!31
	lda $29,0($29)		!gpdisp!31
	mov $0,$1
	beq $1,$L11
	ldq $1,176($15)
	ldq $1,24($1)
	mov $1,$17
	ldah $1,$LC3($29)		!gprelhigh
	lda $16,$LC3($1)		!gprellow
	ldq $27,printf($29)		!literal!32
	jsr $26,($27),0		!lituse_jsr!32
	ldah $29,0($26)		!gpdisp!33
	lda $29,0($29)		!gpdisp!33
	lda $16,1($31)
	ldq $27,exit($29)		!literal!34
	jsr $26,($27),exit		!lituse_jsr!34
$L11:
	ldq $2,72($15)
	ldah $1,20($31)
	lda $1,2410($1)
	cmpeq $2,$1,$1
	bne $1,$L12
	ldq $1,176($15)
	ldq $1,24($1)
	ldq $2,72($15)
	addl $31,$2,$2
	ldah $19,20($31)
	lda $19,2410($19)
	mov $2,$18
	mov $1,$17
	ldah $1,$LC4($29)		!gprelhigh
	lda $16,$LC4($1)		!gprellow
	ldq $27,printf($29)		!literal!35
	jsr $26,($27),0		!lituse_jsr!35
	ldah $29,0($26)		!gpdisp!36
	lda $29,0($29)		!gpdisp!36
	lda $16,1($31)
	ldq $27,exit($29)		!literal!37
	jsr $26,($27),exit		!lituse_jsr!37
$L10:
	ldq $1,176($15)
	stq $31,24($1)
$L12:
	ldq $1,176($15)
	ldl $1,16($1)
	zapnot $1,15,$1
	cmpeq $1,1,$1
	beq $1,$L14
	ldq $1,176($15)
	ldq $1,8($1)
	lda $17,16($15)
	mov $1,$16
	ldq $27,stat($29)		!literal!38
	jsr $26,($27),0		!lituse_jsr!38
	ldah $29,0($26)		!gpdisp!39
	lda $29,0($29)		!gpdisp!39
	mov $0,$1
	beq $1,$L14
	ldq $1,176($15)
	ldq $1,8($1)
	mov $1,$17
	ldah $1,$LC5($29)		!gprelhigh
	lda $16,$LC5($1)		!gprellow
	ldq $27,printf($29)		!literal!40
	jsr $26,($27),0		!lituse_jsr!40
	ldah $29,0($26)		!gpdisp!41
	lda $29,0($29)		!gpdisp!41
	lda $16,1($31)
	ldq $27,exit($29)		!literal!42
	jsr $26,($27),exit		!lituse_jsr!42
$L14:
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,192($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE7:
	.end MAIN_parseCommandLine
	.section	.rodata
$LC8:
	.string	"<none>"
$LC10:
	.string	"MAIN_printInfo:\n\tgrid size      : %i x %i x %i = %.2f * 10^6 Cells\n\tnTimeSteps     : %i\n\tresult file    : %s\n\taction         : %s\n\tsimulation type: %s\n\tobstacle file  : %s\n\n"
$LC0:
	.string	"nothing"
	.zero	24
	.string	"compare"
	.zero	24
	.string	"store"
	.zero	26
$LC6:
	.string	"lid-driven cavity"
	.zero	14
$LC7:
	.string	"channel flow"
	.zero	19
	.text
	.align 2
	.globl MAIN_printInfo
	.ent MAIN_printInfo
MAIN_printInfo:
	.eflag 48
	.frame $15,256,$26,0
	.mask 0x4008000,-224
$LFB8:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!43
	lda $29,0($29)		!gpdisp!43
$MAIN_printInfo..ng:
	lda $30,-256($30)
	.cfi_def_cfa_offset 256
	stq $26,32($30)
	stq $15,40($30)
	.cfi_offset 26, -224
	.cfi_offset 15, -216
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,240($15)
	ldah $1,$LC0($29)		!gprelhigh
	lda $3,48($15)
	lda $1,$LC0($1)		!gprellow
	lda $2,96($31)
	mov $2,$18
	mov $1,$17
	mov $3,$16
	ldq $27,memcpy($29)		!literal!44
	jsr $26,($27),0		!lituse_jsr!44
	ldah $29,0($26)		!gpdisp!45
	lda $29,0($29)		!gpdisp!45
	lda $1,144($15)
	lda $2,96($31)
	mov $2,$18
	mov $31,$17
	mov $1,$16
	ldq $27,memset($29)		!literal!46
	jsr $26,($27),0		!lituse_jsr!46
	ldah $29,0($26)		!gpdisp!47
	lda $29,0($29)		!gpdisp!47
	ldah $6,$LC6($29)		!gprelhigh
	lda $3,$LC6($6)		!gprellow
	ldq_u $2,0($3)
	ldq_u $1,8($3)
	ldq_u $7,15($3)
	and $3,7,$5
	extql $2,$3,$2
	extqh $1,$3,$4
	cmoveq $5,0,$4
	extql $1,$3,$1
	extqh $7,$3,$3
	cmoveq $5,0,$3
	bis $2,$4,$2
	bis $1,$3,$1
	lda $3,$LC6($6)		!gprellow
	ldq_u $4,16($3)
	ldq_u $5,17($3)
	lda $3,16($3)
	extwl $4,$3,$4
	extwh $5,$3,$3
	bis $4,$3,$3
	stq $2,144($15)
	stq $1,152($15)
	ldl $2,160($15)
	zapnot $2,252,$2
	inswl $3,0,$1
	bis $1,$2,$1
	stl $1,160($15)
	ldq $1,160($15)
	zapnot $1,3,$1
	stq $1,160($15)
	stq $31,168($15)
	ldah $3,$LC7($29)		!gprelhigh
	lda $2,$LC7($3)		!gprellow
	ldq_u $1,0($2)
	ldq_u $5,7($2)
	and $2,7,$4
	extql $1,$2,$1
	extqh $5,$2,$2
	cmoveq $4,0,$2
	bis $1,$2,$1
	lda $2,$LC7($3)		!gprellow
	ldq_u $5,8($2)
	ldq_u $4,11($2)
	lda $2,8($2)
	extll $5,$2,$5
	extlh $4,$2,$2
	bis $31,$5,$4
	bis $4,$2,$2
	bis $31,$2,$4
	lda $2,$LC7($3)		!gprellow
	ldq_u $3,12($2)
	lda $2,12($2)
	extbl $3,$2,$3
	stq $1,176($15)
	stl $4,184($15)
	ldl $2,188($15)
	bic $2,255,$2
	insbl $3,0,$1
	bis $1,$2,$1
	stl $1,188($15)
	ldq $1,184($15)
	zapnot $1,31,$1
	stq $1,184($15)
	stq $31,192($15)
	stq $31,200($15)
	ldq $1,240($15)
	ldl $6,0($1)
	ldq $1,240($15)
	ldq $2,8($1)
	ldq $1,240($15)
	ldl $1,16($1)
	zapnot $1,15,$1
	sll $1,5,$1
	lda $4,48($15)
	addq $4,$1,$3
	ldq $1,240($15)
	ldl $1,20($1)
	lda $4,144($15)
	zapnot $1,15,$1
	sll $1,5,$1
	addq $4,$1,$4
	ldq $1,240($15)
	ldq $1,24($1)
	beq $1,$L16
	ldq $1,240($15)
	ldq $1,24($1)
	br $31,$L17
$L16:
	ldah $1,$LC8($29)		!gprelhigh
	lda $1,$LC8($1)		!gprellow
$L17:
	ldah $5,$LC9($29)		!gprelhigh
	ldt $f10,$LC9($5)		!gprellow
	stq $1,24($30)
	stq $4,16($30)
	stq $3,8($30)
	stq $2,0($30)
	mov $6,$21
	cpys $f10,$f10,$f20
	lda $19,130($31)
	lda $18,100($31)
	lda $17,100($31)
	ldah $1,$LC10($29)		!gprelhigh
	lda $16,$LC10($1)		!gprellow
	ldq $27,printf($29)		!literal!48
	jsr $26,($27),0		!lituse_jsr!48
	ldah $29,0($26)		!gpdisp!49
	lda $29,0($29)		!gpdisp!49
	bis $31,$31,$31
	mov $15,$30
	ldq $26,32($30)
	ldq $15,40($30)
	lda $30,256($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE8:
	.end MAIN_printInfo
	.align 2
	.globl MAIN_initialize
	.ent MAIN_initialize
MAIN_initialize:
	.eflag 48
	.frame $15,32,$26,0
	.mask 0x4008000,-32
$LFB9:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!50
	lda $29,0($29)		!gpdisp!50
$MAIN_initialize..ng:
	lda $30,-32($30)
	.cfi_def_cfa_offset 32
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -32
	.cfi_offset 15, -24
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,16($15)
	ldah $1,srcGrid($29)		!gprelhigh
	lda $16,srcGrid($1)		!gprellow
	ldq $27,LBM_allocateGrid($29)		!literal!51
	jsr $26,($27),LBM_allocateGrid		!lituse_jsr!51
	ldah $29,0($26)		!gpdisp!52
	lda $29,0($29)		!gpdisp!52
	ldah $1,dstGrid($29)		!gprelhigh
	lda $16,dstGrid($1)		!gprellow
	ldq $27,LBM_allocateGrid($29)		!literal!53
	jsr $26,($27),LBM_allocateGrid		!lituse_jsr!53
	ldah $29,0($26)		!gpdisp!54
	lda $29,0($29)		!gpdisp!54
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $1,srcGrid($1)		!gprellow
	mov $1,$16
	ldq $27,LBM_initializeGrid($29)		!literal!55
	jsr $26,($27),LBM_initializeGrid		!lituse_jsr!55
	ldah $29,0($26)		!gpdisp!56
	lda $29,0($29)		!gpdisp!56
	ldah $1,dstGrid($29)		!gprelhigh
	ldq $1,dstGrid($1)		!gprellow
	mov $1,$16
	ldq $27,LBM_initializeGrid($29)		!literal!57
	jsr $26,($27),LBM_initializeGrid		!lituse_jsr!57
	ldah $29,0($26)		!gpdisp!58
	lda $29,0($29)		!gpdisp!58
	ldq $1,16($15)
	ldq $1,24($1)
	beq $1,$L19
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $2,srcGrid($1)		!gprellow
	ldq $1,16($15)
	ldq $1,24($1)
	mov $1,$17
	mov $2,$16
	ldq $27,LBM_loadObstacleFile($29)		!literal!59
	jsr $26,($27),LBM_loadObstacleFile		!lituse_jsr!59
	ldah $29,0($26)		!gpdisp!60
	lda $29,0($29)		!gpdisp!60
	ldah $1,dstGrid($29)		!gprelhigh
	ldq $2,dstGrid($1)		!gprellow
	ldq $1,16($15)
	ldq $1,24($1)
	mov $1,$17
	mov $2,$16
	ldq $27,LBM_loadObstacleFile($29)		!literal!61
	jsr $26,($27),LBM_loadObstacleFile		!lituse_jsr!61
	ldah $29,0($26)		!gpdisp!62
	lda $29,0($29)		!gpdisp!62
$L19:
	ldq $1,16($15)
	ldl $1,20($1)
	zapnot $1,15,$1
	cmpeq $1,1,$1
	beq $1,$L20
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $1,srcGrid($1)		!gprellow
	mov $1,$16
	ldq $27,LBM_initializeSpecialCellsForChannel($29)		!literal!63
	jsr $26,($27),LBM_initializeSpecialCellsForChannel		!lituse_jsr!63
	ldah $29,0($26)		!gpdisp!64
	lda $29,0($29)		!gpdisp!64
	ldah $1,dstGrid($29)		!gprelhigh
	ldq $1,dstGrid($1)		!gprellow
	mov $1,$16
	ldq $27,LBM_initializeSpecialCellsForChannel($29)		!literal!65
	jsr $26,($27),LBM_initializeSpecialCellsForChannel		!lituse_jsr!65
	ldah $29,0($26)		!gpdisp!66
	lda $29,0($29)		!gpdisp!66
	br $31,$L21
$L20:
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $1,srcGrid($1)		!gprellow
	mov $1,$16
	ldq $27,LBM_initializeSpecialCellsForLDC($29)		!literal!67
	jsr $26,($27),LBM_initializeSpecialCellsForLDC		!lituse_jsr!67
	ldah $29,0($26)		!gpdisp!68
	lda $29,0($29)		!gpdisp!68
	ldah $1,dstGrid($29)		!gprelhigh
	ldq $1,dstGrid($1)		!gprellow
	mov $1,$16
	ldq $27,LBM_initializeSpecialCellsForLDC($29)		!literal!69
	jsr $26,($27),LBM_initializeSpecialCellsForLDC		!lituse_jsr!69
	ldah $29,0($26)		!gpdisp!70
	lda $29,0($29)		!gpdisp!70
$L21:
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $1,srcGrid($1)		!gprellow
	mov $1,$16
	ldq $27,LBM_showGridStatistics($29)		!literal!71
	jsr $26,($27),LBM_showGridStatistics		!lituse_jsr!71
	ldah $29,0($26)		!gpdisp!72
	lda $29,0($29)		!gpdisp!72
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,32($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE9:
	.end MAIN_initialize
	.align 2
	.globl MAIN_finalize
	.ent MAIN_finalize
MAIN_finalize:
	.eflag 48
	.frame $15,32,$26,0
	.mask 0x4008000,-32
$LFB10:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!73
	lda $29,0($29)		!gpdisp!73
$MAIN_finalize..ng:
	lda $30,-32($30)
	.cfi_def_cfa_offset 32
	stq $26,0($30)
	stq $15,8($30)
	.cfi_offset 26, -32
	.cfi_offset 15, -24
	mov $30,$15
	.cfi_def_cfa_register 15
	.prologue 1
	stq $16,16($15)
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $1,srcGrid($1)		!gprellow
	mov $1,$16
	ldq $27,LBM_showGridStatistics($29)		!literal!74
	jsr $26,($27),LBM_showGridStatistics		!lituse_jsr!74
	ldah $29,0($26)		!gpdisp!75
	lda $29,0($29)		!gpdisp!75
	ldq $1,16($15)
	ldl $1,16($1)
	zapnot $1,15,$1
	cmpeq $1,1,$1
	beq $1,$L23
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $2,srcGrid($1)		!gprellow
	ldq $1,16($15)
	ldq $1,8($1)
	lda $18,-1($31)
	mov $1,$17
	mov $2,$16
	ldq $27,LBM_compareVelocityField($29)		!literal!76
	jsr $26,($27),LBM_compareVelocityField		!lituse_jsr!76
	ldah $29,0($26)		!gpdisp!77
	lda $29,0($29)		!gpdisp!77
$L23:
	ldq $1,16($15)
	ldl $1,16($1)
	zapnot $1,15,$1
	cmpeq $1,2,$1
	beq $1,$L24
	ldah $1,srcGrid($29)		!gprelhigh
	ldq $2,srcGrid($1)		!gprellow
	ldq $1,16($15)
	ldq $1,8($1)
	lda $18,-1($31)
	mov $1,$17
	mov $2,$16
	ldq $27,LBM_storeVelocityField($29)		!literal!78
	jsr $26,($27),LBM_storeVelocityField		!lituse_jsr!78
	ldah $29,0($26)		!gpdisp!79
	lda $29,0($29)		!gpdisp!79
$L24:
	ldah $1,srcGrid($29)		!gprelhigh
	lda $16,srcGrid($1)		!gprellow
	ldq $27,LBM_freeGrid($29)		!literal!80
	jsr $26,($27),LBM_freeGrid		!lituse_jsr!80
	ldah $29,0($26)		!gpdisp!81
	lda $29,0($29)		!gpdisp!81
	ldah $1,dstGrid($29)		!gprelhigh
	lda $16,dstGrid($1)		!gprellow
	ldq $27,LBM_freeGrid($29)		!literal!82
	jsr $26,($27),LBM_freeGrid		!lituse_jsr!82
	ldah $29,0($26)		!gpdisp!83
	lda $29,0($29)		!gpdisp!83
	bis $31,$31,$31
	mov $15,$30
	ldq $26,0($30)
	ldq $15,8($30)
	lda $30,32($30)
	.cfi_restore 15
	.cfi_restore 26
	.cfi_def_cfa 30, 0
	ret $31,($26),1
	.cfi_endproc
$LFE10:
	.end MAIN_finalize
	.section	.rodata
	.align 3
$LC9:
	.long	-858993460
	.long	1073007820
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
