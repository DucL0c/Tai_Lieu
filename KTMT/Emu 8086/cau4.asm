.model small
.stack 100
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
         mov cl,[str+1]
         mov ax,0
         mov bx,10
thapphan:
         mul bx
         mov dl,[si]
         sub dl,'0'
         add ax,dx
         loop thapphan
         
         mov cx,ax
         mov ax,0
         mov bx,1
fibonaci:
         add ax,bx
         mov dx,ax
         mov ax,bx
         mov bx,dx
         dec cx
         cmp cx,1
         jne fibonaci
         
         mov ax,dx
         mov bx,10
         mov cx,0         
tostring:
         mov ah,0      
         div bl
         push ax
         inc cx
         cmp al,0
         jne tostring
  print:    
         pop ax
         mov dl,ah
         add dl,'0'
         mov ah,2
         int 21h
                
         mov ah,4ch
         int 21h
main endp
end