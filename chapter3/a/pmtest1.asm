;real mode---->protected mode---->display
org 0x7c00
jmp Real_mode

[section .gdt]
Str_gdt_Descriptor:Gdt_Descriptor 0,Dispaly_str_len-1,DA_RW
Video_gdt_Descriptor:Gdt_Descriptor 0xB80000,0xffff,DA_RW
Code32_gdt_Descriptor:Gdt_Descriptor 0,Code32_len-1,DA_Xcode+DA_X


GdtLen equ  $-Str_gdt_Descriptor
GdtPtr  dw Gdtlen-1    
dd 0 ;Str_gdt_Descriptor


;
Str_selector equ 0
Video_selector equ Vide_gdt_Descriptor-Str_gdt_Descriptor
Code32_selector equ  Code32_gdt_Descriptor-Str_gdt_Descriptor
;



[section .data]
Display_str db 'Hello world'
Display_str_len equ  $-Display-str


[section .code16]
[BITS 16]
Real_mode:
mov ax,cs
mov ds,ax
mov es,ax
mov ss,ax
mov sp,0x0100 ; why ?

;initialize Gdt_Descriptor
;initialize Str_gdt_Descriptor base address
xor eax,eax
mov ax,ds
shl eax,4
add eax,Str_gdt_Descriptor

mov word [Str_gdt_Descriptor+2],ax
shr eax,16
mov [Str_gdt_Descriptor+4],al
mov [Str_gdt_Descriptor+7],ah

;initial Code32_gdt_Descriptor base address

xor eax,eax
mov ax,cs
shl eax,4
add eax,Code_gdt_Descriptor

mov word [Code_gdt_Descriptor+2],ax
shr eax,16
mov [Code_gdt_Descriptor+4],al
mov [Code_gdt_Descriptor+7],ah


;load  GDTR
xor eax,eax
mov ax,ds
shl eax,4
add eax,Str_gdt_Descriptor

mov dword [GdtPtr+2],eax 

lgdt [GdtPtr]

;switch to Protected_mode
cli ;close int
in al,0x92
or al,00000010b
out 0x92,al

mov eax,cr0
or eax,1

mov cr0,eax

jmp dword Code32_selector:0   ;    

[section .code32]
[BITS 32]
Protected_mode:

mov gs,Video_selector
mov edi,(80*11+79)*2

mov ah,0x0C
mov al,'P'
mov [gs:edi],ax

jmp $





Code32_len equ $-Protected_mode

























