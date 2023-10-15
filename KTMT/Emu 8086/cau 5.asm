.model small
.stack 100h
.data
     tb1 db 13,10,'$'
     tb2 db "NOP$"
.code
main proc
         mov ax,@data
         mov ds,ax
         
         mov ah,1
         int 21h
         sub al,'0'
         mov cx,0
         mov cl,al
          
         lea dx,tb1
         mov ah,9
         int 21h 
         
         cmp cl,0
         je case0
         cmp cl,1
         je case1
         cmp cl,2
         je case2
         cmp cl,3
         je case3
         jmp default
         
   case0: ;b+c
         mov ax,10
         mov bx,5
         add ax,bx
         jmp print      
   case1: ;b-c
         mov ax,10
         mov bx,5
         sub ax,bx
         jmp print        
   case2: ;b*c
         mov ax,10
         mov bx,5
         mul bx
         jmp print    
   case3: ;b/c
         mov ax,10
         mov bx,5
         div bx
         jmp print     
 default:
         lea dx,tb2
         mov ah,9
         int 21h
         jmp continue
   print:
         mov cx,0
         mov bx,10
    lap1:
         mov ah,0   
         div bl
         push ax
         inc cx
         cmp al,0
         jne lap1
    lap2:     
         pop ax
         mov dl,ah
         add dl,'0'
         mov ah,2
         int 21h
         loop lap2
       
 continue:     
         mov ah,4ch
         int 21h
main endp
end