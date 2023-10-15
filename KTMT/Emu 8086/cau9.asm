.model small 
.stack 100h
.data
     str db "Kien Truc May Tinh CS13$"
     tb1 db 13,10,'$'
.code
main proc
         mov ax,@data
         mov ds,ax
         
         lea si,str
     lap:
  chuhoa:       
         mov dl,[si]
         cmp dl,'A'
         jl printso
         cmp dl,'Z'
         jg printhoa
         jmp printthuong
 printso:
         mov ah,2
         int 21h
         jmp continue
printhoa:
         sub dl,20h
         mov ah,2
         int 21h
         jmp continue
printthuong:
         add dl,20h
         mov ah,2
         int 21h
         jmp continue         
continue:       
         inc si
         cmp [si],'$'
         jne lap
            
         mov ah,4ch
         int 21h    
main endp
end