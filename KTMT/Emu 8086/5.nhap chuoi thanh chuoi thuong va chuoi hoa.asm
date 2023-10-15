.model small
.stack 100
.data
    tbao  db "nhap chuoi ki tu: $"
    tbao1 db 10,13,"chuyen sang chuoi in thuong: $"
    tbao2 db 10,13,"chuyen sang chuoi in hoa: $"
    xaukt db 100 dup('$')
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,tbao
    mov ah,9
    int 21h
    
    lea dx,xaukt
    mov ah,10
    int 21h
    
    lea dx,tbao1
    mov ah,9
    int 21h
    call inthuong
    
    lea dx,tbao2
    mov ah,9
    int 21h
    call inhoa
    
    mov ah,4ch
    int 21h
main endp
    
inthuong proc
    lea si,xaukt+2
    lap1:
        mov dl,[si]
        cmp dl,'A'
        jl in1
        cmp dl,'Z'
        jg in1
        add dl,20h
    in1:
        mov ah,2
        int 21h
        inc si
        cmp [si],'$'
        jne lap1
    ret    
inthuong endp
inhoa proc
    lea si,xaukt+2
    lap2:
        mov dl,[si]
        cmp dl,'a'
        jl in2
        cmp dl,'z'
        jg in2
        sub dl,20h
    in2:
        mov ah,2
        int 21h
        inc si
        cmp [si],'$'
        jne lap2
    ret    
inhoa endp
end