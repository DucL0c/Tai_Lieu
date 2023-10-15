.model small
.stack 100
.data
     str db 50 dup('$')
     tb1 db 13,10,"chuoi dao nguoc la: $"
.code
     main proc
          mov ax,@data
          mov ds,ax
          
          lea dx,str
          mov ah,10
          int 21h
                 
          lea dx,tb1
          mov ah,9
          int 21h
          
          mov cl,[str + 1]
          lea si,[str + 2]
          
      lap:
          push [si]
          inc si
          loop lap
          
          mov cl,[str + 1]
      lap2: 
          pop dx
          mov ah,2
          int 21h
          loop lap2
          
          mov ah,4ch
          int 21h
          
      main endp
endp     