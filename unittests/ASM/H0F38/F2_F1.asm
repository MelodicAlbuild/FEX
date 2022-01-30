%ifdef CONFIG
{
  "RegData": {
    "RAX": "0x00000000C5727F5A",
    "RBX": "0x00000000FAC690D7",
    "RCX": "0x000000002AAF1F77",
    "RDX": "0x00000000ADBE9F64",
    "RSI": "0x00000000ADBE9F64",
    "RDI": "0x00000000ADBE9F64"
  }
}
%endif

mov rax, 0
mov rbx, 0
mov rcx, 0

mov rdx, 0
mov rsi, 0
mov rdi, 0

mov rbp, 0
lea rsp, [rel .data]

crc32 eax, word [rel .data]
crc32 ebx, dword [rel .data + 2]
crc32 rcx, qword [rel .data + 8]

mov rbp, 0
.again16:
cmp rbp, 128
je .done16
crc32 edx, word [rsp + rbp * 2]
add rbp, 1
jmp .again16
.done16:


mov rbp, 0
.again32:
cmp rbp, 64
je .done32
crc32 esi, dword [rsp + rbp * 4]
add rbp, 1
jmp .again32
.done32:

mov rbp, 0
.again64:
cmp rbp, 32
je .done64
crc32 rdi, qword [rsp + rbp * 8]
add rbp, 1
jmp .again64
.done64:

hlt

align 16
; 256bytes of random data
.data:
db 0xe0, 0xfc, 0x2b, 0xa1, 0x06, 0x4f, 0x6c, 0xa7, 0x0f, 0x06, 0x6a, 0x1e, 0x7f, 0x76, 0x80, 0x9b
db 0xe0, 0x56, 0xed, 0xaa, 0xf3, 0xc3, 0x68, 0x68, 0xde, 0xe6, 0xe6, 0x94, 0xe2, 0xe9, 0xfc, 0xf0
db 0x6e, 0x35, 0xa8, 0x54, 0xd7, 0xab, 0x8b, 0x6c, 0x77, 0x5f, 0x92, 0xca, 0x25, 0xa6, 0x7e, 0x27
db 0xc7, 0xcd, 0x73, 0xec, 0x95, 0xd6, 0x6f, 0x6a, 0xbb, 0xae, 0xf2, 0xbb, 0x27, 0xb9, 0xa1, 0xdd
db 0x73, 0x4d, 0xd1, 0xc7, 0xd5, 0x2c, 0x31, 0x88, 0xfe, 0xe7, 0xdb, 0xfd, 0x1e, 0x1e, 0x09, 0x7f
db 0x14, 0xfa, 0x4e, 0x95, 0xef, 0xe6, 0x9a, 0xf2, 0xa0, 0x42, 0x62, 0x9a, 0xa4, 0xa8, 0x73, 0x82
db 0x0e, 0x0f, 0x16, 0x82, 0x38, 0x07, 0x12, 0x32, 0x07, 0x35, 0x92, 0xc1, 0x63, 0x07, 0x78, 0xb3
db 0xcb, 0x46, 0x19, 0x57, 0x2b, 0x37, 0x2a, 0x46, 0x1f, 0x04, 0x0e, 0x79, 0x3d, 0xcd, 0x8d, 0xa3
db 0x2b, 0xf3, 0x86, 0x2f, 0xab, 0xba, 0x57, 0x30, 0x2e, 0xd6, 0x2c, 0xf0, 0x46, 0x4f, 0x3f, 0xef
db 0xef, 0xd1, 0xbb, 0x85, 0x34, 0x4b, 0x3c, 0xde, 0x9e, 0x48, 0xa3, 0xb9, 0x8d, 0x71, 0xe3, 0x9d
db 0x09, 0x72, 0xfb, 0xde, 0x8a, 0x32, 0x50, 0x9d, 0x69, 0x98, 0xf1, 0xf6, 0x52, 0xeb, 0xf7, 0xee
db 0xd6, 0x99, 0xc2, 0xff, 0x30, 0x1c, 0x02, 0xce, 0x70, 0x05, 0xb2, 0xf1, 0x56, 0x9c, 0x0e, 0xa6
db 0x18, 0x62, 0xc4, 0xe2, 0x86, 0x38, 0x76, 0x30, 0x2f, 0xa1, 0xe4, 0xa7, 0x0e, 0x5d, 0x53, 0xeb
db 0x14, 0x45, 0xe0, 0xb7, 0xe1, 0xe8, 0x02, 0x68, 0x1a, 0xfe, 0x8e, 0xc1, 0x8f, 0xf2, 0xeb, 0x46
db 0x7f, 0x5d, 0x6a, 0x23, 0x46, 0x97, 0x2e, 0x03, 0x98, 0x12, 0x32, 0x8f, 0x54, 0x76, 0x59, 0xac
db 0xc8, 0x76, 0x5f, 0xc8, 0x71, 0x0c, 0xd3, 0xb6, 0xc5, 0x19, 0xea, 0xab, 0xa6, 0x2c, 0x1d, 0x88

