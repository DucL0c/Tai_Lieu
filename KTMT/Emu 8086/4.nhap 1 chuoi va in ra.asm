.model small
.stack 100
.data
    tbao1 db "nhap vao xau ki tu: $"
    tbao2 db 10,13,"xau ki tu do la: $"
    xaukt db 100 dup('$')
    
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        lea dx,tbao1
        mov ah,9
        int 21h
        
        lea dx,xaukt
        mov ah,10
        int 21h
        
        lea dx,tbao2
        mov ah,9
        int 21h
        
        lea dx,xaukt + 2
        mov ah,9
        int 21h
        
        mov ah,4ch
        int 21h
    main endp    
end