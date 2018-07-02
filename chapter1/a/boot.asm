org 07c00h
mov ax, cs
mov ds, ax
mov es, ax

call DispStr
jmp $

DispStr:
mov ax, 0x1301
mov cx, 16
mov dx, 0x0100
mov bx, 0x000c
mov bp, BootMessage

int 10h
ret

BootMessage db 'Hello, OS world!',0

times 510-($-$$) db 0
dw 0xaa55



;org defines where the program being executed is loaded into memory.

;cs 代码段寄存器
;es 附加段寄存器
;ds 数据段寄存器
;bp 基指针寄存器  直接存取堆栈中的数据


;$  当前行被汇编后的地址
;jmp $  在当前位置循环
;$$ 一个节（section）的开始处汇编后的地址

;int 10h   由BIOS对显示器所提供的服务程序
;在Teletype模式下显示字符串
;入口参数 ： 
;AH=13H   BH=页码  
;CX=显示字符串长度
;DH=坐标行  DL=坐标列
;ES:BP=显示字符串地址
;BL=属性（AL=00H或者01H）
;AL=显示输出方式
;0——字符串中只含显示字符，其显示属性在BL中。显示后，光标位置不变
;1——字符串中只含显示字符，其显示属性在BL中。显示后，光标位置改变
;2——字符串中含显示字符和显示属性。显示后，光标位置不变
;3——字符串中含显示字符和显示属性。显示后，光标位置改变
;出口参数：无
;
;
