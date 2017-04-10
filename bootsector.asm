[org 0x7c00]
[BITS 16]
jmp init

init:
	mov bp,0x8000 ;stack
	mov sp, bp
	
	mov bx, STRING ;get string
	call print_string_16	;print string in bx
	call newline_16

	mov bx,STRING2
	call print_string_16
	call newline_16
	jmp read_command

read_command:
	mov ah, 00h
	int 0x16
	mov dl, al
	cmp dl, 13
	je run_command 
	call print_char_16

	
	jmp read_command

run_command:
	call newline_16
	mov bx, STRING2
	call print_string_16
	jmp read_command
end:
	jmp $	; loop forever

%include 'print_realmode.asm'
%include 'input_realmode.asm'

STRING db 'Hello world',0
STRING2 db 'Waiting for keyboard input..',0
times 510-($-$$) db 0 ;pad boot sector
dw 0xaa55 ;signature word at end of boot sector
