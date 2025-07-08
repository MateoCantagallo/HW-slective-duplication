	.set noreorder
	.set volatile
	.set noat
	.set nomacro
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
$LC2:
	.string	"LBM_allocateGrid: could not allocate %.1f MByte\n"
	.text
	.align 2
	.align 4
	.globl LBM_allocateGrid
	.ent LBM_allocateGrid
LBM_allocateGrid:
	.eflag 48
	.frame $30,16,$26,0
	.mask 0x4000200,-16
$LFB39:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!1
	lda $29,0($29)		!gpdisp!1
$LBM_allocateGrid..ng:
	lda $30,-16($30)
	.cfi_def_cfa_offset 16
	ldq $27,malloc($29)		!literal!5
	stq $9,8($30)
	.cfi_offset 9, -8
	mov $16,$9
	ldah $16,3271($31)
	stq $26,0($30)
	.cfi_offset 26, -16
	.prologue 1
	lda $16,31744($16)
	jsr $26,($27),malloc		!lituse_jsr!5
	ldah $29,0($26)		!gpdisp!6
	stq $0,0($9)
	lda $29,0($29)		!gpdisp!6
	beq $0,$L4
	ldah $0,49($0)
	ldq $26,0($30)
	lda $0,-11264($0)
	stq $0,0($9)
	ldq $9,8($30)
	lda $30,16($30)
	.cfi_remember_state
	.cfi_restore 9
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
$L4:
	.cfi_restore_state
	ldah $1,$LC1($29)		!gprelhigh
	ldq $27,__printf_chk($29)		!literal!2
	ldah $17,$LC2($29)		!gprelhigh
	lda $16,1($31)
	lds $f18,$LC1($1)		!gprellow
	lda $17,$LC2($17)		!gprellow
	cvtsts $f18,$f10
	trapb
	cpys $f10,$f10,$f18
	jsr $26,($27),__printf_chk		!lituse_jsr!2
	ldah $29,0($26)		!gpdisp!3
	lda $16,1($31)
	lda $29,0($29)		!gpdisp!3
	ldq $27,exit($29)		!literal!4
	jsr $26,($27),exit		!lituse_jsr!4
	.cfi_endproc
$LFE39:
	bis $31,$31,$31
	.end LBM_allocateGrid
	.align 2
	.align 4
	.globl LBM_freeGrid
	.ent LBM_freeGrid
LBM_freeGrid:
	.eflag 48
	.frame $30,16,$26,0
	.mask 0x4000200,-16
$LFB40:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!7
	lda $29,0($29)		!gpdisp!7
$LBM_freeGrid..ng:
	lda $30,-16($30)
	.cfi_def_cfa_offset 16
	ldq $27,free($29)		!literal!8
	stq $9,8($30)
	.cfi_offset 9, -8
	mov $16,$9
	ldq $16,0($16)
	stq $26,0($30)
	.cfi_offset 26, -16
	.prologue 1
	ldah $16,-49($16)
	lda $16,11264($16)
	jsr $26,($27),free		!lituse_jsr!8
	ldah $29,0($26)		!gpdisp!9
	ldq $26,0($30)
	stq $31,0($9)
	lda $29,0($29)		!gpdisp!9
	ldq $9,8($30)
	lda $30,16($30)
	.cfi_restore 9
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
	.cfi_endproc
$LFE40:
	.end LBM_freeGrid
	.align 2
	.align 4
	.globl LBM_initializeGrid
	.ent LBM_initializeGrid
LBM_initializeGrid:
	.eflag 48
	.frame $30,0,$26,0
$LFB41:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!10
	lda $29,0($29)		!gpdisp!10
$LBM_initializeGrid..ng:
	.prologue 1
	ldah $2,$LC3($29)		!gprelhigh
	ldah $1,-49($16)
	ldah $3,3223($16)
	ldt $f12,$LC3($2)		!gprellow
	ldah $2,$LC4($29)		!gprelhigh
	lda $1,11264($1)
	lda $3,-22528($3)
	ldt $f11,$LC4($2)		!gprellow
	ldah $2,$LC5($29)		!gprelhigh
	ldt $f10,$LC5($2)		!gprellow
	.align 4
$L7:
	stt $f12,0($1)
	stt $f11,8($1)
	stt $f11,16($1)
	stt $f11,24($1)
	stt $f11,32($1)
	stt $f11,40($1)
	stt $f11,48($1)
	stt $f10,56($1)
	stt $f10,64($1)
	stt $f10,72($1)
	stt $f10,80($1)
	stt $f10,88($1)
	stt $f10,96($1)
	stt $f10,104($1)
	stt $f10,112($1)
	stt $f10,120($1)
	stt $f10,128($1)
	stt $f10,136($1)
	stt $f10,144($1)
	stl $31,152($1)
	lda $1,160($1)
	cmpeq $3,$1,$2
	beq $2,$L7
	ret $31,($26),1
	.cfi_endproc
$LFE41:
	.end LBM_initializeGrid
	.align 2
	.align 4
	.globl LBM_swapGrids
	.ent LBM_swapGrids
$LBM_swapGrids..ng:
LBM_swapGrids:
	.eflag 48
	.frame $30,0,$26,0
$LFB42:
	.cfi_startproc
	.prologue 0
	ldq $2,0($17)
	ldq $1,0($16)
	stq $2,0($16)
	stq $1,0($17)
	ret $31,($26),1
	.cfi_endproc
$LFE42:
	.end LBM_swapGrids
	.section	.rodata.str1.1
$LC6:
	.string	"rb"
	.text
	.align 2
	.align 4
	.globl LBM_loadObstacleFile
	.ent LBM_loadObstacleFile
LBM_loadObstacleFile:
	.eflag 48
	.frame $30,80,$26,0
	.mask 0x400fe00,-80
$LFB43:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!11
	lda $29,0($29)		!gpdisp!11
$LBM_loadObstacleFile..ng:
	lda $30,-80($30)
	.cfi_def_cfa_offset 80
	mov $17,$1
	ldq $27,fopen($29)		!literal!20
	ldah $17,$LC6($29)		!gprelhigh
	stq $9,8($30)
	stq $11,24($30)
	lda $17,$LC6($17)		!gprellow
	stq $15,56($30)
	.cfi_offset 9, -72
	.cfi_offset 11, -56
	.cfi_offset 15, -24
	mov $16,$11
	stq $26,0($30)
	mov $1,$16
	stq $10,16($30)
	lda $15,2019($31)
	stq $12,32($30)
	stq $13,40($30)
	stq $14,48($30)
	.cfi_offset 26, -80
	.cfi_offset 10, -64
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.prologue 1
	jsr $26,($27),fopen		!lituse_jsr!20
	ldah $29,0($26)		!gpdisp!21
	stq $31,64($30)
	lda $29,0($29)		!gpdisp!21
	mov $0,$9
$L11:
	mov $15,$12
	mov $31,$13
$L16:
	lda $1,-2000($12)
	addl $31,$1,$14
	zapnot $12,15,$10
	.align 4
$L13:
	mov $9,$16
	ldq $27,fgetc($29)		!literal!18
	jsr $26,($27),fgetc		!lituse_jsr!18
	ldah $29,0($26)		!gpdisp!19
	addl $14,20,$3
	zapnot $3,15,$2
	cmpeq $0,46,$0
	lda $29,0($29)		!gpdisp!19
	s8addq $14,$11,$1
	cmpeq $2,$10,$2
	bne $0,$L12
	ldl $4,0($1)
	bis $4,1,$4
	stl $4,0($1)
$L12:
	addl $31,$3,$14
	beq $2,$L13
	mov $9,$16
	ldq $27,fgetc($29)		!literal!16
	addl $13,100,$13
	lda $12,2000($12)
	jsr $26,($27),fgetc		!lituse_jsr!16
	ldah $29,0($26)		!gpdisp!17
	addl $31,$12,$12
	zapnot $13,15,$1
	lda $29,0($29)		!gpdisp!17
	lda $1,-10000($1)
	addl $31,$13,$13
	bne $1,$L16
	mov $9,$16
	ldq $27,fgetc($29)		!literal!14
	jsr $26,($27),fgetc		!lituse_jsr!14
	ldah $29,0($26)		!gpdisp!15
	ldah $2,20($31)
	ldq $1,64($30)
	lda $2,-10720($2)
	lda $29,0($29)		!gpdisp!15
	lda $14,10000($1)
	zapnot $14,15,$1
	addl $31,$14,$14
	stq $14,64($30)
	cmpeq $1,$2,$1
	ldah $2,3($31)
	lda $2,3392($2)
	addl $2,$15,$15
	beq $1,$L11
	mov $9,$16
	ldq $27,fclose($29)		!literal!12
	jsr $26,($27),fclose		!lituse_jsr!12
	ldah $29,0($26)		!gpdisp!13
	ldq $9,8($30)
	ldq $26,0($30)
	ldq $10,16($30)
	ldq $11,24($30)
	ldq $12,32($30)
	ldq $13,40($30)
	ldq $14,48($30)
	lda $29,0($29)		!gpdisp!13
	ldq $15,56($30)
	lda $30,80($30)
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
	.cfi_endproc
$LFE43:
	.end LBM_loadObstacleFile
	.align 2
	.align 4
	.globl LBM_initializeSpecialCellsForLDC
	.ent LBM_initializeSpecialCellsForLDC
$LBM_initializeSpecialCellsForLDC..ng:
LBM_initializeSpecialCellsForLDC:
	.eflag 48
	.frame $30,0,$26,0
$LFB44:
	.cfi_startproc
	.prologue 0
	ldah $0,-6($31)
	ldah $21,3($31)
	mov $16,$7
	lda $0,-6765($0)
	lda $28,-2($31)
	lda $21,3392($21)
$L22:
	cmpeq $28,0,$22
	cmpeq $28,129,$2
	cmpeq $28,1,$23
	cmpeq $28,128,$1
	mov $0,$25
	mov $31,$24
	bis $22,$2,$22
	bis $23,$1,$23
$L31:
	subl $24,2,$1
	cmpeq $24,0,$8
	cmpeq $24,99,$2
	zapnot $1,15,$1
	mov $25,$4
	lda $5,1($31)
	mov $31,$3
	bis $8,$2,$8
	cmpule $1,95,$20
	br $31,$L29
	.align 4
$L38:
	bne $8,$L23
	bne $22,$L23
	subl $3,2,$1
	beq $23,$L25
	zapnot $1,15,$1
	cmpule $1,95,$1
	bne $1,$L36
$L25:
	zapnot $5,15,$1
	cmpeq $1,100,$1
	bne $1,$L37
	.align 4
$L27:
	addl $3,1,$3
	addl $5,1,$5
	addl $4,20,$4
$L29:
	cmpeq $3,0,$1
	cmpeq $3,99,$6
	addl $31,$4,$2
	bis $1,$6,$1
	s8addq $2,$7,$2
	beq $1,$L38
$L23:
	ldl $1,0($2)
	bis $1,1,$1
	stl $1,0($2)
	zapnot $5,15,$1
	cmpeq $1,100,$1
	beq $1,$L27
$L37:
	addl $24,1,$24
	lda $25,2000($25)
	cmpeq $24,100,$1
	addl $31,$25,$25
	beq $1,$L31
	addl $28,1,$28
	cmpeq $28,132,$1
	addl $21,$0,$0
	beq $1,$L22
	ret $31,($26),1
$L36:
	beq $20,$L27
	addl $31,$4,$1
	s8addq $1,$7,$1
	ldl $2,0($1)
	bis $2,2,$2
	stl $2,0($1)
	br $31,$L27
	.cfi_endproc
$LFE44:
	.end LBM_initializeSpecialCellsForLDC
	.align 2
	.align 4
	.globl LBM_initializeSpecialCellsForChannel
	.ent LBM_initializeSpecialCellsForChannel
$LBM_initializeSpecialCellsForChannel..ng:
LBM_initializeSpecialCellsForChannel:
	.eflag 48
	.frame $30,0,$26,0
$LFB45:
	.cfi_startproc
	.prologue 0
	ldah $24,-6($31)
	ldah $28,3($31)
	ldah $25,20($31)
	mov $16,$6
	lda $24,-6765($24)
	lda $23,-20000($31)
	lda $28,3392($28)
	lda $25,9280($25)
$L40:
	mov $24,$22
	mov $31,$8
$L46:
	cmpeq $8,0,$7
	cmpeq $8,99,$2
	mov $22,$4
	mov $31,$1
	bis $7,$2,$7
	.align 4
$L43:
	cmpeq $1,99,$5
	cmpeq $1,0,$3
	addl $31,$4,$2
	addl $1,1,$1
	bis $3,$5,$3
	s8addq $2,$6,$2
	cmpeq $1,100,$5
	bne $3,$L41
	beq $7,$L42
$L41:
	ldl $3,0($2)
	bis $3,1,$3
	stl $3,0($2)
$L42:
	addl $4,20,$4
	beq $5,$L43
	addl $8,1,$8
	lda $22,2000($22)
	cmpeq $8,100,$1
	addl $31,$22,$22
	beq $1,$L46
	lda $23,10000($23)
	zapnot $23,15,$1
	addl $28,$24,$24
	cmpeq $1,$25,$1
	addl $31,$23,$23
	beq $1,$L40
	ret $31,($26),1
	.cfi_endproc
$LFE45:
	.end LBM_initializeSpecialCellsForChannel
	.align 2
	.align 4
	.globl LBM_performStreamCollideBGK
	.ent LBM_performStreamCollideBGK
LBM_performStreamCollideBGK:
	.eflag 48
	.frame $30,112,$26,0
	.mask 0x4000000,-112
	.fmask 0x3fc,-104
$LFB46:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!22
	lda $29,0($29)		!gpdisp!22
$LBM_performStreamCollideBGK..ng:
	lda $30,-112($30)
	.cfi_def_cfa_offset 112
	ldah $3,$LC25($29)		!gprelhigh
	ldah $2,24($17)
	stq $26,0($30)
	ldah $1,-25($17)
	ldah $4,3174($16)
	stt $f3,16($30)
	lda $2,11240($2)
	.cfi_offset 26, -112
	.cfi_offset 35, -96
	ldt $f3,$LC25($3)		!gprellow
	lda $1,22512($1)
	lda $4,-11264($4)
	ldah $8,$LC11($29)		!gprelhigh
	stt $f2,8($30)
	stt $f4,24($30)
	stt $f5,32($30)
	stt $f6,40($30)
	stt $f7,48($30)
	stt $f8,56($30)
	stt $f9,64($30)
	.cfi_offset 34, -104
	.cfi_offset 36, -88
	.cfi_offset 37, -80
	.cfi_offset 38, -72
	.cfi_offset 39, -64
	.cfi_offset 40, -56
	.cfi_offset 41, -48
	.prologue 1
	br $31,$L55
	.align 4
$L60:
	subt/su $f19,$f20,$f18
	ldah $7,$LC21($29)		!gprelhigh
	trapb
	subt/su $f21,$f1,$f19
	ldah $6,$LC23($29)		!gprelhigh
	subt/su $f0,$f30,$f20
	ldah $5,$LC19($29)		!gprelhigh
	ldah $3,$LC17($29)		!gprelhigh
	trapb
	addt/su $f18,$f29,$f21
	addt/su $f19,$f29,$f1
	trapb
	lds $f29,$LC21($7)		!gprellow
	addt/su $f20,$f27,$f0
	cvtsts $f29,$f18
	subt/su $f21,$f11,$f30
	trapb
	addt/su $f1,$f11,$f29
	trapb
	subt/su $f0,$f25,$f1
	trapb
	lds $f0,$LC23($6)		!gprellow
	cvtsts $f0,$f11
	trapb
	addt/su $f30,$f10,$f0
	trapb
	subt/su $f29,$f10,$f30
	trapb
	addt/su $f1,$f23,$f29
	trapb
	lds $f1,$LC19($5)		!gprellow
	cvtsts $f1,$f10
	trapb
	subt/su $f0,$f28,$f1
	trapb
	subt/su $f30,$f28,$f0
	trapb
	subt/su $f29,$f15,$f30
	trapb
	addt/su $f1,$f26,$f29
	addt/su $f0,$f27,$f28
	trapb
	addt/su $f30,$f26,$f27
	trapb
	addt/su $f29,$f24,$f26
	trapb
	addt/su $f28,$f25,$f29
	trapb
	subt/su $f27,$f24,$f28
	trapb
	subt/su $f26,$f22,$f27
	trapb
	subt/su $f29,$f23,$f26
	addt/su $f28,$f22,$f25
	subt/su $f27,$f12,$f24
	trapb
	subt/su $f26,$f15,$f23
	subt/su $f25,$f12,$f22
	divt/su $f24,$f13,$f29
	trapb
	divt/su $f23,$f13,$f15
	mult/su $f29,$f18,$f12
	cpysn $f29,$f29,$f16
	mult/su $f29,$f29,$f21
	addt/su $f12,$f11,$f25
	subt/su $f12,$f11,$f24
	trapb
	mult/su $f25,$f29,$f23
	mult/su $f24,$f29,$f12
	trapb
	addt/su $f23,$f10,$f24
	trapb
	addt/su $f12,$f10,$f23
	stt $f24,88($30)
	stt $f23,96($30)
	trapb
	divt/su $f22,$f13,$f12
	addt/su $f29,$f15,$f25
	subt/su $f15,$f29,$f24
	subt/su $f29,$f15,$f23
	trapb
	subt/su $f16,$f15,$f22
	mult/su $f15,$f18,$f26
	mult/su $f25,$f18,$f1
	mult/su $f24,$f18,$f0
	mult/su $f23,$f18,$f30
	mult/su $f22,$f18,$f28
	mult/su $f15,$f15,$f27
	subt/su $f26,$f11,$f20
	cpysn $f15,$f15,$f2
	addt/su $f21,$f27,$f17
	trapb
	addt/su $f26,$f11,$f27
	addt/su $f1,$f11,$f21
	trapb
	addt/su $f0,$f11,$f1
	trapb
	addt/su $f30,$f11,$f0
	trapb
	addt/su $f28,$f11,$f30
	mult/su $f21,$f25,$f26
	trapb
	mult/su $f27,$f15,$f28
	mult/su $f1,$f24,$f25
	trapb
	mult/su $f20,$f15,$f27
	mult/su $f0,$f23,$f24
	trapb
	mult/su $f30,$f22,$f23
	addt/su $f28,$f10,$f19
	addt/su $f27,$f10,$f20
	addt/su $f26,$f10,$f21
	addt/su $f25,$f10,$f1
	addt/su $f24,$f10,$f0
	trapb
	addt/su $f23,$f10,$f30
	subt/su $f15,$f12,$f27
	subt/su $f12,$f15,$f26
	subt/su $f2,$f12,$f25
	addt/su $f29,$f12,$f24
	trapb
	subt/su $f29,$f12,$f23
	subt/su $f12,$f29,$f22
	addt/su $f15,$f12,$f28
	trapb
	subt/su $f16,$f12,$f15
	mult/su $f12,$f18,$f29
	mult/su $f27,$f18,$f8
	mult/su $f28,$f18,$f9
	mult/su $f26,$f18,$f7
	mult/su $f25,$f18,$f6
	mult/su $f24,$f18,$f5
	mult/su $f23,$f18,$f4
	mult/su $f22,$f18,$f2
	trapb
	mult/su $f15,$f18,$f16
	trapb
	mult/su $f12,$f12,$f18
	stt $f18,80($30)
	trapb
	addt/su $f29,$f11,$f18
	stt $f18,104($30)
	trapb
	subt/su $f29,$f11,$f18
	trapb
	addt/su $f9,$f11,$f29
	trapb
	addt/su $f8,$f11,$f9
	trapb
	addt/su $f7,$f11,$f8
	trapb
	addt/su $f6,$f11,$f7
	trapb
	addt/su $f5,$f11,$f6
	trapb
	addt/su $f4,$f11,$f5
	trapb
	addt/su $f2,$f11,$f4
	trapb
	addt/su $f16,$f11,$f2
	trapb
	ldt $f16,80($30)
	addt/su $f17,$f16,$f11
	trapb
	ldt $f16,104($30)
	mult/su $f16,$f12,$f17
	trapb
	mult/su $f18,$f12,$f16
	trapb
	mult/su $f4,$f22,$f18
	trapb
	mult/su $f2,$f15,$f4
	trapb
	lds $f15,$LC17($3)		!gprellow
	mult/su $f29,$f28,$f12
	trapb
	mult/su $f9,$f27,$f28
	cvtsts $f15,$f22
	trapb
	mult/su $f8,$f26,$f27
	mult/su $f5,$f23,$f29
	trapb
	mult/su $f7,$f25,$f26
	trapb
	mult/su $f6,$f24,$f25
	mult/su $f11,$f22,$f15
	addt/su $f17,$f10,$f2
	trapb
	addt/su $f26,$f10,$f24
	addt/su $f16,$f10,$f17
	addt/su $f29,$f10,$f23
	trapb
	addt/su $f12,$f10,$f16
	addt/su $f18,$f10,$f22
	trapb
	ldt $f18,88($30)
	addt/su $f25,$f10,$f12
	addt/su $f28,$f10,$f5
	addt/su $f4,$f10,$f11
	trapb
	addt/su $f27,$f10,$f28
	trapb
	subt/su $f10,$f15,$f27
	trapb
	ldt $f10,96($30)
	subt/su $f19,$f15,$f26
	subt/su $f20,$f15,$f29
	subt/su $f24,$f15,$f25
	trapb
	subt/su $f18,$f15,$f20
	subt/su $f12,$f15,$f24
	trapb
	subt/su $f2,$f15,$f18
	subt/su $f23,$f15,$f12
	trapb
	subt/su $f17,$f15,$f2
	subt/su $f22,$f15,$f23
	trapb
	subt/su $f21,$f15,$f17
	subt/su $f10,$f15,$f19
	trapb
	subt/su $f1,$f15,$f21
	subt/su $f28,$f15,$f4
	trapb
	subt/su $f0,$f15,$f1
	subt/su $f11,$f15,$f22
	trapb
	subt/su $f30,$f15,$f0
	trapb
	subt/su $f16,$f15,$f30
	trapb
	subt/su $f5,$f15,$f16
	trapb
$L54:
	ldah $3,$LC24($29)		!gprelhigh
	mult/su $f14,$f3,$f15
	trapb
	lda $3,$LC24($3)		!gprellow
	lda $16,160($16)
	lda $17,160($17)
	ldt $f10,0($3)
	ldah $3,$LC26($29)		!gprelhigh
	lda $3,$LC26($3)		!gprellow
	mult/su $f13,$f10,$f5
	trapb
	lda $2,160($2)
	lda $1,160($1)
	ldt $f10,0($3)
	ldah $3,$LC27($29)		!gprelhigh
	lda $3,$LC27($3)		!gprellow
	mult/su $f5,$f27,$f28
	ldt $f14,0($3)
	mult/su $f13,$f10,$f11
	trapb
	mult/su $f13,$f14,$f10
	trapb
	addt/su $f28,$f15,$f14
	mult/su $f11,$f26,$f13
	mult/su $f11,$f29,$f5
	mult/su $f11,$f20,$f6
	mult/su $f11,$f19,$f7
	trapb
	mult/su $f11,$f18,$f20
	stt $f14,-160($17)
	mult/su $f11,$f2,$f19
	trapb
	ldt $f14,-152($16)
	mult/su $f10,$f25,$f15
	mult/su $f10,$f17,$f18
	mult/su $f10,$f0,$f29
	mult/su $f14,$f3,$f11
	trapb
	mult/su $f10,$f21,$f17
	mult/su $f10,$f24,$f14
	trapb
	mult/su $f10,$f1,$f21
	addt/su $f11,$f13,$f25
	mult/su $f10,$f30,$f28
	trapb
	mult/su $f10,$f12,$f13
	mult/su $f10,$f22,$f11
	trapb
	mult/su $f10,$f23,$f12
	mult/su $f10,$f16,$f27
	stt $f25,15848($17)
	mult/su $f10,$f4,$f26
	trapb
	ldt $f10,-144($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f5,$f10
	stt $f10,-16144($17)
	trapb
	ldt $f10,-136($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f6,$f10
	stt $f10,24($17)
	trapb
	ldt $f10,-128($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f7,$f10
	stt $f10,-288($17)
	trapb
	ldt $f10,-120($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f20,$f10
	stt $f10,15776($2)
	trapb
	ldt $f10,-112($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f19,$f10
	stt $f10,15776($1)
	trapb
	ldt $f10,-104($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f18,$f10
	stt $f10,16056($17)
	trapb
	ldt $f10,-96($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f17,$f10
	stt $f10,15744($17)
	trapb
	ldt $f10,-88($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f21,$f10
	stt $f10,-15928($17)
	trapb
	ldt $f10,-80($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f29,$f10
	stt $f10,-16240($17)
	trapb
	ldt $f10,-72($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f28,$f10
	stt $f10,31824($2)
	trapb
	ldt $f10,-64($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f27,$f10
	stt $f10,31824($1)
	trapb
	ldt $f10,-56($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f26,$f10
	stt $f10,-160($2)
	trapb
	ldt $f10,-48($16)
	mult/su $f10,$f3,$f22
	trapb
	addt/su $f22,$f15,$f10
	stt $f10,-160($1)
	trapb
	ldt $f10,-40($16)
	mult/su $f10,$f3,$f15
	trapb
	addt/su $f15,$f14,$f10
	stt $f10,16016($2)
	trapb
	ldt $f10,-32($16)
	mult/su $f10,$f3,$f14
	trapb
	addt/su $f14,$f13,$f10
	stt $f10,16016($1)
	trapb
	ldt $f10,-24($16)
	mult/su $f10,$f3,$f13
	trapb
	addt/su $f13,$f12,$f10
	stt $f10,15712($2)
	trapb
	ldt $f10,-16($16)
	cmpeq $4,$16,$3
	mult/su $f10,$f3,$f12
	trapb
	addt/su $f12,$f11,$f10
	stt $f10,15712($1)
	trapb
	bne $3,$L58
$L55:
	ldl $3,152($16)
	ldt $f14,0($16)
	blbs $3,$L59
	ldt $f21,8($16)
	ldt $f1,16($16)
	ldt $f19,24($16)
	addt/su $f21,$f14,$f10
	ldt $f20,32($16)
	ldt $f0,40($16)
	ldt $f30,48($16)
	ldt $f29,56($16)
	addt/su $f10,$f1,$f13
	ldt $f11,64($16)
	trapb
	ldt $f10,72($16)
	ldt $f28,80($16)
	ldt $f27,88($16)
	addt/su $f13,$f19,$f12
	ldt $f25,96($16)
	ldt $f23,104($16)
	ldt $f15,112($16)
	ldt $f26,120($16)
	trapb
	addt/su $f12,$f20,$f13
	ldt $f24,128($16)
	ldt $f22,136($16)
	trapb
	and $3,2,$3
	ldt $f12,144($16)
	addt/su $f13,$f0,$f18
	trapb
	addt/su $f18,$f30,$f13
	trapb
	addt/su $f13,$f29,$f18
	trapb
	addt/su $f18,$f11,$f13
	trapb
	addt/su $f13,$f10,$f18
	trapb
	addt/su $f18,$f28,$f13
	trapb
	addt/su $f13,$f27,$f18
	trapb
	addt/su $f18,$f25,$f13
	trapb
	addt/su $f13,$f23,$f18
	trapb
	addt/su $f18,$f15,$f13
	trapb
	addt/su $f13,$f26,$f18
	trapb
	addt/su $f18,$f24,$f13
	trapb
	addt/su $f13,$f22,$f18
	trapb
	addt/su $f18,$f12,$f13
	trapb
	beq $3,$L60
	ldah $3,$LC7($29)		!gprelhigh
	ldt $f0,$LC11($8)		!gprellow
	lda $3,$LC7($3)		!gprellow
	ldt $f22,0($3)
	ldah $3,$LC8($29)		!gprelhigh
	lda $3,$LC8($3)		!gprellow
	cpys $f22,$f22,$f23
	ldt $f12,0($3)
	cpys $f22,$f22,$f19
	ldah $3,$LC9($29)		!gprelhigh
	lda $3,$LC9($3)		!gprellow
	cpys $f12,$f12,$f24
	ldt $f25,0($3)
	cpys $f12,$f12,$f20
	ldah $3,$LC12($29)		!gprelhigh
	ldt $f1,$LC12($3)		!gprellow
	cpys $f25,$f25,$f4
	ldah $3,$LC13($29)		!gprelhigh
	cpys $f25,$f25,$f29
	ldt $f21,$LC13($3)		!gprellow
	ldah $3,$LC10($29)		!gprelhigh
	lda $3,$LC10($3)		!gprellow
	ldt $f16,0($3)
	ldah $3,$LC14($29)		!gprelhigh
	ldt $f17,$LC14($3)		!gprellow
	cpys $f16,$f16,$f30
	ldah $3,$LC15($29)		!gprelhigh
	cpys $f16,$f16,$f26
	lda $3,$LC15($3)		!gprellow
	ldt $f2,0($3)
	cpys $f2,$f2,$f18
	cpys $f2,$f2,$f27
	br $31,$L54
	.align 4
$L59:
	stt $f14,0($17)
	lda $16,160($16)
	ldt $f10,-152($16)
	lda $17,160($17)
	lda $2,160($2)
	stt $f10,-16144($17)
	lda $1,160($1)
	ldt $f10,-144($16)
	stt $f10,15848($17)
	ldt $f10,-136($16)
	stt $f10,-288($17)
	ldt $f10,-128($16)
	stt $f10,24($17)
	ldt $f10,-120($16)
	stt $f10,15776($1)
	ldt $f10,-112($16)
	stt $f10,15776($2)
	ldt $f10,-104($16)
	stt $f10,-16240($17)
	ldt $f10,-96($16)
	stt $f10,-15928($17)
	ldt $f10,-88($16)
	stt $f10,15744($17)
	ldt $f10,-80($16)
	stt $f10,16056($17)
	ldt $f10,-72($16)
	stt $f10,-160($1)
	ldt $f10,-64($16)
	stt $f10,-160($2)
	ldt $f10,-56($16)
	stt $f10,31824($1)
	ldt $f10,-48($16)
	stt $f10,31824($2)
	ldt $f10,-40($16)
	stt $f10,15712($1)
	ldt $f10,-32($16)
	stt $f10,15712($2)
	ldt $f10,-24($16)
	stt $f10,16016($1)
	ldt $f10,-16($16)
	cmpeq $4,$16,$3
	stt $f10,16016($2)
	beq $3,$L55
$L58:
	ldq $26,0($30)
	ldt $f2,8($30)
	ldt $f3,16($30)
	ldt $f4,24($30)
	ldt $f5,32($30)
	ldt $f6,40($30)
	ldt $f7,48($30)
	ldt $f8,56($30)
	ldt $f9,64($30)
	lda $30,112($30)
	.cfi_restore 41
	.cfi_restore 40
	.cfi_restore 39
	.cfi_restore 38
	.cfi_restore 37
	.cfi_restore 36
	.cfi_restore 35
	.cfi_restore 34
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
	.cfi_endproc
$LFE46:
	.end LBM_performStreamCollideBGK
	.align 2
	.align 4
	.globl LBM_performStreamCollideTRT
	.ent LBM_performStreamCollideTRT
LBM_performStreamCollideTRT:
	.eflag 48
	.frame $30,224,$26,0
	.mask 0x4000000,-224
	.fmask 0x3fc,-216
$LFB47:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!23
	lda $29,0($29)		!gpdisp!23
$LBM_performStreamCollideTRT..ng:
	lda $30,-224($30)
	.cfi_def_cfa_offset 224
	ldah $2,24($17)
	ldah $1,-25($17)
	stq $26,0($30)
	ldah $4,3174($16)
	lda $2,11240($2)
	lda $1,22512($1)
	lda $4,-11264($4)
	ldah $5,$LC3($29)		!gprelhigh
	stt $f2,8($30)
	stt $f3,16($30)
	stt $f4,24($30)
	stt $f5,32($30)
	stt $f6,40($30)
	stt $f7,48($30)
	stt $f8,56($30)
	stt $f9,64($30)
	.cfi_offset 26, -224
	.cfi_offset 34, -216
	.cfi_offset 35, -208
	.cfi_offset 36, -200
	.cfi_offset 37, -192
	.cfi_offset 38, -184
	.cfi_offset 39, -176
	.cfi_offset 40, -168
	.cfi_offset 41, -160
	.prologue 1
	br $31,$L65
	.align 4
$L70:
	addt/su $f24,$f1,$f19
	ldah $7,$LC21($29)		!gprelhigh
	trapb
	addt/su $f24,$f20,$f1
	ldah $6,$LC19($29)		!gprelhigh
	addt/su $f3,$f2,$f11
	ldah $3,$LC17($29)		!gprelhigh
	subt/su $f19,$f22,$f18
	trapb
	addt/su $f1,$f22,$f19
	subt/su $f11,$f13,$f17
	trapb
	lds $f11,$LC21($7)		!gprellow
	addt/su $f18,$f15,$f1
	cvtsts $f11,$f16
	trapb
	subt/su $f19,$f15,$f11
	trapb
	lds $f19,$LC19($6)		!gprellow
	addt/su $f17,$f4,$f18
	cvtsts $f19,$f2
	trapb
	subt/su $f1,$f23,$f19
	trapb
	subt/su $f11,$f23,$f1
	trapb
	subt/su $f18,$f14,$f11
	trapb
	addt/su $f19,$f8,$f18
	trapb
	addt/su $f1,$f3,$f19
	trapb
	addt/su $f11,$f8,$f1
	trapb
	addt/su $f18,$f6,$f11
	trapb
	addt/su $f19,$f13,$f18
	trapb
	subt/su $f1,$f6,$f19
	trapb
	subt/su $f11,$f5,$f1
	trapb
	subt/su $f18,$f4,$f11
	trapb
	addt/su $f19,$f5,$f18
	trapb
	subt/su $f1,$f12,$f19
	trapb
	subt/su $f11,$f14,$f1
	trapb
	subt/su $f18,$f12,$f11
	divt/su $f19,$f10,$f21
	divt/su $f1,$f10,$f7
	trapb
	mult/su $f21,$f16,$f19
	mult/su $f21,$f21,$f17
	mult/su $f19,$f21,$f1
	addt/su $f1,$f2,$f18
	stt $f18,168($30)
	divt/su $f11,$f10,$f12
	trapb
	addt/su $f21,$f7,$f19
	subt/su $f7,$f21,$f1
	mult/su $f7,$f7,$f18
	stt $f19,112($30)
	trapb
	mult/su $f7,$f16,$f19
	stt $f1,120($30)
	ldt $f3,112($30)
	ldt $f4,120($30)
	ldt $f8,120($30)
	trapb
	mult/su $f3,$f16,$f1
	mult/su $f4,$f16,$f11
	trapb
	addt/su $f17,$f18,$f4
	trapb
	mult/su $f19,$f7,$f18
	trapb
	mult/su $f1,$f3,$f19
	trapb
	mult/su $f11,$f8,$f1
	trapb
	addt/su $f18,$f2,$f11
	addt/su $f19,$f2,$f17
	trapb
	addt/su $f1,$f2,$f18
	stt $f11,160($30)
	stt $f17,176($30)
	stt $f18,184($30)
	addt/su $f21,$f12,$f3
	subt/su $f21,$f12,$f8
	trapb
	subt/su $f7,$f12,$f1
	addt/su $f7,$f12,$f19
	mult/su $f12,$f12,$f17
	mult/su $f12,$f16,$f18
	stt $f3,144($30)
	trapb
	cpys $f1,$f1,$f3
	stt $f8,152($30)
	cpys $f19,$f19,$f11
	ldt $f8,144($30)
	stt $f1,136($30)
	mult/su $f3,$f16,$f1
	stt $f19,128($30)
	trapb
	mult/su $f8,$f16,$f3
	trapb
	ldt $f8,152($30)
	mult/su $f11,$f16,$f19
	trapb
	mult/su $f8,$f16,$f11
	trapb
	ldt $f8,136($30)
	addt/su $f4,$f17,$f16
	trapb
	ldt $f4,128($30)
	mult/su $f18,$f12,$f17
	trapb
	mult/su $f19,$f4,$f18
	trapb
	ldt $f4,144($30)
	mult/su $f1,$f8,$f19
	trapb
	ldt $f8,152($30)
	mult/su $f3,$f4,$f1
	trapb
	mult/su $f11,$f8,$f3
	trapb
	lds $f11,$LC17($3)		!gprellow
	cvtsts $f11,$f4
	trapb
	mult/su $f16,$f4,$f11
	trapb
	addt/su $f17,$f2,$f16
	ldt $f4,168($30)
	trapb
	addt/su $f18,$f2,$f17
	trapb
	addt/su $f19,$f2,$f18
	subt/su $f2,$f11,$f8
	trapb
	addt/su $f1,$f2,$f19
	trapb
	addt/su $f3,$f2,$f1
	trapb
	ldt $f2,160($30)
	subt/su $f4,$f11,$f3
	trapb
	ldt $f4,176($30)
	subt/su $f2,$f11,$f9
	trapb
	subt/su $f16,$f11,$f2
	stt $f3,160($30)
	trapb
	subt/su $f4,$f11,$f3
	trapb
	subt/su $f1,$f11,$f4
	stt $f2,168($30)
	trapb
	ldt $f2,184($30)
	stt $f3,208($30)
	subt/su $f17,$f11,$f3
	subt/su $f2,$f11,$f16
	stt $f4,216($30)
	trapb
	subt/su $f18,$f11,$f2
	stt $f3,184($30)
	stt $f16,176($30)
	trapb
	subt/su $f19,$f11,$f16
	trapb
$L64:
	ldah $3,$LC37($29)		!gprelhigh
	ldt $f19,$LC3($5)		!gprellow
	lda $3,$LC37($3)		!gprellow
	lda $16,160($16)
	lds $f1,0($3)
	mult/su $f10,$f19,$f18
	ldah $3,$LC4($29)		!gprelhigh
	trapb
	addt/su $f0,$f26,$f19
	trapb
	lda $3,$LC4($3)		!gprellow
	cvtsts $f1,$f4
	trapb
	lda $17,160($17)
	lda $2,160($2)
	ldt $f1,0($3)
	ldah $3,$LC23($29)		!gprelhigh
	lda $3,$LC23($3)		!gprellow
	mult/su $f10,$f1,$f11
	trapb
	lda $1,160($1)
	lds $f3,0($3)
	ldah $3,$LC38($29)		!gprelhigh
	cvtsts $f3,$f1
	trapb
	ldt $f3,$LC38($3)		!gprellow
	mult/su $f11,$f9,$f0
	ldah $3,$LC39($29)		!gprelhigh
	trapb
	mult/su $f18,$f8,$f9
	trapb
	mult/su $f19,$f4,$f18
	ldt $f17,$LC39($3)		!gprellow
	mult/su $f11,$f1,$f26
	trapb
	ldah $3,$LC5($29)		!gprelhigh
	mult/su $f20,$f4,$f19
	trapb
	lda $3,$LC5($3)		!gprellow
	subt/su $f25,$f9,$f8
	trapb
	subt/su $f18,$f0,$f9
	mult/su $f26,$f7,$f20
	trapb
	addt/su $f30,$f29,$f0
	trapb
	mult/su $f8,$f3,$f29
	mult/su $f26,$f21,$f7
	trapb
	ldt $f21,192($30)
	subt/su $f20,$f19,$f8
	subt/su $f19,$f20,$f30
	mult/su $f9,$f3,$f18
	trapb
	mult/su $f30,$f17,$f20
	trapb
	subt/su $f25,$f29,$f30
	trapb
	mult/su $f0,$f4,$f29
	trapb
	mult/su $f8,$f17,$f0
	trapb
	ldt $f8,160($30)
	mult/su $f21,$f4,$f25
	mult/su $f11,$f8,$f19
	stt $f30,-160($17)
	trapb
	addt/su $f28,$f27,$f30
	ldt $f8,-152($16)
	subt/su $f25,$f7,$f21
	trapb
	subt/su $f29,$f19,$f27
	trapb
	ldt $f29,168($30)
	mult/su $f11,$f29,$f28
	trapb
	subt/su $f8,$f18,$f29
	trapb
	ldt $f8,0($3)
	mult/su $f27,$f3,$f11
	trapb
	subt/su $f7,$f25,$f27
	trapb
	mult/su $f21,$f17,$f25
	trapb
	subt/su $f29,$f20,$f21
	trapb
	mult/su $f30,$f4,$f29
	trapb
	ldt $f30,200($30)
	mult/su $f27,$f17,$f20
	trapb
	mult/su $f26,$f12,$f27
	trapb
	mult/su $f30,$f4,$f26
	trapb
	subt/su $f29,$f28,$f30
	stt $f21,15848($17)
	mult/su $f10,$f8,$f19
	trapb
	ldt $f21,-144($16)
	addt/su $f24,$f23,$f28
	subt/su $f26,$f27,$f29
	ldt $f8,80($30)
	mult/su $f30,$f3,$f10
	trapb
	subt/su $f21,$f18,$f30
	trapb
	subt/su $f27,$f26,$f21
	mult/su $f19,$f1,$f18
	trapb
	subt/su $f24,$f23,$f27
	trapb
	ldt $f23,112($30)
	subt/su $f30,$f0,$f26
	trapb
	mult/su $f21,$f17,$f30
	trapb
	ldt $f21,208($30)
	mult/su $f28,$f4,$f24
	mult/su $f29,$f17,$f12
	trapb
	mult/su $f18,$f23,$f29
	mult/su $f19,$f21,$f28
	trapb
	ldt $f21,184($30)
	stt $f26,-16144($17)
	mult/su $f27,$f4,$f23
	ldt $f0,-136($16)
	addt/su $f22,$f15,$f26
	trapb
	subt/su $f24,$f28,$f27
	trapb
	subt/su $f0,$f11,$f28
	subt/su $f22,$f15,$f24
	trapb
	subt/su $f23,$f29,$f22
	mult/su $f27,$f3,$f15
	trapb
	mult/su $f26,$f4,$f27
	trapb
	subt/su $f28,$f25,$f26
	trapb
	ldt $f25,176($30)
	ldt $f28,120($30)
	mult/su $f22,$f17,$f1
	trapb
	mult/su $f19,$f25,$f22
	trapb
	mult/su $f18,$f28,$f25
	trapb
	mult/su $f24,$f4,$f28
	stt $f26,24($17)
	trapb
	subt/su $f29,$f23,$f24
	trapb
	ldt $f29,-128($16)
	subt/su $f27,$f22,$f23
	trapb
	addt/su $f8,$f14,$f22
	subt/su $f28,$f25,$f27
	subt/su $f25,$f28,$f26
	trapb
	subt/su $f29,$f11,$f25
	trapb
	ldt $f29,128($30)
	mult/su $f23,$f3,$f11
	trapb
	mult/su $f27,$f17,$f23
	trapb
	mult/su $f26,$f17,$f27
	trapb
	subt/su $f25,$f20,$f26
	trapb
	mult/su $f24,$f17,$f25
	trapb
	subt/su $f8,$f14,$f24
	trapb
	ldt $f8,88($30)
	mult/su $f22,$f4,$f14
	trapb
	mult/su $f19,$f21,$f22
	mult/su $f18,$f29,$f28
	stt $f26,-288($17)
	trapb
	mult/su $f24,$f4,$f26
	ldt $f21,-120($16)
	trapb
	addt/su $f13,$f8,$f24
	subt/su $f14,$f22,$f29
	trapb
	subt/su $f13,$f8,$f14
	subt/su $f21,$f10,$f0
	subt/su $f26,$f28,$f22
	trapb
	mult/su $f29,$f3,$f13
	trapb
	mult/su $f24,$f4,$f29
	trapb
	subt/su $f0,$f12,$f24
	trapb
	ldt $f12,136($30)
	mult/su $f22,$f17,$f0
	trapb
	mult/su $f19,$f2,$f22
	mult/su $f18,$f12,$f21
	mult/su $f14,$f4,$f20
	trapb
	subt/su $f28,$f26,$f14
	stt $f24,15776($2)
	trapb
	subt/su $f29,$f22,$f26
	trapb
	ldt $f22,-112($16)
	ldt $f28,96($30)
	ldt $f29,104($30)
	ldt $f2,104($30)
	ldt $f8,144($30)
	addt/su $f28,$f29,$f24
	trapb
	subt/su $f20,$f21,$f29
	subt/su $f21,$f20,$f28
	trapb
	subt/su $f22,$f10,$f21
	trapb
	mult/su $f26,$f3,$f22
	trapb
	mult/su $f29,$f17,$f26
	trapb
	mult/su $f28,$f17,$f29
	subt/su $f21,$f30,$f10
	trapb
	ldt $f30,96($30)
	mult/su $f14,$f17,$f28
	mult/su $f24,$f4,$f12
	trapb
	subt/su $f30,$f2,$f14
	mult/su $f19,$f16,$f20
	trapb
	mult/su $f18,$f8,$f30
	stt $f10,15776($1)
	addt/su $f6,$f5,$f21
	mult/su $f14,$f4,$f24
	trapb
	ldt $f10,-104($16)
	subt/su $f12,$f20,$f16
	trapb
	subt/su $f6,$f5,$f20
	subt/su $f10,$f15,$f14
	subt/su $f24,$f30,$f12
	trapb
	mult/su $f16,$f3,$f10
	trapb
	mult/su $f21,$f4,$f16
	subt/su $f14,$f1,$f2
	trapb
	mult/su $f12,$f17,$f1
	trapb
	ldt $f12,216($30)
	mult/su $f19,$f12,$f21
	trapb
	ldt $f19,152($30)
	stt $f2,16056($17)
	mult/su $f20,$f4,$f12
	trapb
	subt/su $f30,$f24,$f20
	mult/su $f18,$f19,$f14
	trapb
	ldt $f19,-96($16)
	subt/su $f16,$f21,$f30
	subt/su $f12,$f14,$f24
	trapb
	subt/su $f14,$f12,$f21
	trapb
	subt/su $f19,$f11,$f14
	mult/su $f30,$f3,$f12
	trapb
	mult/su $f24,$f17,$f30
	trapb
	mult/su $f21,$f17,$f24
	trapb
	subt/su $f14,$f23,$f21
	trapb
	mult/su $f20,$f17,$f14
	stt $f21,15744($17)
	trapb
	ldt $f21,-88($16)
	subt/su $f21,$f11,$f23
	trapb
	subt/su $f23,$f27,$f11
	stt $f11,-15928($17)
	trapb
	ldt $f11,-80($16)
	subt/su $f11,$f15,$f23
	trapb
	subt/su $f23,$f25,$f11
	stt $f11,-16240($17)
	trapb
	ldt $f11,-72($16)
	subt/su $f11,$f13,$f15
	trapb
	subt/su $f15,$f0,$f11
	stt $f11,31824($2)
	trapb
	ldt $f11,-64($16)
	subt/su $f11,$f22,$f15
	trapb
	subt/su $f15,$f26,$f11
	stt $f11,31824($1)
	trapb
	ldt $f11,-56($16)
	subt/su $f11,$f22,$f15
	trapb
	subt/su $f15,$f29,$f11
	stt $f11,-160($2)
	trapb
	ldt $f11,-48($16)
	subt/su $f11,$f13,$f15
	trapb
	subt/su $f15,$f28,$f11
	stt $f11,-160($1)
	trapb
	ldt $f11,-40($16)
	subt/su $f11,$f10,$f13
	trapb
	subt/su $f13,$f1,$f11
	stt $f11,16016($2)
	trapb
	ldt $f11,-32($16)
	subt/su $f11,$f12,$f13
	trapb
	subt/su $f13,$f30,$f11
	stt $f11,16016($1)
	trapb
	ldt $f11,-24($16)
	subt/su $f11,$f12,$f13
	trapb
	subt/su $f13,$f24,$f11
	stt $f11,15712($2)
	ldt $f12,-16($16)
	cmpeq $4,$16,$3
	trapb
	subt/su $f12,$f10,$f11
	trapb
	subt/su $f11,$f14,$f10
	stt $f10,15712($1)
	trapb
	bne $3,$L68
$L65:
	ldl $3,152($16)
	ldt $f25,0($16)
	blbs $3,$L69
	ldt $f0,8($16)
	ldt $f26,16($16)
	ldt $f30,24($16)
	addt/su $f0,$f25,$f11
	ldt $f29,32($16)
	ldt $f28,40($16)
	subt/su $f0,$f26,$f20
	ldt $f27,48($16)
	ldt $f24,56($16)
	subt/su $f30,$f29,$f1
	addt/su $f11,$f26,$f10
	ldt $f22,64($16)
	ldt $f15,72($16)
	subt/su $f28,$f27,$f2
	ldt $f23,80($16)
	ldt $f3,88($16)
	trapb
	addt/su $f10,$f30,$f11
	ldt $f13,96($16)
	ldt $f4,104($16)
	ldt $f14,112($16)
	ldt $f8,120($16)
	trapb
	addt/su $f11,$f29,$f10
	ldt $f6,128($16)
	trapb
	ldt $f11,144($16)
	and $3,2,$3
	ldt $f5,136($16)
	stt $f1,192($30)
	stt $f11,104($30)
	addt/su $f10,$f28,$f11
	ldt $f12,104($30)
	trapb
	stt $f2,200($30)
	stt $f3,80($30)
	addt/su $f11,$f27,$f10
	stt $f4,88($30)
	stt $f8,96($30)
	trapb
	addt/su $f10,$f24,$f11
	trapb
	addt/su $f11,$f22,$f10
	trapb
	addt/su $f10,$f15,$f11
	trapb
	addt/su $f11,$f23,$f10
	trapb
	addt/su $f10,$f3,$f11
	trapb
	addt/su $f11,$f13,$f10
	trapb
	addt/su $f10,$f4,$f11
	trapb
	addt/su $f11,$f14,$f10
	trapb
	addt/su $f10,$f8,$f11
	trapb
	addt/su $f11,$f6,$f10
	trapb
	addt/su $f10,$f5,$f11
	trapb
	addt/su $f11,$f12,$f10
	trapb
	beq $3,$L70
	ldah $3,$LC28($29)		!gprelhigh
	cpys $f31,$f31,$f12
	lda $3,$LC28($3)		!gprellow
	ldt $f1,0($3)
	ldah $3,$LC29($29)		!gprelhigh
	lda $3,$LC29($3)		!gprellow
	stt $f1,216($30)
	ldt $f1,0($3)
	ldah $3,$LC28($29)		!gprelhigh
	lda $3,$LC28($3)		!gprellow
	stt $f1,152($30)
	ldt $f16,0($3)
	ldah $3,$LC30($29)		!gprelhigh
	lda $3,$LC30($3)		!gprellow
	stt $f1,144($30)
	ldt $f2,0($3)
	ldah $3,$LC32($29)		!gprelhigh
	stt $f16,160($30)
	ldt $f1,$LC32($3)		!gprellow
	cpys $f2,$f2,$f9
	ldah $3,$LC31($29)		!gprelhigh
	lda $3,$LC31($3)		!gprellow
	stt $f1,176($30)
	ldt $f1,0($3)
	ldah $3,$LC33($29)		!gprelhigh
	stt $f2,184($30)
	ldt $f3,$LC33($3)		!gprellow
	ldah $3,$LC34($29)		!gprelhigh
	stt $f1,136($30)
	stt $f3,120($30)
	ldt $f3,$LC34($3)		!gprellow
	ldah $3,$LC31($29)		!gprelhigh
	lda $3,$LC31($3)		!gprellow
	stt $f3,208($30)
	ldt $f1,0($3)
	ldah $3,$LC35($29)		!gprelhigh
	ldt $f3,$LC35($3)		!gprellow
	ldah $3,$LC15($29)		!gprelhigh
	lda $3,$LC15($3)		!gprellow
	stt $f1,128($30)
	ldt $f1,0($3)
	ldah $3,$LC15($29)		!gprelhigh
	lda $3,$LC15($3)		!gprellow
	stt $f3,112($30)
	ldt $f8,0($3)
	ldah $3,$LC31($29)		!gprelhigh
	lda $3,$LC31($3)		!gprellow
	stt $f1,168($30)
	ldt $f7,0($3)
	ldah $3,$LC29($29)		!gprelhigh
	lda $3,$LC29($3)		!gprellow
	ldt $f21,0($3)
	br $31,$L64
	.align 4
$L69:
	stt $f25,0($17)
	lda $16,160($16)
	ldt $f10,-152($16)
	lda $17,160($17)
	lda $2,160($2)
	stt $f10,-16144($17)
	lda $1,160($1)
	ldt $f10,-144($16)
	stt $f10,15848($17)
	ldt $f10,-136($16)
	stt $f10,-288($17)
	ldt $f10,-128($16)
	stt $f10,24($17)
	ldt $f10,-120($16)
	stt $f10,15776($1)
	ldt $f10,-112($16)
	stt $f10,15776($2)
	ldt $f10,-104($16)
	stt $f10,-16240($17)
	ldt $f10,-96($16)
	stt $f10,-15928($17)
	ldt $f10,-88($16)
	stt $f10,15744($17)
	ldt $f10,-80($16)
	stt $f10,16056($17)
	ldt $f10,-72($16)
	stt $f10,-160($1)
	ldt $f10,-64($16)
	stt $f10,-160($2)
	ldt $f10,-56($16)
	stt $f10,31824($1)
	ldt $f10,-48($16)
	stt $f10,31824($2)
	ldt $f10,-40($16)
	stt $f10,15712($1)
	ldt $f10,-32($16)
	stt $f10,15712($2)
	ldt $f10,-24($16)
	stt $f10,16016($1)
	ldt $f10,-16($16)
	cmpeq $4,$16,$3
	stt $f10,16016($2)
	beq $3,$L65
$L68:
	ldq $26,0($30)
	ldt $f2,8($30)
	ldt $f3,16($30)
	ldt $f4,24($30)
	ldt $f5,32($30)
	ldt $f6,40($30)
	ldt $f7,48($30)
	ldt $f8,56($30)
	ldt $f9,64($30)
	lda $30,224($30)
	.cfi_restore 41
	.cfi_restore 40
	.cfi_restore 39
	.cfi_restore 38
	.cfi_restore 37
	.cfi_restore 36
	.cfi_restore 35
	.cfi_restore 34
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
	.cfi_endproc
$LFE47:
	.end LBM_performStreamCollideTRT
	.align 2
	.align 4
	.globl LBM_handleInOutFlow
	.ent LBM_handleInOutFlow
LBM_handleInOutFlow:
	.eflag 48
	.frame $30,192,$26,0
	.mask 0x4000000,-192
	.fmask 0x3fc,-184
$LFB48:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!24
	lda $29,0($29)		!gpdisp!24
$LBM_handleInOutFlow..ng:
	ldah $1,$LC41($29)		!gprelhigh
	ldah $28,$LC19($29)		!gprelhigh
	ldah $0,$LC17($29)		!gprelhigh
	lds $f10,$LC41($1)		!gprellow
	ldah $25,$LC21($29)		!gprelhigh
	lds $f14,$LC19($28)		!gprellow
	ldah $24,$LC23($29)		!gprelhigh
	lds $f13,$LC17($0)		!gprellow
	lds $f12,$LC21($25)		!gprellow
	cvtsts $f10,$f29
	lds $f11,$LC23($24)		!gprellow
	trapb
	cvtsts $f14,$f10
	cvtsts $f13,$f20
	trapb
	lda $30,-192($30)
	.cfi_def_cfa_offset 192
	cvtsts $f12,$f23
	ldah $4,24($16)
	cvtsts $f11,$f13
	ldah $3,49($16)
	ldah $23,$LC3($29)		!gprelhigh
	stq $26,0($30)
	ldah $22,$LC4($29)		!gprelhigh
	ldah $1,$LC42($29)		!gprelhigh
	ldt $f1,$LC3($23)		!gprellow
	ldah $8,$LC5($29)		!gprelhigh
	ldt $f0,$LC4($22)		!gprellow
	ldah $21,3($31)
	ldt $f21,$LC42($1)		!gprellow
	trapb
	lda $4,27136($4)
	ldt $f30,$LC5($8)		!gprellow
	lda $3,-11264($3)
	mov $16,$5
	mov $31,$7
	lda $21,3392($21)
	stt $f2,8($30)
	stt $f3,16($30)
	stt $f4,24($30)
	stt $f5,32($30)
	stt $f6,40($30)
	stt $f7,48($30)
	stt $f8,56($30)
	stt $f9,64($30)
	.cfi_offset 26, -192
	.cfi_offset 34, -184
	.cfi_offset 35, -176
	.cfi_offset 36, -168
	.cfi_offset 37, -160
	.cfi_offset 38, -152
	.cfi_offset 39, -144
	.cfi_offset 40, -136
	.cfi_offset 41, -128
	.prologue 1
	.align 4
$L72:
	ldt $f12,0($4)
	zapnot $7,15,$20
	ldt $f11,8($4)
	ldt $f22,16($4)
	addq $20,$20,$2
	ldt $f15,0($3)
	addt/su $f12,$f11,$f25
	trapb
	ldt $f12,8($3)
	addq $2,$20,$2
	ldt $f14,24($4)
	sll $2,4,$6
	ldt $f11,16($3)
	s4addq $20,$20,$1
	ldt $f28,72($3)
	addt/su $f25,$f22,$f24
	trapb
	addq $2,$6,$2
	addt/su $f15,$f12,$f22
	sll $2,8,$6
	trapb
	ldt $f15,32($4)
	addq $2,$6,$2
	ldt $f12,24($3)
	addt/su $f24,$f14,$f25
	sll $2,16,$6
	trapb
	addt/su $f22,$f11,$f14
	trapb
	ldt $f11,32($3)
	addq $2,$6,$2
	ldt $f22,40($4)
	s4addq $2,$20,$2
	addt/su $f25,$f15,$f24
	trapb
	srl $2,36,$2
	addt/su $f14,$f12,$f15
	trapb
	ldt $f12,48($4)
	s4addq $2,$2,$19
	ldt $f14,40($3)
	s8addq $19,$2,$19
	addt/su $f24,$f22,$f25
	sll $19,10,$6
	trapb
	addt/su $f15,$f11,$f22
	trapb
	ldt $f11,48($3)
	subq $6,$19,$6
	ldt $f15,56($4)
	sll $6,5,$6
	addt/su $f25,$f12,$f24
	trapb
	sll $1,7,$1
	addt/su $f22,$f14,$f12
	trapb
	addq $6,$2,$6
	s4addq $6,$2,$6
	ldt $f22,64($4)
	s8addq $6,$2,$6
	ldt $f14,56($3)
	addt/su $f24,$f15,$f25
	trapb
	sll $6,5,$6
	addt/su $f12,$f11,$f15
	trapb
	ldt $f11,72($4)
	subq $6,$2,$6
	ldt $f12,64($3)
	srl $6,37,$6
	addt/su $f25,$f22,$f24
	trapb
	subq $1,$20,$1
	addt/su $f15,$f14,$f22
	addl $6,$6,$19
	trapb
	s8addq $1,$20,$1
	ldt $f14,80($4)
	s4addq $1,$1,$1
	addt/su $f24,$f11,$f15
	trapb
	addl $19,$6,$19
	addt/su $f22,$f12,$f19
	trapb
	s4addq $1,$20,$1
	s8addl $19,$6,$6
	s8addq $1,$20,$1
	s4addl $6,0,$6
	addt/su $f15,$f14,$f27
	trapb
	s8subq $1,$1,$1
	addt/su $f19,$f28,$f14
	trapb
	subl $2,$6,$2
	stq $2,184($30)
	sll $1,4,$1
	ldt $f2,184($30)
	ldt $f26,88($4)
	addq $1,$20,$1
	ldt $f12,80($3)
	cvtqt $f2,$f11
	trapb
	s4subq $1,$1,$1
	ldt $f25,96($4)
	addt/su $f27,$f26,$f28
	trapb
	srl $1,39,$1
	addt/su $f14,$f12,$f26
	stq $1,184($30)
	trapb
	lda $5,160($5)
	ldt $f15,88($3)
	ldt $f4,184($30)
	addt/su $f28,$f25,$f12
	ldt $f16,96($3)
	divt/su $f11,$f29,$f22
	trapb
	ldt $f11,104($4)
	cvtqt $f4,$f24
	ldt $f17,112($4)
	trapb
	addt/su $f26,$f15,$f4
	ldt $f19,120($4)
	addt/su $f12,$f11,$f3
	ldt $f18,104($3)
	ldt $f28,112($3)
	ldt $f27,128($4)
	addt/su $f4,$f16,$f2
	trapb
	ldt $f26,120($3)
	addt/su $f3,$f17,$f16
	ldt $f14,136($4)
	ldt $f11,128($3)
	ldt $f25,144($4)
	trapb
	addt/su $f2,$f18,$f17
	ldt $f12,136($3)
	trapb
	addt/su $f16,$f19,$f18
	ldt $f15,144($3)
	trapb
	addl $7,20,$7
	cmpeq $7,$21,$1
	addt/su $f17,$f28,$f19
	trapb
	lda $4,160($4)
	addt/su $f18,$f27,$f28
	trapb
	lda $3,160($3)
	addt/su $f19,$f26,$f27
	trapb
	addt/su $f28,$f14,$f26
	trapb
	addt/su $f27,$f11,$f14
	trapb
	addt/su $f26,$f25,$f11
	trapb
	addt/su $f14,$f12,$f25
	trapb
	addt/su $f11,$f11,$f14
	addt/su $f25,$f15,$f12
	trapb
	subt/su $f14,$f12,$f11
	trapb
	mult/su $f11,$f30,$f12
	mult/su $f11,$f0,$f15
	mult/su $f11,$f1,$f17
	divt/su $f24,$f29,$f14
	trapb
	subt/su $f22,$f10,$f11
	trapb
	mult/su $f11,$f11,$f22
	trapb
	subt/su $f10,$f22,$f11
	trapb
	mult/su $f11,$f21,$f22
	trapb
	subt/su $f14,$f10,$f11
	mult/su $f11,$f11,$f24
	trapb
	subt/su $f10,$f24,$f14
	mult/su $f22,$f14,$f11
	trapb
	addt/su $f11,$f31,$f24
	subt/su $f31,$f11,$f22
	mult/su $f11,$f23,$f14
	mult/su $f11,$f11,$f25
	mult/su $f24,$f23,$f19
	mult/su $f22,$f23,$f27
	addt/su $f14,$f13,$f28
	subt/su $f14,$f13,$f26
	addt/su $f19,$f13,$f16
	addt/su $f27,$f13,$f18
	trapb
	subt/su $f13,$f14,$f19
	addt/su $f25,$f31,$f27
	trapb
	mult/su $f28,$f11,$f25
	mult/su $f18,$f22,$f14
	trapb
	mult/su $f26,$f11,$f28
	mult/su $f11,$f19,$f22
	trapb
	mult/su $f16,$f24,$f26
	mult/su $f27,$f20,$f11
	trapb
	addt/su $f25,$f10,$f27
	trapb
	addt/su $f28,$f10,$f25
	addt/su $f26,$f10,$f24
	trapb
	addt/su $f14,$f10,$f26
	trapb
	subt/su $f10,$f22,$f14
	subt/su $f27,$f11,$f28
	trapb
	subt/su $f10,$f11,$f22
	subt/su $f25,$f11,$f18
	subt/su $f14,$f11,$f19
	trapb
	subt/su $f24,$f11,$f25
	trapb
	subt/su $f26,$f11,$f24
	mult/su $f22,$f15,$f14
	trapb
	mult/su $f22,$f12,$f11
	mult/su $f25,$f12,$f27
	mult/su $f24,$f12,$f26
	trapb
	mult/su $f28,$f12,$f25
	mult/su $f19,$f12,$f24
	trapb
	mult/su $f17,$f22,$f19
	stt $f14,-152($5)
	trapb
	mult/su $f15,$f28,$f22
	stt $f14,-144($5)
	mult/su $f18,$f15,$f12
	stt $f14,-136($5)
	stt $f14,-128($5)
	stt $f11,-104($5)
	stt $f11,-96($5)
	stt $f19,-160($5)
	stt $f22,-120($5)
	stt $f12,-112($5)
	stt $f11,-88($5)
	stt $f11,-80($5)
	stt $f27,-72($5)
	stt $f26,-64($5)
	stt $f25,-56($5)
	stt $f24,-48($5)
	stt $f27,-40($5)
	stt $f26,-32($5)
	stt $f25,-24($5)
	stt $f24,-16($5)
	trapb
	beq $1,$L72
	lds $f12,$LC19($28)		!gprellow
	lds $f11,$LC21($25)		!gprellow
	ldah $1,3101($16)
	lds $f10,$LC23($24)		!gprellow
	cvtsts $f12,$f7
	ldah $2,3125($16)
	cvtsts $f11,$f6
	trapb
	ldah $16,3149($16)
	cvtsts $f10,$f3
	trapb
	lda $1,-27136($1)
	lda $16,27136($16)
	ldt $f9,$LC5($8)		!gprellow
	mov $2,$4
	.align 4
$L73:
	ldt $f5,56($1)
	ldt $f11,64($1)
	ldt $f14,88($1)
	ldt $f24,32($1)
	ldt $f16,88($2)
	ldt $f18,96($2)
	ldt $f2,40($1)
	ldt $f17,16($1)
	ldt $f12,8($2)
	ldt $f10,0($2)
	stt $f5,96($30)
	stt $f11,104($30)
	stt $f14,112($30)
	addt/su $f12,$f10,$f19
	ldt $f11,8($1)
	trapb
	stt $f16,80($30)
	stt $f18,88($30)
	stt $f24,128($30)
	subt/su $f11,$f17,$f24
	ldt $f30,72($1)
	ldt $f29,80($1)
	ldt $f25,96($1)
	ldt $f15,104($1)
	ldt $f20,56($2)
	ldt $f21,64($2)
	ldt $f1,72($2)
	ldt $f0,80($2)
	ldt $f27,104($2)
	ldt $f23,112($2)
	ldt $f28,120($2)
	ldt $f26,128($2)
	ldt $f22,136($2)
	ldt $f13,144($2)
	ldah $5,$LC16($29)		!gprelhigh
	ldt $f8,24($1)
	trapb
	stt $f2,136($30)
	ldt $f4,48($1)
	ldt $f5,128($30)
	ldt $f10,16($2)
	ldt $f14,24($2)
	stt $f4,144($30)
	subt/su $f8,$f5,$f16
	ldt $f4,32($2)
	trapb
	lda $5,$LC16($5)		!gprellow
	ldt $f2,96($30)
	lda $16,160($16)
	lda $1,160($1)
	addt/su $f24,$f2,$f18
	trapb
	lda $2,160($2)
	addt/su $f19,$f10,$f24
	trapb
	ldt $f19,-112($2)
	subt/su $f12,$f10,$f2
	trapb
	ldt $f12,-48($1)
	subt/su $f14,$f4,$f10
	trapb
	ldt $f4,96($30)
	addt/su $f16,$f4,$f5
	trapb
	ldt $f4,-160($1)
	addt/su $f24,$f14,$f16
	stt $f18,176($30)
	trapb
	ldt $f18,-120($2)
	ldt $f24,-40($1)
	ldt $f14,-32($1)
	stt $f5,168($30)
	addt/su $f2,$f20,$f5
	trapb
	addt/su $f11,$f4,$f2
	trapb
	ldt $f4,-128($2)
	ldt $f11,-24($1)
	stt $f5,152($30)
	addt/su $f10,$f20,$f5
	stt $f2,160($30)
	trapb
	addt/su $f16,$f4,$f2
	trapb
	ldt $f4,160($30)
	subt/su $f18,$f19,$f16
	ldt $f10,-16($1)
	cmpeq $4,$1,$3
	trapb
	stt $f2,120($30)
	addt/su $f4,$f17,$f2
	trapb
	ldt $f4,120($30)
	subt/su $f5,$f21,$f17
	trapb
	addt/su $f4,$f18,$f5
	trapb
	ldt $f18,152($30)
	addt/su $f18,$f21,$f4
	trapb
	addt/su $f2,$f8,$f18
	trapb
	ldt $f2,80($30)
	addt/su $f16,$f2,$f8
	trapb
	ldt $f2,144($30)
	addt/su $f5,$f19,$f16
	trapb
	ldt $f5,136($30)
	subt/su $f5,$f2,$f19
	trapb
	ldt $f5,128($30)
	addt/su $f18,$f5,$f2
	trapb
	addt/su $f17,$f1,$f18
	trapb
	addt/su $f16,$f20,$f17
	trapb
	ldt $f20,136($30)
	addt/su $f2,$f20,$f16
	trapb
	ldt $f2,88($30)
	stt $f18,120($30)
	subt/su $f4,$f1,$f18
	subt/su $f8,$f2,$f20
	trapb
	ldt $f4,168($30)
	addt/su $f17,$f21,$f2
	ldt $f5,104($30)
	trapb
	ldt $f21,144($30)
	subt/su $f4,$f5,$f17
	trapb
	addt/su $f16,$f21,$f4
	trapb
	ldt $f16,176($30)
	cpys $f5,$f5,$f21
	addt/su $f16,$f21,$f5
	trapb
	addt/su $f2,$f1,$f21
	trapb
	ldt $f1,112($30)
	ldt $f2,96($30)
	addt/su $f19,$f1,$f16
	trapb
	addt/su $f4,$f2,$f19
	trapb
	ldt $f4,120($30)
	addt/su $f21,$f0,$f2
	trapb
	subt/su $f18,$f0,$f21
	trapb
	ldt $f18,104($30)
	subt/su $f4,$f0,$f1
	trapb
	ldt $f4,80($30)
	addt/su $f19,$f18,$f0
	trapb
	addt/su $f20,$f27,$f19
	trapb
	addt/su $f2,$f4,$f20
	addt/su $f17,$f30,$f18
	trapb
	addt/su $f0,$f30,$f17
	trapb
	subt/su $f5,$f30,$f0
	trapb
	ldt $f5,88($30)
	subt/su $f16,$f25,$f30
	addt/su $f20,$f5,$f2
	trapb
	addt/su $f17,$f29,$f16
	addt/su $f1,$f28,$f20
	trapb
	addt/su $f21,$f4,$f1
	trapb
	ldt $f4,112($30)
	addt/su $f2,$f27,$f17
	trapb
	ldt $f2,112($30)
	addt/su $f16,$f2,$f21
	trapb
	addt/su $f17,$f23,$f2
	subt/su $f19,$f23,$f16
	trapb
	subt/su $f18,$f29,$f19
	trapb
	addt/su $f21,$f25,$f18
	trapb
	subt/su $f0,$f29,$f21
	trapb
	addt/su $f2,$f28,$f0
	addt/su $f30,$f15,$f29
	trapb
	addt/su $f18,$f15,$f30
	trapb
	addt/su $f20,$f26,$f18
	addt/su $f0,$f26,$f17
	trapb
	addt/su $f1,$f5,$f20
	addt/su $f30,$f12,$f2
	trapb
	addt/su $f16,$f28,$f1
	addt/su $f19,$f24,$f0
	addt/su $f21,$f4,$f30
	trapb
	subt/su $f29,$f12,$f19
	addt/su $f17,$f22,$f21
	trapb
	subt/su $f18,$f22,$f29
	addt/su $f2,$f24,$f16
	subt/su $f20,$f27,$f28
	trapb
	subt/su $f1,$f26,$f20
	addt/su $f0,$f14,$f27
	trapb
	addt/su $f30,$f25,$f0
	trapb
	addt/su $f19,$f24,$f30
	subt/su $f29,$f13,$f26
	trapb
	addt/su $f21,$f13,$f24
	addt/su $f16,$f14,$f1
	subt/su $f28,$f23,$f25
	trapb
	addt/su $f20,$f22,$f28
	subt/su $f27,$f11,$f23
	trapb
	subt/su $f30,$f14,$f22
	subt/su $f0,$f15,$f27
	addt/su $f1,$f11,$f29
	trapb
	subt/su $f28,$f13,$f15
	trapb
	subt/su $f23,$f10,$f13
	trapb
	subt/su $f27,$f12,$f23
	trapb
	addt/su $f22,$f11,$f12
	trapb
	divt/su $f26,$f24,$f11
	addt/su $f29,$f10,$f14
	subt/su $f12,$f10,$f17
	trapb
	divt/su $f25,$f24,$f10
	addt/su $f11,$f11,$f22
	trapb
	divt/su $f13,$f14,$f11
	trapb
	addt/su $f10,$f10,$f13
	divt/su $f23,$f14,$f12
	subt/su $f22,$f11,$f25
	trapb
	mult/su $f25,$f6,$f10
	cpysn $f25,$f25,$f20
	mult/su $f25,$f25,$f1
	addt/su $f10,$f3,$f23
	subt/su $f10,$f3,$f22
	mult/su $f23,$f25,$f11
	trapb
	mult/su $f22,$f25,$f10
	addt/su $f11,$f7,$f0
	addt/su $f10,$f7,$f30
	trapb
	divt/su $f15,$f24,$f10
	subt/su $f13,$f12,$f11
	addt/su $f25,$f11,$f22
	trapb
	subt/su $f11,$f25,$f15
	subt/su $f25,$f11,$f13
	subt/su $f20,$f11,$f12
	mult/su $f11,$f11,$f24
	mult/su $f22,$f6,$f29
	mult/su $f15,$f6,$f28
	mult/su $f13,$f6,$f27
	mult/su $f12,$f6,$f26
	mult/su $f11,$f6,$f23
	addt/su $f1,$f24,$f19
	trapb
	addt/su $f29,$f3,$f1
	trapb
	addt/su $f28,$f3,$f29
	trapb
	addt/su $f27,$f3,$f28
	trapb
	addt/su $f26,$f3,$f27
	addt/su $f23,$f3,$f24
	subt/su $f23,$f3,$f21
	trapb
	mult/su $f1,$f22,$f23
	trapb
	mult/su $f29,$f15,$f22
	trapb
	mult/su $f28,$f13,$f15
	trapb
	mult/su $f27,$f12,$f13
	mult/su $f24,$f11,$f26
	trapb
	mult/su $f21,$f11,$f24
	cpysn $f11,$f11,$f18
	addt/su $f23,$f7,$f29
	trapb
	addt/su $f26,$f7,$f21
	trapb
	addt/su $f13,$f7,$f26
	addt/su $f24,$f7,$f1
	addt/su $f22,$f7,$f28
	addt/su $f15,$f7,$f27
	divt/su $f17,$f14,$f12
	trapb
	addt/su $f10,$f10,$f13
	trapb
	subt/su $f13,$f12,$f10
	subt/su $f11,$f10,$f23
	subt/su $f10,$f11,$f22
	addt/su $f11,$f10,$f24
	trapb
	subt/su $f20,$f10,$f11
	addt/su $f25,$f10,$f14
	subt/su $f25,$f10,$f13
	subt/su $f10,$f25,$f12
	trapb
	mult/su $f11,$f6,$f20
	mult/su $f10,$f6,$f25
	mult/su $f24,$f6,$f8
	mult/su $f23,$f6,$f5
	subt/su $f18,$f10,$f15
	mult/su $f22,$f6,$f4
	stt $f20,112($30)
	trapb
	mult/su $f10,$f10,$f20
	mult/su $f14,$f6,$f16
	mult/su $f15,$f6,$f2
	mult/su $f13,$f6,$f17
	mult/su $f12,$f6,$f18
	stt $f20,80($30)
	trapb
	addt/su $f25,$f3,$f20
	stt $f20,88($30)
	trapb
	subt/su $f25,$f3,$f20
	trapb
	addt/su $f8,$f3,$f25
	stt $f25,96($30)
	trapb
	addt/su $f5,$f3,$f25
	trapb
	addt/su $f4,$f3,$f5
	trapb
	addt/su $f2,$f3,$f4
	trapb
	addt/su $f16,$f3,$f2
	trapb
	addt/su $f17,$f3,$f16
	trapb
	addt/su $f18,$f3,$f17
	stt $f25,104($30)
	trapb
	ldt $f25,112($30)
	addt/su $f25,$f3,$f18
	trapb
	ldt $f25,80($30)
	addt/su $f19,$f25,$f8
	trapb
	ldt $f25,88($30)
	mult/su $f25,$f10,$f19
	trapb
	mult/su $f20,$f10,$f25
	trapb
	ldt $f20,96($30)
	mult/su $f20,$f24,$f10
	trapb
	ldt $f20,104($30)
	mult/su $f20,$f23,$f24
	trapb
	mult/su $f5,$f22,$f23
	trapb
	mult/su $f4,$f15,$f22
	trapb
	mult/su $f2,$f14,$f15
	trapb
	ldt $f2,0($5)
	mult/su $f18,$f11,$f20
	ldah $5,$LC3($29)		!gprelhigh
	mult/su $f16,$f13,$f14
	trapb
	lda $5,$LC3($5)		!gprellow
	mult/su $f8,$f2,$f11
	mult/su $f17,$f12,$f13
	ldt $f4,0($5)
	addt/su $f24,$f7,$f16
	trapb
	ldah $5,$LC4($29)		!gprelhigh
	addt/su $f20,$f7,$f24
	trapb
	lda $5,$LC4($5)		!gprellow
	subt/su $f7,$f11,$f20
	addt/su $f19,$f7,$f18
	addt/su $f10,$f7,$f17
	trapb
	addt/su $f25,$f7,$f19
	addt/su $f22,$f7,$f12
	trapb
	addt/su $f23,$f7,$f25
	addt/su $f14,$f7,$f10
	trapb
	addt/su $f15,$f7,$f23
	addt/su $f13,$f7,$f22
	trapb
	subt/su $f21,$f11,$f15
	trapb
	subt/su $f1,$f11,$f21
	trapb
	subt/su $f0,$f11,$f1
	mult/su $f20,$f4,$f2
	trapb
	ldt $f4,0($5)
	subt/su $f30,$f11,$f0
	subt/su $f25,$f11,$f14
	trapb
	subt/su $f18,$f11,$f30
	subt/su $f12,$f11,$f13
	trapb
	subt/su $f19,$f11,$f18
	subt/su $f23,$f11,$f12
	stt $f2,-160($16)
	trapb
	subt/su $f29,$f11,$f19
	subt/su $f10,$f11,$f23
	trapb
	subt/su $f28,$f11,$f29
	subt/su $f22,$f11,$f10
	trapb
	subt/su $f27,$f11,$f28
	subt/su $f24,$f11,$f22
	trapb
	subt/su $f26,$f11,$f27
	trapb
	subt/su $f17,$f11,$f26
	trapb
	subt/su $f16,$f11,$f17
	trapb
	mult/su $f1,$f4,$f11
	mult/su $f0,$f4,$f25
	mult/su $f30,$f4,$f24
	mult/su $f15,$f4,$f16
	mult/su $f21,$f4,$f20
	trapb
	mult/su $f18,$f4,$f15
	stt $f11,-136($16)
	mult/su $f19,$f9,$f0
	trapb
	mult/su $f27,$f9,$f11
	stt $f25,-128($16)
	stt $f24,-120($16)
	mult/su $f29,$f9,$f30
	stt $f16,-152($16)
	trapb
	mult/su $f28,$f9,$f29
	stt $f20,-144($16)
	mult/su $f26,$f9,$f25
	stt $f15,-112($16)
	mult/su $f17,$f9,$f24
	stt $f0,-104($16)
	trapb
	mult/su $f14,$f9,$f15
	stt $f11,-80($16)
	trapb
	mult/su $f13,$f9,$f14
	mult/su $f10,$f9,$f11
	stt $f30,-96($16)
	trapb
	mult/su $f12,$f9,$f13
	stt $f29,-88($16)
	trapb
	mult/su $f23,$f9,$f12
	stt $f25,-72($16)
	mult/su $f22,$f9,$f10
	stt $f24,-64($16)
	stt $f15,-56($16)
	stt $f14,-48($16)
	stt $f11,-24($16)
	stt $f13,-40($16)
	stt $f12,-32($16)
	stt $f10,-16($16)
	trapb
	beq $3,$L73
	ldq $26,0($30)
	ldt $f2,8($30)
	ldt $f3,16($30)
	ldt $f4,24($30)
	ldt $f5,32($30)
	ldt $f6,40($30)
	ldt $f7,48($30)
	ldt $f8,56($30)
	ldt $f9,64($30)
	lda $30,192($30)
	.cfi_restore 41
	.cfi_restore 40
	.cfi_restore 39
	.cfi_restore 38
	.cfi_restore 37
	.cfi_restore 36
	.cfi_restore 35
	.cfi_restore 34
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
	.cfi_endproc
$LFE48:
	.end LBM_handleInOutFlow
	.section	.rodata.str1.1
$LC45:
	.string	"LBM_showGridStatistics:\n\tnObstacleCells: %7i nAccelCells: %7i nFluidCells: %7i\n\tminRho: %8.6f maxRho: %8.6f Mass: %e\n\tminU  : %8.6f maxU  : %8.6f\n\n"
	.text
	.align 2
	.align 4
	.globl LBM_showGridStatistics
	.ent LBM_showGridStatistics
LBM_showGridStatistics:
	.eflag 48
	.frame $30,96,$26,0
	.mask 0x4000e00,-64
	.fmask 0x3c,-32
$LFB49:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!25
	lda $29,0($29)		!gpdisp!25
$LBM_showGridStatistics..ng:
	lda $30,-96($30)
	.cfi_def_cfa_offset 96
	ldah $1,$LC43($29)		!gprelhigh
	stt $f2,64($30)
	.cfi_offset 34, -32
	ldt $f2,$LC43($1)		!gprellow
	ldah $1,$LC44($29)		!gprelhigh
	stq $9,40($30)
	stt $f3,72($30)
	ldah $3,3174($16)
	.cfi_offset 9, -56
	.cfi_offset 35, -24
	ldt $f3,$LC44($1)		!gprellow
	stq $10,48($30)
	lda $3,-11264($3)
	stq $11,56($30)
	.cfi_offset 10, -48
	.cfi_offset 11, -40
	mov $31,$10
	stt $f4,80($30)
	cpys $f3,$f3,$f16
	stt $f5,88($30)
	.cfi_offset 36, -16
	.cfi_offset 37, -8
	cpys $f31,$f31,$f4
	cpys $f2,$f2,$f5
	mov $31,$11
	mov $31,$9
	stq $26,32($30)
	.cfi_offset 26, -64
	.prologue 1
	br $31,$L88
	.align 4
$L95:
	lda $16,160($16)
	cmpeq $3,$16,$1
	addl $9,1,$9
	bne $1,$L94
$L88:
	ldt $f10,0($16)
	ldt $f1,8($16)
	ldt $f0,16($16)
	ldt $f20,24($16)
	addt/su $f1,$f10,$f11
	ldt $f21,32($16)
	ldt $f30,40($16)
	ldt $f29,48($16)
	ldt $f28,56($16)
	trapb
	addt/su $f11,$f0,$f10
	ldt $f27,64($16)
	ldt $f26,72($16)
	ldt $f25,80($16)
	ldt $f24,88($16)
	trapb
	addt/su $f10,$f20,$f11
	ldt $f22,96($16)
	ldt $f14,104($16)
	ldt $f12,112($16)
	ldt $f23,120($16)
	trapb
	addt/su $f11,$f21,$f10
	ldt $f15,128($16)
	ldt $f13,136($16)
	trapb
	ldt $f11,144($16)
	ldl $1,152($16)
	addt/su $f10,$f30,$f19
	and $1,2,$2
	trapb
	addt/su $f19,$f29,$f10
	trapb
	addt/su $f10,$f28,$f19
	trapb
	addt/su $f19,$f27,$f10
	trapb
	addt/su $f10,$f26,$f19
	trapb
	addt/su $f19,$f25,$f10
	trapb
	addt/su $f10,$f24,$f19
	trapb
	addt/su $f19,$f22,$f10
	trapb
	addt/su $f10,$f14,$f19
	trapb
	addt/su $f19,$f12,$f10
	trapb
	addt/su $f10,$f23,$f19
	trapb
	addt/su $f19,$f15,$f10
	trapb
	addt/su $f10,$f13,$f19
	trapb
	addt/su $f19,$f11,$f10
	cmptlt/su $f10,$f3,$f18
	trapb
	cmptlt/su $f2,$f10,$f19
	addt/su $f4,$f10,$f17
	trapb
	fcmovne $f18,$f10,$f3
	fcmovne $f19,$f10,$f2
	cpys $f17,$f17,$f4
	blbs $1,$L95
	beq $2,$L83
	addl $10,1,$10
$L84:
	subt/su $f20,$f21,$f19
	trapb
	lda $16,160($16)
	subt/su $f1,$f0,$f21
	cmpeq $3,$16,$1
	trapb
	subt/su $f30,$f29,$f1
	trapb
	mult/su $f10,$f10,$f29
	addt/su $f19,$f28,$f0
	addt/su $f21,$f28,$f30
	trapb
	addt/su $f1,$f24,$f28
	subt/su $f0,$f27,$f10
	trapb
	addt/su $f30,$f27,$f0
	trapb
	subt/su $f28,$f22,$f30
	trapb
	addt/su $f10,$f26,$f28
	trapb
	subt/su $f0,$f26,$f10
	addt/su $f30,$f14,$f27
	trapb
	subt/su $f28,$f25,$f26
	trapb
	subt/su $f10,$f25,$f28
	trapb
	subt/su $f27,$f12,$f10
	trapb
	addt/su $f26,$f23,$f27
	trapb
	addt/su $f28,$f24,$f26
	addt/su $f10,$f23,$f25
	trapb
	addt/su $f27,$f15,$f10
	addt/su $f26,$f22,$f24
	subt/su $f25,$f15,$f23
	trapb
	subt/su $f10,$f13,$f22
	trapb
	subt/su $f24,$f14,$f10
	addt/su $f23,$f13,$f15
	trapb
	subt/su $f22,$f11,$f14
	subt/su $f10,$f12,$f13
	trapb
	subt/su $f15,$f11,$f10
	trapb
	mult/su $f14,$f14,$f15
	mult/su $f13,$f13,$f11
	mult/su $f10,$f10,$f12
	trapb
	addt/su $f15,$f11,$f10
	trapb
	addt/su $f10,$f12,$f11
	trapb
	divt/su $f11,$f29,$f10
	cmptlt/su $f10,$f16,$f12
	trapb
	cmptlt/su $f5,$f10,$f11
	trapb
	fcmovne $f12,$f10,$f16
	fcmovne $f11,$f10,$f5
	beq $1,$L88
$L94:
	ldq $27,sqrt($29)		!literal!26
	jsr $26,($27),sqrt		!lituse_jsr!26
	ldah $29,0($26)		!gpdisp!27
	cpys $f5,$f5,$f16
	lda $29,0($29)		!gpdisp!27
	cpys $f0,$f0,$f5
	ldq $27,sqrt($29)		!literal!28
	jsr $26,($27),sqrt		!lituse_jsr!28
	ldah $29,0($26)		!gpdisp!29
	stt $f4,8($30)
	cpys $f3,$f3,$f21
	mov $11,$20
	lda $29,0($29)		!gpdisp!29
	ldah $17,$LC45($29)		!gprelhigh
	mov $10,$19
	ldq $27,__printf_chk($29)		!literal!30
	mov $9,$18
	stt $f5,16($30)
	stt $f2,0($30)
	lda $17,$LC45($17)		!gprellow
	lda $16,1($31)
	stt $f0,24($30)
	jsr $26,($27),__printf_chk		!lituse_jsr!30
	ldah $29,0($26)		!gpdisp!31
	ldq $9,40($30)
	ldq $26,32($30)
	ldq $10,48($30)
	ldq $11,56($30)
	ldt $f2,64($30)
	ldt $f3,72($30)
	ldt $f4,80($30)
	lda $29,0($29)		!gpdisp!31
	ldt $f5,88($30)
	lda $30,96($30)
	.cfi_remember_state
	.cfi_restore 37
	.cfi_restore 36
	.cfi_restore 35
	.cfi_restore 34
	.cfi_restore 11
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret $31,($26),1
	.align 4
$L83:
	.cfi_restore_state
	addl $11,1,$11
	br $31,$L84
	.cfi_endproc
$LFE49:
	.end LBM_showGridStatistics
	.section	.rodata.str1.1
$LC46:
	.string	"wb"
$LC47:
	.string	"w"
$LC48:
	.string	"%e %e %e\n"
	.text
	.align 2
	.align 4
	.globl LBM_storeVelocityField
	.ent LBM_storeVelocityField
LBM_storeVelocityField:
	.eflag 48
	.frame $30,96,$26,0
	.mask 0x400fe00,-96
$LFB52:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!32
	lda $29,0($29)		!gpdisp!32
$LBM_storeVelocityField..ng:
	lda $30,-96($30)
	.cfi_def_cfa_offset 96
	ldah $1,$LC47($29)		!gprelhigh
	ldq $27,fopen($29)		!literal!43
	lda $1,$LC47($1)		!gprellow
	stq $9,8($30)
	ldah $2,$LC46($29)		!gprelhigh
	stq $11,24($30)
	.cfi_offset 9, -88
	.cfi_offset 11, -72
	mov $16,$9
	stq $12,32($30)
	mov $17,$16
	stq $14,48($30)
	mov $1,$17
	stq $15,56($30)
	lda $2,$LC46($2)		!gprellow
	stq $26,0($30)
	cmovne $18,$2,$17
	stq $10,16($30)
	stq $13,40($30)
	.cfi_offset 12, -64
	.cfi_offset 14, -48
	.cfi_offset 15, -40
	.cfi_offset 26, -96
	.cfi_offset 10, -80
	.cfi_offset 13, -56
	.prologue 1
	mov $18,$11
	jsr $26,($27),fopen		!lituse_jsr!43
	ldah $29,0($26)		!gpdisp!44
	ldah $14,24($31)
	ldah $1,3174($9)
	lda $29,0($29)		!gpdisp!44
	ldah $12,$LC48($29)		!gprelhigh
	mov $0,$15
	lda $9,16000($9)
	lda $12,$LC48($12)		!gprellow
	lda $14,27136($14)
	lda $1,4736($1)
	stq $1,80($30)
$L98:
	mov $9,$10
	addq $9,$14,$13
$L104:
	lda $9,-16000($10)
	br $31,$L101
	.align 4
$L108:
	lda $9,160($9)
	ldq $27,fwrite($29)		!literal!37
	jsr $26,($27),fwrite		!lituse_jsr!37
	ldah $29,0($26)		!gpdisp!38
	mov $15,$19
	lda $29,0($29)		!gpdisp!38
	lda $16,68($30)
	lda $18,1($31)
	ldq $27,fwrite($29)		!literal!39
	lda $17,4($31)
	jsr $26,($27),fwrite		!lituse_jsr!39
	ldah $29,0($26)		!gpdisp!40
	mov $15,$19
	lda $29,0($29)		!gpdisp!40
	lda $18,1($31)
	lda $17,4($31)
	ldq $27,fwrite($29)		!literal!41
	lda $16,64($30)
	jsr $26,($27),fwrite		!lituse_jsr!41
	ldah $29,0($26)		!gpdisp!42
	cmpeq $10,$9,$2
	lda $29,0($29)		!gpdisp!42
	bne $2,$L107
$L101:
	ldt $f13,8($9)
	ldt $f10,0($9)
	ldt $f12,16($9)
	ldt $f11,24($9)
	addt/su $f13,$f10,$f14
	trapb
	ldt $f10,32($9)
	subt/su $f13,$f12,$f23
	ldt $f27,56($9)
	ldt $f29,40($9)
	subt/su $f11,$f10,$f22
	ldt $f28,48($9)
	addt/su $f14,$f12,$f15
	ldt $f26,64($9)
	addt/su $f23,$f27,$f30
	ldt $f25,72($9)
	trapb
	subt/su $f29,$f28,$f14
	ldt $f23,88($9)
	addt/su $f22,$f27,$f13
	ldt $f24,80($9)
	addt/su $f15,$f11,$f12
	trapb
	ldt $f22,96($9)
	addt/su $f30,$f26,$f0
	ldt $f15,104($9)
	addt/su $f14,$f23,$f1
	ldt $f11,136($9)
	subt/su $f13,$f26,$f20
	trapb
	ldt $f14,112($9)
	addt/su $f12,$f10,$f21
	ldt $f13,120($9)
	trapb
	ldt $f12,128($9)
	subt/su $f1,$f22,$f30
	ldt $f10,144($9)
	trapb
	addt/su $f20,$f25,$f1
	lda $16,72($30)
	trapb
	addt/su $f21,$f29,$f20
	mov $15,$19
	trapb
	subt/su $f0,$f25,$f21
	lda $18,1($31)
	trapb
	addt/su $f30,$f15,$f0
	lda $17,4($31)
	trapb
	subt/su $f1,$f24,$f30
	trapb
	addt/su $f20,$f28,$f1
	subt/su $f21,$f24,$f29
	trapb
	subt/su $f0,$f14,$f28
	trapb
	addt/su $f30,$f13,$f0
	trapb
	addt/su $f1,$f27,$f30
	trapb
	addt/su $f29,$f23,$f27
	trapb
	addt/su $f28,$f13,$f29
	trapb
	addt/su $f0,$f12,$f28
	trapb
	addt/su $f30,$f26,$f0
	trapb
	addt/su $f27,$f22,$f30
	trapb
	subt/su $f29,$f12,$f27
	trapb
	subt/su $f28,$f11,$f29
	trapb
	addt/su $f0,$f25,$f28
	subt/su $f30,$f15,$f26
	trapb
	addt/su $f27,$f11,$f25
	trapb
	subt/su $f29,$f10,$f27
	trapb
	addt/su $f28,$f24,$f29
	trapb
	subt/su $f26,$f14,$f28
	trapb
	subt/su $f25,$f10,$f26
	trapb
	cvtts/su $f27,$f25
	trapb
	addt/su $f29,$f23,$f27
	cvtts/su $f28,$f24
	trapb
	cvtts/su $f26,$f23
	trapb
	addt/su $f27,$f22,$f26
	trapb
	addt/su $f26,$f15,$f22
	trapb
	addt/su $f22,$f14,$f15
	trapb
	addt/su $f15,$f13,$f14
	trapb
	addt/su $f14,$f12,$f13
	trapb
	addt/su $f13,$f11,$f12
	trapb
	addt/su $f12,$f10,$f11
	trapb
	cvtts/su $f11,$f10
	divs/su $f25,$f10,$f19
	divs/su $f24,$f10,$f20
	sts $f19,72($30)
	divs/su $f23,$f10,$f21
	sts $f20,68($30)
	sts $f21,64($30)
	trapb
	bne $11,$L108
	cvtsts $f21,$f10
	ldq $27,__fprintf_chk($29)		!literal!35
	mov $12,$18
	lda $17,1($31)
	mov $15,$16
	trapb
	cpys $f10,$f10,$f21
	lda $9,160($9)
	cvtsts $f20,$f10
	trapb
	cpys $f10,$f10,$f20
	cvtsts $f19,$f10
	trapb
	cpys $f10,$f10,$f19
	jsr $26,($27),__fprintf_chk		!lituse_jsr!35
	ldah $29,0($26)		!gpdisp!36
	cmpeq $10,$9,$2
	lda $29,0($29)		!gpdisp!36
	beq $2,$L101
$L107:
	lda $10,16000($10)
	cmpeq $13,$10,$2
	beq $2,$L104
	ldq $1,80($30)
	cmpeq $13,$1,$2
	bne $2,$L103
	mov $13,$9
	br $31,$L98
$L103:
	mov $15,$16
	ldq $27,fclose($29)		!literal!33
	jsr $26,($27),fclose		!lituse_jsr!33
	ldah $29,0($26)		!gpdisp!34
	ldq $9,8($30)
	ldq $26,0($30)
	ldq $10,16($30)
	ldq $11,24($30)
	ldq $12,32($30)
	ldq $13,40($30)
	ldq $14,48($30)
	lda $29,0($29)		!gpdisp!34
	ldq $15,56($30)
	lda $30,96($30)
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
	.cfi_endproc
$LFE52:
	.end LBM_storeVelocityField
	.section	.rodata.str1.1
$LC49:
	.string	"r"
$LC51:
	.string	"%f %f %f\n"
$LC52:
	.string	"LBM_compareVelocityField: maxDiff = %e  \n\n"
	.text
	.align 2
	.align 4
	.globl LBM_compareVelocityField
	.ent LBM_compareVelocityField
LBM_compareVelocityField:
	.eflag 48
	.frame $30,112,$26,0
	.mask 0x400fe00,-112
	.fmask 0x3c,-48
$LFB53:
	.cfi_startproc
	ldah $29,0($27)		!gpdisp!45
	lda $29,0($29)		!gpdisp!45
$LBM_compareVelocityField..ng:
	ldah $1,$LC49($29)		!gprelhigh
	lda $1,$LC49($1)		!gprellow
	ldq $27,fopen($29)		!literal!60
	ldah $2,$LC6($29)		!gprelhigh
	lda $30,-112($30)
	.cfi_def_cfa_offset 112
	mov $17,$3
	lda $2,$LC6($2)		!gprellow
	stq $9,8($30)
	mov $1,$17
	stq $10,16($30)
	cmovne $18,$2,$17
	stq $11,24($30)
	.cfi_offset 9, -104
	.cfi_offset 10, -96
	.cfi_offset 11, -88
	mov $16,$10
	stq $12,32($30)
	stq $15,56($30)
	mov $3,$16
	stt $f2,64($30)
	stq $26,0($30)
	mov $18,$11
	stq $13,40($30)
	.cfi_offset 12, -80
	.cfi_offset 15, -56
	.cfi_offset 34, -48
	.cfi_offset 26, -112
	.cfi_offset 13, -72
	ldah $15,3174($10)
	stq $14,48($30)
	lda $10,16000($10)
	stt $f3,72($30)
	stt $f4,80($30)
	stt $f5,88($30)
	.cfi_offset 14, -64
	.cfi_offset 35, -40
	.cfi_offset 36, -32
	.cfi_offset 37, -24
	.prologue 1
	jsr $26,($27),fopen		!lituse_jsr!60
	ldah $29,0($26)		!gpdisp!61
	lda $15,4736($15)
	lda $29,0($29)		!gpdisp!61
	ldah $1,$LC50($29)		!gprelhigh
	ldah $12,$LC51($29)		!gprelhigh
	mov $0,$9
	lds $f10,$LC50($1)		!gprellow
	lda $12,$LC51($12)		!gprellow
	cvtsts $f10,$f2
	trapb
$L111:
	ldah $1,24($31)
	lda $1,27136($1)
	addq $10,$1,$13
$L119:
	lda $14,-16000($10)
	br $31,$L116
	.align 4
$L124:
	lda $16,104($30)
	ldq $27,fread($29)		!literal!54
	mov $9,$19
	lda $18,1($31)
	lda $17,4($31)
	jsr $26,($27),fread		!lituse_jsr!54
	ldah $29,0($26)		!gpdisp!55
	mov $9,$19
	lda $29,0($29)		!gpdisp!55
	lda $16,100($30)
	lda $18,1($31)
	ldq $27,fread($29)		!literal!56
	lda $17,4($31)
	jsr $26,($27),fread		!lituse_jsr!56
	ldah $29,0($26)		!gpdisp!57
	mov $9,$19
	lda $29,0($29)		!gpdisp!57
	lda $18,1($31)
	lda $17,4($31)
	ldq $27,fread($29)		!literal!58
	lda $16,96($30)
	jsr $26,($27),fread		!lituse_jsr!58
	ldah $29,0($26)		!gpdisp!59
	lda $29,0($29)		!gpdisp!59
$L113:
	lda $14,160($14)
	lds $f11,104($30)
	cmpeq $10,$14,$2
	cvtsts $f11,$f10
	trapb
	lds $f11,100($30)
	cvtsts $f11,$f13
	trapb
	lds $f11,96($30)
	cvtsts $f11,$f12
	trapb
	subt/su $f5,$f10,$f11
	trapb
	subt/su $f4,$f13,$f10
	trapb
	subt/su $f3,$f12,$f13
	trapb
	cvtts/su $f11,$f12
	trapb
	cvtts/su $f10,$f11
	trapb
	cvtts/su $f13,$f10
	muls/su $f12,$f12,$f14
	trapb
	muls/su $f11,$f11,$f13
	muls/su $f10,$f10,$f12
	trapb
	adds/su $f14,$f13,$f10
	adds/su $f10,$f12,$f11
	trapb
	cvtsts $f11,$f10
	trapb
	cmptlt/su $f2,$f10,$f11
	trapb
	fcmovne $f11,$f10,$f2
	bne $2,$L123
$L116:
	ldt $f13,8($14)
	ldt $f10,0($14)
	ldt $f12,16($14)
	ldt $f11,24($14)
	addt/su $f13,$f10,$f14
	trapb
	ldt $f10,32($14)
	subt/su $f13,$f12,$f23
	ldt $f27,56($14)
	ldt $f29,40($14)
	subt/su $f11,$f10,$f22
	ldt $f28,48($14)
	addt/su $f14,$f12,$f15
	ldt $f26,64($14)
	addt/su $f23,$f27,$f0
	ldt $f25,72($14)
	trapb
	subt/su $f29,$f28,$f14
	ldt $f23,88($14)
	addt/su $f22,$f27,$f13
	ldt $f24,80($14)
	addt/su $f15,$f11,$f12
	trapb
	ldt $f22,96($14)
	addt/su $f0,$f26,$f20
	ldt $f15,104($14)
	addt/su $f14,$f23,$f11
	subt/su $f13,$f26,$f21
	trapb
	ldt $f14,112($14)
	addt/su $f12,$f10,$f30
	ldt $f13,120($14)
	trapb
	ldt $f12,128($14)
	subt/su $f11,$f22,$f1
	ldt $f10,136($14)
	addt/su $f21,$f25,$f0
	trapb
	ldt $f11,144($14)
	addt/su $f30,$f29,$f21
	trapb
	subt/su $f20,$f25,$f30
	addt/su $f1,$f15,$f29
	trapb
	subt/su $f0,$f24,$f1
	trapb
	addt/su $f21,$f28,$f0
	trapb
	subt/su $f30,$f24,$f28
	trapb
	subt/su $f29,$f14,$f30
	trapb
	addt/su $f1,$f13,$f29
	trapb
	addt/su $f0,$f27,$f1
	trapb
	addt/su $f28,$f23,$f0
	trapb
	addt/su $f30,$f13,$f28
	trapb
	addt/su $f29,$f12,$f30
	trapb
	addt/su $f1,$f26,$f29
	addt/su $f0,$f22,$f27
	trapb
	subt/su $f28,$f12,$f26
	trapb
	subt/su $f30,$f10,$f28
	trapb
	addt/su $f29,$f25,$f30
	trapb
	subt/su $f27,$f15,$f29
	trapb
	addt/su $f26,$f10,$f27
	trapb
	subt/su $f28,$f11,$f26
	trapb
	addt/su $f30,$f24,$f28
	subt/su $f29,$f14,$f25
	trapb
	subt/su $f27,$f11,$f24
	trapb
	addt/su $f28,$f23,$f27
	trapb
	addt/su $f27,$f22,$f23
	trapb
	addt/su $f23,$f15,$f22
	trapb
	addt/su $f22,$f14,$f15
	trapb
	addt/su $f15,$f13,$f14
	trapb
	addt/su $f14,$f12,$f13
	trapb
	addt/su $f13,$f10,$f12
	trapb
	addt/su $f12,$f11,$f10
	divt/su $f26,$f10,$f5
	divt/su $f25,$f10,$f4
	divt/su $f24,$f10,$f3
	trapb
	bne $11,$L124
	lda $20,96($30)
	ldq $27,__isoc99_fscanf($29)		!literal!52
	lda $19,100($30)
	lda $18,104($30)
	mov $12,$17
	mov $9,$16
	jsr $26,($27),__isoc99_fscanf		!lituse_jsr!52
	ldah $29,0($26)		!gpdisp!53
	lda $29,0($29)		!gpdisp!53
	br $31,$L113
$L123:
	lda $10,16000($10)
	cmpeq $13,$10,$1
	beq $1,$L119
	cmpeq $13,$15,$1
	bne $1,$L118
	mov $13,$10
	br $31,$L111
$L118:
	cpys $f2,$f2,$f16
	ldq $27,sqrt($29)		!literal!46
	jsr $26,($27),sqrt		!lituse_jsr!46
	ldah $29,0($26)		!gpdisp!47
	lda $16,1($31)
	cpys $f0,$f0,$f18
	lda $29,0($29)		!gpdisp!47
	ldah $17,$LC52($29)		!gprelhigh
	lda $17,$LC52($17)		!gprellow
	ldq $27,__printf_chk($29)		!literal!48
	jsr $26,($27),__printf_chk		!lituse_jsr!48
	ldah $29,0($26)		!gpdisp!49
	mov $9,$16
	lda $29,0($29)		!gpdisp!49
	ldq $27,fclose($29)		!literal!50
	jsr $26,($27),fclose		!lituse_jsr!50
	ldah $29,0($26)		!gpdisp!51
	ldq $9,8($30)
	ldq $26,0($30)
	ldq $10,16($30)
	ldq $11,24($30)
	ldq $12,32($30)
	ldq $13,40($30)
	ldq $14,48($30)
	ldq $15,56($30)
	ldt $f2,64($30)
	ldt $f3,72($30)
	ldt $f4,80($30)
	lda $29,0($29)		!gpdisp!51
	ldt $f5,88($30)
	lda $30,112($30)
	.cfi_restore 37
	.cfi_restore 36
	.cfi_restore 35
	.cfi_restore 34
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
	.cfi_endproc
$LFE53:
	.end LBM_compareVelocityField
	.section	.rodata.cst4,"aM",@progbits,4
	.align 2
$LC1:
	.long	1129084864
	.section	.rodata.cst8,"aM",@progbits,8
	.align 3
$LC3:
	.long	1431655765
	.long	1070945621
	.align 3
$LC4:
	.long	477218588
	.long	1068265927
	.align 3
$LC5:
	.long	477218588
	.long	1067217351
	.align 3
$LC7:
	.long	1818867110
	.long	1072661935
	.align 3
$LC8:
	.long	-35459250
	.long	1072709048
	.align 3
$LC9:
	.long	-1672357186
	.long	1072680611
	.align 3
$LC10:
	.long	-1214135715
	.long	1072699512
	.align 3
$LC11:
	.long	16767553
	.long	1072649579
	.align 3
$LC12:
	.long	164376988
	.long	1072702682
	.align 3
$LC13:
	.long	1462625343
	.long	1072674367
	.align 3
$LC14:
	.long	-1314466151
	.long	1072715453
	.align 3
$LC15:
	.long	-971143645
	.long	1072693156
	.align 3
$LC16:
	.long	0
	.long	1073217536
	.section	.rodata.cst4
	.align 2
$LC17:
	.long	1069547520
	.align 2
$LC19:
	.long	1065353216
	.align 2
$LC21:
	.long	1083179008
	.align 2
$LC23:
	.long	1077936128
	.section	.rodata.cst8
	.align 3
$LC24:
	.long	-858993460
	.long	1071959244
	.align 3
$LC25:
	.long	1717986918
	.long	-1074895258
	.align 3
$LC26:
	.long	-1145324613
	.long	1069267899
	.align 3
$LC27:
	.long	-1145324613
	.long	1068219323
	.align 3
$LC28:
	.long	1510728976
	.long	1072693320
	.align 3
$LC29:
	.long	1202590843
	.long	1064598241
	.align 3
$LC30:
	.long	-2050314307
	.long	1072693194
	.align 3
$LC31:
	.long	-755914244
	.long	1063281229
	.align 3
$LC32:
	.long	-1251793987
	.long	1072693241
	.align 3
$LC33:
	.long	-1133871366
	.long	-1083665548
	.align 3
$LC34:
	.long	-1726783012
	.long	1072693433
	.align 3
$LC35:
	.long	824633721
	.long	1065135112
	.section	.rodata.cst4
	.align 2
$LC37:
	.long	1056964608
	.section	.rodata.cst8
	.align 3
$LC38:
	.long	858993459
	.long	1073689395
	.align 3
$LC39:
	.long	1810275495
	.long	1068559605
	.section	.rodata.cst4
	.align 2
$LC41:
	.long	1111883776
	.section	.rodata.cst8
	.align 3
$LC42:
	.long	1202590843
	.long	1065646817
	.align 3
$LC43:
	.long	966823146
	.long	-970375591
	.align 3
$LC44:
	.long	966823146
	.long	1177108057
	.section	.rodata.cst4
	.align 2
$LC50:
	.long	-246811958
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
