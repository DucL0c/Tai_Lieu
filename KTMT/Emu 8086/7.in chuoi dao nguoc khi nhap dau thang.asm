.model small
.stack 100h
.data   
     str db 50 dup('$')
.code
     main proc
          mov ax,@data
          mov ds,ax
          mov cx,0
          
     nhap:
          inc cx
          mov ah,1
          int 21h
          cmp al,'#'
          je inra
          push ax
          jmp nhap
          
     inra: 
          mov ah,2
          mov dl,0
          int 21h
          
          dec cx
          pop dx
          mov ah,2
          int 21h
          
          cmp cx,1
          jne inra
          
          mov ah,4ch
          int 21h
     
     main endp
end