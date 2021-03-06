INCLUDE 'emu8086.inc'
org 100h 
;Culori:
; 0      0000      black
; 1      0001      blue
; 2      0010      green
; 3      0011      cyan
; 4      0100      red
; 5      0101      magenta
; 6      0110      brown
; 7      0111      light gray
; 8      1000      dark gray
; 9      1001      light blue
; a      1010      light green
; b      1011      light cyan
; c      1100      light red
; d      1101      light magenta
; e      1110      yellow
; f      1111      white


; clrscr
mov ax,0600h ;scroll ecran
mov bh,07 ;
mov cx,0000 ;from row=00,column=00
mov dx,184fh ;to row=18h, column=4fh
int 10h ;intrerupere
mov ah,00 ;modul setare
mov al,13h ;mode=13
int 10h ;intrerupere pt schimbare
 

PRINT 'Introduceti-va numele: '
CALL get_string
PUTC 13
PUTC 10
PRINT 'Salut, '
MOV AX, CX
CALL print_string
PRINTN '. Acum iti voi desena '
PRINTN 'o casuta.'

DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_GET_STRING


; start desenare casa

; linie orizontala acoperis
mov cx,130  ; start: column:130
mov dx,75   ; row=75 

;sunet:
    mov al, 7
    mov ah, 0eh 
    int 10h
;sfarsit sunet

hseT: ;house set 
    mov ah,0ch  ; ah=0ch pentru a desena o linie
    mov al,08h  ; color:=dar gray(albastru)
    int 10h     ; intrerupe pentru a 
    inc cx      ; incrementa pozitia orizontala
    cmp cx,216  ; deseneaza linie pana la 216
    jnz hseT
;sunet:
    mov al, 7
    mov ah, 0eh 
    int 10h
;sfarsit sunet

; linie orizontala jos
mov cx,130
mov dx,125
hseB: 
    mov ah,0ch
    mov al,08h
    int 10h
    inc cx
    cmp cx,216
    jnz hseB
;sunet:
    mov al, 7
    mov ah, 0eh 
    int 10h
;sfarsit sunet

; linie verticala stanga
mov cx,130
mov dx,75
hseL: 
    mov ah,0ch
    mov al,08h
    int 10h
    inc dx
    cmp dx,125
    jnz hseL
;sunet:
    mov al, 7
    mov ah, 0eh 
    int 10h
;sfarsit sunet

; linie verticala dreapta
mov cx,216
mov dx,75
hseR: 
    mov ah,0ch
    mov al,08h
    int 10h
    inc dx
    cmp dx,126
    jnz hseR
;sunet:
    mov al, 7
    mov ah, 0eh 
    int 10h
;sfarsit sunet

; linie acoperis stanga
mov cx,130
mov dx,75
hseLR: 
    mov ah,0ch
    mov al,04h ;color: red
    int 10h
    inc cx
    dec dx
    cmp cx,173
    cmp dx,32
    jnz hseLR
;sunet:
    mov al, 7
    mov ah, 0eh 
    int 10h
;sfarsit sunet

; linie acoperis dreapta
mov cx,173
mov dx,32
hseRR: 
    mov ah,0ch
    mov al,04h
    int 10h
    inc cx
    inc dx
    cmp cx,216
    cmp dx,75
    jnz hseRR    
;sunet:
    mov al, 7
    mov ah, 0eh 
    int 10h
;sfarsit sunet

    
    ; sfarsit desenare casa
    ;__________________________________________________
 
    ; deseneaza usa
    ; linie usa stanga
mov cx,164
mov dx,125
hseLD: 
    mov ah,0ch
    mov al,0eh ;color: blue
    int 10h
    dec dx
    cmp dx,100
    jnz hseLD 

; linie usa dreapta
mov cx,182
mov dx,125
hseRD: 
    mov ah,0ch
    mov al,0eh
    int 10h
    dec dx
    cmp dx,100
    jnz hseRD 

; linie usa sus
mov cx,164
mov dx,100
hseTD: 
    mov ah,0ch
    mov al,0eh
    int 10h
    inc cx
    cmp cx,183
    jnz hseTD
    
;sfarsit desenat usa
    ;______________________________________________________
    
    ; deseneaza 2 ferestre matrice 3x3

; fereastra din stanga linia verticala 1
mov cx,136
mov dx,85
hseLWV1: 
    mov ah,0ch
    mov al,07h ;color: light gray
    int 10h
    inc dx
    cmp dx,105
    jnz hseLWV1

; fereastra din stanga linia verticala 2
mov cx,146
mov dx,85
hseLWV2: 
    mov ah,0ch
    mov al,07h
    int 10h
    inc dx
    cmp dx,105
    jnz hseLWV2

;fereastra din stanga linia verticala 3
mov cx,156
mov dx,85
hseLWV3:
    mov ah,0ch
    mov al,07h
    int 10h
    inc dx
    cmp dx,105
    jnz hseLWV3

; fereastra din dreapta linia verticala 1
mov cx,190
mov dx,85
hseRWV1: 
    mov ah,0ch
    mov al,07h
    int 10h
    inc dx
    cmp dx,105
    jnz hseRWV1
;fereastra din dreapta linia verticala 2
mov cx,200
mov dx,85
hseRWV2: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc dx
    cmp dx,105
    jnz hseRWV2
; fereastra din dreapta linia verticala 3
mov cx,210
mov dx,85
hseRWV3: 
    mov ah,0ch
    mov al,07h
    int 10h
    inc dx
    cmp dx,105
    jnz hseRWV3
; fereastra linie orizontala 1
mov cx,136
mov dx,85
hseWH1:     ;stanga
    mov ah,0ch
    mov al,07h
    int 10h
    inc cx
    cmp cx,156
    jnz hseWH1
mov cx,190  ;linia aceasta se continua pentru geamul din stanga pana la 190
mov dx,85 

hseWH1b:    ;dreapta
    mov ah,0ch
    mov al,07h
    int 10h
    inc cx
    cmp cx,210
    jnz hseWH1b 
; fereastra linie orizontala 2
mov cx,136
mov dx,95
hseWH2:     ;stanga
    mov ah,0ch
    mov al,07h
    int 10h
    inc cx
    cmp cx,156
    jnz hseWH2
mov cx,190
mov dx,95
hseWH2b:    ;dreapta 
    mov ah,0ch
    mov al,07h
    int 10h
    inc cx
    cmp cx,210
    jnz hseWH2b
; fereastra linie orizontala 3
mov cx,136
mov dx,105
hseWH3:     ;stanga 
    mov ah,0ch
    mov al,07h
    int 10h
    inc cx
    cmp cx,157
    jnz hseWH3
mov cx,190
mov dx,105
hseWH3b:    ;dreapta 
    mov ah,0ch
    mov al,07h
    int 10h
    inc cx
    cmp cx,211
    jnz hseWH3b
    
    ; sfarsit desenare geamuri
    ; casa completa
    ;______________________________________________

   

