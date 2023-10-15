.model small
.stack 100h
.data
    Tbao1 db "hay nhap mot ky tu: $"
    Tbao2 db 13,10,"Ky tu da nhap: $"
    Kytu  db ?
.code 
    main proc
        Mov ax,@data
        Mov ds,ax
        
        Lea dx, Tbao1
        Mov ah, 9
        int 21h
        
        Mov ah, 1
        Int 21h
        Mov Kytu, al
        
        Lea dx, Tbao2
        Mov ah, 9
        int 21h
        
        Mov ah, 2
        Mov dl, Kytu
        int 21h
        
        Mov ah, 4Ch
        int 21h
    main endp
End