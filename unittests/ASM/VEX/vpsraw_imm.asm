%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
    "XMM3":  ["0x0000000000000000", "0x0000000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM4":  ["0x0000000000000000", "0x0000000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM5":  ["0x0041004300450047", "0x0051005300550057", "0x0000000000000000", "0x0000000000000000"],
    "XMM6":  ["0x30B131B232B333B4", "0x38B939BA3ABB3BBC", "0x0000000000000000", "0x0000000000000000"],
    "XMM7":  ["0xFFFFFFFFFFFFFFFF", "0x0000000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM8":  ["0x0000000000000000", "0x0000000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM9":  ["0x0000000000000000", "0x0000000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM10": ["0x0041004300450047", "0x0051005300550057", "0x0041004300450047", "0x0051005300550057"],
    "XMM11": ["0x30B131B232B333B4", "0x38B939BA3ABB3BBC", "0x30B131B232B333B4", "0x38B939BA3ABB3BBC"],
    "XMM12": ["0xFFFFFFFFFFFFFFFF", "0x0000000000000000", "0xFFFFFFFFFFFFFFFF", "0x0000000000000000"],
    "XMM13": ["0x0020002100220023", "0x00280029002a002b", "0x0030003100320033", "0x00380039003a003b"]
  },
  "MemoryRegions": {
    "0x100000000": "4096"
  }
}
%endif

lea rdx, [rel .data]

vmovapd ymm0, [rdx + 32 * 0]
vmovapd ymm1, [rdx + 32 * 1]
vmovapd ymm2, [rdx + 32 * 2]
vmovapd ymm13, [rel .data2]

vpsraw xmm3, xmm0, 32
vpsraw xmm4, xmm1, 16
vpsraw xmm5, xmm0, 8
vpsraw xmm6, xmm1, 1
vpsraw xmm7, xmm2, 16

vpsraw ymm8, ymm0, 32
vpsraw ymm9, ymm1, 16
vpsraw ymm10, ymm0, 8
vpsraw ymm11, ymm1, 1
vpsraw ymm12, ymm2, 16
vpsraw ymm13, ymm13, 0x9

hlt

align 32
.data:
dq 0x4142434445464748
dq 0x5152535455565758
dq 0x4142434445464748
dq 0x5152535455565758

dq 0x6162636465666768
dq 0x7172737475767778
dq 0x6162636465666768
dq 0x7172737475767778

dq 0x8000800080008000
dq 0x7000700070007000
dq 0x8000800080008000
dq 0x7000700070007000

.data2:
dq 0x4142434445464748, 0x5152535455565758, 0x6162636465666768, 0x7172737475767778
