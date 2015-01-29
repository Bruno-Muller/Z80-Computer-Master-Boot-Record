#include "bios.h"
#include "mbr.h"

__sfr __at (0x00) USART_PORT;
__sfr __at (0x02) SDCARD_PORT;

volatile __at (0x50) unsigned int IO_PARAM1;
volatile __at (0x52) unsigned long IO_PARAM2;

#define SDCARD_READ		0x00

#define MBR_ADDRESS		0x1100
#define VBR_ADRESS 		0x1300

#define MBR_PTR			(void*) MBR_ADDRESS
#define VBR_PTR			(void*) VBR_ADRESS

void print(const char* string) {
	do {
		USART_PORT = *string;
		string++;
	} while (*string != 0);
}

void load_sector_into_memory(void* memory, unsigned long sector_address) {
	IO_PARAM1 = (unsigned int) memory;
	IO_PARAM2 = sector_address;
	SDCARD_PORT = SDCARD_READ;
}

void main() {
	// MBR was previously loaded by the BIOS
	const MasterBootRecord* const mbr = MBR_PTR;
	const PartitionDescriptor* partition;
	char bootable, i;
	
	print("\r\nBOOT MANAGER");
	
	bootable = 0;
	for(i = 0; i<4; i++) {
		// TODO : look for a bootable partition
		partition = &mbr->partitionTable[i];
		if (partition->bootable == IS_BOOTABLE) {
			bootable = 1;
			i=5;
		}
	}
	
	if (bootable == 1) {
		// Load VBR of a bootable partition
		load_sector_into_memory(VBR_PTR, partition->firstPartitionSector);
	} else {
		print("\r\nNON BOOTABLE DISK");
		while(1);
	}
	// crt0.s will jump to VBR_PTR
}