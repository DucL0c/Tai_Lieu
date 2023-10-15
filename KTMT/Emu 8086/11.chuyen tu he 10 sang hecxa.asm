.model small
.stack 100h
.data
     
.code
main proc
         mov ax,@data
         mov ds,ax
         mov ax,1000
         call hecxa
         mov ah,4ch
         int 21h
main endp
     
hecxa proc
          mov bx,16
          mov cx,0
               
    lap1:
          div bl
          push ax
          inc cx;
          mov ah,0
          cmp al,0
          jne lap1
               
    inra:
          pop ax;
          mov dl,ah
          
          cmp dl,10
          je hex_a
          cmp dl,11
          je hex_b
          cmp dl,12
          je hex_c
          cmp dl,13
          je hex_d
          cmp dl,14
          je hex_e
          cmp dl,15
          je hex_f
               
          add dl,'0'
          jmp print
              
              
   hex_a: 
          mov dl,'A'
          jmp print
   hex_b: 
          mov dl,'B'
          jmp print
   hex_c: 
          mov dl,'C'
          jmp print
   hex_d:
          mov dl,'D'
          jmp print
   hex_e: 
          mov dl,'E'
          jmp print
   hex_f: 
          mov dl,'F'
          jmp print   
   print:
          mov ah,2
          int 21h 
          loop inra
   ret
        
hecxa endp    
end