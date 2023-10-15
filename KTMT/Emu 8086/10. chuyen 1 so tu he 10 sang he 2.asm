.model small
.stack 100
.data
     str  db  5 dup('$')
     tb1  db  13,10,"dang nhi phan : $"
.code 
     main proc
              mov ax,@data
              mov ds,ax
              
              mov ax,'#'
              push ax
              
              mov ah,10
              lea dx,str
              int 21h
    ;123          
              mov cl,[str+1]
              lea si,str+2
              mov ax,0 
              mov bx,10 
    thapphan:
              mul bx
              mov dl,[si]
              sub dl,'0'
              add ax,dx 
              inc si
              loop thapphan
                           
                           
              mov bl,2   
     nhiphan:
              mov ah,0
              div bl
              push ax
              cmp al,0
              jne nhiphan
              
              lea dx,tb1
              mov ah,9
              int 21h
              mov ah,2 
        inra: 
              pop dx
              cmp dx,'#'
              je done
              mov dl,dh
              add dl,'0'
              int 21h
              jmp inra
         done:
              mov ah,4ch
              int 21h
              
     main endp
end