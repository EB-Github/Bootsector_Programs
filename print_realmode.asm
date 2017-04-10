print_string_16:
	push dx 
	push bx
	mov dl, [bx] 		; move string to dl
	cmp dl, 0    		; check for end of string
	je return

	call print_char_16 	;print character
	inc bx		   	;next character
	call print_string_16
return:
	pop dx
	pop bx
	ret

print_char_16:
	pusha
	mov ah, 0x0E		;print char service
	mov al, dl
	int 0x10		;video interrupt
	popa
	ret

newline_16:
	mov ah, 0x3		;get cursor data
	int 0x10		;video interrupt
	mov ah, 0x2		;set cursor location
	mov dl, 0	
	mov bh, 0
	add dh, 1		;next line
	int 0x10		;video interrupt
	ret
