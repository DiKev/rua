-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 19.2 (Release Build #57)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2019 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from Float_Inv_altera_fp_functions_191_z7i6ldy
-- VHDL created on Fri May 21 17:13:42 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;

library twentynm;
use twentynm.twentynm_components.twentynm_mac;
use twentynm.twentynm_components.twentynm_fp_mac;

entity Float_Inv_altera_fp_functions_191_z7i6ldy is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end Float_Inv_altera_fp_functions_191_z7i6ldy;

architecture normal of Float_Inv_altera_fp_functions_191_z7i6ldy is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid7_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal singX_uid8_fpInverseTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid9_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWF_uid10_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstNaNWF_uid11_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid12_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cst2BiasM1_uid13_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cst2Bias_uid14_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid21_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid22_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid23_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid23_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid24_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid25_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid26_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid27_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid28_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid29_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid30_fpInverseTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal updatedY_uid32_fpInverseTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal y_uid34_fpInverseTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal y_uid34_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCompExt_uid39_fpInverseTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRComp_uid40_fpInverseTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRComp_uid40_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal udf_uid41_fpInverseTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal udf_uid41_fpInverseTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOne_uid43_fpInverseTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRCompYIsOne_uid43_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fxpInverseRes_uid44_fpInverseTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal fxpInverseRes_uid44_fpInverseTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fxpInverseResFrac_uid46_fpInverseTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fxpInverseResFrac_uid46_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRCalc_uid47_fpInverseTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRCalc_uid47_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCalc_uid48_fpInverseTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCalc_uid48_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal xRegAndUdf_uid49_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIOrXRUdf_uid50_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid51_fpInverseTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid52_fpInverseTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid54_fpInverseTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid54_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid55_fpInverseTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid55_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid56_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid57_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid58_fpInverseTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT1_uid72_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeB_uid74_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid74_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid75_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal s1sumAHighB_uid76_invPolyEval_a : STD_LOGIC_VECTOR (20 downto 0);
    signal s1sumAHighB_uid76_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal s1sumAHighB_uid76_invPolyEval_o : STD_LOGIC_VECTOR (20 downto 0);
    signal s1sumAHighB_uid76_invPolyEval_q : STD_LOGIC_VECTOR (20 downto 0);
    signal s1_uid77_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal lowRangeB_uid80_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid80_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid81_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal s2sumAHighB_uid82_invPolyEval_a : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid82_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid82_invPolyEval_o : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid82_invPolyEval_q : STD_LOGIC_VECTOR (29 downto 0);
    signal s2_uid83_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal osig_uid86_pT1_uid73_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid89_pT2_uid79_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid60_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid63_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid66_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_reset : std_logic;
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_qq : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_ena2 : std_logic;
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_reset : std_logic;
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (21 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_ena2 : std_logic;
    signal yAddr_uid36_fpInverseTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid36_fpInverseTest_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_delay_0 : STD_LOGIC_VECTOR (14 downto 0);
    signal redist4_fracXIsZero_uid31_fpInverseTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_fracXIsZero_uid23_fpInverseTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_singX_uid8_fpInverseTest_b_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_reset0 : std_logic;
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_ia : STD_LOGIC_VECTOR (14 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_iq : STD_LOGIC_VECTOR (14 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_i : signal is true;
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_sticky_ena_q : signal is true;
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_mem_reset0 : std_logic;
    signal redist7_expX_uid6_fpInverseTest_b_8_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist7_expX_uid6_fpInverseTest_b_8_rdcnt_i : signal is true;
    signal redist7_expX_uid6_fpInverseTest_b_8_rdcnt_eq : std_logic;
    attribute preserve of redist7_expX_uid6_fpInverseTest_b_8_rdcnt_eq : signal is true;
    signal redist7_expX_uid6_fpInverseTest_b_8_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist7_expX_uid6_fpInverseTest_b_8_sticky_ena_q : signal is true;
    signal redist7_expX_uid6_fpInverseTest_b_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- fracX_uid7_fpInverseTest(BITSELECT,6)@0
    fracX_uid7_fpInverseTest_b <= a(22 downto 0);

    -- cstAllZWF_uid10_fpInverseTest(CONSTANT,9)
    cstAllZWF_uid10_fpInverseTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid23_fpInverseTest(LOGICAL,22)@0 + 1
    fracXIsZero_uid23_fpInverseTest_qi <= "1" WHEN cstAllZWF_uid10_fpInverseTest_q = fracX_uid7_fpInverseTest_b ELSE "0";
    fracXIsZero_uid23_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid23_fpInverseTest_qi, xout => fracXIsZero_uid23_fpInverseTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist5_fracXIsZero_uid23_fpInverseTest_q_8(DELAY,101)
    redist5_fracXIsZero_uid23_fpInverseTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid23_fpInverseTest_q, xout => redist5_fracXIsZero_uid23_fpInverseTest_q_8_q, ena => en(0), clk => clk, aclr => areset );

    -- fracXIsNotZero_uid24_fpInverseTest(LOGICAL,23)@8
    fracXIsNotZero_uid24_fpInverseTest_q <= not (redist5_fracXIsZero_uid23_fpInverseTest_q_8_q);

    -- cstAllOWE_uid9_fpInverseTest(CONSTANT,8)
    cstAllOWE_uid9_fpInverseTest_q <= "11111111";

    -- redist7_expX_uid6_fpInverseTest_b_8_notEnable(LOGICAL,121)
    redist7_expX_uid6_fpInverseTest_b_8_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist7_expX_uid6_fpInverseTest_b_8_nor(LOGICAL,122)
    redist7_expX_uid6_fpInverseTest_b_8_nor_q <= not (redist7_expX_uid6_fpInverseTest_b_8_notEnable_q or redist7_expX_uid6_fpInverseTest_b_8_sticky_ena_q);

    -- redist7_expX_uid6_fpInverseTest_b_8_mem_last(CONSTANT,118)
    redist7_expX_uid6_fpInverseTest_b_8_mem_last_q <= "0100";

    -- redist7_expX_uid6_fpInverseTest_b_8_cmp(LOGICAL,119)
    redist7_expX_uid6_fpInverseTest_b_8_cmp_b <= STD_LOGIC_VECTOR("0" & redist7_expX_uid6_fpInverseTest_b_8_rdmux_q);
    redist7_expX_uid6_fpInverseTest_b_8_cmp_q <= "1" WHEN redist7_expX_uid6_fpInverseTest_b_8_mem_last_q = redist7_expX_uid6_fpInverseTest_b_8_cmp_b ELSE "0";

    -- redist7_expX_uid6_fpInverseTest_b_8_cmpReg(REG,120)
    redist7_expX_uid6_fpInverseTest_b_8_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist7_expX_uid6_fpInverseTest_b_8_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist7_expX_uid6_fpInverseTest_b_8_cmpReg_q <= STD_LOGIC_VECTOR(redist7_expX_uid6_fpInverseTest_b_8_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_expX_uid6_fpInverseTest_b_8_sticky_ena(REG,123)
    redist7_expX_uid6_fpInverseTest_b_8_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist7_expX_uid6_fpInverseTest_b_8_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist7_expX_uid6_fpInverseTest_b_8_nor_q = "1") THEN
                redist7_expX_uid6_fpInverseTest_b_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist7_expX_uid6_fpInverseTest_b_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_expX_uid6_fpInverseTest_b_8_enaAnd(LOGICAL,124)
    redist7_expX_uid6_fpInverseTest_b_8_enaAnd_q <= redist7_expX_uid6_fpInverseTest_b_8_sticky_ena_q and en;

    -- redist7_expX_uid6_fpInverseTest_b_8_rdcnt(COUNTER,115)
    -- low=0, high=5, step=1, init=0
    redist7_expX_uid6_fpInverseTest_b_8_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist7_expX_uid6_fpInverseTest_b_8_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist7_expX_uid6_fpInverseTest_b_8_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist7_expX_uid6_fpInverseTest_b_8_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                    redist7_expX_uid6_fpInverseTest_b_8_rdcnt_eq <= '1';
                ELSE
                    redist7_expX_uid6_fpInverseTest_b_8_rdcnt_eq <= '0';
                END IF;
                IF (redist7_expX_uid6_fpInverseTest_b_8_rdcnt_eq = '1') THEN
                    redist7_expX_uid6_fpInverseTest_b_8_rdcnt_i <= redist7_expX_uid6_fpInverseTest_b_8_rdcnt_i + 3;
                ELSE
                    redist7_expX_uid6_fpInverseTest_b_8_rdcnt_i <= redist7_expX_uid6_fpInverseTest_b_8_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist7_expX_uid6_fpInverseTest_b_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist7_expX_uid6_fpInverseTest_b_8_rdcnt_i, 3)));

    -- redist7_expX_uid6_fpInverseTest_b_8_rdmux(MUX,116)
    redist7_expX_uid6_fpInverseTest_b_8_rdmux_s <= en;
    redist7_expX_uid6_fpInverseTest_b_8_rdmux_combproc: PROCESS (redist7_expX_uid6_fpInverseTest_b_8_rdmux_s, redist7_expX_uid6_fpInverseTest_b_8_wraddr_q, redist7_expX_uid6_fpInverseTest_b_8_rdcnt_q)
    BEGIN
        CASE (redist7_expX_uid6_fpInverseTest_b_8_rdmux_s) IS
            WHEN "0" => redist7_expX_uid6_fpInverseTest_b_8_rdmux_q <= redist7_expX_uid6_fpInverseTest_b_8_wraddr_q;
            WHEN "1" => redist7_expX_uid6_fpInverseTest_b_8_rdmux_q <= redist7_expX_uid6_fpInverseTest_b_8_rdcnt_q;
            WHEN OTHERS => redist7_expX_uid6_fpInverseTest_b_8_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- expX_uid6_fpInverseTest(BITSELECT,5)@0
    expX_uid6_fpInverseTest_b <= a(30 downto 23);

    -- redist7_expX_uid6_fpInverseTest_b_8_wraddr(REG,117)
    redist7_expX_uid6_fpInverseTest_b_8_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist7_expX_uid6_fpInverseTest_b_8_wraddr_q <= "101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist7_expX_uid6_fpInverseTest_b_8_wraddr_q <= STD_LOGIC_VECTOR(redist7_expX_uid6_fpInverseTest_b_8_rdmux_q);
        END IF;
    END PROCESS;

    -- redist7_expX_uid6_fpInverseTest_b_8_mem(DUALMEM,114)
    redist7_expX_uid6_fpInverseTest_b_8_mem_ia <= STD_LOGIC_VECTOR(expX_uid6_fpInverseTest_b);
    redist7_expX_uid6_fpInverseTest_b_8_mem_aa <= redist7_expX_uid6_fpInverseTest_b_8_wraddr_q;
    redist7_expX_uid6_fpInverseTest_b_8_mem_ab <= redist7_expX_uid6_fpInverseTest_b_8_rdmux_q;
    redist7_expX_uid6_fpInverseTest_b_8_mem_reset0 <= areset;
    redist7_expX_uid6_fpInverseTest_b_8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist7_expX_uid6_fpInverseTest_b_8_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => redist7_expX_uid6_fpInverseTest_b_8_mem_reset0,
        clock1 => clk,
        address_a => redist7_expX_uid6_fpInverseTest_b_8_mem_aa,
        data_a => redist7_expX_uid6_fpInverseTest_b_8_mem_ia,
        wren_a => en(0),
        address_b => redist7_expX_uid6_fpInverseTest_b_8_mem_ab,
        q_b => redist7_expX_uid6_fpInverseTest_b_8_mem_iq
    );
    redist7_expX_uid6_fpInverseTest_b_8_mem_q <= redist7_expX_uid6_fpInverseTest_b_8_mem_iq(7 downto 0);

    -- redist7_expX_uid6_fpInverseTest_b_8_outputreg0(DELAY,113)
    redist7_expX_uid6_fpInverseTest_b_8_outputreg0_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist7_expX_uid6_fpInverseTest_b_8_outputreg0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist7_expX_uid6_fpInverseTest_b_8_outputreg0_q <= STD_LOGIC_VECTOR(redist7_expX_uid6_fpInverseTest_b_8_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- expXIsMax_uid22_fpInverseTest(LOGICAL,21)@8
    expXIsMax_uid22_fpInverseTest_q <= "1" WHEN redist7_expX_uid6_fpInverseTest_b_8_outputreg0_q = cstAllOWE_uid9_fpInverseTest_q ELSE "0";

    -- excN_x_uid26_fpInverseTest(LOGICAL,25)@8
    excN_x_uid26_fpInverseTest_q <= expXIsMax_uid22_fpInverseTest_q and fracXIsNotZero_uid24_fpInverseTest_q;

    -- invExcRNaN_uid56_fpInverseTest(LOGICAL,55)@8
    invExcRNaN_uid56_fpInverseTest_q <= not (excN_x_uid26_fpInverseTest_q);

    -- singX_uid8_fpInverseTest(BITSELECT,7)@0
    singX_uid8_fpInverseTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist6_singX_uid8_fpInverseTest_b_8(DELAY,102)
    redist6_singX_uid8_fpInverseTest_b_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => singX_uid8_fpInverseTest_b, xout => redist6_singX_uid8_fpInverseTest_b_8_q, ena => en(0), clk => clk, aclr => areset );

    -- signR_uid57_fpInverseTest(LOGICAL,56)@8
    signR_uid57_fpInverseTest_q <= redist6_singX_uid8_fpInverseTest_b_8_q and invExcRNaN_uid56_fpInverseTest_q;

    -- cst2Bias_uid14_fpInverseTest(CONSTANT,13)
    cst2Bias_uid14_fpInverseTest_q <= "11111110";

    -- expRCompYIsOneExt_uid42_fpInverseTest(SUB,41)@8
    expRCompYIsOneExt_uid42_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid14_fpInverseTest_q);
    expRCompYIsOneExt_uid42_fpInverseTest_b <= STD_LOGIC_VECTOR("0" & redist7_expX_uid6_fpInverseTest_b_8_outputreg0_q);
    expRCompYIsOneExt_uid42_fpInverseTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid42_fpInverseTest_a) - UNSIGNED(expRCompYIsOneExt_uid42_fpInverseTest_b));
    expRCompYIsOneExt_uid42_fpInverseTest_q <= expRCompYIsOneExt_uid42_fpInverseTest_o(8 downto 0);

    -- expRCompYIsOne_uid43_fpInverseTest(BITSELECT,42)@8
    expRCompYIsOne_uid43_fpInverseTest_in <= expRCompYIsOneExt_uid42_fpInverseTest_q(7 downto 0);
    expRCompYIsOne_uid43_fpInverseTest_b <= expRCompYIsOne_uid43_fpInverseTest_in(7 downto 0);

    -- cst2BiasM1_uid13_fpInverseTest(CONSTANT,12)
    cst2BiasM1_uid13_fpInverseTest_q <= "11111101";

    -- expRCompExt_uid39_fpInverseTest(SUB,38)@8
    expRCompExt_uid39_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid13_fpInverseTest_q);
    expRCompExt_uid39_fpInverseTest_b <= STD_LOGIC_VECTOR("0" & redist7_expX_uid6_fpInverseTest_b_8_outputreg0_q);
    expRCompExt_uid39_fpInverseTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid39_fpInverseTest_a) - UNSIGNED(expRCompExt_uid39_fpInverseTest_b));
    expRCompExt_uid39_fpInverseTest_q <= expRCompExt_uid39_fpInverseTest_o(8 downto 0);

    -- expRComp_uid40_fpInverseTest(BITSELECT,39)@8
    expRComp_uid40_fpInverseTest_in <= expRCompExt_uid39_fpInverseTest_q(7 downto 0);
    expRComp_uid40_fpInverseTest_b <= expRComp_uid40_fpInverseTest_in(7 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- updatedY_uid32_fpInverseTest(BITJOIN,31)@0
    updatedY_uid32_fpInverseTest_q <= GND_q & cstAllZWF_uid10_fpInverseTest_q;

    -- fracXIsZero_uid31_fpInverseTest(LOGICAL,32)@0 + 1
    fracXIsZero_uid31_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & fracX_uid7_fpInverseTest_b);
    fracXIsZero_uid31_fpInverseTest_qi <= "1" WHEN fracXIsZero_uid31_fpInverseTest_a = updatedY_uid32_fpInverseTest_q ELSE "0";
    fracXIsZero_uid31_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid31_fpInverseTest_qi, xout => fracXIsZero_uid31_fpInverseTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist4_fracXIsZero_uid31_fpInverseTest_q_8(DELAY,100)
    redist4_fracXIsZero_uid31_fpInverseTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid31_fpInverseTest_q, xout => redist4_fracXIsZero_uid31_fpInverseTest_q_8_q, ena => en(0), clk => clk, aclr => areset );

    -- expRCalc_uid48_fpInverseTest(MUX,47)@8
    expRCalc_uid48_fpInverseTest_s <= redist4_fracXIsZero_uid31_fpInverseTest_q_8_q;
    expRCalc_uid48_fpInverseTest_combproc: PROCESS (expRCalc_uid48_fpInverseTest_s, en, expRComp_uid40_fpInverseTest_b, expRCompYIsOne_uid43_fpInverseTest_b)
    BEGIN
        CASE (expRCalc_uid48_fpInverseTest_s) IS
            WHEN "0" => expRCalc_uid48_fpInverseTest_q <= expRComp_uid40_fpInverseTest_b;
            WHEN "1" => expRCalc_uid48_fpInverseTest_q <= expRCompYIsOne_uid43_fpInverseTest_b;
            WHEN OTHERS => expRCalc_uid48_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstAllZWE_uid12_fpInverseTest(CONSTANT,11)
    cstAllZWE_uid12_fpInverseTest_q <= "00000000";

    -- excZ_x_uid21_fpInverseTest(LOGICAL,20)@8
    excZ_x_uid21_fpInverseTest_q <= "1" WHEN redist7_expX_uid6_fpInverseTest_b_8_outputreg0_q = cstAllZWE_uid12_fpInverseTest_q ELSE "0";

    -- udf_uid41_fpInverseTest(BITSELECT,40)@8
    udf_uid41_fpInverseTest_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => expRCompExt_uid39_fpInverseTest_q(8)) & expRCompExt_uid39_fpInverseTest_q));
    udf_uid41_fpInverseTest_b <= STD_LOGIC_VECTOR(udf_uid41_fpInverseTest_in(9 downto 9));

    -- invExpXIsMax_uid27_fpInverseTest(LOGICAL,26)@8
    invExpXIsMax_uid27_fpInverseTest_q <= not (expXIsMax_uid22_fpInverseTest_q);

    -- InvExpXIsZero_uid28_fpInverseTest(LOGICAL,27)@8
    InvExpXIsZero_uid28_fpInverseTest_q <= not (excZ_x_uid21_fpInverseTest_q);

    -- excR_x_uid29_fpInverseTest(LOGICAL,28)@8
    excR_x_uid29_fpInverseTest_q <= InvExpXIsZero_uid28_fpInverseTest_q and invExpXIsMax_uid27_fpInverseTest_q;

    -- xRegAndUdf_uid49_fpInverseTest(LOGICAL,48)@8
    xRegAndUdf_uid49_fpInverseTest_q <= excR_x_uid29_fpInverseTest_q and udf_uid41_fpInverseTest_b;

    -- excI_x_uid25_fpInverseTest(LOGICAL,24)@8
    excI_x_uid25_fpInverseTest_q <= expXIsMax_uid22_fpInverseTest_q and redist5_fracXIsZero_uid23_fpInverseTest_q_8_q;

    -- xIOrXRUdf_uid50_fpInverseTest(LOGICAL,49)@8
    xIOrXRUdf_uid50_fpInverseTest_q <= excI_x_uid25_fpInverseTest_q or xRegAndUdf_uid49_fpInverseTest_q;

    -- excSelBits_uid51_fpInverseTest(BITJOIN,50)@8
    excSelBits_uid51_fpInverseTest_q <= excN_x_uid26_fpInverseTest_q & excZ_x_uid21_fpInverseTest_q & xIOrXRUdf_uid50_fpInverseTest_q;

    -- outMuxSelEnc_uid52_fpInverseTest(LOOKUP,51)@8
    outMuxSelEnc_uid52_fpInverseTest_combproc: PROCESS (excSelBits_uid51_fpInverseTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excSelBits_uid51_fpInverseTest_q) IS
            WHEN "000" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "001" => outMuxSelEnc_uid52_fpInverseTest_q <= "00";
            WHEN "010" => outMuxSelEnc_uid52_fpInverseTest_q <= "10";
            WHEN "011" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "100" => outMuxSelEnc_uid52_fpInverseTest_q <= "11";
            WHEN "101" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "110" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "111" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN OTHERS => -- unreachable
                           outMuxSelEnc_uid52_fpInverseTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid55_fpInverseTest(MUX,54)@8
    expRPostExc_uid55_fpInverseTest_s <= outMuxSelEnc_uid52_fpInverseTest_q;
    expRPostExc_uid55_fpInverseTest_combproc: PROCESS (expRPostExc_uid55_fpInverseTest_s, en, cstAllZWE_uid12_fpInverseTest_q, expRCalc_uid48_fpInverseTest_q, cstAllOWE_uid9_fpInverseTest_q)
    BEGIN
        CASE (expRPostExc_uid55_fpInverseTest_s) IS
            WHEN "00" => expRPostExc_uid55_fpInverseTest_q <= cstAllZWE_uid12_fpInverseTest_q;
            WHEN "01" => expRPostExc_uid55_fpInverseTest_q <= expRCalc_uid48_fpInverseTest_q;
            WHEN "10" => expRPostExc_uid55_fpInverseTest_q <= cstAllOWE_uid9_fpInverseTest_q;
            WHEN "11" => expRPostExc_uid55_fpInverseTest_q <= cstAllOWE_uid9_fpInverseTest_q;
            WHEN OTHERS => expRPostExc_uid55_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstNaNWF_uid11_fpInverseTest(CONSTANT,10)
    cstNaNWF_uid11_fpInverseTest_q <= "00000000000000000000001";

    -- oFracX_uid30_fpInverseTest(BITJOIN,29)@0
    oFracX_uid30_fpInverseTest_q <= VCC_q & fracX_uid7_fpInverseTest_b;

    -- y_uid34_fpInverseTest(BITSELECT,33)@0
    y_uid34_fpInverseTest_in <= oFracX_uid30_fpInverseTest_q(22 downto 0);
    y_uid34_fpInverseTest_b <= y_uid34_fpInverseTest_in(22 downto 0);

    -- yAddr_uid36_fpInverseTest_merged_bit_select(BITSELECT,95)@0
    yAddr_uid36_fpInverseTest_merged_bit_select_b <= y_uid34_fpInverseTest_b(22 downto 15);
    yAddr_uid36_fpInverseTest_merged_bit_select_c <= y_uid34_fpInverseTest_b(14 downto 0);

    -- memoryC2_uid66_inverseTables_lutmem(DUALMEM,92)@0 + 2
    -- in j@20000000
    memoryC2_uid66_inverseTables_lutmem_aa <= yAddr_uid36_fpInverseTest_merged_bit_select_b;
    memoryC2_uid66_inverseTables_lutmem_reset0 <= areset;
    memoryC2_uid66_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Inv_altera_fp_functions_191_z7i6ldy_memoryC2_uid66_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC2_uid66_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid66_inverseTables_lutmem_aa,
        q_a => memoryC2_uid66_inverseTables_lutmem_ir
    );
    memoryC2_uid66_inverseTables_lutmem_r <= memoryC2_uid66_inverseTables_lutmem_ir(11 downto 0);

    -- redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2(DELAY,98)
    redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_delay_0 <= (others => '0');
            redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid36_fpInverseTest_merged_bit_select_c);
                redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q <= redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- yT1_uid72_invPolyEval(BITSELECT,71)@2
    yT1_uid72_invPolyEval_b <= redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q(14 downto 3);

    -- prodXY_uid85_pT1_uid73_invPolyEval_cma(CHAINMULTADD,93)@2 + 3
    prodXY_uid85_pT1_uid73_invPolyEval_cma_reset <= areset;
    prodXY_uid85_pT1_uid73_invPolyEval_cma_ena0 <= en(0);
    prodXY_uid85_pT1_uid73_invPolyEval_cma_ena1 <= prodXY_uid85_pT1_uid73_invPolyEval_cma_ena0;
    prodXY_uid85_pT1_uid73_invPolyEval_cma_ena2 <= prodXY_uid85_pT1_uid73_invPolyEval_cma_ena0;

    prodXY_uid85_pT1_uid73_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(yT1_uid72_invPolyEval_b),12));
    prodXY_uid85_pT1_uid73_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(memoryC2_uid66_inverseTables_lutmem_r),12));
    prodXY_uid85_pT1_uid73_invPolyEval_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 12,
        ax_clock => "0",
        ax_width => 12,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 24
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid85_pT1_uid73_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid85_pT1_uid73_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid85_pT1_uid73_invPolyEval_cma_ena2,
        aclr(0) => prodXY_uid85_pT1_uid73_invPolyEval_cma_reset,
        aclr(1) => prodXY_uid85_pT1_uid73_invPolyEval_cma_reset,
        ay => prodXY_uid85_pT1_uid73_invPolyEval_cma_a0,
        ax => prodXY_uid85_pT1_uid73_invPolyEval_cma_c0,
        resulta => prodXY_uid85_pT1_uid73_invPolyEval_cma_s0
    );
    prodXY_uid85_pT1_uid73_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid85_pT1_uid73_invPolyEval_cma_s0, xout => prodXY_uid85_pT1_uid73_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid85_pT1_uid73_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid85_pT1_uid73_invPolyEval_cma_qq(23 downto 0));

    -- osig_uid86_pT1_uid73_invPolyEval(BITSELECT,85)@5
    osig_uid86_pT1_uid73_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid85_pT1_uid73_invPolyEval_cma_q(23 downto 11));

    -- highBBits_uid75_invPolyEval(BITSELECT,74)@5
    highBBits_uid75_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid86_pT1_uid73_invPolyEval_b(12 downto 1));

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3(DELAY,96)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_delay_0 <= (others => '0');
            redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_delay_1 <= (others => '0');
            redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid36_fpInverseTest_merged_bit_select_b);
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_delay_1 <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_delay_0;
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_q <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid63_inverseTables_lutmem(DUALMEM,91)@3 + 2
    -- in j@20000000
    memoryC1_uid63_inverseTables_lutmem_aa <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_q;
    memoryC1_uid63_inverseTables_lutmem_reset0 <= areset;
    memoryC1_uid63_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Inv_altera_fp_functions_191_z7i6ldy_memoryC1_uid63_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC1_uid63_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid63_inverseTables_lutmem_aa,
        q_a => memoryC1_uid63_inverseTables_lutmem_ir
    );
    memoryC1_uid63_inverseTables_lutmem_r <= memoryC1_uid63_inverseTables_lutmem_ir(19 downto 0);

    -- s1sumAHighB_uid76_invPolyEval(ADD,75)@5
    s1sumAHighB_uid76_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => memoryC1_uid63_inverseTables_lutmem_r(19)) & memoryC1_uid63_inverseTables_lutmem_r));
    s1sumAHighB_uid76_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 12 => highBBits_uid75_invPolyEval_b(11)) & highBBits_uid75_invPolyEval_b));
    s1sumAHighB_uid76_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid76_invPolyEval_a) + SIGNED(s1sumAHighB_uid76_invPolyEval_b));
    s1sumAHighB_uid76_invPolyEval_q <= s1sumAHighB_uid76_invPolyEval_o(20 downto 0);

    -- lowRangeB_uid74_invPolyEval(BITSELECT,73)@5
    lowRangeB_uid74_invPolyEval_in <= osig_uid86_pT1_uid73_invPolyEval_b(0 downto 0);
    lowRangeB_uid74_invPolyEval_b <= lowRangeB_uid74_invPolyEval_in(0 downto 0);

    -- s1_uid77_invPolyEval(BITJOIN,76)@5
    s1_uid77_invPolyEval_q <= s1sumAHighB_uid76_invPolyEval_q & lowRangeB_uid74_invPolyEval_b;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_notEnable(LOGICAL,109)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_nor(LOGICAL,110)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_nor_q <= not (redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_notEnable_q or redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_sticky_ena_q);

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_cmpReg(REG,108)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_sticky_ena(REG,111)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_nor_q = "1") THEN
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_enaAnd(LOGICAL,112)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_enaAnd_q <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_sticky_ena_q and en;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt(COUNTER,105)
    -- low=0, high=1, step=1, init=0
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_i <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_i, 1)));

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux(MUX,106)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_s <= en;
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_combproc: PROCESS (redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_s, redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_wraddr_q, redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_q)
    BEGIN
        CASE (redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_s) IS
            WHEN "0" => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_q <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_wraddr_q;
            WHEN "1" => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_q <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdcnt_q;
            WHEN OTHERS => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_wraddr(REG,107)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_wraddr_q <= STD_LOGIC_VECTOR(redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_q);
        END IF;
    END PROCESS;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem(DUALMEM,104)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_ia <= STD_LOGIC_VECTOR(redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q);
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_aa <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_wraddr_q;
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_ab <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_rdmux_q;
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_reset0 <= areset;
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 15,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_reset0,
        clock1 => clk,
        address_a => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_aa,
        data_a => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_ia,
        wren_a => en(0),
        address_b => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_ab,
        q_b => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_iq
    );
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_q <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_iq(14 downto 0);

    -- prodXY_uid88_pT2_uid79_invPolyEval_cma(CHAINMULTADD,94)@5 + 3
    prodXY_uid88_pT2_uid79_invPolyEval_cma_reset <= areset;
    prodXY_uid88_pT2_uid79_invPolyEval_cma_ena0 <= en(0);
    prodXY_uid88_pT2_uid79_invPolyEval_cma_ena1 <= prodXY_uid88_pT2_uid79_invPolyEval_cma_ena0;
    prodXY_uid88_pT2_uid79_invPolyEval_cma_ena2 <= prodXY_uid88_pT2_uid79_invPolyEval_cma_ena0;

    prodXY_uid88_pT2_uid79_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_mem_q),15));
    prodXY_uid88_pT2_uid79_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(s1_uid77_invPolyEval_q),22));
    prodXY_uid88_pT2_uid79_invPolyEval_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 15,
        ax_clock => "0",
        ax_width => 22,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 37
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid88_pT2_uid79_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid88_pT2_uid79_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid88_pT2_uid79_invPolyEval_cma_ena2,
        aclr(0) => prodXY_uid88_pT2_uid79_invPolyEval_cma_reset,
        aclr(1) => prodXY_uid88_pT2_uid79_invPolyEval_cma_reset,
        ay => prodXY_uid88_pT2_uid79_invPolyEval_cma_a0,
        ax => prodXY_uid88_pT2_uid79_invPolyEval_cma_c0,
        resulta => prodXY_uid88_pT2_uid79_invPolyEval_cma_s0
    );
    prodXY_uid88_pT2_uid79_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid88_pT2_uid79_invPolyEval_cma_s0, xout => prodXY_uid88_pT2_uid79_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid88_pT2_uid79_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid88_pT2_uid79_invPolyEval_cma_qq(36 downto 0));

    -- osig_uid89_pT2_uid79_invPolyEval(BITSELECT,88)@8
    osig_uid89_pT2_uid79_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid88_pT2_uid79_invPolyEval_cma_q(36 downto 14));

    -- highBBits_uid81_invPolyEval(BITSELECT,80)@8
    highBBits_uid81_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid89_pT2_uid79_invPolyEval_b(22 downto 2));

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6(DELAY,97)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_delay_0 <= (others => '0');
            redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_delay_1 <= (others => '0');
            redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_delay_0 <= STD_LOGIC_VECTOR(redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_3_q);
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_delay_1 <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_delay_0;
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_q <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid60_inverseTables_lutmem(DUALMEM,90)@6 + 2
    -- in j@20000000
    memoryC0_uid60_inverseTables_lutmem_aa <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_6_q;
    memoryC0_uid60_inverseTables_lutmem_reset0 <= areset;
    memoryC0_uid60_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 29,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Inv_altera_fp_functions_191_z7i6ldy_memoryC0_uid60_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC0_uid60_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid60_inverseTables_lutmem_aa,
        q_a => memoryC0_uid60_inverseTables_lutmem_ir
    );
    memoryC0_uid60_inverseTables_lutmem_r <= memoryC0_uid60_inverseTables_lutmem_ir(28 downto 0);

    -- s2sumAHighB_uid82_invPolyEval(ADD,81)@8
    s2sumAHighB_uid82_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid60_inverseTables_lutmem_r(28)) & memoryC0_uid60_inverseTables_lutmem_r));
    s2sumAHighB_uid82_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 21 => highBBits_uid81_invPolyEval_b(20)) & highBBits_uid81_invPolyEval_b));
    s2sumAHighB_uid82_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid82_invPolyEval_a) + SIGNED(s2sumAHighB_uid82_invPolyEval_b));
    s2sumAHighB_uid82_invPolyEval_q <= s2sumAHighB_uid82_invPolyEval_o(29 downto 0);

    -- lowRangeB_uid80_invPolyEval(BITSELECT,79)@8
    lowRangeB_uid80_invPolyEval_in <= osig_uid89_pT2_uid79_invPolyEval_b(1 downto 0);
    lowRangeB_uid80_invPolyEval_b <= lowRangeB_uid80_invPolyEval_in(1 downto 0);

    -- s2_uid83_invPolyEval(BITJOIN,82)@8
    s2_uid83_invPolyEval_q <= s2sumAHighB_uid82_invPolyEval_q & lowRangeB_uid80_invPolyEval_b;

    -- fxpInverseRes_uid44_fpInverseTest(BITSELECT,43)@8
    fxpInverseRes_uid44_fpInverseTest_in <= s2_uid83_invPolyEval_q(28 downto 0);
    fxpInverseRes_uid44_fpInverseTest_b <= fxpInverseRes_uid44_fpInverseTest_in(28 downto 5);

    -- fxpInverseResFrac_uid46_fpInverseTest(BITSELECT,45)@8
    fxpInverseResFrac_uid46_fpInverseTest_in <= fxpInverseRes_uid44_fpInverseTest_b(22 downto 0);
    fxpInverseResFrac_uid46_fpInverseTest_b <= fxpInverseResFrac_uid46_fpInverseTest_in(22 downto 0);

    -- fracRCalc_uid47_fpInverseTest(MUX,46)@8
    fracRCalc_uid47_fpInverseTest_s <= redist4_fracXIsZero_uid31_fpInverseTest_q_8_q;
    fracRCalc_uid47_fpInverseTest_combproc: PROCESS (fracRCalc_uid47_fpInverseTest_s, en, fxpInverseResFrac_uid46_fpInverseTest_b, cstAllZWF_uid10_fpInverseTest_q)
    BEGIN
        CASE (fracRCalc_uid47_fpInverseTest_s) IS
            WHEN "0" => fracRCalc_uid47_fpInverseTest_q <= fxpInverseResFrac_uid46_fpInverseTest_b;
            WHEN "1" => fracRCalc_uid47_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
            WHEN OTHERS => fracRCalc_uid47_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid54_fpInverseTest(MUX,53)@8
    fracRPostExc_uid54_fpInverseTest_s <= outMuxSelEnc_uid52_fpInverseTest_q;
    fracRPostExc_uid54_fpInverseTest_combproc: PROCESS (fracRPostExc_uid54_fpInverseTest_s, en, cstAllZWF_uid10_fpInverseTest_q, fracRCalc_uid47_fpInverseTest_q, cstNaNWF_uid11_fpInverseTest_q)
    BEGIN
        CASE (fracRPostExc_uid54_fpInverseTest_s) IS
            WHEN "00" => fracRPostExc_uid54_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
            WHEN "01" => fracRPostExc_uid54_fpInverseTest_q <= fracRCalc_uid47_fpInverseTest_q;
            WHEN "10" => fracRPostExc_uid54_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
            WHEN "11" => fracRPostExc_uid54_fpInverseTest_q <= cstNaNWF_uid11_fpInverseTest_q;
            WHEN OTHERS => fracRPostExc_uid54_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid58_fpInverseTest(BITJOIN,57)@8
    R_uid58_fpInverseTest_q <= signR_uid57_fpInverseTest_q & expRPostExc_uid55_fpInverseTest_q & fracRPostExc_uid54_fpInverseTest_q;

    -- xOut(GPOUT,4)@8
    q <= R_uid58_fpInverseTest_q;

END normal;
