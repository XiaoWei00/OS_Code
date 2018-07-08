00007C00  E91900            jmp word 0x7c1c
00007C03  000A              add [bp+si],cl
00007C05  00FF              add bh,bh
00007C07  FF14              call word [si]
00007C09  0005              add [di],al
00007C0B  0000              add [bx+si],al
00007C0D  0000              add [bx+si],al
00007C0F  004865            add [bx+si+0x65],cl
00007C12  6C                insb
00007C13  6C                insb
00007C14  6F                outsw
00007C15  20776F            and [bx+0x6f],dh
00007C18  726C              jc 0x7c86
00007C1A  64008CC88E        add [fs:si-0x7138],cl
00007C1F  D88EC08E          fmul dword [bp-0x7140]
00007C23  D0BC0001          sar byte [si+0x100],1
00007C27  6631C0            xor eax,eax
00007C2A  8CD8              mov ax,ds
00007C2C  66C1E004          shl eax,byte 0x4
00007C30  6605107C0000      add eax,0x7c10
00007C36  A3067C            mov [0x7c06],ax
00007C39  66C1E810          shr eax,byte 0x10
00007C3D  A2087C            mov [0x7c08],al
00007C40  88260B7C          mov [0x7c0b],ah
00007C44  6631C0            xor eax,eax
00007C47  8CC8              mov ax,cs
00007C49  66C1E004          shl eax,byte 0x4
00007C4D  6605947C0000      add eax,0x7c94
00007C53  A30A7C            mov [0x7c0a],ax
00007C56  66C1E810          shr eax,byte 0x10
00007C5A  A20C7C            mov [0x7c0c],al
00007C5D  88260F7C          mov [0x7c0f],ah
00007C61  6631C0            xor eax,eax
00007C64  8CD8              mov ax,ds
00007C66  66C1E004          shl eax,byte 0x4
00007C6A  6605047C0000      add eax,0x7c04
00007C70  66A30C7C          mov [0x7c0c],eax
00007C74  0F01160A7C        lgdt [0x7c0a]
00007C79  FA                cli
00007C7A  E492              in al,0x92
00007C7C  0C02              or al,0x2
00007C7E  E692              out 0x92,al
00007C80  0F20C0            mov eax,cr0
00007C83  6683C801          or eax,byte +0x1
00007C87  0F22C0            mov cr0,eax
00007C8A  66EA000000000400  jmp dword 0x4:0x0
00007C92  0000              add [bx+si],al
00007C94  66B802008EE8      mov eax,0xe88e0002
00007C9A  BF7E07            mov di,0x77e
00007C9D  0000              add [bx+si],al
00007C9F  B40C              mov ah,0xc
00007CA1  B050              mov al,0x50
00007CA3  65668907          mov [gs:bx],eax
00007CA7  EBFE              jmp short 0x7ca7
