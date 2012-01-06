gcc -c helloworld.c -I/usr/include/efi -I /usr/include/efi/x86_64/ -DEFI_FUNCTION_WRAPPER -fno-merge-constants -fPIC -fshort-wchar -fno-strict-aliasing -O2 -Wall
ld -nostdlib -T /usr/lib/elf_x86_64_efi.lds -shared -Bsymbolic -o helloworld.elf helloworld.o -L/usr/lib /usr/lib/crt0-efi-x86_64.o -lefi -lgnuefi
objcopy -j .text -j .sdata -j .data -j .dynamic -j .dynsym -j .rel -j .rela -j .reloc  --target=pei-x86-64 --subsystem  efi-app helloworld.elf helloworld.efi
