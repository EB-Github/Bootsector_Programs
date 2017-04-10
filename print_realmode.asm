print_string_16:
	push dx
	push bx
	mov dl, [bx]
	cmp dl, 0
	je return

	call print_char_16
	inc bx
	call print_string_16
return:
	pop dx
	pop bx
	ret
	
print_char_16:
	pusha
	mov ah, 0x0E
	mov al, dl
	int 0x10
	popa
	ret
