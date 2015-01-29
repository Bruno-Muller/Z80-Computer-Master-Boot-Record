;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Mon Jan 26 15:41:51 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _load_sector_into_memory
	.globl _print
	.globl _IO_PARAM2
	.globl _IO_PARAM1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_USART_PORT	=	0x0000
_SDCARD_PORT	=	0x0002
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_IO_PARAM1	=	0x0050
_IO_PARAM2	=	0x0052
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:18: void print(const char* string) {
;	---------------------------------
; Function print
; ---------------------------------
_print_start::
_print:
;main.c:19: do {
	pop	bc
	pop	de
	push	de
	push	bc
00101$:
;main.c:20: USART_PORT = *string;
	ld	a,(de)
	out	(_USART_PORT),a
;main.c:21: string++;
	inc	de
;main.c:22: } while (*string != 0);
	ld	a,(de)
	or	a, a
	jr	NZ,00101$
	ret
_print_end::
;main.c:25: void load_sector_into_memory(void* memory, unsigned long sector_address) {
;	---------------------------------
; Function load_sector_into_memory
; ---------------------------------
_load_sector_into_memory_start::
_load_sector_into_memory:
;main.c:26: IO_PARAM1 = (unsigned int) memory;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	(#_IO_PARAM1 + 0),a
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	ld	(#_IO_PARAM1 + 1),a
;main.c:27: IO_PARAM2 = sector_address;
	ld	de, #_IO_PARAM2
	ld	hl, #4
	add	hl, sp
	ld	bc, #4
	ldir
;main.c:28: SDCARD_PORT = SDCARD_READ;
	ld	a,#0x00
	out	(_SDCARD_PORT),a
	ret
_load_sector_into_memory_end::
;main.c:31: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;main.c:37: print("\r\nBOOT MANAGER");
	ld	hl,#___str_0
	push	hl
	call	_print
	pop	af
;main.c:39: bootable = 0;
;main.c:40: for(i = 0; i<4; i++) {
	ld	bc,#0x0000
00110$:
;main.c:42: partition = &mbr->partitionTable[i];
	ld	a,c
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	add	a, #0xBE
	ld	e,a
	ld	a,#0x00
	adc	a, #0x12
	ld	d,a
;main.c:43: if (partition->bootable == IS_BOOTABLE) {
	ld	a,(de)
	sub	a, #0x80
	jr	NZ,00111$
;main.c:44: bootable = 1;
;main.c:45: i=5;
	ld	bc,#0x0105
00111$:
;main.c:40: for(i = 0; i<4; i++) {
	inc	c
	ld	a,c
	xor	a, #0x80
	sub	a, #0x84
	jr	C,00110$
;main.c:49: if (bootable == 1) {
	dec	b
	jr	NZ,00108$
;main.c:51: load_sector_into_memory(VBR_PTR, partition->firstPartitionSector);
	ex	de,hl
	ld	de, #0x0008
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	push	de
	ld	hl,#0x1300
	push	hl
	call	_load_sector_into_memory
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ret
00108$:
;main.c:53: print("\r\nNON BOOTABLE DISK");
	ld	hl,#___str_1
	push	hl
	call	_print
	pop	af
;main.c:54: while(1);
00105$:
	jr	00105$
	ret
_main_end::
___str_0:
	.db 0x0D
	.db 0x0A
	.ascii "BOOT MANAGER"
	.db 0x00
___str_1:
	.db 0x0D
	.db 0x0A
	.ascii "NON BOOTABLE DISK"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
