.model small
.stack 100h
.data 
     str  db  50 dup('$')
     tb1  db  13,10,"chieu dai cua chuoi la: $"
.code
     main proc
              mov ax,@data
              mov ds,ax
                
              mov ah,10
              lea dx,str
              int 21h
              
              lea dx,tb1
              mov ah,9
              int 21h
              
              mov ax,0
              mov al,str+1
              mov bx,10
              mov cx,0
         lap:
              mov dx,0
              div bx
              push dx
              inc cx
              cmp ax,0
              jnz lap
              
         inra:
              pop dx
              add dx,'0'
              mov ah,2
              int 21h
              loop inra
              
              mov ah,4ch
              int 21h
              
      main endp
end