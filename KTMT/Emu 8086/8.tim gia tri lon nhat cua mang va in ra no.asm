.model small
.stack 100h
.data
     list db 1,2,3,4,5,6,7,8,9
.code 
     main proc
          mov ax,@data
          mov ds,ax
          
          mov cx,9
          lea si,list
          mov bl,[si]
     lap:
          lodsb
          cmp bl,al
          jge bypass
          mov bl,al
     bypass:
          loop lap
          
          add bl,'0'
          mov dl,bl
          mov ah,2
          int 21h    
          
          mov ah,4ch
          int 21h
     main endp
end