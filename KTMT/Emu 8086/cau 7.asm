.model small
.stack 100
.data
     tb1 db 13,10,"tong cua n so dau tien la: $"
     str db 5 dup('$')
.code
main proc
         mov ax,@data
         mov ds,ax
         
         mov ah,10 
         lea dx,str
         int 21h
         ;mov ax,dx 
         
         mov ah,9
         lea dx,tb1
         int 21h
         
         lea si,str+2
         mov cl,[str+1]
         mov ax,0
         mov bx,10
         
    lap1:
         mul bx
         mov dl,[si]
         sub dl,'0'
         add ax,dx
         inc si
         loop lap1
         
         mov cx,ax
         mov ax,0
         mov bx,1
    lap2:
         add ax,bx
         inc bx
         dec cx
         cmp cx,0
         jne lap2 
         
         mov cx,0
         mov bx,10
    lap3:
         mov ah,0
         div bl
         push ax
         inc cx
         cmp al,0
         jne lap3 
    inra:      
         pop ax
         mov dl,ah
         add dl,'0'
         mov ah,2
         int 21h
         loop inra
     
         mov ah,4ch
         int 21h    
main endp
end