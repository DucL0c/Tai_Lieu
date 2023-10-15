.model small
.stack 100
.data
     tb1    db  "nhap 1 chuoi thuong: $"
     tb2    db  13,10,"chuoi kitu hoa do la: $"
     str    db  100 dup('$')
.code
main proc
        mov ax,@data
        mov ds,ax
        
        lea dx,tb1
        mov ah,9
        int 21h
           
        mov ah,10
        lea dx,str
        int 21h
        
        lea dx,tb2
        mov ah,9
        int 21h
        
        lea si,str+2
   lap1:
        mov dl,[si] 
        cmp [si],' '
        je xong
        add dl,20h
        xong:
        jmp in1
   in1: 
        mov ah,2
        int 21h
        inc si
        cmp [si],13
        jne lap1
        
        mov ah,4ch
        int 21h
main endp
end