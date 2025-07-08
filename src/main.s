	.set noreorder
	.set volatile
	.set noat
	.set nomacro
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
$LC1:
	.string	"syntax: lbm <time steps> <result file> <0: nil, 1: cmp, 2: str> <0: ldc, 1: channel flow> [<obstacle file>]"
$LC2:
	.string	"MAIN_parseCommandLine: cannot stat obstacle file '%s'\n"
$LC3:
	.string	"MAIN_parseCommandLine:\n\tsize of file '%s' is %i bytes\n\texpected size is %i bytes\n"
$LC4:
	.string	"MAIN_parseCommandLine: cannot stat result file '%s'\n"
	.text
	.align 2
	.align 4
	.globl MAIN_parseCommandLine
	.ent MAIN_parseCommandLine
MAIN_parseCommandLine:
	.eflag 48
	.frame $30,176,$26,0
	.mask 0x4000e00,-176
$LFB40:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!1
	lda $29,0($29)		!gpdisp!1
$MAIN_parseCommandLine..ng:
	subl $16,5,$1
	lda $30,-176($30)
	.cfi_def_cfa_offset 176
	zapnot $1,15,$1
	stq $9,8($30)
	.cfi_offset 9, -168
	mov $18,$9
	stq $10,16($30)
	cmpule $1,1,$1
	stq $11,24($30)
	.cfi_offset 10, -160
	.cfi_offset 11, -152
	mov $17,$10
	stq $26,0($30)
	.cfi_offset 26, -176
	.prologue 1
	mov $16,$11
	beq $1,$L11
	ldq $16,8($17)
	lda $18,10($31)
	ldq $27,strtol($29)		!literal!15
	mov $31,$17
	cmpeq $11,6,$11
	jsr $26,($27),strtol		!lituse_jsr!15
	ldah $29,0($26)		!gpdisp!16
	lda $18,10($31)
	ldq $1,16($10)
	lda $29,0($29)		!gpdisp!16
	stl $0,0($9)
	mov $31,$17
	stq $1,8($9)
	ldq $16,24($10)
	ldq $27,strtol($29)		!literal!17
	jsr $26,($27),strtol		!lituse_jsr!17
	ldah $29,0($26)		!gpdisp!18
	lda $18,10($31)
	ldq $16,32($10)
	lda $29,0($29)		!gpdisp!18
	stl $0,16($9)
	mov $31,$17
	ldq $27,strtol($29)		!literal!19
	jsr $26,($27),strtol		!lituse_jsr!19
	ldah $29,0($26)		!gpdisp!20
	stl $0,20($9)
	lda $29,0($29)		!gpdisp!20
	bne $11,$L12
	stq $31,24($9)
$L5:
	ldl $1,16($9)
	cmpeq $1,1,$1
	bne $1,$L13
$L1:
	ldq $26,0($30)
	ldq $9,8($30)
	ldq $10,16($30)
	ldq $11,24($30)
	lda $30,176($30)
	.cfi_remember_state
	.cfi_restore 11
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
	.align 4
$L12:
	.cfi_restore_state
	ldq $1,40($10)
	lda $17,32($30)
	ldq $27,stat($29)		!literal!13
	mov $1,$16
	stq $1,24($9)
	jsr $26,($27),stat		!lituse_jsr!13
	ldah $29,0($26)		!gpdisp!14
	lda $29,0($29)		!gpdisp!14
	bne $0,$L14
	ldah $20,20($31)
	ldq $19,88($30)
	lda $20,2410($20)
	cmpeq $19,$20,$1
	bne $1,$L5
	ldq $27,__printf_chk($29)		!literal!7
	ldah $17,$LC3($29)		!gprelhigh
	ldq $18,24($9)
	lda $16,1($31)
	addl $31,$19,$19
	lda $17,$LC3($17)		!gprellow
	jsr $26,($27),__printf_chk		!lituse_jsr!7
	ldah $29,0($26)		!gpdisp!8
	lda $16,1($31)
	lda $29,0($29)		!gpdisp!8
	ldq $27,exit($29)		!literal!9
	jsr $26,($27),exit		!lituse_jsr!9
	.align 4
$L13:
	ldq $16,8($9)
	lda $17,32($30)
	ldq $27,stat($29)		!literal!5
	jsr $26,($27),stat		!lituse_jsr!5
	ldah $29,0($26)		!gpdisp!6
	lda $29,0($29)		!gpdisp!6
	beq $0,$L1
	ldq $27,__printf_chk($29)		!literal!2
	ldah $17,$LC4($29)		!gprelhigh
	ldq $18,8($9)
	lda $16,1($31)
	lda $17,$LC4($17)		!gprellow
	jsr $26,($27),__printf_chk		!lituse_jsr!2
	ldah $29,0($26)		!gpdisp!3
	lda $16,1($31)
	lda $29,0($29)		!gpdisp!3
	ldq $27,exit($29)		!literal!4
	jsr $26,($27),exit		!lituse_jsr!4
$L11:
	ldah $16,$LC1($29)		!gprelhigh
	ldq $27,puts($29)		!literal!21
	lda $16,$LC1($16)		!gprellow
	jsr $26,($27),puts		!lituse_jsr!21
	ldah $29,0($26)		!gpdisp!22
	lda $16,1($31)
	lda $29,0($29)		!gpdisp!22
	ldq $27,exit($29)		!literal!23
	jsr $26,($27),exit		!lituse_jsr!23
$L14:
	ldq $27,__printf_chk($29)		!literal!10
	ldah $17,$LC2($29)		!gprelhigh
	ldq $18,24($9)
	lda $16,1($31)
	lda $17,$LC2($17)		!gprellow
	jsr $26,($27),__printf_chk		!lituse_jsr!10
	ldah $29,0($26)		!gpdisp!11
	lda $16,1($31)
	lda $29,0($29)		!gpdisp!11
	ldq $27,exit($29)		!literal!12
	jsr $26,($27),exit		!lituse_jsr!12
	.cfi_endproc
$LFE40:
	bis $31,$31,$31
	.end MAIN_parseCommandLine
	.section	.rodata.str1.1
$LC5:
	.string	"<none>"
$LC9:
	.string	"MAIN_printInfo:\n\tgrid size      : %i x %i x %i = %.2f * 10^6 Cells\n\tnTimeSteps     : %i\n\tresult file    : %s\n\taction         : %s\n\tsimulation type: %s\n\tobstacle file  : %s\n\n"
	.section	.rodata
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
	.align 4
	.globl MAIN_printInfo
	.ent MAIN_printInfo
MAIN_printInfo:
	.eflag 48
	.frame $30,256,$26,0
	.mask 0x4000200,-208
$LFB41:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!24
	lda $29,0($29)		!gpdisp!24
$MAIN_printInfo..ng:
	lda $30,-256($30)
	.cfi_def_cfa_offset 256
	ldah $17,$LC0($29)		!gprelhigh
	ldq $27,memcpy($29)		!literal!25
	stq $26,48($30)
	lda $18,96($31)
	stq $9,56($30)
	.cfi_offset 26, -208
	.cfi_offset 9, -200
	.prologue 1
	lda $17,$LC0($17)		!gprellow
	mov $16,$9
	lda $16,160($30)
	jsr $26,($27),memcpy		!lituse_jsr!25
	ldah $29,0($26)		!gpdisp!26
	ldl $6,80($30)
	lda $29,0($29)		!gpdisp!26
	ldl $24,0($9)
	ldah $3,$LC6($29)		!gprelhigh
	ldq $25,8($9)
	lda $1,$LC6($3)		!gprellow
	ldl $0,108($30)
	lda $2,16($1)
	ldq_u $8,$LC6($3)		!gprellow
	ldq_u $5,17($1)
	ldah $20,$LC7($29)		!gprelhigh
	ldq_u $3,16($1)
	zapnot $6,252,$6
	ldq_u $4,8($1)
	extwh $5,$2,$5
	ldq_u $7,15($1)
	extwl $3,$2,$3
	stq $31,128($30)
	lda $2,$LC7($20)		!gprellow
	stq $31,136($30)
	bis $3,$5,$3
	ldl $5,16($9)
	zapnot $3,3,$3
	ldq $27,__printf_chk($29)		!literal!27
	lda $19,12($2)
	bis $3,$6,$3
	stl $3,80($30)
	ldq_u $22,12($2)
	ldq_u $23,8($2)
	bic $0,255,$0
	ldq_u $21,11($2)
	extbl $22,$19,$22
	ldq_u $6,7($2)
	lda $28,8($2)
	ldq_u $3,$LC7($20)		!gprellow
	bis $22,$0,$22
	stl $22,108($30)
	extlh $21,$28,$21
	stq $31,144($30)
	and $1,7,$22
	stq $31,152($30)
	extll $23,$28,$23
	stq $31,88($30)
	extqh $4,$1,$28
	stq $31,112($30)
	extqh $7,$1,$7
	stq $31,120($30)
	extql $8,$1,$8
	extql $4,$1,$4
	ldq $1,80($30)
	bis $23,$21,$23
	stl $23,104($30)
	extqh $6,$2,$6
	zapnot $1,3,$1
	stq $1,80($30)
	and $2,7,$23
	ldq $1,104($30)
	cmoveq $22,0,$28
	cmoveq $22,0,$7
	cmoveq $23,0,$6
	extql $3,$2,$3
	zapnot $1,31,$1
	stq $1,104($30)
	bis $4,$7,$4
	stq $4,72($30)
	bis $3,$6,$3
	stq $3,96($30)
	bis $8,$28,$8
	stq $8,64($30)
	zapnot $5,15,$2
	ldl $1,20($9)
	lda $5,160($30)
	ldq $3,24($9)
	sll $2,5,$2
	stq $25,8($30)
	zapnot $1,15,$1
	stq $24,0($30)
	addq $5,$2,$2
	stq $2,16($30)
	ldah $4,$LC8($29)		!gprelhigh
	sll $1,5,$1
	lda $2,64($30)
	ldt $f21,$LC8($4)		!gprellow
	addq $2,$1,$1
	stq $1,24($30)
	ldah $4,$LC5($29)		!gprelhigh
	lda $1,$LC5($4)		!gprellow
	ldah $17,$LC9($29)		!gprelhigh
	cmoveq $3,$1,$3
	stq $3,32($30)
	lda $20,130($31)
	lda $19,100($31)
	lda $18,100($31)
	lda $17,$LC9($17)		!gprellow
	lda $16,1($31)
	jsr $26,($27),__printf_chk		!lituse_jsr!27
	ldah $29,0($26)		!gpdisp!28
	ldq $9,56($30)
	ldq $26,48($30)
	lda $29,0($29)		!gpdisp!28
	lda $30,256($30)
	.cfi_restore 9
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
	.cfi_endproc
$LFE41:
	.end MAIN_printInfo
	.align 2
	.align 4
	.globl MAIN_initialize
	.ent MAIN_initialize
MAIN_initialize:
	.eflag 48
	.frame $30,32,$26,0
	.mask 0x4000e00,-32
$LFB42:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!29
	lda $29,0($29)		!gpdisp!29
$MAIN_initialize..ng:
	lda $30,-32($30)
	.cfi_def_cfa_offset 32
	ldq $27,LBM_allocateGrid($29)		!literal!44
	stq $9,8($30)
	.cfi_offset 9, -24
	ldah $9,srcGrid($29)		!gprelhigh
	stq $26,0($30)
	stq $10,16($30)
	.cfi_offset 26, -32
	.cfi_offset 10, -16
	mov $16,$10
	stq $11,24($30)
	.cfi_offset 11, -8
	.prologue 1
	lda $16,srcGrid($9)		!gprellow
	jsr $26,($27),LBM_allocateGrid		!lituse_jsr!44
	ldah $29,0($26)		!gpdisp!45
	lda $29,0($29)		!gpdisp!45
	ldah $11,dstGrid($29)		!gprelhigh
	lda $16,dstGrid($11)		!gprellow
	ldq $27,LBM_allocateGrid($29)		!literal!46
	jsr $26,($27),LBM_allocateGrid		!lituse_jsr!46
	ldah $29,0($26)		!gpdisp!47
	ldq $16,srcGrid($9)		!gprellow
	lda $29,0($29)		!gpdisp!47
	ldq $27,LBM_initializeGrid($29)		!literal!48
	jsr $26,($27),LBM_initializeGrid		!lituse_jsr!48
	ldah $29,0($26)		!gpdisp!49
	ldq $16,dstGrid($11)		!gprellow
	lda $29,0($29)		!gpdisp!49
	ldq $27,LBM_initializeGrid($29)		!literal!50
	jsr $26,($27),LBM_initializeGrid		!lituse_jsr!50
	ldah $29,0($26)		!gpdisp!51
	ldq $17,24($10)
	lda $29,0($29)		!gpdisp!51
	beq $17,$L19
	ldq $16,srcGrid($9)		!gprellow
	ldq $27,LBM_loadObstacleFile($29)		!literal!40
	jsr $26,($27),LBM_loadObstacleFile		!lituse_jsr!40
	ldah $29,0($26)		!gpdisp!41
	ldq $17,24($10)
	lda $29,0($29)		!gpdisp!41
	ldq $16,dstGrid($11)		!gprellow
	ldq $27,LBM_loadObstacleFile($29)		!literal!42
	jsr $26,($27),LBM_loadObstacleFile		!lituse_jsr!42
	ldah $29,0($26)		!gpdisp!43
	lda $29,0($29)		!gpdisp!43
$L19:
	ldl $1,20($10)
	ldq $16,srcGrid($9)		!gprellow
	cmpeq $1,1,$1
	bne $1,$L25
	ldq $27,LBM_initializeSpecialCellsForLDC($29)		!literal!32
	jsr $26,($27),LBM_initializeSpecialCellsForLDC		!lituse_jsr!32
	ldah $29,0($26)		!gpdisp!33
	ldq $16,dstGrid($11)		!gprellow
	lda $29,0($29)		!gpdisp!33
	ldq $27,LBM_initializeSpecialCellsForLDC($29)		!literal!34
	jsr $26,($27),LBM_initializeSpecialCellsForLDC		!lituse_jsr!34
	ldah $29,0($26)		!gpdisp!35
	lda $29,0($29)		!gpdisp!35
$L21:
	ldq $16,srcGrid($9)		!gprellow
	ldq $27,LBM_showGridStatistics($29)		!literal!30
	jsr $26,($27),LBM_showGridStatistics		!lituse_jsr!30
	ldah $29,0($26)		!gpdisp!31
	ldq $9,8($30)
	ldq $26,0($30)
	ldq $10,16($30)
	lda $29,0($29)		!gpdisp!31
	ldq $11,24($30)
	lda $30,32($30)
	.cfi_remember_state
	.cfi_restore 11
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
	.align 4
$L25:
	.cfi_restore_state
	ldq $27,LBM_initializeSpecialCellsForChannel($29)		!literal!36
	jsr $26,($27),LBM_initializeSpecialCellsForChannel		!lituse_jsr!36
	ldah $29,0($26)		!gpdisp!37
	ldq $16,dstGrid($11)		!gprellow
	lda $29,0($29)		!gpdisp!37
	ldq $27,LBM_initializeSpecialCellsForChannel($29)		!literal!38
	jsr $26,($27),LBM_initializeSpecialCellsForChannel		!lituse_jsr!38
	ldah $29,0($26)		!gpdisp!39
	lda $29,0($29)		!gpdisp!39
	br $31,$L21
	.cfi_endproc
$LFE42:
	.end MAIN_initialize
	.align 2
	.align 4
	.globl MAIN_finalize
	.ent MAIN_finalize
MAIN_finalize:
	.eflag 48
	.frame $30,32,$26,0
	.mask 0x4000600,-32
$LFB43:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!52
	lda $29,0($29)		!gpdisp!52
$MAIN_finalize..ng:
	lda $30,-32($30)
	.cfi_def_cfa_offset 32
	ldq $27,LBM_showGridStatistics($29)		!literal!61
	stq $10,16($30)
	.cfi_offset 10, -16
	ldah $10,srcGrid($29)		!gprelhigh
	stq $9,8($30)
	.cfi_offset 9, -24
	mov $16,$9
	ldq $16,srcGrid($10)		!gprellow
	stq $26,0($30)
	.cfi_offset 26, -32
	.prologue 1
	jsr $26,($27),LBM_showGridStatistics		!lituse_jsr!61
	ldah $29,0($26)		!gpdisp!62
	ldl $1,16($9)
	lda $29,0($29)		!gpdisp!62
	zapnot $1,15,$1
	cmpeq $1,1,$2
	bne $2,$L29
	cmpeq $1,2,$1
	bne $1,$L30
$L28:
	lda $16,srcGrid($10)		!gprellow
	ldq $27,LBM_freeGrid($29)		!literal!53
	jsr $26,($27),LBM_freeGrid		!lituse_jsr!53
	ldah $29,0($26)		!gpdisp!54
	lda $29,0($29)		!gpdisp!54
	ldah $16,dstGrid($29)		!gprelhigh
	lda $16,dstGrid($16)		!gprellow
	ldq $27,LBM_freeGrid($29)		!literal!55
	jsr $26,($27),LBM_freeGrid		!lituse_jsr!55
	ldah $29,0($26)		!gpdisp!56
	ldq $9,8($30)
	ldq $26,0($30)
	lda $29,0($29)		!gpdisp!56
	ldq $10,16($30)
	lda $30,32($30)
	.cfi_remember_state
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
	.align 4
$L29:
	.cfi_restore_state
	ldq $17,8($9)
	ldq $16,srcGrid($10)		!gprellow
	lda $18,-1($31)
	ldq $27,LBM_compareVelocityField($29)		!literal!59
	jsr $26,($27),LBM_compareVelocityField		!lituse_jsr!59
	ldah $29,0($26)		!gpdisp!60
	ldl $1,16($9)
	lda $29,0($29)		!gpdisp!60
	zapnot $1,15,$1
	cmpeq $1,2,$1
	beq $1,$L28
$L30:
	ldq $17,8($9)
	ldq $16,srcGrid($10)		!gprellow
	lda $18,-1($31)
	ldq $27,LBM_storeVelocityField($29)		!literal!57
	jsr $26,($27),LBM_storeVelocityField		!lituse_jsr!57
	ldah $29,0($26)		!gpdisp!58
	lda $29,0($29)		!gpdisp!58
	br $31,$L28
	.cfi_endproc
$LFE43:
	.end MAIN_finalize
	.section	.rodata.str1.1
$LC10:
	.string	"timestep: %i\n"
	.section	.text.startup,"ax",@progbits
	.align 2
	.align 4
	.globl main
	.ent main
main:
	.eflag 48
	.frame $30,96,$26,0
	.mask 0x400fe00,-96
$LFB39:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!63
	lda $29,0($29)		!gpdisp!63
$main..ng:
	lda $30,-96($30)
	.cfi_def_cfa_offset 96
	lda $18,64($30)
	stq $26,0($30)
	stq $11,24($30)
	stq $9,8($30)
	stq $10,16($30)
	stq $12,32($30)
	stq $13,40($30)
	stq $14,48($30)
	stq $15,56($30)
	.cfi_offset 26, -96
	.cfi_offset 11, -72
	.cfi_offset 9, -88
	.cfi_offset 10, -80
	.cfi_offset 12, -64
	.cfi_offset 13, -56
	.cfi_offset 14, -48
	.cfi_offset 15, -40
	.prologue 1
	ldq $27,MAIN_parseCommandLine($29)		!literal!74
	jsr $26,($27),MAIN_parseCommandLine		!lituse_jsr!74
	ldah $29,0($26)		!gpdisp!75
	lda $29,0($29)		!gpdisp!75
	lda $16,64($30)
	ldq $27,MAIN_printInfo($29)		!literal!76
	jsr $26,($27),MAIN_printInfo		!lituse_jsr!76
	ldah $29,0($26)		!gpdisp!77
	lda $29,0($29)		!gpdisp!77
	lda $16,64($30)
	ldq $27,MAIN_initialize($29)		!literal!78
	jsr $26,($27),MAIN_initialize		!lituse_jsr!78
	ldah $29,0($26)		!gpdisp!79
	lda $29,0($29)		!gpdisp!79
	ldl $11,64($30)
	ble $11,$L36
	ldah $9,srcGrid($29)		!gprelhigh
	ldl $10,84($30)
	ldah $12,dstGrid($29)		!gprelhigh
	lda $15,1($31)
	lda $14,dstGrid($12)		!gprellow
	lda $13,srcGrid($9)		!gprellow
	cmpeq $10,1,$10
	.align 4
$L35:
	bne $10,$L40
$L33:
	ldq $17,dstGrid($12)		!gprellow
	ldq $16,srcGrid($9)		!gprellow
	ldq $27,LBM_performStreamCollideTRT($29)		!literal!68
	jsr $26,($27),LBM_performStreamCollideTRT		!lituse_jsr!68
	ldah $29,0($26)		!gpdisp!69
	mov $14,$17
	lda $29,0($29)		!gpdisp!69
	mov $13,$16
	ldq $27,LBM_swapGrids($29)		!literal!70
	jsr $26,($27),LBM_swapGrids		!lituse_jsr!70
	ldah $29,0($26)		!gpdisp!71
	and $15,63,$2
	lda $29,0($29)		!gpdisp!71
	beq $2,$L41
$L34:
	addl $15,1,$15
	cmple $15,$11,$2
	bne $2,$L35
$L36:
	lda $16,64($30)
	ldq $27,MAIN_finalize($29)		!literal!80
	jsr $26,($27),MAIN_finalize		!lituse_jsr!80
	ldah $29,0($26)		!gpdisp!81
	lda $29,0($29)		!gpdisp!81
	ldq $9,8($30)
	ldq $26,0($30)
	ldq $10,16($30)
	ldq $11,24($30)
	ldq $12,32($30)
	ldq $13,40($30)
	ldq $14,48($30)
	mov $31,$0
	ldq $15,56($30)
	lda $30,96($30)
	.cfi_remember_state
	.cfi_restore 15
	.cfi_restore 14
	.cfi_restore 13
	.cfi_restore 12
	.cfi_restore 11
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
	.align 4
$L41:
	.cfi_restore_state
	ldah $17,$LC10($29)		!gprelhigh
	ldq $27,__printf_chk($29)		!literal!64
	mov $15,$18
	lda $16,1($31)
	lda $17,$LC10($17)		!gprellow
	jsr $26,($27),__printf_chk		!lituse_jsr!64
	ldah $29,0($26)		!gpdisp!65
	ldq $16,srcGrid($9)		!gprellow
	lda $29,0($29)		!gpdisp!65
	ldq $27,LBM_showGridStatistics($29)		!literal!66
	jsr $26,($27),LBM_showGridStatistics		!lituse_jsr!66
	ldah $29,0($26)		!gpdisp!67
	lda $29,0($29)		!gpdisp!67
	br $31,$L34
	.align 4
$L40:
	ldq $16,srcGrid($9)		!gprellow
	ldq $27,LBM_handleInOutFlow($29)		!literal!72
	jsr $26,($27),LBM_handleInOutFlow		!lituse_jsr!72
	ldah $29,0($26)		!gpdisp!73
	lda $29,0($29)		!gpdisp!73
	br $31,$L33
	.cfi_endproc
$LFE39:
	.end main
	.section	.sbss,"aw"
	.type	dstGrid, @object
	.size	dstGrid, 8
	.align 3
dstGrid:
	.zero	8
	.type	srcGrid, @object
	.size	srcGrid, 8
	.align 3
srcGrid:
	.zero	8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 3
$LC8:
	.long	-858993460
	.long	1073007820
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
