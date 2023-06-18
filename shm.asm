;*******************************************IN THE NAME OF GOD**************************************
.model small
.stack  100h
.data
a  db  "IN THE NAME OF GOD","$"
B  DB  " WELCOME TO PLAY EXCTING DOZE","$"
c   db "PLEASE  ENTER KAY TO GOTO PAGE NEXT...","$"
D db "PLEASE  SELECT  TO IN THE PLAY===>>>1 2 3 4 5 6 7 8 9 ",'$'
PO  DB  "DO YOU   WANT CONTINUO  AGAIN (Y/N)?","$"
;======================GADVAL==================
P DB "PAGE:1","$"
PAGE 2 DB "PAGE:2","$"
TR  DB" WINNER IN THE PLAY","$" 
   id db 1
    ;td db1
UY  DB "DO YOU WANT CONTINUE AGIN(Y/N)?"
msg6  db   "PLEASE ENTER ANY KEY","$"
msg     db    "IN THE NAME OF GOD","$"
d1       db   0c9h,2 dup(5  dup(0cdh),0cbh),5 dup(0cdh),0bbh,13,10,"$"
d2       db     0bah,"     ",0bah,"     ",0bah,"     ",0bah,13,10,"$"
d3        db      0cch,2 dup(5 dup(0cdh),0ceh),5 dup(0cdh),0b9h,13,10,"$"
d4     db         0c8h,2 dup(5 dup(0cdh),0cah),5 dup(0cdh),0bch,13,10,"$"
t1     db      "1","$"
t2     db      "2","$"
t3     db      "3","$"
k   db       "1","$"
k1     db       "2","$"
k2  db        "3","$"
l   db           "TIMER PLAYER 1:","$"
l1 db          0c9h,2 dup(5  dup(0cdh)),5 dup(0cdh),0bbh,13,10,"$"
l3 db            0c8h,2 dup(5 dup(0cdh)),5 dup(0cdh),0bch,13,10,"$"
u  db             "WHOLE TIMER:","$"
U1 db           "TIMER PLAYER 2:","$"
P1  DB   "ENETR PLAYER1:","$"
P2   DB   "ENTER PLAYER2:","$"
;*****************************************************************************************************
op3  db "y","$"  
  aop label byte
       maxa db 2
       lena db ?
       buffera db 2 dup(' '),'$'

     bop label byte
       maxb db 2
       lenb db ?
       bufferb db 2 dup(' '),'$'

    List db 00,3,4,5,6,7,8,9,10,11    
    test_ok  db ? 
    marhale2 db 0
    count db 0
    suc db ?
    mab db ?
    mag db ?
    empty db ?
    no db 0

   ;*******************************************************************************************
     A1  db ' NAME PLAYER 1: ','$'  
     B1  db ' CHAR PLAYER 1: ','$'  
	np1 label byte              
         maxn db 10
	 lenn db ?                     
	 buffern db 10 dup(' '),'$'

	cp1 label byte
         maxc db 2
	 lenc db ?
	 bufferc db 2 dup(' '),'$'
;******************************************************************************************************
RICH  DB  "(C) COPY RIGHT @2006 SOFT SHIRJAN","$"    
 A2  db ' NAME PLAYER 2: ','$'
     B2  db ' CHAR PLAYER 2: ','$'
	np2 label byte
         maxn2 db 10
	 lenn2 db ?
	 buffern2 db 20 dup(' '),'$'

	cp2 label byte
         maxc2 db 2
	 lenc2 db 1
	 bufferc2 db 10 dup(' '),'$'

poor db  "DO YOU WANT CONTINUE AGAIN(Y/N)?","$"
y1 label byte
max  db 2
len db 1
buffery db 20 dup(' '),"$"

;******************************************************************************************************
.code
main  proc far

MOV AX,@DATA
MOV DS,AX


op4:
mov suc,0
mov id,1
mov test_ok,'a'

CALL CLRSCR

CALL  DISPLAY
CALL  PLAY1
CALL CLRSCR
MOV AH,02H
MOV BH,00
MOV DH,25
MOV DL,5
INT 10H
mov ah, 9h
LEA dx, P2
int 21h
CALL  DISPLAY1
CALL  CLRSCR
CALL  GAD
CALL  default

RE:

 call nobat

  mov ah,0ah
  mov dx,offset aop
  int 21h
CALL  OK_A
  cmp test_ok,'A'
  je u20
  jmp u4
U20:
CALL  PRINT
  call shart
  cmp suc,1
  je u3

  cmp count,6
  je u4
loop  RE
;****************************************************************************************
u3:
 call barande

call exit
u4:
 call nobat

  mov ah,0ah
  mov dx,offset bop
  int 21h
call ok_B
  cmp test_ok,'A'
  je u5
  jmp u4

u5:
 mov ah,2h
   mov dh,4   
   mov dl,35
   mov bh,0
   int 10h

  mov ah,0ah
  mov dx,offset aop
  int 21h 

  call ok_A
  cmp test_ok,'A'
je u6
  jmp u4

u6:
 call jabejaee
call shart
 cmp suc,1
 je u3


loop u4 

;***************************************END PROGRAM************************************************************
mov ah,4ch
int 21h
main endp
; ***********************************exit********************************************************************

exit proc near

mov ah,02
mov dh,20
mov dl,1
mov bh,0
int 10h

mov ax,4c00h
int 21h
 ret
exit endp

;***************************************barande**************************************************
barande proc


mov ah,02
mov dh,18
mov dl,2
mov bh,0
int 10h

 call taviz
 cmp id,1
 je J1

  mov ah,09h
  mov dx,offset np2
  int 21h
  mov dx,offset buffern2
  int 21h
mov ah,02
mov dh,20
mov dl,13
mov bh,0
int 10h
MOV AH,9H
LEA DX,TR
INT 21H
  ret

J1: 
  mov ah,09h
  mov dx,offset np1
  int 21h
  mov dx,offset buffern
  int 21h
mov ah,02
mov dh,18
mov dl,5
mov bh,0
int 10h
MOV AH,9H
LEA DX,TR
INT 21H

 ret
barande endp

;******************************_r1**************************************************
_r1 proc
 mov ah,2
 mov dh,14
 mov dl,28
 mov bh,0
 int 10h 
 cmp List[1],3
 je nm1
 ret

nm1:
cmp id,1
je OA
 mov List[1],2
 jmp oB
oA:
 mov List[1],1

oB:
 call cz
 ret

_r1 endp

; ***********************************_r2***************************************************************
_r2 proc
 mov ah,2
 mov dh,14
 mov dl,34
 mov bh,0
 int 10h  
 cmp List[2],4
 je nm2
 ret

nm2:
cmp id,1
je oC
 mov List[2],2
 jmp oD
oC:
 mov List[2],1

oD:
 call cz
 ret

_r2 endp

; ***********************************_r3***************************************************

_r3 proc
 mov ah,2
 mov dh,14
 mov dl,40
 mov bh,0
 int 10h 
 cmp List[3],5
 je nm3
 ret

nm3:
cmp id,1
je oE
 mov List[3],2
 jmp oF
oE:
 mov List[3],1

oF:
 call cz
 ret

_r3 endp

; ***********************************_r4********************************************************

_r4 proc
 mov ah,2
 mov dh,16
 mov dl,28
 mov bh,0
 int 10h 
 cmp List[4],6
 je nm4
 ret

nm4:
cmp id,1
je oG
 mov List[4],2
 jmp oH
oG:
 mov List[4],1

oH:
 call cz
 ret

_r4 endp

; ***********************************_r5***********************************************************
_r5 proc
 mov ah,2
 mov dh,16
 mov dl,34
 mov bh,0
 int 10h 
 cmp List[5],7
 je nm5
 ret

nm5:
cmp id,1
je oI
 mov List[5],2
 jmp oJ
oI:
 mov List[5],1

oJ:
 call cz
 ret

_r5 endp
; ***********************************_r6******************************************************
_r6 proc
 mov ah,2
 mov dh,16
 mov dl,40
 mov bh,0
 int 10h 
 cmp List[6],8
 je nm6
 ret

nm6:
cmp id,1
je oK1
 mov List[6],2
 jmp oL
oK1:
 mov List[6],1

oL:
 call cz
 ret

_r6 endp

; ***********************************_r7********************************************************************

_r7 proc
 mov ah,2
 mov dh,18
 mov dl,28
 mov bh,0
 int 10h 
 cmp List[7],9
 je nm7
 ret

nm7:
cmp id,1
je oM
 mov List[7],2
 jmp oN
oM:
 mov List[7],1

oN:
 call cz
 ret

_r7 endp

; ***********************************_r8*****************************************************

_r8 proc
 mov ah,2
 mov dh,18
 mov dl,34
 mov bh,0
 int 10h 
 cmp List[8],10
 je nm8
 ret

nm8:
cmp id,1
je oP
 mov List[8],2
 jmp oQ
oP:
 mov List[8],1

oQ:
 call cz
 ret

_r8 endp

; ***********************************_r9*****************************************************

_r9 proc
 mov ah,2
 mov dh,18
 mov dl,40
 mov bh,0
 int 10h 
 cmp List[9],11
 je nm9
 ret

nm9:
cmp id,1
je oR1
 mov List[9],2
 jmp oS
oR1:
 mov List[9],1

oS:
 call cz
 ret

_r9 endp

;*************************************mulA************************************

mulA proc

 mov dl,List[1]
 cmp dl,List[5]
 je v7_1
 ret 

v7_1:
 cmp dl,List[9]
 je v7_2
 ret
 
v7_2:
 mov suc,1
 ret
mulA endp 

; ***********************************;  1 mulb****************************************************

mulB proc

 mov dl,List[3]
 cmp dl,List[5]
 je v8_1
 ret 

v8_1:
 cmp dl,List[7]
 je v8_2
 ret
 
v8_2:
 mov suc,1
 ret
mulB endp 

; ***********************************vertical_1 ****************************************************************

vertical_1 proc

 mov dl,List[1]
 cmp dl,List[4]
 je v4_1
 ret 

v4_1:
 cmp dl,List[7]
 je v4_2
 ret
 
v4_2:
 mov suc,1
 ret
vertical_1 endp 

; ***********************************;  1 vertical_2************************************

vertical_2 proc
;  2 vertical
 mov dl,List[2]
 cmp dl,List[5]
 je v5_1
 ret 

v5_1:
 cmp dl,List[8]
 je v5_2
 ret
 
v5_2:
 mov suc,1
 ret
vertical_2 endp 
; ***********************************;  1 vertical_3********************************

vertical_3 proc
;  3 vertical
 mov dl,List[3]
 cmp dl,List[6]
 je v6_1
 ret 

v6_1:
 cmp dl,List[9]
 je v6_2
 ret
 
v6_2:
 mov suc,1
 ret
vertical_3 endp 

;***********************************horizental_1 *******************************************

horizental_1 proc

 mov dl,List[1]
 cmp dl,List[2]
 je v1_1
 ret 

v1_1:
 cmp dl,List[3]
 je v1_2
 ret
 
v1_2:
 mov suc,1
 ret
horizental_1 endp 

; ***********************************;  1 horizental_2******************************************

horizental_2 proc

 mov dl,List[4]
 cmp dl,List[5]
 je v2_1
 ret 

v2_1:
 cmp dl,List[6]
 je v2_2
 ret
 
v2_2:
 mov suc,1
 ret
horizental_2 endp 

; ***********************************;  2 horizental_3*****************************************

horizental_3 proc

 mov dl,List[7]
 cmp dl,List[8]
 je v3_1
 ret 

v3_1:
 cmp dl,List[9]
 je v3_2
 ret
 
v3_2:
 mov suc,1
 ret
horizental_3 endp 
;*************************************jabejaee *************************************************

jabejaee proc

call lev1 ; barrasy mabda
cmp no,1
je w1

call lev2 ; barrasy magsad                
cmp no,1
je w1

 nxt2:
   mov dh,empty
   mov list[DI],dh   
   
   mov dl,id
   mov list[sI],dl 
   call cz
   call space 


w1: 
 ret
jabejaee endp

; ***********************************default********************************
default proc
mov count,00
mov suc,00
 ret
default endp

;**********************************space ***************************************
space proc
cmp mab,1
je k3 
jmp k3_1

k3:
 mov ah,2
 mov dh,14
 mov dl,28
 mov bh,0
 int 10h 
 
 mov dl,32
 mov ah,02h
 int 21h
 ret
 ; ------------
k3_1:
cmp mab,2
je k4 
jmp k4_1

k4:
 mov ah,2
 mov dh,14
 mov dl,34
 mov bh,0
 int 10h 
 
 mov dl,32
 mov ah,02h
 int 21h
 ret
 ; ------------ 
k4_1:
cmp mab,3
je k5 
jmp k5_1

k5:
 mov ah,2
 mov dh,14
 mov dl,40
 mov bh,0
 int 10h 
 
 mov dl,32
 mov ah,02h
 int 21h
 ret
 ; ------------ 
k5_1:
cmp mab,4
je k6 
jmp k6_1

k6:
 mov ah,2
 mov dh,16
 mov dl,28
 mov bh,0
 int 10h 
 
 mov dl,32
 mov ah,02h
 int 21h
 ret
 ; ------------ 
k6_1:
cmp mab,5
je k7 
jmp k7_1

k7:
 mov ah,2
 mov dh,16
 mov dl,34
 mov bh,0
 int 10h 
 
 mov dl,32
 mov ah,02h
 int 21h
 ret
 ; ------------ 
k7_1:
cmp mab,6
je k11 
jmp k11_1

k11:
 mov ah,2
 mov dh,16
 mov dl,40
 mov bh,0
 int 10h 
 
 mov dl,32
 mov ah,02h
 int 21h
 ret
 ; ------------ 
k11_1:
cmp mab,7
je k12 
jmp k12_1

k12:
 mov ah,2
 mov dh,18
 mov dl,28
 mov bh,0
 int 10h 
 
 mov dl,32
 mov ah,02h
 int 21h
 ret
 ; ------------ 
k12_1:
cmp mab,8
je k13 
jmp k13_1

k13:
 mov ah,2
 mov dh,18
 mov dl,34
 mov bh,0
 int 10h 
 
 mov dl,32
 mov ah,02h
 int 21h
 ret
 ; ------------ 
k13_1:
cmp mab,9
je k14 
jmp k14_1

k14:
 mov ah,2
 mov dh,18
 mov dl,40
 mov bh,0
 int 10h 
 
 mov dl,32
 mov ah,02h
 int 21h
 ret
 ; ------------ 
k14_1:

 ret
space endp

;*********************************cz************************************
cz proc
 cmp id,1
 je q1
 
 mov ah,02h
 mov dl,bufferc2
 int 21h 
 jmp q2

q1:
 mov ah,02h
 mov dl,bufferc
 int 21h 

q2:
 add count,1
 call taviz
 ret
cz endp

;**********************************lev2 *********************************************
lev2 proc

 mov no,0
                  ;nxt:
 ; ------------
 cmp buffera,'1'
 je m1
 jmp m1_2

 m1:
  cmp list[1],3
  je m1_1
  mov no,1
  ret
 
 m1_1:
  mov sI,1
  mov ah,2
  mov dh,14
  mov dl,28
  mov bh,0
  int 10h 
  ret      ; jmp nxt2
 ; ------------
m1_2:
 cmp buffera,'2'
 je m2
 jmp m2_2

 m2:
  cmp list[2],4
  je m2_1
  mov no,1
  ret
 
 m2_1:
  mov sI,2
  mov ah,2
  mov dh,14
  mov dl,38
  mov bh,0
  int 10h 
  ret      ; jmp nxt2
 ; ------------
m2_2:
 cmp buffera,'3'
 je m3
 jmp m3_2

 m3:
  cmp list[3],5
  je m3_1
  mov no,1
  ret
 
 m3_1:
  mov sI,3
  mov ah,2
 mov dh,14
 mov dl,40
  mov bh,0
  int 10h 
  ret      ; jmp nxt2
 ; ------------
m3_2:
 cmp buffera,'4'
 je m4
 jmp m4_2

 m4:
  cmp list[4],6
  je m4_1
  mov no,1
  ret
 
 m4_1:
  mov sI,4
  mov ah,2
 mov dh,16
 mov dl,28
  mov bh,0
  int 10h 
  ret      ; jmp nxt2
 ; ------------
m4_2:
 cmp buffera,'5'
 je m5
 jmp m5_2

 m5:
  cmp list[5],7
  je m5_1
  mov no,1
  ret
 
 m5_1:
  mov sI,5
  mov ah,2
 mov dh,16
 mov dl,34
  mov bh,0
  int 10h 
  ret      ; jmp nxt2
 ; ------------
m5_2:
 cmp buffera,'6'
 je m6
 jmp m6_2

 m6:
  cmp list[6],8
  je m6_1
  mov no,1
  ret
 
 m6_1:
  mov sI,6
  mov ah,2
 mov dh,16
 mov dl,40
  mov bh,0
  int 10h 
  ret      ; jmp nxt2
 ; ------------
m6_2:
 cmp buffera,'7'
 je m7
 jmp m7_2

 m7:
  cmp list[7],9
  je m7_1
  mov no,1
  ret
 
 m7_1:
  mov sI,7
  mov ah,2
 mov dh,18
 mov dl,28
  mov bh,0
  int 10h 
  ret      ; jmp nxt2
 ; ------------
m7_2:
 cmp buffera,'8'
 je m8
 jmp m8_2

 m8:
  cmp list[8],10
  je m8_1
  mov no,1
  ret
 
 m8_1:
  mov sI,8
  mov ah,2
 mov dh,18
 mov dl,34
  mov bh,0
  int 10h 
  ret        ; jmp nxt2
 ; ------------
m8_2:
 cmp buffera,'9'
 je m9
 jmp m9_2

 m9:
  cmp list[9],11
  je m9_1
  mov no,1
  ret
 
 m9_1:
  mov sI,9
  mov ah,2
  mov dh,18
  mov dl,40
  mov bh,0
  int 10h 
  ret      ; jmp nxt2
 ; ------------
m9_2:

 ret
lev2 endp
; ***********************************lev1 **************************************


lev1 proc

mov no,0

 cmp bufferb,'1'
 je n1
 jmp n1_3

 n1:
   cmp list[1],3
   jne n1_1
   ret 
 n1_1:
   mov dl,id 
   cmp dl,list[1]
   je n1_2
   mov no,1
   ret   
 n1_2:
   mov DI,1
   mov mab,1
   mov empty,3
   ret         ; jmp nxt 
 ;-------------
n1_3:
 cmp bufferb,'2'
 je n2
 jmp n2_3

 n2:
   cmp list[2],4
   jne n2_1
   ret
 n2_1:
   mov dl,id 
   cmp dl,list[2]
   je n2_2
   mov no,1
   ret
 n2_2:
   mov DI,2
   mov mab,2
   mov empty,4
   ret
 ;-------------
n2_3:
 cmp bufferb,'3'
 je n3
 jmp n3_3

 n3:
   cmp list[3],5
   jne n3_1
   ret
 n3_1:
   mov dl,id 
   cmp dl,list[3]
   je n3_2
   mov no,1
   ret
 n3_2:
   mov DI,3
   mov mab,3
   mov empty,5
   ret
 ;-------------
n3_3:
 cmp bufferb,'4'
 je n4
 jmp n4_3

 n4:
   cmp list[4],6
   jne n4_1
   ret
 n4_1:
   mov dl,id 
   cmp dl,list[4]
   je n4_2
   mov no,1
   ret
 n4_2:
   mov DI,4
   mov mab,4
   mov empty,6
   ret
 ;-------------
n4_3:
 cmp bufferb,'5'
 je n5
 jmp n5_3

 n5:
   cmp list[5],7
   jne n5_1
   ret
 n5_1:
   mov dl,id 
   cmp dl,list[5]
   je n5_2
   mov no,1
   ret
 n5_2:
   mov DI,5
   mov mab,5
   mov empty,7
   ret
 ;-------------
n5_3:
 cmp bufferb,'6'
 je n6
 jmp n6_3

 n6:
   cmp list[6],8
   jne n6_1
   ret
 n6_1:
   mov dl,id 
   cmp dl,list[6]
   je n6_2
   mov no,1
   ret
 n6_2:
   mov DI,6
   mov mab,6
   mov empty,8
   ret
 ;-------------
n6_3:
 cmp bufferb,'7'
 je n7
 jmp n7_3

 n7:
   cmp list[7],9
   jne n7_1
   ret
 n7_1:
   mov dl,id 
   cmp dl,list[7]
   je n7_2
   mov no,1
   ret
 n7_2:
   mov DI,7
   mov mab,7
   mov empty,9
   ret
 ;-------------
n7_3:
 cmp bufferb,'8'
 je n8
 jmp n8_3

 n8:
   cmp list[8],10
   jne n8_1
   ret
 n8_1:
   mov dl,id 
   cmp dl,list[8]
   je n8_2
   mov no,1
   ret
 n8_2:
   mov DI,8
   mov mab,8
   mov empty,10
   ret
 ;-------------
n8_3:
 cmp bufferb,'9'
 je n9
 jmp n9_3

 n9:
   cmp list[9],11
   jne n9_1
   ret
 n9_1:
   mov dl,id 
   cmp dl,list[9]
   je n9_2
   mov no,1
   ret
 n9_2:
   mov DI,9
   mov mab,9
   mov empty,11
   ret
 ;-------------
n9_3:
 ret

lev1 endp 


;***************************print************************************************************
print proc
 
 cmp buffera,'1'
 je r1
 cmp buffera,'2'
 je r2
 cmp buffera,'3'
 je r3
 cmp buffera,'4'
 je r4
 cmp buffera,'5'
 je r5
 cmp buffera,'6'
 je r6

 call edame
 ret

r1:
 call _r1
 ret

r2:
 call _r2
 ret

r3:
 call _r3
 ret

r4:
 call _r4
 ret

r5:
 call _r5
 ret

r6:
 call _r6
 ret

print endp 
;*******************************edame *******************************************************
edame proc

 cmp buffera,'7'
 je r7
 cmp buffera,'8'
 je r8
 cmp buffera,'9'
 je r9
 ret ; other character

r7:
 call _r7
 ret

r8:
 call _r8
 ret

r9:
 call _r9
 ret

 edame endp


;*****************************shart**********************************
shart proc
 mov suc,0

 call horizental_1 
 call horizental_2 
 call horizental_3 
 
 call vertical_1
 call vertical_2
 call vertical_3 
 
 call mulA
 call mulB
 
 ret
shart endp

;******************************ok_A **************************************************
ok_A proc
 mov test_ok,'Z'

 cmp buffera,'1'
 je az
 cmp buffera,'2'
 je az
 cmp buffera,'3'
 je az
 cmp buffera,'4'
 je az
 cmp buffera,'5'
 je az
 cmp buffera,'6'
 je az 
 cmp buffera,'7'
 je az
 cmp buffera,'8'
 je az
 cmp buffera,'9'
 je az
 ret

az:
 mov test_ok,'A'
 ret
ok_A endp

;*********************************ok_B **************************************
ok_B proc
 mov test_ok,'Z'

 cmp bufferb,'1'
 je bz
 cmp bufferb,'2'
 je bz
 cmp bufferb,'3'
 je bz
 cmp bufferb,'4'
 je bz
 cmp bufferb,'5'
 je bz
 cmp bufferb,'6'
 je bz 
 cmp bufferb,'7'
 je bz
 cmp bufferb,'8'
 je bz
 cmp bufferb,'9'
 je bz
 ret

bz:
 mov test_ok,'A'
 ret
ok_B endp

;*******************************CLRSCR*********************************

CLRSCR  PROC NEAR
mov ax,3
int 10h
RET 
ENDP
;********************DISPLAY*************************************************

DISPLAY  PROC  NEAR 
mov  ax,0600h
mov  bh,95
mov  cx,0000h
mov   dx,184fh
int   10h
MOV AH,02H
MOV BH,00
MOV DH,24
MOV DL,5
INT 10H
mov ah, 9h
LEA dx, P
int 21h


MOV AH ,6H
MOV AL ,15  ;”ÿ—
MOV CH,6  ;»—«Ì »«·« Ì« Å«ÌÌ‰ «„œ‰
MOV CL,10
MOV DH,2
MOV DL,60
MOV BH,01H
INT  10H
;mov  ah,4ch
;INT 21H
;****************************
MOV AH ,6H
MOV AL ,14  ;”ÿ—
MOV CH,6 ;»—«Ì »«·« Ì« Å«ÌÌ‰ «„œ‰
MOV CL,6
MOV DH,10
MOV DL,58
MOV BH,71H
INT  10H
;********PRINT ALLAH*************************
MOV AH,02H
MOV BH,00
MOV DH,2
MOV DL,20
INT 10H
MOV AH,9H
LEA DX,A
INT 21H
;*********PRINT WELCOME**********************

MOV AH,02H
MOV BH,00
MOV DH,4
MOV DL,15
INT 10H
MOV AH,9H
LEA DX,B
INT 21H
RET
ENDP
;***********PRINT PLAYER1&CHAR************************
PLAY1  PROC  NEAR
mov  ax,0600h
mov  bh,00
mov  cx,9299h
mov   dx,184fh
int   10h

MOV AH,02H
MOV BH,00
MOV DH,10
MOV DL,6
INT 10H
mov  ah,9h
lea dx,a1
int 21h

MOV AH,02H
MOV BH,00
MOV DH,13
MOV DL,6
INT 10H
mov  ah,9h
lea dx,B1
int 21h

;***************PRINT PLAYER2&CHAR*****************************************

MOV AH,02H
MOV BH,00
MOV DH,10
MOV DL,32
INT 10H
mov  ah,9h
lea dx,a2
int 21h

MOV AH,02H
MOV BH,00
MOV DH,13
MOV DL,32
INT 10H
mov  ah,9h
lea dx,B2
int 21h
;***************MAGHDAR DEHY  PLAYER1,2&CHAR 1,2***************************

MOV AH,02H
MOV BH,00
MOV DH,10
MOV DL,21
INT 10H
 mov ah,0ah
 mov dx,offset np1
 int 21h

MOV AH,02H
MOV BH,00
MOV DH,10
MOV DL,47
INT 10H
mov ah,0ah
mov dx,offset   np2
int 21h

MOV AH,02H
MOV BH,00
MOV DH,13
MOV DL,21
INT 10H
mov ah,0ah
mov dx,offset  cp1
int 21h

MOV AH,02H
MOV BH,00
MOV DH,13
MOV DL,47
INT 10H
mov ah, 0ah
mov dx, offset  cp2
int 21h
;***************************
RET
ENDP

;=====================GADVAL BARY PAGE GANEBY=========

DISPLAY1   PROC  NEAR
mov  ax,0600h
mov  bh,95
mov  cx,0000h
mov   dx,184fh
int   10h

mov   ah,02H
mov   bh,00
mov  dh,20
mov  dl,25
int    10h
lea dx,RICH
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,2
mov  dl,25
int    10h
lea dx,msg
mov ah,9h
int 21h
mov   ah,02H
mov   bh,00
mov  dh,13
mov  dl,25
int    10h
lea dx,d1
mov ah,9h
int 21h



mov   ah,02H
mov   bh,00
mov  dh,14
mov  dl,25
int    10h
lea dx,d2
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,15
mov  dl,25
int    10h
lea dx,d3
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,16
mov  dl,25
int    10h
lea dx,d2
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,17
mov  dl,25
int    10h
lea dx,d3
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,18
mov  dl,25
int    10h
lea dx,d2
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,19
mov  dl,25
int    10h
lea dx,d4
mov ah,9h
int 21h

;============ write satar (1,2,3)======================

mov   ah,02H
mov   bh,00
mov  dh,14
mov  dl,23
int    10h
lea dx,t1
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,16
mov  dl,23
int    10h
lea dx,t2
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,18
mov  dl,23
int    10h
lea dx,t3
mov ah,9h
int 21h
;==========sotoon (1,2,3)=======================

mov   ah,02H
mov   bh,00
mov  dh,12
mov  dl,28
int    10h
lea dx,k
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,12
mov  dl,34
int    10h
lea dx,k1
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,12
mov  dl,40
int    10h
lea dx,k2
mov ah,9h
int 21h

;===============timer and gadval===================

mov   ah,02H
mov   bh,00
mov  dh,3
mov  dl,2
int    10h
lea dx,l
mov  ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,4
mov  dl,2
int    10h

lea dx,l1
mov  ah,9h
int 21h
mov   ah,02H
mov   bh,00
mov  dh,5
mov  dl,2
int    10h
lea dx,l3
mov  ah,9h
int 21h

;************WHOL TIME*********************

mov   ah,02H
mov   bh,00
mov  dh,3
mov  dl,27
int    10h
lea dx,U
mov  ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,4
mov  dl,27
int    10h

lea dx,l1
mov  ah,9h
int 21h
mov   ah,02H
mov   bh,00
mov  dh,5
mov  dl,27
int    10h
lea dx,l3
mov  ah,9h
int 21h

;=======TIMER PLAYER2======================

mov   ah,02H
mov   bh,00
mov  dh,3
mov  dl,53
int    10h
lea dx,U1
mov  ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,4
mov  dl,53
int    10h

lea dx,l1
mov  ah,9h
int 21h
mov   ah,02H
mov   bh,00
mov  dh,5
mov  dl,53
int    10h
lea dx,l3
mov  ah,9h
int 21h
mov   ah,02H
mov   bh,00
mov  dh,22
mov  dl,40
int    10h
lea dx,MSG6
mov  ah,9h
int 21h

;==================================

mov   ah,02H
mov   bh,00
mov  dh,23
mov  dl,24
int    10h
lea dx,D
mov  ah,9h
int 21h
RET 
ENDP
;=============CALL GAD====================

 GAD  PROC NEAR
CALL CLRSCR
mov  ax,0600h
mov  bh,95
mov  cx,0000h
mov   dx,184fh
int   10h
mov ah,6
mov al,15;»—«Ì »«·« Ì« Å«ÌÌ‰ »—œ‰ ”ÿ—
mov ch,8;Â— çﬁœ— ò„ œÂÌœ »«·« „Ì—Êœ
mov cl,48;Â— Ãﬁœ— ò„ œÂÌœ ÿÊ· òÊÃò „Ì ‘Êœ
mov dh,5;payyn meayad bala dahid
mov dl,20;bozorg meshavad
mov bh,60
int 10h
mov   ah,02H
mov   bh,00
mov  dh,2
mov  dl,25
int    10h
lea dx,msg
mov ah,9h
int 21h
mov   ah,02H
mov   bh,00
mov  dh,13
mov  dl,25
int    10h
lea dx,d1
mov ah,9h
int 21h



mov   ah,02H
mov   bh,00
mov  dh,14
mov  dl,25
int    10h
lea dx,d2
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,15
mov  dl,25
int    10h
lea dx,d3
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,16
mov  dl,25
int    10h
lea dx,d2
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,17
mov  dl,25
int    10h
lea dx,d3
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,18
mov  dl,25
int    10h
lea dx,d2
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,19
mov  dl,25
int    10h
lea dx,d4
mov ah,9h
int 21h

;============ write satar (1,2,3)======================

mov   ah,02H
mov   bh,00
mov  dh,14
mov  dl,23
int    10h
lea dx,t1
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,16
mov  dl,23
int    10h
lea dx,t2
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,18
mov  dl,23
int    10h
lea dx,t3
mov ah,9h
int 21h
;==========sotoon (1,2,3)=======================

mov   ah,02H
mov   bh,00
mov  dh,12
mov  dl,28
int    10h
lea dx,k
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,12
mov  dl,34
int    10h
lea dx,k1
mov ah,9h
int 21h

mov   ah,02H
mov   bh,00
mov  dh,12
mov  dl,40
int    10h
lea dx,k2
mov ah,9h
int 21h
RET 
ENDP
;************************nobat*****************************************

nobat  proc

mov ah,6
mov al,4;»—«Ì »«·« Ì« Å«ÌÌ‰ »—œ‰ ”ÿ—
mov ch,0;Â— çﬁœ— ò„ œÂÌœ »«·« „Ì—Êœ
mov cl,2;Â— Ãﬁœ— ò„ œÂÌœ ÿÊ· òÊÃò „Ì ‘Êœ
mov dh,5;payyn meayad bala dahid
mov dl,16;bozorg meshavad
mov bh,36
int 10h

;*******************

  mov ah,02h
   mov dh,4   
   mov dl,56
   mov bh,00
   int 10h

;********************

cmp id,1
je AS
  
  mov ah,09h
  mov dx,offset p2
  int 21h
ret

AS:
mov ah,6
mov al,4;»—«Ì »«·« Ì« Å«ÌÌ‰ »—œ‰ ”ÿ—
mov ch,0;Â— çﬁœ— ò„ œÂÌœ »«·« „Ì—Êœ
mov cl,56;Â— Ãﬁœ— ò„ œÂÌœ ÿÊ· òÊÃò „Ì ‘Êœ
mov dh,5;payyn meayad bala dahid
mov dl,70;bozorg meshavad
mov bh,36
int 10h
   mov ah,2h
   mov dh,4   
   mov dl,2
   mov bh,0
   int 10h


;************
 



  mov ah,09h
  mov dx,offset p1
  int 21h 
  ret 
nobat endp

;******************************************taviz**************************

taviz proc
 cmp id,1
 je ta1

 mov id,1
 ret
 
ta1:
  mov id,2
  ret
taviz endp
; ***********************************
;************************************

end  main