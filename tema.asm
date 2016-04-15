.model small
.stack 100h

.data
meniu   db      10, 13, 10, 13, "Alegeti o optiune:",0Dh,0Ah,0Dh,0Ah,09h
        db      "1- DESENARE CASA",0Dh,0Ah,09h
        db      "2- DESENARE CU MOUSE-UL",0Dh,0Ah,09h      
        db      "3- Exit",0Dh,0Ah,09h
        db      "Optiunea aleasa: " 
        db      '$'   

.code
main proc 
    mov   ax,@data
    mov   ds,ax

ArataMeniu: 
    mov ah, 0
    mov al, 13h ; trecere in mod grafic 320x200
    int 10h
    mov ah,6      
    lea     dx, meniu  
    mov     ah, 09h 
    int     21h     
        
getnum:        
    mov     ah, 1 
    int     21h        
    
    cmp     al, '1' 
    jl      ArataMeniu   
    cmp     al, '3'
    jg      ArataMeniu 
        
    cmp     al, "1"
    je      DesenezaCasa
    cmp     al, "2"
    je      DeseneazaCuMouse
    cmp     al, "3"
    jmp     Quit       
Quit: 
    mov ah, 02
    mov dl, 07h ;tonul beep
    int 21h ;produce tonul
    mov   ah,4ch
    int   21h  

DesenezaCasa: 
    w equ 50 ; marime intermediara-latimea
    h equ 50 ; marime intermediara-inaltimea
    mov ah, 0
    mov al, 13h ; trecere in mod grafic 320x200
    int 10h

    ;CASA
    
    ;DESENARE ACOPERIS 
    ;afisare latura inferioara
    mov cx, 100+w ;pozitia de start pe axa ox
    mov dx, 20+h  ;pozitia de startpe axa oy 
    mov al, 5 ;selecteaza culoarea
    u2: mov ah, 0ch ;deseneaza o dreapta pe axa ox
    int 10h
    dec cx
    cmp cx, 100 ; compara sa vada daca linia a ajuns la punctul de oprire
    ja u2 ; daca nu a depasit 100, reia si deseneaza in continuare      
    ;latura din stanga triunghi
    mov cx, 100
    mov dx, 20+h
    mov al, 15
    u3: mov ah, 0ch
    int 10h
    dec dx 
    dec dx
    inc cx
    cmp dx, 20 
    ja u3
    ;latura din dreapta triunghi
    mov cx, 100+w
    mov dx, 20+h
    mov al, 15 
    u4: mov ah, 0ch
    int 10h
    dec dx
    dec dx 
    dec cx
    cmp dx, 20
    ja u4 
    ;latura acoperis sus
    mov cx, 175+w ;
    mov dx, 20  ; 
    mov al, 15 ;
    u5: mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 125
    ja u5    
    ;latura acoperis jos
    mov cx, 200+w 
    mov dx, 20+h   
    mov al, 15 
    u6: mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 150 
    ja u6  
    ;latura din dreapta acoperis
    mov cx, 200+w
    mov dx, 20+h
    mov al, 15 
    u7: mov ah, 0ch
    int 10h
    dec dx
    dec dx 
    dec cx
    cmp dx, 20
    ja u7
     
    ;DESENARE ZIDURI CASA 
    ;temelie
    mov cx, 200+w 
    mov dx, 60+h  
    mov al, 5 
    u8: mov ah, 0ch 
    int 10h
    dec cx
    cmp cx, 150 
    ja u8
    ;zidul 1 din dreapta
    mov cx, 200+w
    mov dx, 20+h
    mov al, 5       
    u9: mov ah, 0ch
    int 10h
    inc dx
    cmp dx, 110
    jb u9         
    ;zidul din stanga
    mov cx, 100
    mov dx, 20+h
    mov al, 15
    u10: mov ah, 0ch
    int 10h
    inc dx
    cmp dx, 110
    jb u10            
    ;zidul 2 din dreapta
    mov cx, 100+w
    mov dx, 20+h
    mov al, 55       
    u11: mov ah, 0ch
    int 10h
    inc dx
    cmp dx, 110
    jb u11    
    ;continuare temelie   
    mov cx, 100+w
    mov dx, 110
    mov al, 5
    u12: mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 100
    ja u12   
    
    ;DESENARE USA  
    ;latura din dreapta usii
    mov cx, 85+w
    mov dx, 30+h
    mov al, 7       
    u13: mov ah, 0ch
    int 10h
    inc dx
    cmp dx,110 
    jb u13    
    ;latura din stanga usii
    mov cx, 65+w
    mov dx, 30+h
    mov al, 7       
    u14: mov ah, 0ch
    int 10h
    inc dx
    cmp dx,110 
    jb u14     
    ;latura de sus a usii
    mov cx, 85+w 
    mov dx, 30+h   
    mov al, 7 
    u15: mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 115
    ja u15      
    
    ;DESENARE FEREASTRA
    ;fereastra jos
    mov cx, 170+w 
    mov dx, 50+h   
    mov al, 8 
    u16: mov ah, 0ch 
    int 10h
    dec cx
    cmp cx, 180 
    ja u16      
    ;fereastra sus
    mov cx, 170+w 
    mov dx, 35+h  
    mov al, 8 
    u17: mov ah, 0ch 
    int 10h
    dec cx
    cmp cx, 180
    ja u17
    ;fereastra mijloc
    mov cx, 170+w
    mov dx, 42+h  
    mov al, 9 
    u18: mov ah, 0ch 
    int 10h
    dec cx
    cmp cx, 180 
    ja u18
    ; fereastra stanga
    mov cx, 130+w
    mov dx, 35+h
    mov al, 8       
    u19: mov ah, 0ch
    int 10h
    inc dx
    cmp dx,100 
    jb u19
    ; fereastra dreapta
    mov cx, 170+w
    mov dx, 35+h
    mov al, 8      
    u20: mov ah, 0ch
    int 10h
    inc dx
    cmp dx,100 
    jb u20      
    ; fereastra mijloc
    mov cx, 150+w
    mov dx, 35+h
    mov al, 9       
    u21: mov ah, 0ch
    int 10h
    inc dx
    cmp dx,100 
    jb u21       
    
    ;DESENARE PANOURI SOLARE PE ACOPERIS
    ;latura de sus a panourilor
    mov cx, 165+w 
    mov dx, 25   
    mov al, 15 
    u22: mov ah, 0ch 
    int 10h
    dec cx
    cmp cx, 140 
    ja u22   
    ;latura de jos a panourilor
    mov cx, 185+w 
    mov dx, 15+h 
    mov al, 15 
    u23: mov ah, 0ch 
    int 10h
    dec cx
    cmp cx, 160 
    ja u23  
    ; latura din dreapta panourilor
    mov cx, 185+w
    mov dx, 15+h
    mov al, 15 
    u24: mov ah, 0ch
    int 10h
    dec dx
    dec dx 
    dec cx
    cmp dx, 25
    ja u24  
    ; latura din stanga panourilor
    mov cx, 110+w
    mov dx, 15+h
    mov al, 15 
    u25: mov ah, 0ch
    int 10h
    dec dx
    dec dx 
    dec cx
    cmp dx, 25
    ja u25    
    ; latura de mijloc a panourilor
    mov cx, 147+w
    mov dx, 15+h
    mov al, 15 
    u26: mov ah, 0ch
    int 10h
    dec dx
    dec dx 
    dec cx
    cmp dx, 25
    ja u26 
    ;asteptare apasare tasta
    mov ah,00
    int 16h
    
    mov ah, 02
    mov dl, 07h ;tonul beep
    int 21h ;produce tonul
    jmp ArataMeniu 
    
DeseneazaCuMouse: 
    mov al, 13h; trecere in mod grafic 320x200
    mov ah, 0
    int 10h
    
    mov ax, 0
    int 33h
    
    mov ax, 1; arata cursorul mouse-ului
    int 33h  
    
    start:
        mov ax, 3; primeste pozitia cursorului
        int 33h
        call punepixel ; apeleaza procedura de desenare pixel
    verificaESC:  ; verifica daca a fost apasata tasta ESC
        mov dl, 255
        mov ah, 6
        int 21h
        cmp al, 27; ESC? 
        je sfarsit;daca da, sare la sfarsit
        jne start ;daca nu, continua
        
    sfarsit:
        mov ah, 02
        mov dl, 07h ; tonul beep
        int 21h ;produce tonul
        jmp ArataMeniu 
    punepixel proc
        mov al, 1100b ; culoarea
        mov ah, 0ch
        shr cx, 1
        int 10h
        ret  
    punepixel endp    
               
end main