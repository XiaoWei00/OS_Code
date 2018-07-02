
%macro Gdt_Descriptor 3 ;%1 %2 %3
dw %2 & 0xffff


%endmacro

DA_RW equ 0x92
DA_X  equ 0x98
DA_Xcode equ 0x4000



;NASM 汇编   宏定义
;%macro 宏名 参数个数
;宏体
;%endmacro

;%1 第一个参数  %2 第二个参数 .....

;
;
;
;nasm 伪指令  伪指令用于指示编译器如何进行编译
;nasm 定义7种数据大小
;db 8位 dw 16位    dd 32位  dq 64位
;
