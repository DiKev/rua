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

-- VHDL created from Float_Div_altera_fp_functions_191_vr3lzay
-- VHDL created on Fri May 21 17:13:47 2021


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

entity Float_Div_altera_fp_functions_191_vr3lzay is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end Float_Div_altera_fp_functions_191_vr3lzay;

architecture normal of Float_Div_altera_fp_functions_191_vr3lzay is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBiasM1_uid6_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expX_uid9_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid10_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid11_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expY_uid12_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracY_uid13_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signY_uid14_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal paddingY_uid15_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal updatedY_uid16_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid18_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid20_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid23_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid23_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid27_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid28_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid41_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid42_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid47_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid48_fpDivTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal yAddr_uid51_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal yPE_uid52_fpDivTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracYPostZ_uid56_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYPostZ_uid56_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid58_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oFracXSE_bottomExtension_uid61_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oFracXSE_mergedSignalTM_uid63_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal divValPreNormTrunc_uid66_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormTrunc_uid66_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal norm_uid67_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid68_fpDivTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal divValPreNormHigh_uid68_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormLow_uid69_fpDivTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormLow_uid69_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal normFracRnd_uid70_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid70_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracRnd_uid71_fpDivTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndOp_uid75_fpDivTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal fracRPreExc_uid78_fpDivTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid78_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excRPreExc_uid79_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal excRPreExc_uid79_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRExt_uid80_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid81_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid84_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid85_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid86_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid87_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid88_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid89_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid90_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid91_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid92_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid93_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid94_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid95_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid96_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid98_fpDivTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid99_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid100_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid103_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid103_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid107_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid107_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid108_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid109_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid110_fpDivTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT1_uid124_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeB_uid126_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid126_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid127_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_a : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_o : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal s1_uid129_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid132_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid132_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid133_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal s2_uid135_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal osig_uid141_pT1_uid125_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid144_pT2_uid131_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC0_uid112_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid112_invTables_lutmem_ia : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC0_uid112_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid112_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid112_invTables_lutmem_ir : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC0_uid112_invTables_lutmem_r : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC1_uid115_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid115_invTables_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid115_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid115_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid115_invTables_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid115_invTables_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid118_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid118_invTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid118_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid118_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid118_invTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid118_invTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset : std_logic;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0 : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s0 : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0 : std_logic;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena1 : std_logic;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena2 : std_logic;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_reset : std_logic;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_qq : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ena2 : std_logic;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_reset : std_logic;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (22 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ena2 : std_logic;
    signal invY_uid54_fpDivTest_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal invY_uid54_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (25 downto 0);
    signal invY_uid54_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_lOAdded_uid58_fpDivTest_q_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist0_lOAdded_uid58_fpDivTest_q_3_delay_0 : STD_LOGIC_VECTOR (23 downto 0);
    signal redist0_lOAdded_uid58_fpDivTest_q_3_delay_1 : STD_LOGIC_VECTOR (23 downto 0);
    signal redist1_fracYPostZ_uid56_fpDivTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_fracYPostZ_uid56_fpDivTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_yPE_uid52_fpDivTest_b_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist2_yPE_uid52_fpDivTest_b_2_delay_0 : STD_LOGIC_VECTOR (13 downto 0);
    signal redist3_yPE_uid52_fpDivTest_b_5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist3_yPE_uid52_fpDivTest_b_5_delay_0 : STD_LOGIC_VECTOR (13 downto 0);
    signal redist3_yPE_uid52_fpDivTest_b_5_delay_1 : STD_LOGIC_VECTOR (13 downto 0);
    signal redist4_yAddr_uid51_fpDivTest_b_3_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist4_yAddr_uid51_fpDivTest_b_3_delay_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist4_yAddr_uid51_fpDivTest_b_3_delay_1 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist5_yAddr_uid51_fpDivTest_b_6_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist5_yAddr_uid51_fpDivTest_b_6_delay_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist5_yAddr_uid51_fpDivTest_b_6_delay_1 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist7_signR_uid46_fpDivTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_fracXIsZero_uid39_fpDivTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_expXIsMax_uid38_fpDivTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_excZ_y_uid37_fpDivTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fracXIsZero_uid25_fpDivTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fracXIsZero_uid25_fpDivTest_q_4_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fracXIsZero_uid25_fpDivTest_q_4_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_expXIsMax_uid24_fpDivTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_excZ_x_uid23_fpDivTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_fracYZero_uid15_fpDivTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_outputreg0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_mem_reset0 : std_logic;
    signal redist6_expXmY_uid47_fpDivTest_q_11_mem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_mem_iq : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_mem_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_i : signal is true;
    signal redist6_expXmY_uid47_fpDivTest_q_11_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expXmY_uid47_fpDivTest_q_11_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist6_expXmY_uid47_fpDivTest_q_11_sticky_ena_q : signal is true;
    signal redist6_expXmY_uid47_fpDivTest_q_11_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_mem_reset0 : std_logic;
    signal redist15_fracX_uid10_fpDivTest_b_8_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist15_fracX_uid10_fpDivTest_b_8_rdcnt_i : signal is true;
    signal redist15_fracX_uid10_fpDivTest_b_8_rdcnt_eq : std_logic;
    attribute preserve of redist15_fracX_uid10_fpDivTest_b_8_rdcnt_eq : signal is true;
    signal redist15_fracX_uid10_fpDivTest_b_8_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracX_uid10_fpDivTest_b_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist15_fracX_uid10_fpDivTest_b_8_sticky_ena_q : signal is true;
    signal redist15_fracX_uid10_fpDivTest_b_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- fracY_uid13_fpDivTest(BITSELECT,12)@0
    fracY_uid13_fpDivTest_b <= b(22 downto 0);

    -- paddingY_uid15_fpDivTest(CONSTANT,14)
    paddingY_uid15_fpDivTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid39_fpDivTest(LOGICAL,38)@0 + 1
    fracXIsZero_uid39_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = fracY_uid13_fpDivTest_b ELSE "0";
    fracXIsZero_uid39_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_qi, xout => fracXIsZero_uid39_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist8_fracXIsZero_uid39_fpDivTest_q_12(DELAY,160)
    redist8_fracXIsZero_uid39_fpDivTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_q, xout => redist8_fracXIsZero_uid39_fpDivTest_q_12_q, ena => en(0), clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpDivTest(CONSTANT,17)
    cstAllOWE_uid18_fpDivTest_q <= "11111111";

    -- expY_uid12_fpDivTest(BITSELECT,11)@0
    expY_uid12_fpDivTest_b <= b(30 downto 23);

    -- expXIsMax_uid38_fpDivTest(LOGICAL,37)@0 + 1
    expXIsMax_uid38_fpDivTest_qi <= "1" WHEN expY_uid12_fpDivTest_b = cstAllOWE_uid18_fpDivTest_q ELSE "0";
    expXIsMax_uid38_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_qi, xout => expXIsMax_uid38_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist9_expXIsMax_uid38_fpDivTest_q_12(DELAY,161)
    redist9_expXIsMax_uid38_fpDivTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_q, xout => redist9_expXIsMax_uid38_fpDivTest_q_12_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_y_uid41_fpDivTest(LOGICAL,40)@12
    excI_y_uid41_fpDivTest_q <= redist9_expXIsMax_uid38_fpDivTest_q_12_q and redist8_fracXIsZero_uid39_fpDivTest_q_12_q;

    -- redist15_fracX_uid10_fpDivTest_b_8_notEnable(LOGICAL,187)
    redist15_fracX_uid10_fpDivTest_b_8_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist15_fracX_uid10_fpDivTest_b_8_nor(LOGICAL,188)
    redist15_fracX_uid10_fpDivTest_b_8_nor_q <= not (redist15_fracX_uid10_fpDivTest_b_8_notEnable_q or redist15_fracX_uid10_fpDivTest_b_8_sticky_ena_q);

    -- redist15_fracX_uid10_fpDivTest_b_8_mem_last(CONSTANT,184)
    redist15_fracX_uid10_fpDivTest_b_8_mem_last_q <= "0101";

    -- redist15_fracX_uid10_fpDivTest_b_8_cmp(LOGICAL,185)
    redist15_fracX_uid10_fpDivTest_b_8_cmp_b <= STD_LOGIC_VECTOR("0" & redist15_fracX_uid10_fpDivTest_b_8_rdmux_q);
    redist15_fracX_uid10_fpDivTest_b_8_cmp_q <= "1" WHEN redist15_fracX_uid10_fpDivTest_b_8_mem_last_q = redist15_fracX_uid10_fpDivTest_b_8_cmp_b ELSE "0";

    -- redist15_fracX_uid10_fpDivTest_b_8_cmpReg(REG,186)
    redist15_fracX_uid10_fpDivTest_b_8_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_fracX_uid10_fpDivTest_b_8_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist15_fracX_uid10_fpDivTest_b_8_cmpReg_q <= STD_LOGIC_VECTOR(redist15_fracX_uid10_fpDivTest_b_8_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_fracX_uid10_fpDivTest_b_8_sticky_ena(REG,189)
    redist15_fracX_uid10_fpDivTest_b_8_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_fracX_uid10_fpDivTest_b_8_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_fracX_uid10_fpDivTest_b_8_nor_q = "1") THEN
                redist15_fracX_uid10_fpDivTest_b_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist15_fracX_uid10_fpDivTest_b_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_fracX_uid10_fpDivTest_b_8_enaAnd(LOGICAL,190)
    redist15_fracX_uid10_fpDivTest_b_8_enaAnd_q <= redist15_fracX_uid10_fpDivTest_b_8_sticky_ena_q and en;

    -- redist15_fracX_uid10_fpDivTest_b_8_rdcnt(COUNTER,181)
    -- low=0, high=6, step=1, init=0
    redist15_fracX_uid10_fpDivTest_b_8_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_fracX_uid10_fpDivTest_b_8_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist15_fracX_uid10_fpDivTest_b_8_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist15_fracX_uid10_fpDivTest_b_8_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                    redist15_fracX_uid10_fpDivTest_b_8_rdcnt_eq <= '1';
                ELSE
                    redist15_fracX_uid10_fpDivTest_b_8_rdcnt_eq <= '0';
                END IF;
                IF (redist15_fracX_uid10_fpDivTest_b_8_rdcnt_eq = '1') THEN
                    redist15_fracX_uid10_fpDivTest_b_8_rdcnt_i <= redist15_fracX_uid10_fpDivTest_b_8_rdcnt_i + 2;
                ELSE
                    redist15_fracX_uid10_fpDivTest_b_8_rdcnt_i <= redist15_fracX_uid10_fpDivTest_b_8_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist15_fracX_uid10_fpDivTest_b_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist15_fracX_uid10_fpDivTest_b_8_rdcnt_i, 3)));

    -- redist15_fracX_uid10_fpDivTest_b_8_rdmux(MUX,182)
    redist15_fracX_uid10_fpDivTest_b_8_rdmux_s <= en;
    redist15_fracX_uid10_fpDivTest_b_8_rdmux_combproc: PROCESS (redist15_fracX_uid10_fpDivTest_b_8_rdmux_s, redist15_fracX_uid10_fpDivTest_b_8_wraddr_q, redist15_fracX_uid10_fpDivTest_b_8_rdcnt_q)
    BEGIN
        CASE (redist15_fracX_uid10_fpDivTest_b_8_rdmux_s) IS
            WHEN "0" => redist15_fracX_uid10_fpDivTest_b_8_rdmux_q <= redist15_fracX_uid10_fpDivTest_b_8_wraddr_q;
            WHEN "1" => redist15_fracX_uid10_fpDivTest_b_8_rdmux_q <= redist15_fracX_uid10_fpDivTest_b_8_rdcnt_q;
            WHEN OTHERS => redist15_fracX_uid10_fpDivTest_b_8_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- fracX_uid10_fpDivTest(BITSELECT,9)@0
    fracX_uid10_fpDivTest_b <= a(22 downto 0);

    -- redist15_fracX_uid10_fpDivTest_b_8_wraddr(REG,183)
    redist15_fracX_uid10_fpDivTest_b_8_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_fracX_uid10_fpDivTest_b_8_wraddr_q <= "110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_fracX_uid10_fpDivTest_b_8_wraddr_q <= STD_LOGIC_VECTOR(redist15_fracX_uid10_fpDivTest_b_8_rdmux_q);
        END IF;
    END PROCESS;

    -- redist15_fracX_uid10_fpDivTest_b_8_mem(DUALMEM,180)
    redist15_fracX_uid10_fpDivTest_b_8_mem_ia <= STD_LOGIC_VECTOR(fracX_uid10_fpDivTest_b);
    redist15_fracX_uid10_fpDivTest_b_8_mem_aa <= redist15_fracX_uid10_fpDivTest_b_8_wraddr_q;
    redist15_fracX_uid10_fpDivTest_b_8_mem_ab <= redist15_fracX_uid10_fpDivTest_b_8_rdmux_q;
    redist15_fracX_uid10_fpDivTest_b_8_mem_reset0 <= areset;
    redist15_fracX_uid10_fpDivTest_b_8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => redist15_fracX_uid10_fpDivTest_b_8_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => redist15_fracX_uid10_fpDivTest_b_8_mem_reset0,
        clock1 => clk,
        address_a => redist15_fracX_uid10_fpDivTest_b_8_mem_aa,
        data_a => redist15_fracX_uid10_fpDivTest_b_8_mem_ia,
        wren_a => en(0),
        address_b => redist15_fracX_uid10_fpDivTest_b_8_mem_ab,
        q_b => redist15_fracX_uid10_fpDivTest_b_8_mem_iq
    );
    redist15_fracX_uid10_fpDivTest_b_8_mem_q <= redist15_fracX_uid10_fpDivTest_b_8_mem_iq(22 downto 0);

    -- fracXIsZero_uid25_fpDivTest(LOGICAL,24)@8 + 1
    fracXIsZero_uid25_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = redist15_fracX_uid10_fpDivTest_b_8_mem_q ELSE "0";
    fracXIsZero_uid25_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid25_fpDivTest_qi, xout => fracXIsZero_uid25_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist11_fracXIsZero_uid25_fpDivTest_q_4(DELAY,163)
    redist11_fracXIsZero_uid25_fpDivTest_q_4_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist11_fracXIsZero_uid25_fpDivTest_q_4_delay_0 <= (others => '0');
            redist11_fracXIsZero_uid25_fpDivTest_q_4_delay_1 <= (others => '0');
            redist11_fracXIsZero_uid25_fpDivTest_q_4_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist11_fracXIsZero_uid25_fpDivTest_q_4_delay_0 <= STD_LOGIC_VECTOR(fracXIsZero_uid25_fpDivTest_q);
                redist11_fracXIsZero_uid25_fpDivTest_q_4_delay_1 <= redist11_fracXIsZero_uid25_fpDivTest_q_4_delay_0;
                redist11_fracXIsZero_uid25_fpDivTest_q_4_q <= redist11_fracXIsZero_uid25_fpDivTest_q_4_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- expX_uid9_fpDivTest(BITSELECT,8)@0
    expX_uid9_fpDivTest_b <= a(30 downto 23);

    -- expXIsMax_uid24_fpDivTest(LOGICAL,23)@0 + 1
    expXIsMax_uid24_fpDivTest_qi <= "1" WHEN expX_uid9_fpDivTest_b = cstAllOWE_uid18_fpDivTest_q ELSE "0";
    expXIsMax_uid24_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid24_fpDivTest_qi, xout => expXIsMax_uid24_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist12_expXIsMax_uid24_fpDivTest_q_12(DELAY,164)
    redist12_expXIsMax_uid24_fpDivTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid24_fpDivTest_q, xout => redist12_expXIsMax_uid24_fpDivTest_q_12_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_x_uid27_fpDivTest(LOGICAL,26)@12
    excI_x_uid27_fpDivTest_q <= redist12_expXIsMax_uid24_fpDivTest_q_12_q and redist11_fracXIsZero_uid25_fpDivTest_q_4_q;

    -- excXIYI_uid96_fpDivTest(LOGICAL,95)@12
    excXIYI_uid96_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- fracXIsNotZero_uid40_fpDivTest(LOGICAL,39)@12
    fracXIsNotZero_uid40_fpDivTest_q <= not (redist8_fracXIsZero_uid39_fpDivTest_q_12_q);

    -- excN_y_uid42_fpDivTest(LOGICAL,41)@12
    excN_y_uid42_fpDivTest_q <= redist9_expXIsMax_uid38_fpDivTest_q_12_q and fracXIsNotZero_uid40_fpDivTest_q;

    -- fracXIsNotZero_uid26_fpDivTest(LOGICAL,25)@12
    fracXIsNotZero_uid26_fpDivTest_q <= not (redist11_fracXIsZero_uid25_fpDivTest_q_4_q);

    -- excN_x_uid28_fpDivTest(LOGICAL,27)@12
    excN_x_uid28_fpDivTest_q <= redist12_expXIsMax_uid24_fpDivTest_q_12_q and fracXIsNotZero_uid26_fpDivTest_q;

    -- cstAllZWE_uid20_fpDivTest(CONSTANT,19)
    cstAllZWE_uid20_fpDivTest_q <= "00000000";

    -- excZ_y_uid37_fpDivTest(LOGICAL,36)@0 + 1
    excZ_y_uid37_fpDivTest_qi <= "1" WHEN expY_uid12_fpDivTest_b = cstAllZWE_uid20_fpDivTest_q ELSE "0";
    excZ_y_uid37_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_qi, xout => excZ_y_uid37_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist10_excZ_y_uid37_fpDivTest_q_12(DELAY,162)
    redist10_excZ_y_uid37_fpDivTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_q, xout => redist10_excZ_y_uid37_fpDivTest_q_12_q, ena => en(0), clk => clk, aclr => areset );

    -- excZ_x_uid23_fpDivTest(LOGICAL,22)@0 + 1
    excZ_x_uid23_fpDivTest_qi <= "1" WHEN expX_uid9_fpDivTest_b = cstAllZWE_uid20_fpDivTest_q ELSE "0";
    excZ_x_uid23_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_x_uid23_fpDivTest_qi, xout => excZ_x_uid23_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist13_excZ_x_uid23_fpDivTest_q_12(DELAY,165)
    redist13_excZ_x_uid23_fpDivTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_x_uid23_fpDivTest_q, xout => redist13_excZ_x_uid23_fpDivTest_q_12_q, ena => en(0), clk => clk, aclr => areset );

    -- excXZYZ_uid95_fpDivTest(LOGICAL,94)@12
    excXZYZ_uid95_fpDivTest_q <= redist13_excZ_x_uid23_fpDivTest_q_12_q and redist10_excZ_y_uid37_fpDivTest_q_12_q;

    -- excRNaN_uid97_fpDivTest(LOGICAL,96)@12
    excRNaN_uid97_fpDivTest_q <= excXZYZ_uid95_fpDivTest_q or excN_x_uid28_fpDivTest_q or excN_y_uid42_fpDivTest_q or excXIYI_uid96_fpDivTest_q;

    -- invExcRNaN_uid108_fpDivTest(LOGICAL,107)@12
    invExcRNaN_uid108_fpDivTest_q <= not (excRNaN_uid97_fpDivTest_q);

    -- signY_uid14_fpDivTest(BITSELECT,13)@0
    signY_uid14_fpDivTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- signX_uid11_fpDivTest(BITSELECT,10)@0
    signX_uid11_fpDivTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- signR_uid46_fpDivTest(LOGICAL,45)@0 + 1
    signR_uid46_fpDivTest_qi <= signX_uid11_fpDivTest_b xor signY_uid14_fpDivTest_b;
    signR_uid46_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid46_fpDivTest_qi, xout => signR_uid46_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist7_signR_uid46_fpDivTest_q_12(DELAY,159)
    redist7_signR_uid46_fpDivTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid46_fpDivTest_q, xout => redist7_signR_uid46_fpDivTest_q_12_q, ena => en(0), clk => clk, aclr => areset );

    -- sRPostExc_uid109_fpDivTest(LOGICAL,108)@12
    sRPostExc_uid109_fpDivTest_q <= redist7_signR_uid46_fpDivTest_q_12_q and invExcRNaN_uid108_fpDivTest_q;

    -- lOAdded_uid58_fpDivTest(BITJOIN,57)@8
    lOAdded_uid58_fpDivTest_q <= VCC_q & redist15_fracX_uid10_fpDivTest_b_8_mem_q;

    -- redist0_lOAdded_uid58_fpDivTest_q_3(DELAY,152)
    redist0_lOAdded_uid58_fpDivTest_q_3_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_lOAdded_uid58_fpDivTest_q_3_delay_0 <= (others => '0');
            redist0_lOAdded_uid58_fpDivTest_q_3_delay_1 <= (others => '0');
            redist0_lOAdded_uid58_fpDivTest_q_3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist0_lOAdded_uid58_fpDivTest_q_3_delay_0 <= STD_LOGIC_VECTOR(lOAdded_uid58_fpDivTest_q);
                redist0_lOAdded_uid58_fpDivTest_q_3_delay_1 <= redist0_lOAdded_uid58_fpDivTest_q_3_delay_0;
                redist0_lOAdded_uid58_fpDivTest_q_3_q <= redist0_lOAdded_uid58_fpDivTest_q_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- oFracXSE_bottomExtension_uid61_fpDivTest(CONSTANT,60)
    oFracXSE_bottomExtension_uid61_fpDivTest_q <= "00";

    -- oFracXSE_mergedSignalTM_uid63_fpDivTest(BITJOIN,62)@11
    oFracXSE_mergedSignalTM_uid63_fpDivTest_q <= redist0_lOAdded_uid58_fpDivTest_q_3_q & oFracXSE_bottomExtension_uid61_fpDivTest_q;

    -- yAddr_uid51_fpDivTest(BITSELECT,50)@0
    yAddr_uid51_fpDivTest_b <= fracY_uid13_fpDivTest_b(22 downto 14);

    -- memoryC2_uid118_invTables_lutmem(DUALMEM,147)@0 + 2
    -- in j@20000000
    memoryC2_uid118_invTables_lutmem_aa <= yAddr_uid51_fpDivTest_b;
    memoryC2_uid118_invTables_lutmem_reset0 <= areset;
    memoryC2_uid118_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Div_altera_fp_functions_191_vr3lzay_memoryC2_uid118_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC2_uid118_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid118_invTables_lutmem_aa,
        q_a => memoryC2_uid118_invTables_lutmem_ir
    );
    memoryC2_uid118_invTables_lutmem_r <= memoryC2_uid118_invTables_lutmem_ir(11 downto 0);

    -- yPE_uid52_fpDivTest(BITSELECT,51)@0
    yPE_uid52_fpDivTest_b <= b(13 downto 0);

    -- redist2_yPE_uid52_fpDivTest_b_2(DELAY,154)
    redist2_yPE_uid52_fpDivTest_b_2_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist2_yPE_uid52_fpDivTest_b_2_delay_0 <= (others => '0');
            redist2_yPE_uid52_fpDivTest_b_2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist2_yPE_uid52_fpDivTest_b_2_delay_0 <= STD_LOGIC_VECTOR(yPE_uid52_fpDivTest_b);
                redist2_yPE_uid52_fpDivTest_b_2_q <= redist2_yPE_uid52_fpDivTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- yT1_uid124_invPolyEval(BITSELECT,123)@2
    yT1_uid124_invPolyEval_b <= redist2_yPE_uid52_fpDivTest_b_2_q(13 downto 2);

    -- prodXY_uid140_pT1_uid125_invPolyEval_cma(CHAINMULTADD,149)@2 + 3
    prodXY_uid140_pT1_uid125_invPolyEval_cma_reset <= areset;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0 <= en(0);
    prodXY_uid140_pT1_uid125_invPolyEval_cma_ena1 <= prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_ena2 <= prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0;

    prodXY_uid140_pT1_uid125_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(yT1_uid124_invPolyEval_b),12));
    prodXY_uid140_pT1_uid125_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(memoryC2_uid118_invTables_lutmem_r),12));
    prodXY_uid140_pT1_uid125_invPolyEval_cma_DSP0 : twentynm_mac
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
        ena(0) => prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid140_pT1_uid125_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid140_pT1_uid125_invPolyEval_cma_ena2,
        aclr(0) => prodXY_uid140_pT1_uid125_invPolyEval_cma_reset,
        aclr(1) => prodXY_uid140_pT1_uid125_invPolyEval_cma_reset,
        ay => prodXY_uid140_pT1_uid125_invPolyEval_cma_a0,
        ax => prodXY_uid140_pT1_uid125_invPolyEval_cma_c0,
        resulta => prodXY_uid140_pT1_uid125_invPolyEval_cma_s0
    );
    prodXY_uid140_pT1_uid125_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid140_pT1_uid125_invPolyEval_cma_s0, xout => prodXY_uid140_pT1_uid125_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid140_pT1_uid125_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_qq(23 downto 0));

    -- osig_uid141_pT1_uid125_invPolyEval(BITSELECT,140)@5
    osig_uid141_pT1_uid125_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_q(23 downto 11));

    -- highBBits_uid127_invPolyEval(BITSELECT,126)@5
    highBBits_uid127_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid141_pT1_uid125_invPolyEval_b(12 downto 1));

    -- redist4_yAddr_uid51_fpDivTest_b_3(DELAY,156)
    redist4_yAddr_uid51_fpDivTest_b_3_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist4_yAddr_uid51_fpDivTest_b_3_delay_0 <= (others => '0');
            redist4_yAddr_uid51_fpDivTest_b_3_delay_1 <= (others => '0');
            redist4_yAddr_uid51_fpDivTest_b_3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist4_yAddr_uid51_fpDivTest_b_3_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid51_fpDivTest_b);
                redist4_yAddr_uid51_fpDivTest_b_3_delay_1 <= redist4_yAddr_uid51_fpDivTest_b_3_delay_0;
                redist4_yAddr_uid51_fpDivTest_b_3_q <= redist4_yAddr_uid51_fpDivTest_b_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid115_invTables_lutmem(DUALMEM,146)@3 + 2
    -- in j@20000000
    memoryC1_uid115_invTables_lutmem_aa <= redist4_yAddr_uid51_fpDivTest_b_3_q;
    memoryC1_uid115_invTables_lutmem_reset0 <= areset;
    memoryC1_uid115_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Div_altera_fp_functions_191_vr3lzay_memoryC1_uid115_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC1_uid115_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid115_invTables_lutmem_aa,
        q_a => memoryC1_uid115_invTables_lutmem_ir
    );
    memoryC1_uid115_invTables_lutmem_r <= memoryC1_uid115_invTables_lutmem_ir(20 downto 0);

    -- s1sumAHighB_uid128_invPolyEval(ADD,127)@5
    s1sumAHighB_uid128_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid115_invTables_lutmem_r(20)) & memoryC1_uid115_invTables_lutmem_r));
    s1sumAHighB_uid128_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid127_invPolyEval_b(11)) & highBBits_uid127_invPolyEval_b));
    s1sumAHighB_uid128_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid128_invPolyEval_a) + SIGNED(s1sumAHighB_uid128_invPolyEval_b));
    s1sumAHighB_uid128_invPolyEval_q <= s1sumAHighB_uid128_invPolyEval_o(21 downto 0);

    -- lowRangeB_uid126_invPolyEval(BITSELECT,125)@5
    lowRangeB_uid126_invPolyEval_in <= osig_uid141_pT1_uid125_invPolyEval_b(0 downto 0);
    lowRangeB_uid126_invPolyEval_b <= lowRangeB_uid126_invPolyEval_in(0 downto 0);

    -- s1_uid129_invPolyEval(BITJOIN,128)@5
    s1_uid129_invPolyEval_q <= s1sumAHighB_uid128_invPolyEval_q & lowRangeB_uid126_invPolyEval_b;

    -- redist3_yPE_uid52_fpDivTest_b_5(DELAY,155)
    redist3_yPE_uid52_fpDivTest_b_5_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist3_yPE_uid52_fpDivTest_b_5_delay_0 <= (others => '0');
            redist3_yPE_uid52_fpDivTest_b_5_delay_1 <= (others => '0');
            redist3_yPE_uid52_fpDivTest_b_5_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist3_yPE_uid52_fpDivTest_b_5_delay_0 <= STD_LOGIC_VECTOR(redist2_yPE_uid52_fpDivTest_b_2_q);
                redist3_yPE_uid52_fpDivTest_b_5_delay_1 <= redist3_yPE_uid52_fpDivTest_b_5_delay_0;
                redist3_yPE_uid52_fpDivTest_b_5_q <= redist3_yPE_uid52_fpDivTest_b_5_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- prodXY_uid143_pT2_uid131_invPolyEval_cma(CHAINMULTADD,150)@5 + 3
    prodXY_uid143_pT2_uid131_invPolyEval_cma_reset <= areset;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0 <= en(0);
    prodXY_uid143_pT2_uid131_invPolyEval_cma_ena1 <= prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_ena2 <= prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0;

    prodXY_uid143_pT2_uid131_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(redist3_yPE_uid52_fpDivTest_b_5_q),14));
    prodXY_uid143_pT2_uid131_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(s1_uid129_invPolyEval_q),23));
    prodXY_uid143_pT2_uid131_invPolyEval_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        ax_clock => "0",
        ax_width => 23,
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
        ena(0) => prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid143_pT2_uid131_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid143_pT2_uid131_invPolyEval_cma_ena2,
        aclr(0) => prodXY_uid143_pT2_uid131_invPolyEval_cma_reset,
        aclr(1) => prodXY_uid143_pT2_uid131_invPolyEval_cma_reset,
        ay => prodXY_uid143_pT2_uid131_invPolyEval_cma_a0,
        ax => prodXY_uid143_pT2_uid131_invPolyEval_cma_c0,
        resulta => prodXY_uid143_pT2_uid131_invPolyEval_cma_s0
    );
    prodXY_uid143_pT2_uid131_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid143_pT2_uid131_invPolyEval_cma_s0, xout => prodXY_uid143_pT2_uid131_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid143_pT2_uid131_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_qq(36 downto 0));

    -- osig_uid144_pT2_uid131_invPolyEval(BITSELECT,143)@8
    osig_uid144_pT2_uid131_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_q(36 downto 13));

    -- highBBits_uid133_invPolyEval(BITSELECT,132)@8
    highBBits_uid133_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid144_pT2_uid131_invPolyEval_b(23 downto 2));

    -- redist5_yAddr_uid51_fpDivTest_b_6(DELAY,157)
    redist5_yAddr_uid51_fpDivTest_b_6_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist5_yAddr_uid51_fpDivTest_b_6_delay_0 <= (others => '0');
            redist5_yAddr_uid51_fpDivTest_b_6_delay_1 <= (others => '0');
            redist5_yAddr_uid51_fpDivTest_b_6_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist5_yAddr_uid51_fpDivTest_b_6_delay_0 <= STD_LOGIC_VECTOR(redist4_yAddr_uid51_fpDivTest_b_3_q);
                redist5_yAddr_uid51_fpDivTest_b_6_delay_1 <= redist5_yAddr_uid51_fpDivTest_b_6_delay_0;
                redist5_yAddr_uid51_fpDivTest_b_6_q <= redist5_yAddr_uid51_fpDivTest_b_6_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid112_invTables_lutmem(DUALMEM,145)@6 + 2
    -- in j@20000000
    memoryC0_uid112_invTables_lutmem_aa <= redist5_yAddr_uid51_fpDivTest_b_6_q;
    memoryC0_uid112_invTables_lutmem_reset0 <= areset;
    memoryC0_uid112_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 31,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Div_altera_fp_functions_191_vr3lzay_memoryC0_uid112_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC0_uid112_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid112_invTables_lutmem_aa,
        q_a => memoryC0_uid112_invTables_lutmem_ir
    );
    memoryC0_uid112_invTables_lutmem_r <= memoryC0_uid112_invTables_lutmem_ir(30 downto 0);

    -- s2sumAHighB_uid134_invPolyEval(ADD,133)@8
    s2sumAHighB_uid134_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => memoryC0_uid112_invTables_lutmem_r(30)) & memoryC0_uid112_invTables_lutmem_r));
    s2sumAHighB_uid134_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid133_invPolyEval_b(21)) & highBBits_uid133_invPolyEval_b));
    s2sumAHighB_uid134_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid134_invPolyEval_a) + SIGNED(s2sumAHighB_uid134_invPolyEval_b));
    s2sumAHighB_uid134_invPolyEval_q <= s2sumAHighB_uid134_invPolyEval_o(31 downto 0);

    -- lowRangeB_uid132_invPolyEval(BITSELECT,131)@8
    lowRangeB_uid132_invPolyEval_in <= osig_uid144_pT2_uid131_invPolyEval_b(1 downto 0);
    lowRangeB_uid132_invPolyEval_b <= lowRangeB_uid132_invPolyEval_in(1 downto 0);

    -- s2_uid135_invPolyEval(BITJOIN,134)@8
    s2_uid135_invPolyEval_q <= s2sumAHighB_uid134_invPolyEval_q & lowRangeB_uid132_invPolyEval_b;

    -- invY_uid54_fpDivTest_merged_bit_select(BITSELECT,151)@8
    invY_uid54_fpDivTest_merged_bit_select_in <= s2_uid135_invPolyEval_q(31 downto 0);
    invY_uid54_fpDivTest_merged_bit_select_b <= invY_uid54_fpDivTest_merged_bit_select_in(30 downto 5);
    invY_uid54_fpDivTest_merged_bit_select_c <= invY_uid54_fpDivTest_merged_bit_select_in(31 downto 31);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma(CHAINMULTADD,148)@8 + 3
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset <= areset;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0 <= en(0);
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena1 <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena2 <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0;

    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(invY_uid54_fpDivTest_merged_bit_select_b),26));
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(lOAdded_uid58_fpDivTest_q),24));
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 26,
        ax_clock => "0",
        ax_width => 24,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 50
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0,
        ena(1) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena1,
        ena(2) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena2,
        aclr(0) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset,
        aclr(1) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset,
        ay => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0,
        ax => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0,
        resulta => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s0
    );
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 50, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s0, xout => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq(49 downto 0));

    -- osig_uid138_prodDivPreNormProd_uid60_fpDivTest(BITSELECT,137)@11
    osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q(49 downto 24);

    -- updatedY_uid16_fpDivTest(BITJOIN,15)@0
    updatedY_uid16_fpDivTest_q <= GND_q & paddingY_uid15_fpDivTest_q;

    -- fracYZero_uid15_fpDivTest(LOGICAL,16)@0 + 1
    fracYZero_uid15_fpDivTest_a <= STD_LOGIC_VECTOR("0" & fracY_uid13_fpDivTest_b);
    fracYZero_uid15_fpDivTest_qi <= "1" WHEN fracYZero_uid15_fpDivTest_a = updatedY_uid16_fpDivTest_q ELSE "0";
    fracYZero_uid15_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYZero_uid15_fpDivTest_qi, xout => fracYZero_uid15_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist14_fracYZero_uid15_fpDivTest_q_8(DELAY,166)
    redist14_fracYZero_uid15_fpDivTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYZero_uid15_fpDivTest_q, xout => redist14_fracYZero_uid15_fpDivTest_q_8_q, ena => en(0), clk => clk, aclr => areset );

    -- fracYPostZ_uid56_fpDivTest(LOGICAL,55)@8 + 1
    fracYPostZ_uid56_fpDivTest_qi <= redist14_fracYZero_uid15_fpDivTest_q_8_q or invY_uid54_fpDivTest_merged_bit_select_c;
    fracYPostZ_uid56_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYPostZ_uid56_fpDivTest_qi, xout => fracYPostZ_uid56_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist1_fracYPostZ_uid56_fpDivTest_q_3(DELAY,153)
    redist1_fracYPostZ_uid56_fpDivTest_q_3_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist1_fracYPostZ_uid56_fpDivTest_q_3_delay_0 <= (others => '0');
            redist1_fracYPostZ_uid56_fpDivTest_q_3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist1_fracYPostZ_uid56_fpDivTest_q_3_delay_0 <= STD_LOGIC_VECTOR(fracYPostZ_uid56_fpDivTest_q);
                redist1_fracYPostZ_uid56_fpDivTest_q_3_q <= redist1_fracYPostZ_uid56_fpDivTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- divValPreNormTrunc_uid66_fpDivTest(MUX,65)@11
    divValPreNormTrunc_uid66_fpDivTest_s <= redist1_fracYPostZ_uid56_fpDivTest_q_3_q;
    divValPreNormTrunc_uid66_fpDivTest_combproc: PROCESS (divValPreNormTrunc_uid66_fpDivTest_s, en, osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b, oFracXSE_mergedSignalTM_uid63_fpDivTest_q)
    BEGIN
        CASE (divValPreNormTrunc_uid66_fpDivTest_s) IS
            WHEN "0" => divValPreNormTrunc_uid66_fpDivTest_q <= osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b;
            WHEN "1" => divValPreNormTrunc_uid66_fpDivTest_q <= oFracXSE_mergedSignalTM_uid63_fpDivTest_q;
            WHEN OTHERS => divValPreNormTrunc_uid66_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- norm_uid67_fpDivTest(BITSELECT,66)@11
    norm_uid67_fpDivTest_b <= STD_LOGIC_VECTOR(divValPreNormTrunc_uid66_fpDivTest_q(25 downto 25));

    -- rndOp_uid75_fpDivTest(BITJOIN,74)@11
    rndOp_uid75_fpDivTest_q <= norm_uid67_fpDivTest_b & paddingY_uid15_fpDivTest_q & VCC_q;

    -- cstBiasM1_uid6_fpDivTest(CONSTANT,5)
    cstBiasM1_uid6_fpDivTest_q <= "01111110";

    -- redist6_expXmY_uid47_fpDivTest_q_11_notEnable(LOGICAL,176)
    redist6_expXmY_uid47_fpDivTest_q_11_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist6_expXmY_uid47_fpDivTest_q_11_nor(LOGICAL,177)
    redist6_expXmY_uid47_fpDivTest_q_11_nor_q <= not (redist6_expXmY_uid47_fpDivTest_q_11_notEnable_q or redist6_expXmY_uid47_fpDivTest_q_11_sticky_ena_q);

    -- redist6_expXmY_uid47_fpDivTest_q_11_mem_last(CONSTANT,173)
    redist6_expXmY_uid47_fpDivTest_q_11_mem_last_q <= "0110";

    -- redist6_expXmY_uid47_fpDivTest_q_11_cmp(LOGICAL,174)
    redist6_expXmY_uid47_fpDivTest_q_11_cmp_b <= STD_LOGIC_VECTOR("0" & redist6_expXmY_uid47_fpDivTest_q_11_rdmux_q);
    redist6_expXmY_uid47_fpDivTest_q_11_cmp_q <= "1" WHEN redist6_expXmY_uid47_fpDivTest_q_11_mem_last_q = redist6_expXmY_uid47_fpDivTest_q_11_cmp_b ELSE "0";

    -- redist6_expXmY_uid47_fpDivTest_q_11_cmpReg(REG,175)
    redist6_expXmY_uid47_fpDivTest_q_11_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_expXmY_uid47_fpDivTest_q_11_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist6_expXmY_uid47_fpDivTest_q_11_cmpReg_q <= STD_LOGIC_VECTOR(redist6_expXmY_uid47_fpDivTest_q_11_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_expXmY_uid47_fpDivTest_q_11_sticky_ena(REG,178)
    redist6_expXmY_uid47_fpDivTest_q_11_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_expXmY_uid47_fpDivTest_q_11_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist6_expXmY_uid47_fpDivTest_q_11_nor_q = "1") THEN
                redist6_expXmY_uid47_fpDivTest_q_11_sticky_ena_q <= STD_LOGIC_VECTOR(redist6_expXmY_uid47_fpDivTest_q_11_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_expXmY_uid47_fpDivTest_q_11_enaAnd(LOGICAL,179)
    redist6_expXmY_uid47_fpDivTest_q_11_enaAnd_q <= redist6_expXmY_uid47_fpDivTest_q_11_sticky_ena_q and en;

    -- redist6_expXmY_uid47_fpDivTest_q_11_rdcnt(COUNTER,170)
    -- low=0, high=7, step=1, init=0
    redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_i <= redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_i, 3)));

    -- redist6_expXmY_uid47_fpDivTest_q_11_rdmux(MUX,171)
    redist6_expXmY_uid47_fpDivTest_q_11_rdmux_s <= en;
    redist6_expXmY_uid47_fpDivTest_q_11_rdmux_combproc: PROCESS (redist6_expXmY_uid47_fpDivTest_q_11_rdmux_s, redist6_expXmY_uid47_fpDivTest_q_11_wraddr_q, redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_q)
    BEGIN
        CASE (redist6_expXmY_uid47_fpDivTest_q_11_rdmux_s) IS
            WHEN "0" => redist6_expXmY_uid47_fpDivTest_q_11_rdmux_q <= redist6_expXmY_uid47_fpDivTest_q_11_wraddr_q;
            WHEN "1" => redist6_expXmY_uid47_fpDivTest_q_11_rdmux_q <= redist6_expXmY_uid47_fpDivTest_q_11_rdcnt_q;
            WHEN OTHERS => redist6_expXmY_uid47_fpDivTest_q_11_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expXmY_uid47_fpDivTest(SUB,46)@0 + 1
    expXmY_uid47_fpDivTest_a <= STD_LOGIC_VECTOR("0" & expX_uid9_fpDivTest_b);
    expXmY_uid47_fpDivTest_b <= STD_LOGIC_VECTOR("0" & expY_uid12_fpDivTest_b);
    expXmY_uid47_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXmY_uid47_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expXmY_uid47_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid47_fpDivTest_a) - UNSIGNED(expXmY_uid47_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    expXmY_uid47_fpDivTest_q <= expXmY_uid47_fpDivTest_o(8 downto 0);

    -- redist6_expXmY_uid47_fpDivTest_q_11_wraddr(REG,172)
    redist6_expXmY_uid47_fpDivTest_q_11_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_expXmY_uid47_fpDivTest_q_11_wraddr_q <= "111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist6_expXmY_uid47_fpDivTest_q_11_wraddr_q <= STD_LOGIC_VECTOR(redist6_expXmY_uid47_fpDivTest_q_11_rdmux_q);
        END IF;
    END PROCESS;

    -- redist6_expXmY_uid47_fpDivTest_q_11_mem(DUALMEM,169)
    redist6_expXmY_uid47_fpDivTest_q_11_mem_ia <= STD_LOGIC_VECTOR(expXmY_uid47_fpDivTest_q);
    redist6_expXmY_uid47_fpDivTest_q_11_mem_aa <= redist6_expXmY_uid47_fpDivTest_q_11_wraddr_q;
    redist6_expXmY_uid47_fpDivTest_q_11_mem_ab <= redist6_expXmY_uid47_fpDivTest_q_11_rdmux_q;
    redist6_expXmY_uid47_fpDivTest_q_11_mem_reset0 <= areset;
    redist6_expXmY_uid47_fpDivTest_q_11_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 9,
        widthad_b => 3,
        numwords_b => 8,
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
        clocken1 => redist6_expXmY_uid47_fpDivTest_q_11_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => redist6_expXmY_uid47_fpDivTest_q_11_mem_reset0,
        clock1 => clk,
        address_a => redist6_expXmY_uid47_fpDivTest_q_11_mem_aa,
        data_a => redist6_expXmY_uid47_fpDivTest_q_11_mem_ia,
        wren_a => en(0),
        address_b => redist6_expXmY_uid47_fpDivTest_q_11_mem_ab,
        q_b => redist6_expXmY_uid47_fpDivTest_q_11_mem_iq
    );
    redist6_expXmY_uid47_fpDivTest_q_11_mem_q <= redist6_expXmY_uid47_fpDivTest_q_11_mem_iq(8 downto 0);

    -- redist6_expXmY_uid47_fpDivTest_q_11_outputreg0(DELAY,168)
    redist6_expXmY_uid47_fpDivTest_q_11_outputreg0_clkproc_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_expXmY_uid47_fpDivTest_q_11_outputreg0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist6_expXmY_uid47_fpDivTest_q_11_outputreg0_q <= STD_LOGIC_VECTOR(redist6_expXmY_uid47_fpDivTest_q_11_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- expR_uid48_fpDivTest(ADD,47)@11
    expR_uid48_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => redist6_expXmY_uid47_fpDivTest_q_11_outputreg0_q(8)) & redist6_expXmY_uid47_fpDivTest_q_11_outputreg0_q));
    expR_uid48_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & cstBiasM1_uid6_fpDivTest_q));
    expR_uid48_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid48_fpDivTest_a) + SIGNED(expR_uid48_fpDivTest_b));
    expR_uid48_fpDivTest_q <= expR_uid48_fpDivTest_o(9 downto 0);

    -- divValPreNormHigh_uid68_fpDivTest(BITSELECT,67)@11
    divValPreNormHigh_uid68_fpDivTest_in <= divValPreNormTrunc_uid66_fpDivTest_q(24 downto 0);
    divValPreNormHigh_uid68_fpDivTest_b <= divValPreNormHigh_uid68_fpDivTest_in(24 downto 1);

    -- divValPreNormLow_uid69_fpDivTest(BITSELECT,68)@11
    divValPreNormLow_uid69_fpDivTest_in <= divValPreNormTrunc_uid66_fpDivTest_q(23 downto 0);
    divValPreNormLow_uid69_fpDivTest_b <= divValPreNormLow_uid69_fpDivTest_in(23 downto 0);

    -- normFracRnd_uid70_fpDivTest(MUX,69)@11
    normFracRnd_uid70_fpDivTest_s <= norm_uid67_fpDivTest_b;
    normFracRnd_uid70_fpDivTest_combproc: PROCESS (normFracRnd_uid70_fpDivTest_s, en, divValPreNormLow_uid69_fpDivTest_b, divValPreNormHigh_uid68_fpDivTest_b)
    BEGIN
        CASE (normFracRnd_uid70_fpDivTest_s) IS
            WHEN "0" => normFracRnd_uid70_fpDivTest_q <= divValPreNormLow_uid69_fpDivTest_b;
            WHEN "1" => normFracRnd_uid70_fpDivTest_q <= divValPreNormHigh_uid68_fpDivTest_b;
            WHEN OTHERS => normFracRnd_uid70_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracRnd_uid71_fpDivTest(BITJOIN,70)@11
    expFracRnd_uid71_fpDivTest_q <= expR_uid48_fpDivTest_q & normFracRnd_uid70_fpDivTest_q;

    -- expFracPostRnd_uid76_fpDivTest(ADD,75)@11 + 1
    expFracPostRnd_uid76_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => expFracRnd_uid71_fpDivTest_q(33)) & expFracRnd_uid71_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & rndOp_uid75_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracPostRnd_uid76_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expFracPostRnd_uid76_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid76_fpDivTest_a) + SIGNED(expFracPostRnd_uid76_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    expFracPostRnd_uid76_fpDivTest_q <= expFracPostRnd_uid76_fpDivTest_o(34 downto 0);

    -- excRPreExc_uid79_fpDivTest(BITSELECT,78)@12
    excRPreExc_uid79_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(31 downto 0);
    excRPreExc_uid79_fpDivTest_b <= excRPreExc_uid79_fpDivTest_in(31 downto 24);

    -- invExpXIsMax_uid43_fpDivTest(LOGICAL,42)@12
    invExpXIsMax_uid43_fpDivTest_q <= not (redist9_expXIsMax_uid38_fpDivTest_q_12_q);

    -- InvExpXIsZero_uid44_fpDivTest(LOGICAL,43)@12
    InvExpXIsZero_uid44_fpDivTest_q <= not (redist10_excZ_y_uid37_fpDivTest_q_12_q);

    -- excR_y_uid45_fpDivTest(LOGICAL,44)@12
    excR_y_uid45_fpDivTest_q <= InvExpXIsZero_uid44_fpDivTest_q and invExpXIsMax_uid43_fpDivTest_q;

    -- excXIYR_uid93_fpDivTest(LOGICAL,92)@12
    excXIYR_uid93_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excR_y_uid45_fpDivTest_q;

    -- excXIYZ_uid92_fpDivTest(LOGICAL,91)@12
    excXIYZ_uid92_fpDivTest_q <= excI_x_uid27_fpDivTest_q and redist10_excZ_y_uid37_fpDivTest_q_12_q;

    -- expRExt_uid80_fpDivTest(BITSELECT,79)@12
    expRExt_uid80_fpDivTest_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid76_fpDivTest_q(34 downto 24));

    -- expOvf_uid84_fpDivTest(COMPARE,83)@12
    expOvf_uid84_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid80_fpDivTest_b(10)) & expRExt_uid80_fpDivTest_b));
    expOvf_uid84_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid18_fpDivTest_q));
    expOvf_uid84_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid84_fpDivTest_a) - SIGNED(expOvf_uid84_fpDivTest_b));
    expOvf_uid84_fpDivTest_n(0) <= not (expOvf_uid84_fpDivTest_o(12));

    -- invExpXIsMax_uid29_fpDivTest(LOGICAL,28)@12
    invExpXIsMax_uid29_fpDivTest_q <= not (redist12_expXIsMax_uid24_fpDivTest_q_12_q);

    -- InvExpXIsZero_uid30_fpDivTest(LOGICAL,29)@12
    InvExpXIsZero_uid30_fpDivTest_q <= not (redist13_excZ_x_uid23_fpDivTest_q_12_q);

    -- excR_x_uid31_fpDivTest(LOGICAL,30)@12
    excR_x_uid31_fpDivTest_q <= InvExpXIsZero_uid30_fpDivTest_q and invExpXIsMax_uid29_fpDivTest_q;

    -- excXRYROvf_uid91_fpDivTest(LOGICAL,90)@12
    excXRYROvf_uid91_fpDivTest_q <= excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q and expOvf_uid84_fpDivTest_n;

    -- excXRYZ_uid90_fpDivTest(LOGICAL,89)@12
    excXRYZ_uid90_fpDivTest_q <= excR_x_uid31_fpDivTest_q and redist10_excZ_y_uid37_fpDivTest_q_12_q;

    -- excRInf_uid94_fpDivTest(LOGICAL,93)@12
    excRInf_uid94_fpDivTest_q <= excXRYZ_uid90_fpDivTest_q or excXRYROvf_uid91_fpDivTest_q or excXIYZ_uid92_fpDivTest_q or excXIYR_uid93_fpDivTest_q;

    -- xRegOrZero_uid87_fpDivTest(LOGICAL,86)@12
    xRegOrZero_uid87_fpDivTest_q <= excR_x_uid31_fpDivTest_q or redist13_excZ_x_uid23_fpDivTest_q_12_q;

    -- regOrZeroOverInf_uid88_fpDivTest(LOGICAL,87)@12
    regOrZeroOverInf_uid88_fpDivTest_q <= xRegOrZero_uid87_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- expUdf_uid81_fpDivTest(COMPARE,80)@12
    expUdf_uid81_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000" & GND_q));
    expUdf_uid81_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid80_fpDivTest_b(10)) & expRExt_uid80_fpDivTest_b));
    expUdf_uid81_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid81_fpDivTest_a) - SIGNED(expUdf_uid81_fpDivTest_b));
    expUdf_uid81_fpDivTest_n(0) <= not (expUdf_uid81_fpDivTest_o(12));

    -- regOverRegWithUf_uid86_fpDivTest(LOGICAL,85)@12
    regOverRegWithUf_uid86_fpDivTest_q <= expUdf_uid81_fpDivTest_n and excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q;

    -- zeroOverReg_uid85_fpDivTest(LOGICAL,84)@12
    zeroOverReg_uid85_fpDivTest_q <= redist13_excZ_x_uid23_fpDivTest_q_12_q and excR_y_uid45_fpDivTest_q;

    -- excRZero_uid89_fpDivTest(LOGICAL,88)@12
    excRZero_uid89_fpDivTest_q <= zeroOverReg_uid85_fpDivTest_q or regOverRegWithUf_uid86_fpDivTest_q or regOrZeroOverInf_uid88_fpDivTest_q;

    -- concExc_uid98_fpDivTest(BITJOIN,97)@12
    concExc_uid98_fpDivTest_q <= excRNaN_uid97_fpDivTest_q & excRInf_uid94_fpDivTest_q & excRZero_uid89_fpDivTest_q;

    -- excREnc_uid99_fpDivTest(LOOKUP,98)@12
    excREnc_uid99_fpDivTest_combproc: PROCESS (concExc_uid98_fpDivTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid98_fpDivTest_q) IS
            WHEN "000" => excREnc_uid99_fpDivTest_q <= "01";
            WHEN "001" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "010" => excREnc_uid99_fpDivTest_q <= "10";
            WHEN "011" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "100" => excREnc_uid99_fpDivTest_q <= "11";
            WHEN "101" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "110" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "111" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid99_fpDivTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid107_fpDivTest(MUX,106)@12
    expRPostExc_uid107_fpDivTest_s <= excREnc_uid99_fpDivTest_q;
    expRPostExc_uid107_fpDivTest_combproc: PROCESS (expRPostExc_uid107_fpDivTest_s, en, cstAllZWE_uid20_fpDivTest_q, excRPreExc_uid79_fpDivTest_b, cstAllOWE_uid18_fpDivTest_q)
    BEGIN
        CASE (expRPostExc_uid107_fpDivTest_s) IS
            WHEN "00" => expRPostExc_uid107_fpDivTest_q <= cstAllZWE_uid20_fpDivTest_q;
            WHEN "01" => expRPostExc_uid107_fpDivTest_q <= excRPreExc_uid79_fpDivTest_b;
            WHEN "10" => expRPostExc_uid107_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN "11" => expRPostExc_uid107_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN OTHERS => expRPostExc_uid107_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid100_fpDivTest(CONSTANT,99)
    oneFracRPostExc2_uid100_fpDivTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid78_fpDivTest(BITSELECT,77)@12
    fracRPreExc_uid78_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(23 downto 0);
    fracRPreExc_uid78_fpDivTest_b <= fracRPreExc_uid78_fpDivTest_in(23 downto 1);

    -- fracRPostExc_uid103_fpDivTest(MUX,102)@12
    fracRPostExc_uid103_fpDivTest_s <= excREnc_uid99_fpDivTest_q;
    fracRPostExc_uid103_fpDivTest_combproc: PROCESS (fracRPostExc_uid103_fpDivTest_s, en, paddingY_uid15_fpDivTest_q, fracRPreExc_uid78_fpDivTest_b, oneFracRPostExc2_uid100_fpDivTest_q)
    BEGIN
        CASE (fracRPostExc_uid103_fpDivTest_s) IS
            WHEN "00" => fracRPostExc_uid103_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "01" => fracRPostExc_uid103_fpDivTest_q <= fracRPreExc_uid78_fpDivTest_b;
            WHEN "10" => fracRPostExc_uid103_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "11" => fracRPostExc_uid103_fpDivTest_q <= oneFracRPostExc2_uid100_fpDivTest_q;
            WHEN OTHERS => fracRPostExc_uid103_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid110_fpDivTest(BITJOIN,109)@12
    divR_uid110_fpDivTest_q <= sRPostExc_uid109_fpDivTest_q & expRPostExc_uid107_fpDivTest_q & fracRPostExc_uid103_fpDivTest_q;

    -- xOut(GPOUT,4)@12
    q <= divR_uid110_fpDivTest_q;

END normal;
