.model small
.stack 100
.data 
     str  db 10 dup('$')
     tb1  db 13,10 ,'$'
.code
main proc
         mov ax,@data
         mov ds,ax
         
         lea dx,str
         mov ah,10
         int 21h
         
         lea si,str+2
         mov cl,[str+1]
         mov ax,0
         mov bx,10
thapphan:
         mul bx
         mov dl,[si]
         sub dl,'0'
         add ax,dx
         inc si
         loop thapphan 
         mov cx,ax  
                        
         mov ah,9
         lea dx,tb1
         int 21h
         
         mov ax,1
         mov bx,1
    lap1:
         mul bx
         inc bx
         cmp bx,cx
         jle lap1
         mov cx,0
         mov bx,10
    lap2:
         mov dx,0
         div bx
         inc cx
         add dx,'0'
         push dx
         cmp ax,0
         jne lap2
    inra:
         pop dx
         mov ah,2
         int 21h
         loop inra
         
         mov ah,4ch
         int 21h
main endp
end