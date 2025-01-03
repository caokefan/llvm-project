; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 2
; RUN: llc -mtriple=amdgcn -mcpu=tahiti < %s | FileCheck -check-prefixes=GCN,GFX678,GFX6 %s
; RUN: llc -mtriple=amdgcn -mcpu=hawaii < %s | FileCheck -check-prefixes=GCN,GFX678,GFX7 %s
; RUN: llc -mtriple=amdgcn -mcpu=fiji < %s | FileCheck -check-prefixes=GCN,GFX678,GFX8 %s
; RUN: llc -mtriple=amdgcn -mcpu=gfx900 < %s | FileCheck -check-prefixes=GCN,GFX9 %s
; RUN: llc -mtriple=amdgcn -mcpu=gfx1030 < %s | FileCheck -check-prefixes=GCN,GFX1011,GFX10 %s
; RUN: llc -mtriple=amdgcn -mcpu=gfx1100 -amdgpu-enable-delay-alu=0 < %s | FileCheck -check-prefixes=GCN,GFX1011,GFX11 %s

declare i32 @llvm.get.rounding()

define i32 @func_rounding() {
; GFX678-LABEL: func_rounding:
; GFX678:       ; %bb.0:
; GFX678-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX678-NEXT:    s_getreg_b32 s4, hwreg(HW_REG_MODE, 0, 4)
; GFX678-NEXT:    s_lshl_b32 s6, s4, 2
; GFX678-NEXT:    s_mov_b32 s4, 0xeb24da71
; GFX678-NEXT:    s_mov_b32 s5, 0xc96f385
; GFX678-NEXT:    s_lshr_b64 s[4:5], s[4:5], s6
; GFX678-NEXT:    s_and_b32 s4, s4, 15
; GFX678-NEXT:    s_add_i32 s5, s4, 4
; GFX678-NEXT:    s_cmp_lt_u32 s4, 4
; GFX678-NEXT:    s_cselect_b32 s4, s4, s5
; GFX678-NEXT:    v_mov_b32_e32 v0, s4
; GFX678-NEXT:    s_setpc_b64 s[30:31]
;
; GFX9-LABEL: func_rounding:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_getreg_b32 s4, hwreg(HW_REG_MODE, 0, 4)
; GFX9-NEXT:    s_lshl_b32 s6, s4, 2
; GFX9-NEXT:    s_mov_b32 s4, 0xeb24da71
; GFX9-NEXT:    s_mov_b32 s5, 0xc96f385
; GFX9-NEXT:    s_lshr_b64 s[4:5], s[4:5], s6
; GFX9-NEXT:    s_and_b32 s4, s4, 15
; GFX9-NEXT:    s_add_i32 s5, s4, 4
; GFX9-NEXT:    s_cmp_lt_u32 s4, 4
; GFX9-NEXT:    s_cselect_b32 s4, s4, s5
; GFX9-NEXT:    v_mov_b32_e32 v0, s4
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: func_rounding:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_getreg_b32 s6, hwreg(HW_REG_MODE, 0, 4)
; GFX10-NEXT:    s_mov_b32 s4, 0xeb24da71
; GFX10-NEXT:    s_mov_b32 s5, 0xc96f385
; GFX10-NEXT:    s_lshl_b32 s6, s6, 2
; GFX10-NEXT:    s_lshr_b64 s[4:5], s[4:5], s6
; GFX10-NEXT:    s_and_b32 s4, s4, 15
; GFX10-NEXT:    s_add_i32 s5, s4, 4
; GFX10-NEXT:    s_cmp_lt_u32 s4, 4
; GFX10-NEXT:    s_cselect_b32 s4, s4, s5
; GFX10-NEXT:    v_mov_b32_e32 v0, s4
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: func_rounding:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    s_getreg_b32 s2, hwreg(HW_REG_MODE, 0, 4)
; GFX11-NEXT:    s_mov_b32 s0, 0xeb24da71
; GFX11-NEXT:    s_mov_b32 s1, 0xc96f385
; GFX11-NEXT:    s_lshl_b32 s2, s2, 2
; GFX11-NEXT:    s_lshr_b64 s[0:1], s[0:1], s2
; GFX11-NEXT:    s_and_b32 s0, s0, 15
; GFX11-NEXT:    s_add_i32 s1, s0, 4
; GFX11-NEXT:    s_cmp_lt_u32 s0, 4
; GFX11-NEXT:    s_cselect_b32 s0, s0, s1
; GFX11-NEXT:    v_mov_b32_e32 v0, s0
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  %rounding = call i32 @llvm.get.rounding()
  ret i32 %rounding
}
;; NOTE: These prefixes are unused and the list is autogenerated. Do not add tests below this line:
; GCN: {{.*}}
; GFX1011: {{.*}}
; GFX6: {{.*}}
; GFX7: {{.*}}
; GFX8: {{.*}}
