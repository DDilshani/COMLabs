	.file	"lcd.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.type	toggle_e, @function
toggle_e:
.LFB7:
	.file 1 "lcd.c"
	.loc 1 102 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 103 0
	sbi 0x8,2
.LVL0:
.LBB28:
.LBB29:
	.file 2 "/usr/lib/avr/include/util/delay.h"
	.loc 2 246 0
	ldi r24,lo8(5)
	1: dec r24
	brne 1b
	nop
.LBE29:
.LBE28:
	.loc 1 105 0
	cbi 0x8,2
	ret
	.cfi_endproc
.LFE7:
	.size	toggle_e, .-toggle_e
	.type	lcd_write, @function
lcd_write:
.LFB8:
	.loc 1 119 0
	.cfi_startproc
.LVL1:
	push r28
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
	push __zero_reg__
.LCFI2:
	.cfi_def_cfa_offset 5
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI3:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 1 */
/* stack size = 3 */
.L__stack_usage = 3
	.loc 1 123 0
	tst r22
	breq .L3
	.loc 1 124 0
	sbi 0x8,0
	rjmp .L4
.L3:
	.loc 1 126 0
	cbi 0x8,0
.L4:
	.loc 1 128 0
	cbi 0x8,1
	.loc 1 151 0
	sbi 0xa,2
	.loc 1 152 0
	sbi 0xa,3
	.loc 1 153 0
	sbi 0xa,4
	.loc 1 154 0
	sbi 0xa,5
	.loc 1 157 0
	cbi 0xb,5
	.loc 1 158 0
	cbi 0xb,4
	.loc 1 159 0
	cbi 0xb,3
	.loc 1 160 0
	cbi 0xb,2
	.loc 1 161 0
	sbrc r24,7
	.loc 1 161 0 is_stmt 0 discriminator 1
	sbi 0xb,5
.L5:
	.loc 1 162 0 is_stmt 1
	sbrc r24,6
	.loc 1 162 0 is_stmt 0 discriminator 1
	sbi 0xb,4
.L6:
	.loc 1 163 0 is_stmt 1
	sbrc r24,5
	.loc 1 163 0 is_stmt 0 discriminator 1
	sbi 0xb,3
.L7:
	.loc 1 164 0 is_stmt 1
	sbrc r24,4
	.loc 1 164 0 is_stmt 0 discriminator 1
	sbi 0xb,2
.L8:
	.loc 1 165 0 is_stmt 1
	std Y+1,r24
	call toggle_e
.LVL2:
	.loc 1 168 0
	cbi 0xb,5
	.loc 1 169 0
	cbi 0xb,4
	.loc 1 170 0
	cbi 0xb,3
	.loc 1 171 0
	cbi 0xb,2
	.loc 1 172 0
	ldd r24,Y+1
	sbrc r24,3
	.loc 1 172 0 is_stmt 0 discriminator 1
	sbi 0xb,5
.L9:
	.loc 1 173 0 is_stmt 1
	sbrc r24,2
	.loc 1 173 0 is_stmt 0 discriminator 1
	sbi 0xb,4
.L10:
	.loc 1 174 0 is_stmt 1
	sbrc r24,1
	.loc 1 174 0 is_stmt 0 discriminator 1
	sbi 0xb,3
.L11:
	.loc 1 175 0 is_stmt 1
	sbrc r24,0
	.loc 1 175 0 is_stmt 0 discriminator 1
	sbi 0xb,2
.L12:
	.loc 1 176 0 is_stmt 1
	call toggle_e
.LVL3:
	.loc 1 179 0
	sbi 0xb,2
	.loc 1 180 0
	sbi 0xb,3
	.loc 1 181 0
	sbi 0xb,4
	.loc 1 182 0
	sbi 0xb,5
/* epilogue start */
	.loc 1 184 0
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE8:
	.size	lcd_write, .-lcd_write
	.type	lcd_read.constprop.0, @function
lcd_read.constprop.0:
.LFB22:
	.loc 1 199 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL4:
	.loc 1 207 0
	cbi 0x8,0
	.loc 1 208 0
	sbi 0x8,1
	.loc 1 230 0
	cbi 0xa,2
	.loc 1 231 0
	cbi 0xa,3
	.loc 1 232 0
	cbi 0xa,4
	.loc 1 233 0
	cbi 0xa,5
	.loc 1 236 0
	sbi 0x8,2
.LVL5:
.LBB30:
.LBB31:
	.loc 2 246 0
	ldi r24,lo8(5)
	1: dec r24
	brne 1b
	nop
.LVL6:
.LBE31:
.LBE30:
	.loc 1 239 0
	sbic 0x9,2
	rjmp .L44
	.loc 1 238 0
	ldi r24,0
	rjmp .L36
.L44:
	.loc 1 239 0
	ldi r24,lo8(16)
.L36:
.LVL7:
	.loc 1 240 0
	sbic 0x9,3
	ori r24,lo8(32)
.LVL8:
.L37:
	.loc 1 241 0
	sbic 0x9,4
	ori r24,lo8(64)
.LVL9:
.L38:
	.loc 1 242 0
	sbic 0x9,5
	ori r24,lo8(-128)
.LVL10:
.L39:
	.loc 1 243 0
	cbi 0x8,2
.LVL11:
.LBB32:
.LBB33:
	.loc 2 246 0
	ldi r25,lo8(5)
	1: dec r25
	brne 1b
	nop
.LBE33:
.LBE32:
	.loc 1 248 0
	sbi 0x8,2
.LVL12:
.LBB34:
.LBB35:
	.loc 2 246 0
	ldi r25,lo8(5)
	1: dec r25
	brne 1b
	nop
.LBE35:
.LBE34:
	.loc 1 250 0
	sbic 0x9,2
	ori r24,lo8(1)
.LVL13:
.L40:
	.loc 1 251 0
	sbic 0x9,3
	ori r24,lo8(2)
.LVL14:
.L41:
	.loc 1 252 0
	sbic 0x9,4
	ori r24,lo8(4)
.LVL15:
.L42:
	.loc 1 253 0
	sbic 0x9,5
	ori r24,lo8(8)
.LVL16:
.L43:
	.loc 1 254 0
	cbi 0x8,2
	.loc 1 257 0
	ret
	.cfi_endproc
.LFE22:
	.size	lcd_read.constprop.0, .-lcd_read.constprop.0
	.type	lcd_waitbusy, @function
lcd_waitbusy:
.LFB10:
	.loc 1 270 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L68:
	.loc 1 274 0 discriminator 1
	call lcd_read.constprop.0
.LVL17:
	sbrc r24,7
	rjmp .L68
.LVL18:
.LBB36:
.LBB37:
	.loc 2 246 0
	ldi r24,lo8(21)
	1: dec r24
	brne 1b
.LVL19:
	nop
.LBE37:
.LBE36:
	.loc 1 280 0
	jmp lcd_read.constprop.0
.LVL20:
	.cfi_endproc
.LFE10:
	.size	lcd_waitbusy, .-lcd_waitbusy
.global	lcd_command
	.type	lcd_command, @function
lcd_command:
.LFB12:
	.loc 1 339 0
	.cfi_startproc
.LVL21:
	push r28
.LCFI4:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.loc 1 340 0
	call lcd_waitbusy
.LVL22:
	.loc 1 341 0
	ldi r22,0
	mov r24,r28
/* epilogue start */
	.loc 1 342 0
	pop r28
.LVL23:
	.loc 1 341 0
	jmp lcd_write
.LVL24:
	.cfi_endproc
.LFE12:
	.size	lcd_command, .-lcd_command
.global	lcd_data
	.type	lcd_data, @function
lcd_data:
.LFB13:
	.loc 1 351 0
	.cfi_startproc
.LVL25:
	push r28
.LCFI5:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.loc 1 352 0
	call lcd_waitbusy
.LVL26:
	.loc 1 353 0
	ldi r22,lo8(1)
	mov r24,r28
/* epilogue start */
	.loc 1 354 0
	pop r28
.LVL27:
	.loc 1 353 0
	jmp lcd_write
.LVL28:
	.cfi_endproc
.LFE13:
	.size	lcd_data, .-lcd_data
.global	lcd_gotoxy
	.type	lcd_gotoxy, @function
lcd_gotoxy:
.LFB14:
	.loc 1 365 0
	.cfi_startproc
.LVL29:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 370 0
	cpse r22,__zero_reg__
	rjmp .L72
	.loc 1 371 0
	subi r24,lo8(-(-128))
.LVL30:
	rjmp .L73
.LVL31:
.L72:
	.loc 1 373 0
	subi r24,lo8(-(-64))
.LVL32:
.L73:
	jmp lcd_command
.LVL33:
	.cfi_endproc
.LFE14:
	.size	lcd_gotoxy, .-lcd_gotoxy
.global	lcd_getxy
	.type	lcd_getxy, @function
lcd_getxy:
.LFB15:
	.loc 1 392 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 393 0
	call lcd_waitbusy
.LVL34:
	.loc 1 394 0
	ldi r25,0
	ret
	.cfi_endproc
.LFE15:
	.size	lcd_getxy, .-lcd_getxy
.global	lcd_clrscr
	.type	lcd_clrscr, @function
lcd_clrscr:
.LFB16:
	.loc 1 401 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 402 0
	ldi r24,lo8(1)
	jmp lcd_command
.LVL35:
	.cfi_endproc
.LFE16:
	.size	lcd_clrscr, .-lcd_clrscr
.global	lcd_home
	.type	lcd_home, @function
lcd_home:
.LFB17:
	.loc 1 410 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 411 0
	ldi r24,lo8(2)
	jmp lcd_command
.LVL36:
	.cfi_endproc
.LFE17:
	.size	lcd_home, .-lcd_home
.global	lcd_putc
	.type	lcd_putc, @function
lcd_putc:
.LFB18:
	.loc 1 421 0
	.cfi_startproc
.LVL37:
	push r28
.LCFI6:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.loc 1 425 0
	call lcd_waitbusy
.LVL38:
	.loc 1 426 0
	cpi r28,lo8(10)
	brne .L78
.LVL39:
.LBB40:
.LBB41:
	.loc 1 298 0
	cpi r24,lo8(64)
	brsh .L80
	.loc 1 299 0
	ldi r24,lo8(64)
.LVL40:
	rjmp .L79
.LVL41:
.L80:
	.loc 1 301 0
	ldi r24,0
.LVL42:
.L79:
	.loc 1 324 0
	subi r24,lo8(-(-128))
.LVL43:
/* epilogue start */
.LBE41:
.LBE40:
	.loc 1 459 0
	pop r28
.LVL44:
.LBB43:
.LBB42:
	.loc 1 324 0
	jmp lcd_command
.LVL45:
.L78:
.LBE42:
.LBE43:
	.loc 1 456 0
	ldi r22,lo8(1)
	mov r24,r28
.LVL46:
/* epilogue start */
	.loc 1 459 0
	pop r28
.LVL47:
	.loc 1 456 0
	jmp lcd_write
.LVL48:
	.cfi_endproc
.LFE18:
	.size	lcd_putc, .-lcd_putc
.global	lcd_puts
	.type	lcd_puts, @function
lcd_puts:
.LFB19:
	.loc 1 469 0
	.cfi_startproc
.LVL49:
	push r28
.LCFI7:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI8:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
.LVL50:
.L82:
	.loc 1 472 0 discriminator 1
	ld r24,Y+
.LVL51:
	tst r24
	breq .L84
	.loc 1 473 0
	call lcd_putc
.LVL52:
	rjmp .L82
.LVL53:
.L84:
/* epilogue start */
	.loc 1 476 0
	pop r29
	pop r28
.LVL54:
	ret
	.cfi_endproc
.LFE19:
	.size	lcd_puts, .-lcd_puts
.global	lcd_puts_p
	.type	lcd_puts_p, @function
lcd_puts_p:
.LFB20:
	.loc 1 486 0
	.cfi_startproc
.LVL55:
	push r28
.LCFI9:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI10:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r30,r24
.LVL56:
.L86:
.LBB44:
	.loc 1 489 0 discriminator 1
/* #APP */
 ;  489 "lcd.c" 1
	lpm r24, Z
	
 ;  0 "" 2
.LVL57:
/* #NOAPP */
	movw r28,r30
	adiw r28,1
.LVL58:
.LBE44:
	tst r24
	breq .L88
	.loc 1 490 0
	call lcd_putc
.LVL59:
	movw r30,r28
	rjmp .L86
.LVL60:
.L88:
/* epilogue start */
	.loc 1 493 0
	pop r29
	pop r28
.LVL61:
	ret
	.cfi_endproc
.LFE20:
	.size	lcd_puts_p, .-lcd_puts_p
.global	lcd_init
	.type	lcd_init, @function
lcd_init:
.LFB21:
	.loc 1 505 0
	.cfi_startproc
.LVL62:
	push r28
.LCFI11:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.loc 1 531 0
	sbi 0x7,0
	.loc 1 532 0
	sbi 0x7,1
	.loc 1 533 0
	sbi 0x7,2
	.loc 1 534 0
	sbi 0xa,2
	.loc 1 535 0
	sbi 0xa,3
	.loc 1 536 0
	sbi 0xa,4
	.loc 1 537 0
	sbi 0xa,5
.LVL63:
.LBB45:
.LBB46:
	.loc 2 246 0
	ldi r24,lo8(-1537)
	ldi r25,hi8(-1537)
	1: sbiw r24,1
	brne 1b
.LVL64:
	rjmp .
	nop
.LBE46:
.LBE45:
	.loc 1 542 0
	sbi 0xb,3
	.loc 1 543 0
	sbi 0xb,2
	.loc 1 544 0
	call toggle_e
.LVL65:
.LBB47:
.LBB48:
	.loc 2 246 0
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
	1: sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE48:
.LBE47:
	.loc 1 548 0
	call toggle_e
.LVL66:
.LBB49:
.LBB50:
	.loc 2 246 0
	ldi r24,lo8(255)
	ldi r25,hi8(255)
	1: sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE50:
.LBE49:
	.loc 1 552 0
	call toggle_e
.LVL67:
.LBB51:
.LBB52:
	.loc 2 246 0
	ldi r24,lo8(255)
	ldi r25,hi8(255)
	1: sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE52:
.LBE51:
	.loc 1 556 0
	cbi 0xb,2
	.loc 1 557 0
	call toggle_e
.LVL68:
.LBB53:
.LBB54:
	.loc 2 246 0
	ldi r24,lo8(255)
	ldi r25,hi8(255)
	1: sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE54:
.LBE53:
	.loc 1 585 0
	ldi r24,lo8(40)
	call lcd_command
.LVL69:
	.loc 1 587 0
	ldi r24,lo8(8)
	call lcd_command
.LVL70:
	.loc 1 588 0
	call lcd_clrscr
.LVL71:
	.loc 1 589 0
	ldi r24,lo8(6)
	call lcd_command
.LVL72:
	.loc 1 590 0
	mov r24,r28
/* epilogue start */
	.loc 1 592 0
	pop r28
.LVL73:
	.loc 1 590 0
	jmp lcd_command
.LVL74:
	.cfi_endproc
.LFE21:
	.size	lcd_init, .-lcd_init
.Letext0:
	.file 3 "/usr/lib/avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x7a2
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF35
	.byte	0x1
	.long	.LASF36
	.long	.LASF37
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x3
	.byte	0x7a
	.long	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x3
	.byte	0x7c
	.long	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x3
	.byte	0x7e
	.long	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF24
	.byte	0x2
	.byte	0xe0
	.byte	0x1
	.byte	0x3
	.long	0xc2
	.uleb128 0x6
	.long	.LASF14
	.byte	0x2
	.byte	0xe0
	.long	0xc2
	.uleb128 0x7
	.long	.LASF10
	.byte	0x2
	.byte	0xe2
	.long	0x2c
	.uleb128 0x7
	.long	.LASF11
	.byte	0x2
	.byte	0xe3
	.long	0xc2
	.uleb128 0x7
	.long	.LASF12
	.byte	0x2
	.byte	0xe7
	.long	0x5e
	.uleb128 0x8
	.byte	0x1
	.long	.LASF38
	.byte	0x2
	.byte	0xe8
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF13
	.uleb128 0x9
	.long	.LASF39
	.byte	0x1
	.byte	0xc7
	.byte	0x1
	.long	0x2c
	.byte	0x1
	.long	0xf0
	.uleb128 0xa
	.string	"rs"
	.byte	0x1
	.byte	0xc7
	.long	0x2c
	.uleb128 0x7
	.long	.LASF15
	.byte	0x1
	.byte	0xc9
	.long	0x2c
	.byte	0
	.uleb128 0xb
	.long	.LASF16
	.byte	0x1
	.byte	0x65
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x143
	.uleb128 0xc
	.long	0x7e
	.long	.LBB28
	.long	.LBE28
	.byte	0x1
	.byte	0x68
	.uleb128 0xd
	.long	0x8b
	.byte	0x4
	.long	0x3f800000
	.uleb128 0xe
	.long	.LBB29
	.long	.LBE29
	.uleb128 0xf
	.long	0x96
	.uleb128 0x10
	.long	0xa1
	.byte	0x4
	.long	0x41800000
	.uleb128 0x11
	.long	0xac
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	.LASF17
	.byte	0x1
	.byte	0x76
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.long	.LLST0
	.byte	0x1
	.long	0x197
	.uleb128 0x13
	.long	.LASF15
	.byte	0x1
	.byte	0x76
	.long	0x2c
	.long	.LLST1
	.uleb128 0x14
	.string	"rs"
	.byte	0x1
	.byte	0x76
	.long	0x2c
	.long	.LLST2
	.uleb128 0x7
	.long	.LASF18
	.byte	0x1
	.byte	0x78
	.long	0x37
	.uleb128 0x15
	.long	.LVL2
	.long	0xf0
	.uleb128 0x15
	.long	.LVL3
	.long	0xf0
	.byte	0
	.uleb128 0x16
	.long	0xc9
	.long	.LFB22
	.long	.LFE22
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x270
	.uleb128 0x17
	.long	0xe4
	.long	.LLST3
	.uleb128 0x18
	.long	0xda
	.byte	0
	.uleb128 0x19
	.long	0x7e
	.long	.LBB30
	.long	.LBE30
	.byte	0x1
	.byte	0xed
	.long	0x1f9
	.uleb128 0xd
	.long	0x8b
	.byte	0x4
	.long	0x3f800000
	.uleb128 0xe
	.long	.LBB31
	.long	.LBE31
	.uleb128 0xf
	.long	0x96
	.uleb128 0x10
	.long	0xa1
	.byte	0x4
	.long	0x41800000
	.uleb128 0x11
	.long	0xac
	.byte	0x10
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	0x7e
	.long	.LBB32
	.long	.LBE32
	.byte	0x1
	.byte	0xf5
	.long	0x236
	.uleb128 0xd
	.long	0x8b
	.byte	0x4
	.long	0x3f800000
	.uleb128 0xe
	.long	.LBB33
	.long	.LBE33
	.uleb128 0xf
	.long	0x96
	.uleb128 0x10
	.long	0xa1
	.byte	0x4
	.long	0x41800000
	.uleb128 0x11
	.long	0xac
	.byte	0x10
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x7e
	.long	.LBB34
	.long	.LBE34
	.byte	0x1
	.byte	0xf9
	.uleb128 0xd
	.long	0x8b
	.byte	0x4
	.long	0x3f800000
	.uleb128 0xe
	.long	.LBB35
	.long	.LBE35
	.uleb128 0xf
	.long	0x96
	.uleb128 0x10
	.long	0xa1
	.byte	0x4
	.long	0x41800000
	.uleb128 0x11
	.long	0xac
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF40
	.byte	0x1
	.word	0x10c
	.byte	0x1
	.long	0x2c
	.long	.LFB10
	.long	.LFE10
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x2ee
	.uleb128 0x1b
	.string	"c"
	.byte	0x1
	.word	0x10f
	.long	0x2c
	.long	.LLST4
	.uleb128 0x1c
	.long	0x7e
	.long	.LBB36
	.long	.LBE36
	.byte	0x1
	.word	0x115
	.long	0x2da
	.uleb128 0xd
	.long	0x8b
	.byte	0x4
	.long	0x40800000
	.uleb128 0xe
	.long	.LBB37
	.long	.LBE37
	.uleb128 0xf
	.long	0x96
	.uleb128 0x10
	.long	0xa1
	.byte	0x4
	.long	0x42800000
	.uleb128 0x11
	.long	0xac
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LVL17
	.long	0x197
	.uleb128 0x1d
	.long	.LVL20
	.byte	0x1
	.long	0x197
	.byte	0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.word	0x152
	.byte	0x1
	.long	.LFB12
	.long	.LFE12
	.long	.LLST5
	.byte	0x1
	.long	0x33a
	.uleb128 0x1f
	.string	"cmd"
	.byte	0x1
	.word	0x152
	.long	0x2c
	.long	.LLST6
	.uleb128 0x15
	.long	.LVL22
	.long	0x270
	.uleb128 0x20
	.long	.LVL24
	.byte	0x1
	.long	0x143
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x21
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.word	0x15e
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.long	.LLST7
	.byte	0x1
	.long	0x386
	.uleb128 0x22
	.long	.LASF15
	.byte	0x1
	.word	0x15e
	.long	0x2c
	.long	.LLST8
	.uleb128 0x15
	.long	.LVL26
	.long	0x270
	.uleb128 0x20
	.long	.LVL28
	.byte	0x1
	.long	0x143
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x21
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.word	0x16c
	.byte	0x1
	.long	.LFB14
	.long	.LFE14
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x3c8
	.uleb128 0x1f
	.string	"x"
	.byte	0x1
	.word	0x16c
	.long	0x2c
	.long	.LLST9
	.uleb128 0x1f
	.string	"y"
	.byte	0x1
	.word	0x16c
	.long	0x2c
	.long	.LLST10
	.uleb128 0x1d
	.long	.LVL33
	.byte	0x1
	.long	0x2ee
	.byte	0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF41
	.byte	0x1
	.word	0x187
	.byte	0x1
	.long	0x3e
	.long	.LFB15
	.long	.LFE15
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x3f1
	.uleb128 0x15
	.long	.LVL34
	.long	0x270
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.word	0x190
	.byte	0x1
	.long	.LFB16
	.long	.LFE16
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x41d
	.uleb128 0x20
	.long	.LVL35
	.byte	0x1
	.long	0x2ee
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.word	0x199
	.byte	0x1
	.long	.LFB17
	.long	.LFE17
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x449
	.uleb128 0x20
	.long	.LVL36
	.byte	0x1
	.long	0x2ee
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF25
	.byte	0x1
	.word	0x121
	.byte	0x1
	.byte	0x3
	.long	0x470
	.uleb128 0x26
	.string	"pos"
	.byte	0x1
	.word	0x121
	.long	0x2c
	.uleb128 0x27
	.long	.LASF26
	.byte	0x1
	.word	0x123
	.long	0x2c
	.byte	0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.word	0x1a4
	.byte	0x1
	.long	.LFB18
	.long	.LFE18
	.long	.LLST11
	.byte	0x1
	.long	0x501
	.uleb128 0x1f
	.string	"c"
	.byte	0x1
	.word	0x1a4
	.long	0x501
	.long	.LLST12
	.uleb128 0x1b
	.string	"pos"
	.byte	0x1
	.word	0x1a6
	.long	0x2c
	.long	.LLST13
	.uleb128 0x28
	.long	0x449
	.long	.LBB40
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.word	0x1ac
	.long	0x4e0
	.uleb128 0x29
	.long	0x457
	.long	.LLST14
	.uleb128 0x2a
	.long	.Ldebug_ranges0+0
	.uleb128 0x17
	.long	0x463
	.long	.LLST15
	.uleb128 0x1d
	.long	.LVL45
	.byte	0x1
	.long	0x2ee
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LVL38
	.long	0x270
	.uleb128 0x20
	.long	.LVL48
	.byte	0x1
	.long	0x143
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x21
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF28
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF29
	.byte	0x1
	.word	0x1d3
	.byte	0x1
	.long	.LFB19
	.long	.LFE19
	.long	.LLST16
	.byte	0x1
	.long	0x549
	.uleb128 0x1f
	.string	"s"
	.byte	0x1
	.word	0x1d3
	.long	0x549
	.long	.LLST17
	.uleb128 0x1b
	.string	"c"
	.byte	0x1
	.word	0x1d6
	.long	0x501
	.long	.LLST18
	.uleb128 0x15
	.long	.LVL52
	.long	0x470
	.byte	0
	.uleb128 0x2b
	.byte	0x2
	.long	0x54f
	.uleb128 0x2c
	.long	0x501
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.word	0x1e4
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST19
	.byte	0x1
	.long	0x5c5
	.uleb128 0x22
	.long	.LASF31
	.byte	0x1
	.word	0x1e4
	.long	0x549
	.long	.LLST20
	.uleb128 0x1b
	.string	"c"
	.byte	0x1
	.word	0x1e7
	.long	0x501
	.long	.LLST21
	.uleb128 0x2d
	.long	.LBB44
	.long	.LBE44
	.long	0x5bb
	.uleb128 0x2e
	.long	.LASF32
	.byte	0x1
	.word	0x1e9
	.long	0x45
	.long	.LLST22
	.uleb128 0x2e
	.long	.LASF33
	.byte	0x1
	.word	0x1e9
	.long	0x2c
	.long	.LLST21
	.byte	0
	.uleb128 0x15
	.long	.LVL59
	.long	0x470
	.byte	0
	.uleb128 0x2f
	.byte	0x1
	.long	.LASF42
	.byte	0x1
	.word	0x1f8
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST24
	.byte	0x1
	.uleb128 0x22
	.long	.LASF34
	.byte	0x1
	.word	0x1f8
	.long	0x2c
	.long	.LLST25
	.uleb128 0x1c
	.long	0x7e
	.long	.LBB45
	.long	.LBE45
	.byte	0x1
	.word	0x21b
	.long	0x62d
	.uleb128 0xd
	.long	0x8b
	.byte	0x4
	.long	0x467a0000
	.uleb128 0xe
	.long	.LBB46
	.long	.LBE46
	.uleb128 0xf
	.long	0x96
	.uleb128 0x10
	.long	0xa1
	.byte	0x4
	.long	0x487a0000
	.uleb128 0x30
	.long	0xac
	.long	0x3e800
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	0x7e
	.long	.LBB47
	.long	.LBE47
	.byte	0x1
	.word	0x221
	.long	0x66e
	.uleb128 0xd
	.long	0x8b
	.byte	0x4
	.long	0x459c4000
	.uleb128 0xe
	.long	.LBB48
	.long	.LBE48
	.uleb128 0xf
	.long	0x96
	.uleb128 0x10
	.long	0xa1
	.byte	0x4
	.long	0x479c4000
	.uleb128 0x30
	.long	0xac
	.long	0x13880
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	0x7e
	.long	.LBB49
	.long	.LBE49
	.byte	0x1
	.word	0x225
	.long	0x6ad
	.uleb128 0xd
	.long	0x8b
	.byte	0x4
	.long	0x42800000
	.uleb128 0xe
	.long	.LBB50
	.long	.LBE50
	.uleb128 0xf
	.long	0x96
	.uleb128 0x10
	.long	0xa1
	.byte	0x4
	.long	0x44800000
	.uleb128 0x31
	.long	0xac
	.word	0x400
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	0x7e
	.long	.LBB51
	.long	.LBE51
	.byte	0x1
	.word	0x229
	.long	0x6ec
	.uleb128 0xd
	.long	0x8b
	.byte	0x4
	.long	0x42800000
	.uleb128 0xe
	.long	.LBB52
	.long	.LBE52
	.uleb128 0xf
	.long	0x96
	.uleb128 0x10
	.long	0xa1
	.byte	0x4
	.long	0x44800000
	.uleb128 0x31
	.long	0xac
	.word	0x400
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	0x7e
	.long	.LBB53
	.long	.LBE53
	.byte	0x1
	.word	0x22e
	.long	0x72b
	.uleb128 0xd
	.long	0x8b
	.byte	0x4
	.long	0x42800000
	.uleb128 0xe
	.long	.LBB54
	.long	.LBE54
	.uleb128 0xf
	.long	0x96
	.uleb128 0x10
	.long	0xa1
	.byte	0x4
	.long	0x44800000
	.uleb128 0x31
	.long	0xac
	.word	0x400
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LVL65
	.long	0xf0
	.uleb128 0x15
	.long	.LVL66
	.long	0xf0
	.uleb128 0x15
	.long	.LVL67
	.long	0xf0
	.uleb128 0x15
	.long	.LVL68
	.long	0xf0
	.uleb128 0x32
	.long	.LVL69
	.long	0x2ee
	.long	0x763
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x28
	.byte	0
	.uleb128 0x32
	.long	.LVL70
	.long	0x2ee
	.long	0x776
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x38
	.byte	0
	.uleb128 0x15
	.long	.LVL71
	.long	0x3f1
	.uleb128 0x32
	.long	.LVL72
	.long	0x2ee
	.long	0x792
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x36
	.byte	0
	.uleb128 0x20
	.long	.LVL74
	.byte	0x1
	.long	0x2ee
	.uleb128 0x21
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB8-.Ltext0
	.long	.LCFI0-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0-.Ltext0
	.long	.LCFI1-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1-.Ltext0
	.long	.LCFI2-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI2-.Ltext0
	.long	.LCFI3-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI3-.Ltext0
	.long	.LFE8-.Ltext0
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	0
	.long	0
.LLST1:
	.long	.LVL1-.Ltext0
	.long	.LVL2-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL2-1-.Ltext0
	.long	.LFE8-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LVL1-.Ltext0
	.long	.LVL2-1-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL2-1-.Ltext0
	.long	.LFE8-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST3:
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL7-.Ltext0
	.long	.LFE22-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST4:
	.long	.LVL17-.Ltext0
	.long	.LVL19-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST5:
	.long	.LFB12-.Ltext0
	.long	.LCFI4-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI4-.Ltext0
	.long	.LFE12-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST6:
	.long	.LVL21-.Ltext0
	.long	.LVL22-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL22-1-.Ltext0
	.long	.LVL23-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL23-.Ltext0
	.long	.LVL24-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL24-1-.Ltext0
	.long	.LFE12-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST7:
	.long	.LFB13-.Ltext0
	.long	.LCFI5-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI5-.Ltext0
	.long	.LFE13-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST8:
	.long	.LVL25-.Ltext0
	.long	.LVL26-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL26-1-.Ltext0
	.long	.LVL27-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL27-.Ltext0
	.long	.LVL28-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL28-1-.Ltext0
	.long	.LFE13-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL29-.Ltext0
	.long	.LVL30-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.word	0x4
	.byte	0x88
	.sleb128 -128
	.byte	0x9f
	.long	.LVL31-.Ltext0
	.long	.LVL32-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL32-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST10:
	.long	.LVL29-.Ltext0
	.long	.LVL33-1-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL33-1-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST11:
	.long	.LFB18-.Ltext0
	.long	.LCFI6-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI6-.Ltext0
	.long	.LFE18-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST12:
	.long	.LVL37-.Ltext0
	.long	.LVL38-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL38-1-.Ltext0
	.long	.LVL44-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL44-.Ltext0
	.long	.LVL45-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL45-.Ltext0
	.long	.LVL47-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL47-.Ltext0
	.long	.LVL48-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL48-1-.Ltext0
	.long	.LFE18-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST13:
	.long	.LVL38-.Ltext0
	.long	.LVL40-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL41-.Ltext0
	.long	.LVL42-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL45-.Ltext0
	.long	.LVL46-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST14:
	.long	.LVL39-.Ltext0
	.long	.LVL40-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL41-.Ltext0
	.long	.LVL42-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST15:
	.long	.LVL42-.Ltext0
	.long	.LVL43-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL43-.Ltext0
	.long	.LVL45-1-.Ltext0
	.word	0x4
	.byte	0x88
	.sleb128 -128
	.byte	0x9f
	.long	0
	.long	0
.LLST16:
	.long	.LFB19-.Ltext0
	.long	.LCFI7-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI7-.Ltext0
	.long	.LCFI8-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI8-.Ltext0
	.long	.LFE19-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST17:
	.long	.LVL49-.Ltext0
	.long	.LVL50-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL50-.Ltext0
	.long	.LVL51-.Ltext0
	.word	0x3
	.byte	0x8c
	.sleb128 1
	.byte	0x9f
	.long	.LVL51-.Ltext0
	.long	.LVL54-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST18:
	.long	.LVL51-.Ltext0
	.long	.LVL52-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL53-.Ltext0
	.long	.LFE19-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST19:
	.long	.LFB20-.Ltext0
	.long	.LCFI9-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI9-.Ltext0
	.long	.LCFI10-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI10-.Ltext0
	.long	.LFE20-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST20:
	.long	.LVL55-.Ltext0
	.long	.LVL56-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL56-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x3
	.byte	0x8e
	.sleb128 1
	.byte	0x9f
	.long	.LVL58-.Ltext0
	.long	.LVL61-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL61-.Ltext0
	.long	.LFE20-.Ltext0
	.word	0x3
	.byte	0x8e
	.sleb128 1
	.byte	0x9f
	.long	0
	.long	0
.LLST21:
	.long	.LVL57-.Ltext0
	.long	.LVL59-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL60-.Ltext0
	.long	.LFE20-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST22:
	.long	.LVL56-.Ltext0
	.long	.LVL59-1-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL59-1-.Ltext0
	.long	.LVL60-.Ltext0
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	.LVL60-.Ltext0
	.long	.LFE20-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST24:
	.long	.LFB21-.Ltext0
	.long	.LCFI11-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI11-.Ltext0
	.long	.LFE21-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST25:
	.long	.LVL62-.Ltext0
	.long	.LVL64-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL64-.Ltext0
	.long	.LVL73-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL73-.Ltext0
	.long	.LVL74-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL74-1-.Ltext0
	.long	.LFE21-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB40-.Ltext0
	.long	.LBE40-.Ltext0
	.long	.LBB43-.Ltext0
	.long	.LBE43-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF26:
	.string	"addressCounter"
.LASF29:
	.string	"lcd_puts"
.LASF19:
	.string	"lcd_command"
.LASF22:
	.string	"lcd_clrscr"
.LASF14:
	.string	"__us"
.LASF38:
	.string	"__builtin_avr_delay_cycles"
.LASF15:
	.string	"data"
.LASF37:
	.string	"/home/e13175/Desktop/SEMESTER5/CO321/Lab08/LCDlib"
.LASF1:
	.string	"unsigned char"
.LASF21:
	.string	"lcd_gotoxy"
.LASF7:
	.string	"long unsigned int"
.LASF42:
	.string	"lcd_init"
.LASF17:
	.string	"lcd_write"
.LASF20:
	.string	"lcd_data"
.LASF13:
	.string	"double"
.LASF11:
	.string	"__tmp"
.LASF23:
	.string	"lcd_home"
.LASF25:
	.string	"lcd_newline"
.LASF35:
	.string	"GNU C 4.8.2 -fpreprocessed -mmcu=atmega328p -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums"
.LASF4:
	.string	"unsigned int"
.LASF24:
	.string	"_delay_us"
.LASF9:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF34:
	.string	"dispAttr"
.LASF32:
	.string	"__addr16"
.LASF33:
	.string	"__result"
.LASF41:
	.string	"lcd_getxy"
.LASF16:
	.string	"toggle_e"
.LASF8:
	.string	"long long int"
.LASF30:
	.string	"lcd_puts_p"
.LASF12:
	.string	"__ticks_dc"
.LASF39:
	.string	"lcd_read"
.LASF31:
	.string	"progmem_s"
.LASF3:
	.string	"uint16_t"
.LASF10:
	.string	"__ticks"
.LASF6:
	.string	"uint32_t"
.LASF5:
	.string	"long int"
.LASF28:
	.string	"char"
.LASF0:
	.string	"signed char"
.LASF27:
	.string	"lcd_putc"
.LASF40:
	.string	"lcd_waitbusy"
.LASF36:
	.string	"lcd.c"
.LASF18:
	.string	"dataBits"
	.ident	"GCC: (GNU) 4.8.2"
