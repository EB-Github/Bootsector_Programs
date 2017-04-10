[org 0x7c00]
[BITS 16]
jmp init

init:
	mov bp,0x8000 ;stack
	mov sp, bp	

	mov bx, STRING ;get string
	call print_string_16	;print string in bx

	jmp end
	
end:
	jmp $	; loop forever

%include 'print_realmode.asm'

STRING db 'Hello world',0

times 510-($-$$) db 0 ;pad boot sector
dw 0xaa55 ;signature word at end of boot sector
