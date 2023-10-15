.model small
.stack 100
.data
    tbao1 db "nhap 1 ki tu in hoa: $"
    tbao2 db 13,10,"ki tu in thuong do la: $"
    kitu  db ?,"$"
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        lea dx,tbao1
        mov ah,9
        int 21h
        
        mov ah,1
        int 21h
        add al,20h
        mov kitu,al
        
        lea dx,tbao2
        mov ah,9
        int 21h
        
        lea dx,kitu
        mov ah,9
        int 21h
        
        mov ah,4ch
        int 21   
    main endp    
end