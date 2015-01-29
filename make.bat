cd %1
D:
sdasz80 -o crt0.s
sdasz80 -o bios.s
sdcc -mz80 -c main.c
sdcc -mz80 --code-loc 0x1120 --data-loc 0x2000 --no-std-crt0 -o mbr.ihx main.rel bios.rel crt0.rel
makebin -p mbr.ihx mbr.bin
pause