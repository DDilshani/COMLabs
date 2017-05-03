	.file	"test_lcd.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
.global	display
	.type	display, @function
display:
.LFB7:
	.file 1 "test_lcd.c"
	.loc 1 26 0
	.cfi_startproc
.LVL0:
	push r28
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r22
	.loc 1 28 0
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L4
	.loc 1 33 0
	sbiw r24,2
	brne .L1
.LVL1:
.LBB8:
.LBB9:
	.loc 1 35 0
	ldi r24,lo8(10)
.LVL2:
	call lcd_putc
.LVL3:
.L4:
	.loc 1 36 0
	movw r24,r28
/* epilogue start */
.LBE9:
.LBE8:
	.loc 1 39 0
	pop r29
	pop r28
.LVL4:
.LBB11:
.LBB10:
	.loc 1 36 0
	jmp lcd_puts
.LVL5:
.L1:
/* epilogue start */
.LBE10:
.LBE11:
	.loc 1 39 0
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE7:
	.size	display, .-display
.global	displayChar
	.type	displayChar, @function
displayChar:
.LFB8:
	.loc 1 41 0
	.cfi_startproc
.LVL6:
	push r28
.LCFI2:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI3:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
	push __zero_reg__
.LCFI4:
	.cfi_def_cfa_offset 5
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI5:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 1 */
/* stack size = 3 */
.L__stack_usage = 3
	.loc 1 43 0
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L9
	.loc 1 48 0
	sbiw r24,2
	brne .L6
.LVL7:
.LBB14:
.LBB15:
	.loc 1 50 0
	ldi r24,lo8(10)
.LVL8:
	std Y+1,r22
	call lcd_putc
.LVL9:
	.loc 1 51 0
	ldd r22,Y+1
.LVL10:
.L9:
	mov r24,r22
/* epilogue start */
.LBE15:
.LBE14:
	.loc 1 54 0
	pop __tmp_reg__
	pop r29
	pop r28
.LBB17:
.LBB16:
	.loc 1 51 0
	jmp lcd_putc
.LVL11:
.L6:
/* epilogue start */
.LBE16:
.LBE17:
	.loc 1 54 0
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE8:
	.size	displayChar, .-displayChar
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Enter the key :"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB9:
	.loc 1 56 0
	.cfi_startproc
	push r28
.LCFI6:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI7:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI8:
	.cfi_def_cfa_register 28
	sbiw r28,16
.LCFI9:
	.cfi_def_cfa_offset 20
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 16 */
/* stack size = 18 */
.L__stack_usage = 18
	.loc 1 58 0
	ldi r24,lo8(16)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	.loc 1 60 0
	ldi r24,lo8(12)
	call lcd_init
.LVL12:
	.loc 1 63 0
	call lcd_clrscr
.LVL13:
.LBB38:
.LBB39:
	.loc 1 30 0
	movw r24,r28
	adiw r24,1
	call lcd_puts
.LVL14:
.LBE39:
.LBE38:
.LBB40:
.LBB41:
.LBB42:
	.loc 1 35 0
	ldi r24,lo8(10)
	call lcd_putc
.LVL15:
	.loc 1 36 0
	movw r24,r28
	adiw r24,1
	call lcd_puts
.LVL16:
.LBE42:
.LBE41:
.LBE40:
.LBB43:
.LBB44:
	.file 2 "/usr/lib/avr/include/util/delay.h"
	.loc 2 164 0
	ldi r18,lo8(15999999)
	ldi r24,hi8(15999999)
	ldi r25,hlo8(15999999)
	1: subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LBE44:
.LBE43:
	.loc 1 69 0
	call lcd_clrscr
.LVL17:
.LBB45:
.LBB46:
	.loc 1 45 0
	ldi r24,lo8(97)
	call lcd_putc
.LVL18:
.LBE46:
.LBE45:
.LBB47:
.LBB48:
.LBB49:
	.loc 1 50 0
	ldi r24,lo8(10)
	call lcd_putc
.LVL19:
	.loc 1 51 0
	ldi r24,lo8(97)
	call lcd_putc
.LVL20:
.LBE49:
.LBE48:
.LBE47:
.LBB50:
.LBB51:
	.loc 2 164 0
	ldi r18,lo8(15999999)
	ldi r24,hi8(15999999)
	ldi r25,hlo8(15999999)
	1: subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LBE51:
.LBE50:
	.loc 1 78 0
	ldi r24,0
	ldi r25,0
/* epilogue start */
	adiw r28,16
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.text
.Letext0:
	.file 3 "/usr/lib/avr/include/stdint.h"
	.file 4 "lcd.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x463
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF26
	.byte	0x1
	.long	.LASF27
	.long	.LASF28
	.long	.Ldebug_ranges0+0x30
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x4
	.long	.LASF4
	.byte	0x3
	.byte	0x7a
	.long	0x50
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x4
	.long	.LASF5
	.byte	0x3
	.byte	0x7c
	.long	0x29
	.uleb128 0x4
	.long	.LASF6
	.byte	0x3
	.byte	0x7e
	.long	0x6d
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
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0x1a
	.byte	0x1
	.byte	0x1
	.long	0xa5
	.uleb128 0x6
	.string	"n"
	.byte	0x1
	.byte	0x1a
	.long	0x30
	.uleb128 0x7
	.long	.LASF10
	.byte	0x1
	.byte	0x1a
	.long	0xa5
	.byte	0
	.uleb128 0x8
	.byte	0x2
	.long	0xab
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF11
	.uleb128 0x5
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.byte	0x1
	.long	0xd3
	.uleb128 0x6
	.string	"n"
	.byte	0x1
	.byte	0x29
	.long	0x30
	.uleb128 0x6
	.string	"c"
	.byte	0x1
	.byte	0x29
	.long	0xab
	.byte	0
	.uleb128 0x9
	.long	.LASF29
	.byte	0x2
	.byte	0x8e
	.byte	0x1
	.byte	0x3
	.long	0x117
	.uleb128 0x7
	.long	.LASF14
	.byte	0x2
	.byte	0x8e
	.long	0x117
	.uleb128 0xa
	.long	.LASF15
	.byte	0x2
	.byte	0x90
	.long	0x57
	.uleb128 0xa
	.long	.LASF16
	.byte	0x2
	.byte	0x91
	.long	0x117
	.uleb128 0xa
	.long	.LASF17
	.byte	0x2
	.byte	0x95
	.long	0x62
	.uleb128 0xb
	.byte	0x1
	.long	.LASF24
	.byte	0x2
	.byte	0x96
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF18
	.uleb128 0xc
	.long	0x82
	.long	.LFB7
	.long	.LFE7
	.long	.LLST0
	.byte	0x1
	.long	0x189
	.uleb128 0xd
	.long	0x90
	.long	.LLST1
	.uleb128 0xd
	.long	0x99
	.long	.LLST2
	.uleb128 0xe
	.long	.Ldebug_ranges0+0
	.uleb128 0xd
	.long	0x90
	.long	.LLST3
	.uleb128 0xd
	.long	0x99
	.long	.LLST4
	.uleb128 0xf
	.long	.LVL3
	.long	0x411
	.long	0x170
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x11
	.long	.LVL5
	.byte	0x1
	.long	0x426
	.uleb128 0x10
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0xb2
	.long	.LFB8
	.long	.LFE8
	.long	.LLST5
	.byte	0x1
	.long	0x1e7
	.uleb128 0xd
	.long	0xc0
	.long	.LLST6
	.uleb128 0xd
	.long	0xc9
	.long	.LLST7
	.uleb128 0xe
	.long	.Ldebug_ranges0+0x18
	.uleb128 0xd
	.long	0xc0
	.long	.LLST8
	.uleb128 0xd
	.long	0xc9
	.long	.LLST9
	.uleb128 0xf
	.long	.LVL9
	.long	0x411
	.long	0x1db
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x12
	.long	.LVL11
	.byte	0x1
	.long	0x411
	.byte	0
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.long	0x30
	.long	.LFB9
	.long	.LFE9
	.long	.LLST10
	.byte	0x1
	.long	0x3da
	.uleb128 0x14
	.string	"s"
	.byte	0x1
	.byte	0x3a
	.long	0x3da
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x15
	.string	"c"
	.byte	0x1
	.byte	0x47
	.long	0xab
	.byte	0x61
	.uleb128 0x16
	.long	0x82
	.long	.LBB38
	.long	.LBE38
	.byte	0x1
	.byte	0x41
	.long	0x24f
	.uleb128 0x17
	.long	0x99
	.uleb128 0x18
	.long	0x90
	.byte	0x1
	.uleb128 0x19
	.long	.LVL14
	.long	0x426
	.uleb128 0x10
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x91
	.sleb128 -19
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	0x82
	.long	.LBB40
	.long	.LBE40
	.byte	0x1
	.byte	0x42
	.long	0x2ab
	.uleb128 0x17
	.long	0x99
	.uleb128 0x18
	.long	0x90
	.byte	0x2
	.uleb128 0x1a
	.long	.LBB41
	.long	.LBE41
	.uleb128 0x18
	.long	0x90
	.byte	0x2
	.uleb128 0x17
	.long	0x99
	.uleb128 0xf
	.long	.LVL15
	.long	0x411
	.long	0x294
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x19
	.long	.LVL16
	.long	0x426
	.uleb128 0x10
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x91
	.sleb128 -19
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	0xd3
	.long	.LBB43
	.long	.LBE43
	.byte	0x1
	.byte	0x44
	.long	0x2eb
	.uleb128 0x1b
	.long	0xe0
	.byte	0x4
	.long	0x459c4000
	.uleb128 0x1a
	.long	.LBB44
	.long	.LBE44
	.uleb128 0x1c
	.long	0xeb
	.uleb128 0x1d
	.long	0xf6
	.byte	0x4
	.long	0x4c989680
	.uleb128 0x1e
	.long	0x101
	.long	0x4c4b400
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	0xb2
	.long	.LBB45
	.long	.LBE45
	.byte	0x1
	.byte	0x48
	.long	0x31b
	.uleb128 0x18
	.long	0xc9
	.byte	0x61
	.uleb128 0x18
	.long	0xc0
	.byte	0x1
	.uleb128 0x19
	.long	.LVL18
	.long	0x411
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	0xb2
	.long	.LBB47
	.long	.LBE47
	.byte	0x1
	.byte	0x49
	.long	0x374
	.uleb128 0x18
	.long	0xc9
	.byte	0x61
	.uleb128 0x18
	.long	0xc0
	.byte	0x2
	.uleb128 0x1a
	.long	.LBB48
	.long	.LBE48
	.uleb128 0x18
	.long	0xc0
	.byte	0x2
	.uleb128 0x18
	.long	0xc9
	.byte	0x61
	.uleb128 0xf
	.long	.LVL19
	.long	0x411
	.long	0x362
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x19
	.long	.LVL20
	.long	0x411
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x61
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	0xd3
	.long	.LBB50
	.long	.LBE50
	.byte	0x1
	.byte	0x4b
	.long	0x3b4
	.uleb128 0x1b
	.long	0xe0
	.byte	0x4
	.long	0x459c4000
	.uleb128 0x1a
	.long	.LBB51
	.long	.LBE51
	.uleb128 0x1c
	.long	0xeb
	.uleb128 0x1d
	.long	0xf6
	.byte	0x4
	.long	0x4c989680
	.uleb128 0x1e
	.long	0x101
	.long	0x4c4b400
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	.LVL12
	.long	0x446
	.long	0x3c7
	.uleb128 0x10
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3c
	.byte	0
	.uleb128 0x1f
	.long	.LVL13
	.long	0x45b
	.uleb128 0x1f
	.long	.LVL17
	.long	0x45b
	.byte	0
	.uleb128 0x20
	.long	0xab
	.long	0x3ea
	.uleb128 0x21
	.long	0x3ea
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF19
	.uleb128 0x20
	.long	0x50
	.long	0x401
	.uleb128 0x21
	.long	0x3ea
	.byte	0xf
	.byte	0
	.uleb128 0xa
	.long	.LASF20
	.byte	0x1
	.byte	0x14
	.long	0x40c
	.uleb128 0x22
	.long	0x3f1
	.uleb128 0x23
	.byte	0x1
	.long	.LASF21
	.byte	0x4
	.word	0x149
	.byte	0x1
	.byte	0x1
	.long	0x426
	.uleb128 0x24
	.long	0xab
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF22
	.byte	0x4
	.word	0x151
	.byte	0x1
	.byte	0x1
	.long	0x43b
	.uleb128 0x24
	.long	0x43b
	.byte	0
	.uleb128 0x8
	.byte	0x2
	.long	0x441
	.uleb128 0x22
	.long	0xab
	.uleb128 0x23
	.byte	0x1
	.long	.LASF23
	.byte	0x4
	.word	0x129
	.byte	0x1
	.byte	0x1
	.long	0x45b
	.uleb128 0x24
	.long	0x45
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF25
	.byte	0x4
	.word	0x130
	.byte	0x1
	.byte	0x1
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
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x34
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB7
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LFE7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LVL0
	.long	.LVL2
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL2
	.long	.LVL5
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL5
	.long	.LFE7
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST2:
	.long	.LVL0
	.long	.LVL3-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL3-1
	.long	.LVL4
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL4
	.long	.LVL5-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL5-1
	.long	.LVL5
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	.LVL5
	.long	.LFE7
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST3:
	.long	.LVL1
	.long	.LVL3
	.word	0x2
	.byte	0x32
	.byte	0x9f
	.long	0
	.long	0
.LLST4:
	.long	.LVL1
	.long	.LVL3-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL3-1
	.long	.LVL3
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST5:
	.long	.LFB8
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI3
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI5
	.long	.LFE8
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	0
	.long	0
.LLST6:
	.long	.LVL6
	.long	.LVL8
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL8
	.long	.LVL11
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL11
	.long	.LFE8
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST7:
	.long	.LVL6
	.long	.LVL9-1
	.word	0x1
	.byte	0x66
	.long	.LVL9-1
	.long	.LVL11
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	.LVL11
	.long	.LFE8
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST8:
	.long	.LVL7
	.long	.LVL10
	.word	0x2
	.byte	0x32
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL7
	.long	.LVL9-1
	.word	0x1
	.byte	0x66
	.long	.LVL9-1
	.long	.LVL10
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST10:
	.long	.LFB9
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI8
	.long	.LCFI9
	.word	0x2
	.byte	0x8c
	.sleb128 4
	.long	.LCFI9
	.long	.LFE9
	.word	0x2
	.byte	0x8c
	.sleb128 20
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB9
	.long	.LFE9-.LFB9
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB8
	.long	.LBE8
	.long	.LBB11
	.long	.LBE11
	.long	0
	.long	0
	.long	.LBB14
	.long	.LBE14
	.long	.LBB17
	.long	.LBE17
	.long	0
	.long	0
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB9
	.long	.LFE9
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF20:
	.string	"copyRightChar"
.LASF22:
	.string	"lcd_puts"
.LASF27:
	.string	"test_lcd.c"
.LASF25:
	.string	"lcd_clrscr"
.LASF24:
	.string	"__builtin_avr_delay_cycles"
.LASF13:
	.string	"displayChar"
.LASF28:
	.string	"/home/e13175/Desktop/SEMESTER5/CO321/Lab08/LCDlib"
.LASF3:
	.string	"unsigned char"
.LASF7:
	.string	"long unsigned int"
.LASF23:
	.string	"lcd_init"
.LASF29:
	.string	"_delay_ms"
.LASF18:
	.string	"double"
.LASF16:
	.string	"__tmp"
.LASF30:
	.string	"main"
.LASF26:
	.string	"GNU C 4.8.2 -fpreprocessed -mmcu=atmega328p -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums"
.LASF0:
	.string	"unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF4:
	.string	"uint8_t"
.LASF10:
	.string	"words"
.LASF19:
	.string	"sizetype"
.LASF8:
	.string	"long long int"
.LASF11:
	.string	"char"
.LASF17:
	.string	"__ticks_dc"
.LASF5:
	.string	"uint16_t"
.LASF15:
	.string	"__ticks"
.LASF6:
	.string	"uint32_t"
.LASF1:
	.string	"long int"
.LASF12:
	.string	"display"
.LASF2:
	.string	"signed char"
.LASF21:
	.string	"lcd_putc"
.LASF14:
	.string	"__ms"
	.ident	"GCC: (GNU) 4.8.2"
.global __do_copy_data
