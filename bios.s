	.module	bios	
	
	BIOS_JUMP_TABLE .equ 0x0FCD

	BOOT_FNUM	 .equ 0
	WBOOT_FNUM	 .equ 1
	CONST_FNUM	 .equ 2
	CONIN_FNUM	 .equ 3
	CONOUT_FNUM	 .equ 4
	LIST_FNUM	 .equ 5
	PUNCH_FNUM	 .equ 6
	READER_FNUM	 .equ 7
	HOME_FNUM	 .equ 8
	SELDSK_FNUM	 .equ 9
	SETTRK_FNUM	 .equ 10
	SETSEC_FNUM	 .equ 11
	SETDMA_FNUM	 .equ 12
	READ_FNUM	 .equ 13
	WRITE_FNUM	 .equ 14
	LISTST_FNUM	 .equ 15
	SECTRAN_FNUM .equ 16

	_bios_boot    .gblequ BIOS_JUMP_TABLE + 3 * BOOT_FNUM
	_bios_wboot   .gblequ BIOS_JUMP_TABLE + 3 * WBOOT_FNUM
	_bios_const   .gblequ BIOS_JUMP_TABLE + 3 * CONST_FNUM
	_bios_conin	  .gblequ BIOS_JUMP_TABLE + 3 * CONIN_FNUM
	_bios_conout  .gblequ BIOS_JUMP_TABLE + 3 * CONOUT_FNUM
	_bios_list    .gblequ BIOS_JUMP_TABLE + 3 * LIST_FNUM
	_bios_punch   .gblequ BIOS_JUMP_TABLE + 3 * PUNCH_FNUM
	_bios_reader  .gblequ BIOS_JUMP_TABLE + 3 * READER_FNUM
	_bios_home    .gblequ BIOS_JUMP_TABLE + 3 * HOME_FNUM
	_bios_seldsk  .gblequ BIOS_JUMP_TABLE + 3 * SELDSK_FNUM
	_bios_settrk  .gblequ BIOS_JUMP_TABLE + 3 * SETTRK_FNUM
	_bios_setsec  .gblequ BIOS_JUMP_TABLE + 3 * SETSEC_FNUM
	_bios_setdma  .gblequ BIOS_JUMP_TABLE + 3 * SETDMA_FNUM
	_bios_read    .gblequ BIOS_JUMP_TABLE + 3 * READ_FNUM
	_bios_write   .gblequ BIOS_JUMP_TABLE + 3 * WRITE_FNUM
	_bios_listst  .gblequ BIOS_JUMP_TABLE + 3 * LISTST_FNUM
	_bios_sectran .gblequ BIOS_JUMP_TABLE + 3 * SECTRAN_FNUM