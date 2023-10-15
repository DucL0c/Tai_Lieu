.model small
.stack 100h
.data
      str db ?
.code
main proc
        mov ax,@data
        mov ds,ax
    
    lap:
        mov ah,1
        int 21h  
        cmp al,13
        je continue  
        cmp al,27
        je continue
        mov str,al
        jmp lap 
        
    continue:
     
        mov ah,4ch
        int 21h
main endp
end