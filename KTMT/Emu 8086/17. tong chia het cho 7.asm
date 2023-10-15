.model small
.stack 100h
.data
    mang1 db 10,11,60,23,77,43,14,16,17,88 
    str1 db 'Tong: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea si,mang1 
    mov bx,0
    mov dl,7
    
    tong: 
        mov al,[si]
        xor ah,ah 
        mov cx,ax
        inc si 
        cmp si,10
        je endtong
        
        div dl
        cmp ah,0
        jne tong
          
        add bx,cx
        jmp tong
    
    endtong:
        mov ax,bx
        call printNumber
    
        mov ah,4ch
        int 21h
main endp
printNumber proc
  push ax
  push bx
  push cx
  push dx

  cmp ax, 0
  jge NOT_NEGATIVE    
  neg ax              
  mov dl, '-'
  call printCharacter
    
  NOT_NEGATIVE:
  mov bl, 10
  mov cx, 0
  StartSplit:
    div bl
    push ax   
    inc cx  
    cmp al, 0
    jz ExitSplit
    xor ah, ah
    jmp StartSplit
  ExitSplit:   
                              
  StartPrint:
    pop ax
    mov dl, ah
    call printSingleDigit
    loop StartPrint
  
  pop dx
  pop cx
  pop bx
  pop ax
  ret
printNumber endp

printSingleDigit proc      
    push ax
    add dl, '0'
    mov ah, 2
    int 21H
    pop ax
    ret
printSingleDigit endp 

printString proc 
  push ax   
  mov ah, 9
  int 21H
  pop ax   
  ret
printString endp  

printCharacter proc      
    push ax
    mov ah, 2
    int 21H
    pop ax
    ret
printCharacter endp

end main