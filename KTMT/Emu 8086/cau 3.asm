.model small
.stack 100h
.data
     str db 5 dup('$') 
     tb1 db 13,10,'$'
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
         
         lea si,str+2
         mov dl,[si]
         
         cmp dl,'-'
         je tru 
         jmp cong
    tru:
         mov ax,20
         mov bx,10
         sub ax,bx
         jmp print 
         
    cong:
         mov ax,20
         mov bx,10
         add ax,bx
         jmp print 
         
   print:      
         mov bx,10
         mov cx,0
   lap:
         mov ah,0
         div bl
         push ax
         inc cx
         cmp al,0
         jne lap:
         
    lap2:
         pop ax
         mov dl,ah
         add dl,'0'
         mov ah,2
         int 21h
         loop lap2             
         
         mov ah,4ch
         int 21h
main endp
end