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

-- VHDL created from Fix_Div_altera_fxp_functions_191_hzr34sy
-- VHDL created on Fri May 21 17:13:44 2021


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

entity Fix_Div_altera_fxp_functions_191_hzr34sy is
    port (
        numerator : in std_logic_vector(31 downto 0);  -- sfix32
        denominator : in std_logic_vector(31 downto 0);  -- sfix32
        en : in std_logic_vector(0 downto 0);  -- ufix1
        result : out std_logic_vector(31 downto 0);  -- sfix32
        clk : in std_logic;
        rst : in std_logic
    );
end Fix_Div_altera_fxp_functions_191_hzr34sy;

architecture normal of Fix_Div_altera_fxp_functions_191_hzr34sy is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xMSB_uid7_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yPSE_uid9_divider_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yPSE_uid9_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yPSEA_uid11_divider_a : STD_LOGIC_VECTOR (32 downto 0);
    signal yPSEA_uid11_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yPSEA_uid11_divider_o : STD_LOGIC_VECTOR (32 downto 0);
    signal yPSEA_uid11_divider_q : STD_LOGIC_VECTOR (32 downto 0);
    signal yPS_uid12_divider_in : STD_LOGIC_VECTOR (31 downto 0);
    signal yPS_uid12_divider_b : STD_LOGIC_VECTOR (31 downto 0);
    signal normYNoLeadOne_uid15_divider_in : STD_LOGIC_VECTOR (30 downto 0);
    signal normYNoLeadOne_uid15_divider_b : STD_LOGIC_VECTOR (30 downto 0);
    signal paddingY_uid16_divider_q : STD_LOGIC_VECTOR (30 downto 0);
    signal updatedY_uid17_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid16_divider_a : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid16_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid19_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid20_divider_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid20_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid21_divider_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yIsZero_uid21_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseRes_uid26_divider_in : STD_LOGIC_VECTOR (38 downto 0);
    signal fxpInverseRes_uid26_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal oneInvRes_uid27_divider_q : STD_LOGIC_VECTOR (32 downto 0);
    signal invResPostOneHandling2_uid28_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal invResPostOneHandling2_uid28_divider_q : STD_LOGIC_VECTOR (32 downto 0);
    signal cWOut_uid29_divider_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rShiftCount_uid30_divider_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid30_divider_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid30_divider_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid30_divider_q : STD_LOGIC_VECTOR (6 downto 0);
    signal xPSX_uid31_divider_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xPSX_uid31_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zMsbY0_uid33_divider_q : STD_LOGIC_VECTOR (1 downto 0);
    signal xPSXE_uid34_divider_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xPSXE_uid34_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xPSXE_uid34_divider_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xPSXE_uid34_divider_q : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftInput_uid37_divider_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftInput_uid37_divider_b : STD_LOGIC_VECTOR (64 downto 0);
    signal prodPostRightShiftPost_uid39_divider_in : STD_LOGIC_VECTOR (62 downto 0);
    signal prodPostRightShiftPost_uid39_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal prodPostRightShiftPostRnd_uid41_divider_a : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid41_divider_b : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid41_divider_o : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid41_divider_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRndRange_uid42_divider_in : STD_LOGIC_VECTOR (32 downto 0);
    signal prodPostRightShiftPostRndRange_uid42_divider_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstValOvfPos_uid43_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstValOvfneg_uid44_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid45_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstOvf_uid46_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cstOvf_uid46_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinal_uid47_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinal_uid47_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prod_qy_GT_x_uid49_divider_a : STD_LOGIC_VECTOR (65 downto 0);
    signal prod_qy_GT_x_uid49_divider_b : STD_LOGIC_VECTOR (65 downto 0);
    signal prod_qy_GT_x_uid49_divider_o : STD_LOGIC_VECTOR (65 downto 0);
    signal prod_qy_GT_x_uid49_divider_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_qy_LT_x_uid50_divider_a : STD_LOGIC_VECTOR (65 downto 0);
    signal prod_qy_LT_x_uid50_divider_b : STD_LOGIC_VECTOR (65 downto 0);
    signal prod_qy_LT_x_uid50_divider_o : STD_LOGIC_VECTOR (65 downto 0);
    signal prod_qy_LT_x_uid50_divider_c : STD_LOGIC_VECTOR (0 downto 0);
    signal resultSign_uid55_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signResFinal_uid56_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal OverflowCond_uid57_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CondNegX_uid58_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid59_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CondPosX_uid60_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal postMuxSelect_uid61_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstSubFinal_uid63_divider_q : STD_LOGIC_VECTOR (1 downto 0);
    signal resFinalMP1_uid64_divider_a : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalMP1_uid64_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalMP1_uid64_divider_o : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalMP1_uid64_divider_q : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalPostMux_uid65_divider_in : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalPostMux_uid65_divider_b : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDiv_uid66_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinalIntDiv_uid66_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid68_zCount_uid13_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid70_zCount_uid13_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid71_zCount_uid13_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid73_zCount_uid13_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid73_zCount_uid13_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid74_zCount_uid13_divider_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid76_zCount_uid13_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid79_zCount_uid13_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid79_zCount_uid13_divider_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid80_zCount_uid13_divider_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid82_zCount_uid13_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid85_zCount_uid13_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid85_zCount_uid13_divider_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid86_zCount_uid13_divider_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid88_zCount_uid13_divider_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid88_zCount_uid13_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid91_zCount_uid13_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid91_zCount_uid13_divider_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid92_zCount_uid13_divider_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid94_zCount_uid13_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid97_zCount_uid13_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid97_zCount_uid13_divider_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid99_zCount_uid13_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid100_zCount_uid13_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid101_zCount_uid13_divider_q : STD_LOGIC_VECTOR (5 downto 0);
    signal yT1_uid119_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeB_uid121_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid121_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid122_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal s1sumAHighB_uid123_invPolyEval_a : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid123_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid123_invPolyEval_o : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid123_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal s1_uid124_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal yT2_uid125_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal lowRangeB_uid127_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid127_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid128_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s2sumAHighB_uid129_invPolyEval_a : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid129_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid129_invPolyEval_o : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid129_invPolyEval_q : STD_LOGIC_VECTOR (29 downto 0);
    signal s2_uid130_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal lowRangeB_uid133_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid133_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid134_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s3sumAHighB_uid135_invPolyEval_a : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid135_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid135_invPolyEval_o : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid135_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal s3_uid136_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal osig_uid139_pT1_uid120_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal osig_uid142_pT2_uid126_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal nx_mergedSignalTM_uid156_pT3_uid132_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_bottomExtension_uid161_pT3_uid132_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_mergedSignalTM_uid163_pT3_uid132_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid165_pT3_uid132_invPolyEval_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightBottomX_mergedSignalTM_uid167_pT3_uid132_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid173_pT3_uid132_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid173_pT3_uid132_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal highBBits_uid174_pT3_uid132_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid176_pT3_uid132_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid177_pT3_uid132_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid177_pT3_uid132_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng16_uid182_normY_uid14_divider_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng16_uid182_normY_uid14_divider_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid183_normY_uid14_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid187_normY_uid14_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid187_normY_uid14_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng4_uid189_normY_uid14_divider_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng4_uid189_normY_uid14_divider_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1_uid190_normY_uid14_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx2Rng8_uid192_normY_uid14_divider_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2Rng8_uid192_normY_uid14_divider_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2_uid193_normY_uid14_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3Rng12_uid195_normY_uid14_divider_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage1Idx3Rng12_uid195_normY_uid14_divider_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage1Idx3_uid196_normY_uid14_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid198_normY_uid14_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid198_normY_uid14_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx1Rng1_uid200_normY_uid14_divider_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage2Idx1Rng1_uid200_normY_uid14_divider_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage2Idx1_uid201_normY_uid14_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx2Rng2_uid203_normY_uid14_divider_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage2Idx2Rng2_uid203_normY_uid14_divider_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage2Idx2_uid204_normY_uid14_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx3Pad3_uid205_normY_uid14_divider_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2Idx3Rng3_uid206_normY_uid14_divider_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage2Idx3Rng3_uid206_normY_uid14_divider_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage2Idx3_uid207_normY_uid14_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2_uid209_normY_uid14_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid209_normY_uid14_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid36_divider_bs2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid36_divider_bjB6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXInvY_uid36_divider_bs8_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid36_divider_bs8_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid36_divider_bs11_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid36_divider_bs11_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid36_divider_sums_join_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodXInvY_uid36_divider_sums_align_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal prodXInvY_uid36_divider_sums_align_1_qint : STD_LOGIC_VECTOR (52 downto 0);
    signal prodXInvY_uid36_divider_sums_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal prodXInvY_uid36_divider_sums_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal prodXInvY_uid36_divider_sums_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal prodXInvY_uid36_divider_sums_result_add_0_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal xMSB_uid227_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng1_uid229_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1_uid230_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal seMsb_to2_uid231_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid231_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx2Rng2_uid232_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (62 downto 0);
    signal rightShiftStage0Idx2_uid233_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal seMsb_to3_uid234_in : STD_LOGIC_VECTOR (2 downto 0);
    signal seMsb_to3_uid234_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx3Rng3_uid235_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (61 downto 0);
    signal rightShiftStage0Idx3_uid236_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0_uid238_prodPostRightShift_uid38_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid238_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal seMsb_to4_uid239_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid239_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx1Rng4_uid240_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (60 downto 0);
    signal rightShiftStage1Idx1_uid241_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal seMsb_to8_uid242_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid242_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx2Rng8_uid243_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (56 downto 0);
    signal rightShiftStage1Idx2_uid244_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal seMsb_to12_uid245_in : STD_LOGIC_VECTOR (11 downto 0);
    signal seMsb_to12_uid245_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3Rng12_uid246_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (52 downto 0);
    signal rightShiftStage1Idx3_uid247_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1_uid249_prodPostRightShift_uid38_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal seMsb_to16_uid250_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid250_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage2Idx1Rng16_uid251_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx1_uid252_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal seMsb_to32_uid253_in : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to32_uid253_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx2Rng32_uid254_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage2Idx2_uid255_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal seMsb_to48_uid256_in : STD_LOGIC_VECTOR (47 downto 0);
    signal seMsb_to48_uid256_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage2Idx3Rng48_uid257_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage2Idx3_uid258_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2_uid260_prodPostRightShift_uid38_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid260_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal seMsb_to64_uid261_in : STD_LOGIC_VECTOR (63 downto 0);
    signal seMsb_to64_uid261_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage3Idx1Rng64_uid262_prodPostRightShift_uid38_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3Idx1_uid263_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage3_uid265_prodPostRightShift_uid38_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3_uid265_prodPostRightShift_uid38_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid48_divider_bs1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid48_divider_bs2_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid48_divider_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid48_divider_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid48_divider_bs6_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid48_divider_bs7_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid48_divider_bs7_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid48_divider_bs10_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid48_divider_bs10_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid48_divider_sums_join_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal prodResY_uid48_divider_sums_align_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal prodResY_uid48_divider_sums_align_1_qint : STD_LOGIC_VECTOR (50 downto 0);
    signal prodResY_uid48_divider_sums_result_add_0_0_a : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid48_divider_sums_result_add_0_0_b : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid48_divider_sums_result_add_0_0_o : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid48_divider_sums_result_add_0_0_q : STD_LOGIC_VECTOR (64 downto 0);
    signal memoryC0_uid103_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid103_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (37 downto 0);
    signal memoryC0_uid103_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid103_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid103_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (37 downto 0);
    signal memoryC0_uid103_invTabGen_lutmem_r : STD_LOGIC_VECTOR (37 downto 0);
    signal memoryC1_uid106_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid106_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid106_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid106_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid106_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid106_invTabGen_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC2_uid109_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid109_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid109_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid109_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid109_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid109_invTabGen_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC3_uid112_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid112_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid112_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid112_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid112_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid112_invTabGen_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid138_pT1_uid120_invPolyEval_cma_reset : std_logic;
    signal prodXY_uid138_pT1_uid120_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid138_pT1_uid120_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid138_pT1_uid120_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid138_pT1_uid120_invPolyEval_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid138_pT1_uid120_invPolyEval_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid138_pT1_uid120_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid138_pT1_uid120_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid138_pT1_uid120_invPolyEval_cma_ena2 : std_logic;
    signal prodXY_uid141_pT2_uid126_invPolyEval_cma_reset : std_logic;
    signal prodXY_uid141_pT2_uid126_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (20 downto 0);
    signal prodXY_uid141_pT2_uid126_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (22 downto 0);
    signal prodXY_uid141_pT2_uid126_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (43 downto 0);
    signal prodXY_uid141_pT2_uid126_invPolyEval_cma_qq : STD_LOGIC_VECTOR (43 downto 0);
    signal prodXY_uid141_pT2_uid126_invPolyEval_cma_q : STD_LOGIC_VECTOR (43 downto 0);
    signal prodXY_uid141_pT2_uid126_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid141_pT2_uid126_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid141_pT2_uid126_invPolyEval_cma_ena2 : std_logic;
    signal sm0_uid170_pT3_uid132_invPolyEval_cma_reset : std_logic;
    signal sm0_uid170_pT3_uid132_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid170_pT3_uid132_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid170_pT3_uid132_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid170_pT3_uid132_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid170_pT3_uid132_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid170_pT3_uid132_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid170_pT3_uid132_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid170_pT3_uid132_invPolyEval_cma_ena2 : std_logic;
    signal prodXInvY_uid36_divider_im0_cma_reset : std_logic;
    signal prodXInvY_uid36_divider_im0_cma_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid36_divider_im0_cma_c0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid36_divider_im0_cma_s0 : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid36_divider_im0_cma_qq : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid36_divider_im0_cma_q : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid36_divider_im0_cma_ena0 : std_logic;
    signal prodXInvY_uid36_divider_im0_cma_ena1 : std_logic;
    signal prodXInvY_uid36_divider_im0_cma_ena2 : std_logic;
    signal prodXInvY_uid36_divider_im9_cma_reset : std_logic;
    signal prodXInvY_uid36_divider_im9_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid36_divider_im9_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid36_divider_im9_cma_s0 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid36_divider_im9_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid36_divider_im9_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid36_divider_im9_cma_ena0 : std_logic;
    signal prodXInvY_uid36_divider_im9_cma_ena1 : std_logic;
    signal prodXInvY_uid36_divider_im9_cma_ena2 : std_logic;
    signal prodResY_uid48_divider_im0_cma_reset : std_logic;
    signal prodResY_uid48_divider_im0_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid48_divider_im0_cma_c0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid48_divider_im0_cma_s0 : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid48_divider_im0_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid48_divider_im0_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid48_divider_im0_cma_ena0 : std_logic;
    signal prodResY_uid48_divider_im0_cma_ena1 : std_logic;
    signal prodResY_uid48_divider_im0_cma_ena2 : std_logic;
    signal prodResY_uid48_divider_im8_cma_reset : std_logic;
    signal prodResY_uid48_divider_im8_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid48_divider_im8_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid48_divider_im8_cma_s0 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid48_divider_im8_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid48_divider_im8_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid48_divider_im8_cma_ena0 : std_logic;
    signal prodResY_uid48_divider_im8_cma_ena1 : std_logic;
    signal prodResY_uid48_divider_im8_cma_ena2 : std_logic;
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_a1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena2 : std_logic;
    signal prodXInvY_uid36_divider_ma3_cma_reset : std_logic;
    signal prodXInvY_uid36_divider_ma3_cma_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXInvY_uid36_divider_ma3_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid36_divider_ma3_cma_a1 : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXInvY_uid36_divider_ma3_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid36_divider_ma3_cma_s0 : STD_LOGIC_VECTOR (34 downto 0);
    signal prodXInvY_uid36_divider_ma3_cma_qq : STD_LOGIC_VECTOR (34 downto 0);
    signal prodXInvY_uid36_divider_ma3_cma_q : STD_LOGIC_VECTOR (34 downto 0);
    signal prodXInvY_uid36_divider_ma3_cma_ena0 : std_logic;
    signal prodXInvY_uid36_divider_ma3_cma_ena1 : std_logic;
    signal prodXInvY_uid36_divider_ma3_cma_ena2 : std_logic;
    signal prodResY_uid48_divider_ma3_cma_reset : std_logic;
    signal prodResY_uid48_divider_ma3_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid48_divider_ma3_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid48_divider_ma3_cma_a1 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid48_divider_ma3_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid48_divider_ma3_cma_s0 : STD_LOGIC_VECTOR (32 downto 0);
    signal prodResY_uid48_divider_ma3_cma_qq : STD_LOGIC_VECTOR (32 downto 0);
    signal prodResY_uid48_divider_ma3_cma_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prodResY_uid48_divider_ma3_cma_ena0 : std_logic;
    signal prodResY_uid48_divider_ma3_cma_ena1 : std_logic;
    signal prodResY_uid48_divider_ma3_cma_ena2 : std_logic;
    signal yAddr_uid23_divider_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid23_divider_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid36_divider_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid36_divider_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (17 downto 0);
    signal rVStage_uid75_zCount_uid13_divider_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid75_zCount_uid13_divider_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid81_zCount_uid13_divider_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid81_zCount_uid13_divider_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid87_zCount_uid13_divider_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid87_zCount_uid13_divider_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid93_zCount_uid13_divider_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid93_zCount_uid13_divider_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid186_normY_uid14_divider_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid186_normY_uid14_divider_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid186_normY_uid14_divider_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal topRangeY_uid159_pT3_uid132_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid159_pT3_uid132_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal topRangeX_uid158_pT3_uid132_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeX_uid158_pT3_uid132_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_rVStage_uid87_zCount_uid13_divider_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_rVStage_uid87_zCount_uid13_divider_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_e_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_yAddr_uid23_divider_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_yAddr_uid23_divider_merged_bit_select_b_3_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_yAddr_uid23_divider_merged_bit_select_b_3_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid23_divider_merged_bit_select_b_6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid23_divider_merged_bit_select_b_6_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid23_divider_merged_bit_select_b_6_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_yAddr_uid23_divider_merged_bit_select_b_9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_yAddr_uid23_divider_merged_bit_select_b_9_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_yAddr_uid23_divider_merged_bit_select_b_9_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_yAddr_uid23_divider_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist7_yAddr_uid23_divider_merged_bit_select_c_2_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_yAddr_uid23_divider_merged_bit_select_c_5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_yAddr_uid23_divider_merged_bit_select_c_5_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_yAddr_uid23_divider_merged_bit_select_c_5_delay_1 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_yAddr_uid23_divider_merged_bit_select_c_8_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_yAddr_uid23_divider_merged_bit_select_c_8_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_yAddr_uid23_divider_merged_bit_select_c_8_delay_1 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_vCount_uid82_zCount_uid13_divider_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_vCount_uid76_zCount_uid13_divider_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_vCount_uid70_zCount_uid13_divider_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_vCount_uid70_zCount_uid13_divider_q_2_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_resFinal_uid47_divider_q_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_resFinal_uid47_divider_q_4_delay_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_signX_uid45_divider_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_signX_uid45_divider_b_4_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_signX_uid45_divider_b_4_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_signX_uid45_divider_b_4_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_fxpInverseRes_uid26_divider_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist18_normYIsOne_uid20_divider_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_normYIsOneC2_uid19_divider_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_normYNoLeadOne_uid15_divider_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist21_yPS_uid12_divider_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_yPS_uid12_divider_b_2_delay_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_xMSB_uid7_divider_b_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_xMSB_uid7_divider_b_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_outputreg0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_mem_reset0 : std_logic;
    signal redist11_r_uid101_zCount_uid13_divider_q_15_mem_ia : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_mem_iq : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_mem_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_i : signal is true;
    signal redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_eq : std_logic;
    attribute preserve of redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_eq : signal is true;
    signal redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid101_zCount_uid13_divider_q_15_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist11_r_uid101_zCount_uid13_divider_q_15_sticky_ena_q : signal is true;
    signal redist11_r_uid101_zCount_uid13_divider_q_15_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_resFinal_uid47_divider_q_4_inputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_resFinal_uid47_divider_q_4_outputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_outputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_mem_reset0 : std_logic;
    signal redist24_in_rsrvd_fix_numerator_14_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist24_in_rsrvd_fix_numerator_14_rdcnt_i : signal is true;
    signal redist24_in_rsrvd_fix_numerator_14_rdcnt_eq : std_logic;
    attribute preserve of redist24_in_rsrvd_fix_numerator_14_rdcnt_eq : signal is true;
    signal redist24_in_rsrvd_fix_numerator_14_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_rdmux_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_in_rsrvd_fix_numerator_14_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist24_in_rsrvd_fix_numerator_14_sticky_ena_q : signal is true;
    signal redist24_in_rsrvd_fix_numerator_14_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_mem_reset0 : std_logic;
    signal redist25_in_rsrvd_fix_numerator_18_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist25_in_rsrvd_fix_numerator_18_rdcnt_i : signal is true;
    signal redist25_in_rsrvd_fix_numerator_18_rdcnt_eq : std_logic;
    attribute preserve of redist25_in_rsrvd_fix_numerator_18_rdcnt_eq : signal is true;
    signal redist25_in_rsrvd_fix_numerator_18_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_numerator_18_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist25_in_rsrvd_fix_numerator_18_sticky_ena_q : signal is true;
    signal redist25_in_rsrvd_fix_numerator_18_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_outputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_mem_reset0 : std_logic;
    signal redist26_in_rsrvd_fix_numerator_22_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist26_in_rsrvd_fix_numerator_22_rdcnt_i : signal is true;
    signal redist26_in_rsrvd_fix_numerator_22_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_rdmux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_in_rsrvd_fix_numerator_22_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist26_in_rsrvd_fix_numerator_22_sticky_ena_q : signal is true;
    signal redist26_in_rsrvd_fix_numerator_22_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_outputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_mem_reset0 : std_logic;
    signal redist27_in_rsrvd_fix_denominator_18_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist27_in_rsrvd_fix_denominator_18_rdcnt_i : signal is true;
    signal redist27_in_rsrvd_fix_denominator_18_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_rdmux_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_in_rsrvd_fix_denominator_18_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist27_in_rsrvd_fix_denominator_18_sticky_ena_q : signal is true;
    signal redist27_in_rsrvd_fix_denominator_18_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- xMSB_uid7_divider(BITSELECT,6)@0
    xMSB_uid7_divider_b <= STD_LOGIC_VECTOR(denominator(31 downto 31));

    -- redist22_xMSB_uid7_divider_b_14(DELAY,327)
    redist22_xMSB_uid7_divider_b_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => xMSB_uid7_divider_b, xout => redist22_xMSB_uid7_divider_b_14_q, ena => en(0), clk => clk, aclr => rst );

    -- redist23_xMSB_uid7_divider_b_22(DELAY,328)
    redist23_xMSB_uid7_divider_b_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => redist22_xMSB_uid7_divider_b_14_q, xout => redist23_xMSB_uid7_divider_b_22_q, ena => en(0), clk => clk, aclr => rst );

    -- redist25_in_rsrvd_fix_numerator_18_notEnable(LOGICAL,366)
    redist25_in_rsrvd_fix_numerator_18_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist25_in_rsrvd_fix_numerator_18_nor(LOGICAL,367)
    redist25_in_rsrvd_fix_numerator_18_nor_q <= not (redist25_in_rsrvd_fix_numerator_18_notEnable_q or redist25_in_rsrvd_fix_numerator_18_sticky_ena_q);

    -- redist25_in_rsrvd_fix_numerator_18_mem_last(CONSTANT,363)
    redist25_in_rsrvd_fix_numerator_18_mem_last_q <= "01";

    -- redist25_in_rsrvd_fix_numerator_18_cmp(LOGICAL,364)
    redist25_in_rsrvd_fix_numerator_18_cmp_q <= "1" WHEN redist25_in_rsrvd_fix_numerator_18_mem_last_q = redist25_in_rsrvd_fix_numerator_18_rdmux_q ELSE "0";

    -- redist25_in_rsrvd_fix_numerator_18_cmpReg(REG,365)
    redist25_in_rsrvd_fix_numerator_18_cmpReg_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist25_in_rsrvd_fix_numerator_18_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist25_in_rsrvd_fix_numerator_18_cmpReg_q <= STD_LOGIC_VECTOR(redist25_in_rsrvd_fix_numerator_18_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_in_rsrvd_fix_numerator_18_sticky_ena(REG,368)
    redist25_in_rsrvd_fix_numerator_18_sticky_ena_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist25_in_rsrvd_fix_numerator_18_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist25_in_rsrvd_fix_numerator_18_nor_q = "1") THEN
                redist25_in_rsrvd_fix_numerator_18_sticky_ena_q <= STD_LOGIC_VECTOR(redist25_in_rsrvd_fix_numerator_18_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_in_rsrvd_fix_numerator_18_enaAnd(LOGICAL,369)
    redist25_in_rsrvd_fix_numerator_18_enaAnd_q <= redist25_in_rsrvd_fix_numerator_18_sticky_ena_q and en;

    -- redist25_in_rsrvd_fix_numerator_18_rdcnt(COUNTER,360)
    -- low=0, high=2, step=1, init=0
    redist25_in_rsrvd_fix_numerator_18_rdcnt_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist25_in_rsrvd_fix_numerator_18_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist25_in_rsrvd_fix_numerator_18_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist25_in_rsrvd_fix_numerator_18_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                    redist25_in_rsrvd_fix_numerator_18_rdcnt_eq <= '1';
                ELSE
                    redist25_in_rsrvd_fix_numerator_18_rdcnt_eq <= '0';
                END IF;
                IF (redist25_in_rsrvd_fix_numerator_18_rdcnt_eq = '1') THEN
                    redist25_in_rsrvd_fix_numerator_18_rdcnt_i <= redist25_in_rsrvd_fix_numerator_18_rdcnt_i + 2;
                ELSE
                    redist25_in_rsrvd_fix_numerator_18_rdcnt_i <= redist25_in_rsrvd_fix_numerator_18_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist25_in_rsrvd_fix_numerator_18_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist25_in_rsrvd_fix_numerator_18_rdcnt_i, 2)));

    -- redist25_in_rsrvd_fix_numerator_18_rdmux(MUX,361)
    redist25_in_rsrvd_fix_numerator_18_rdmux_s <= en;
    redist25_in_rsrvd_fix_numerator_18_rdmux_combproc: PROCESS (redist25_in_rsrvd_fix_numerator_18_rdmux_s, redist25_in_rsrvd_fix_numerator_18_wraddr_q, redist25_in_rsrvd_fix_numerator_18_rdcnt_q)
    BEGIN
        CASE (redist25_in_rsrvd_fix_numerator_18_rdmux_s) IS
            WHEN "0" => redist25_in_rsrvd_fix_numerator_18_rdmux_q <= redist25_in_rsrvd_fix_numerator_18_wraddr_q;
            WHEN "1" => redist25_in_rsrvd_fix_numerator_18_rdmux_q <= redist25_in_rsrvd_fix_numerator_18_rdcnt_q;
            WHEN OTHERS => redist25_in_rsrvd_fix_numerator_18_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist24_in_rsrvd_fix_numerator_14_notEnable(LOGICAL,355)
    redist24_in_rsrvd_fix_numerator_14_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist24_in_rsrvd_fix_numerator_14_nor(LOGICAL,356)
    redist24_in_rsrvd_fix_numerator_14_nor_q <= not (redist24_in_rsrvd_fix_numerator_14_notEnable_q or redist24_in_rsrvd_fix_numerator_14_sticky_ena_q);

    -- redist24_in_rsrvd_fix_numerator_14_mem_last(CONSTANT,352)
    redist24_in_rsrvd_fix_numerator_14_mem_last_q <= "01010";

    -- redist24_in_rsrvd_fix_numerator_14_cmp(LOGICAL,353)
    redist24_in_rsrvd_fix_numerator_14_cmp_b <= STD_LOGIC_VECTOR("0" & redist24_in_rsrvd_fix_numerator_14_rdmux_q);
    redist24_in_rsrvd_fix_numerator_14_cmp_q <= "1" WHEN redist24_in_rsrvd_fix_numerator_14_mem_last_q = redist24_in_rsrvd_fix_numerator_14_cmp_b ELSE "0";

    -- redist24_in_rsrvd_fix_numerator_14_cmpReg(REG,354)
    redist24_in_rsrvd_fix_numerator_14_cmpReg_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist24_in_rsrvd_fix_numerator_14_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist24_in_rsrvd_fix_numerator_14_cmpReg_q <= STD_LOGIC_VECTOR(redist24_in_rsrvd_fix_numerator_14_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist24_in_rsrvd_fix_numerator_14_sticky_ena(REG,357)
    redist24_in_rsrvd_fix_numerator_14_sticky_ena_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist24_in_rsrvd_fix_numerator_14_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist24_in_rsrvd_fix_numerator_14_nor_q = "1") THEN
                redist24_in_rsrvd_fix_numerator_14_sticky_ena_q <= STD_LOGIC_VECTOR(redist24_in_rsrvd_fix_numerator_14_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist24_in_rsrvd_fix_numerator_14_enaAnd(LOGICAL,358)
    redist24_in_rsrvd_fix_numerator_14_enaAnd_q <= redist24_in_rsrvd_fix_numerator_14_sticky_ena_q and en;

    -- redist24_in_rsrvd_fix_numerator_14_rdcnt(COUNTER,349)
    -- low=0, high=11, step=1, init=0
    redist24_in_rsrvd_fix_numerator_14_rdcnt_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist24_in_rsrvd_fix_numerator_14_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist24_in_rsrvd_fix_numerator_14_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist24_in_rsrvd_fix_numerator_14_rdcnt_i = TO_UNSIGNED(10, 4)) THEN
                    redist24_in_rsrvd_fix_numerator_14_rdcnt_eq <= '1';
                ELSE
                    redist24_in_rsrvd_fix_numerator_14_rdcnt_eq <= '0';
                END IF;
                IF (redist24_in_rsrvd_fix_numerator_14_rdcnt_eq = '1') THEN
                    redist24_in_rsrvd_fix_numerator_14_rdcnt_i <= redist24_in_rsrvd_fix_numerator_14_rdcnt_i + 5;
                ELSE
                    redist24_in_rsrvd_fix_numerator_14_rdcnt_i <= redist24_in_rsrvd_fix_numerator_14_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist24_in_rsrvd_fix_numerator_14_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist24_in_rsrvd_fix_numerator_14_rdcnt_i, 4)));

    -- redist24_in_rsrvd_fix_numerator_14_rdmux(MUX,350)
    redist24_in_rsrvd_fix_numerator_14_rdmux_s <= en;
    redist24_in_rsrvd_fix_numerator_14_rdmux_combproc: PROCESS (redist24_in_rsrvd_fix_numerator_14_rdmux_s, redist24_in_rsrvd_fix_numerator_14_wraddr_q, redist24_in_rsrvd_fix_numerator_14_rdcnt_q)
    BEGIN
        CASE (redist24_in_rsrvd_fix_numerator_14_rdmux_s) IS
            WHEN "0" => redist24_in_rsrvd_fix_numerator_14_rdmux_q <= redist24_in_rsrvd_fix_numerator_14_wraddr_q;
            WHEN "1" => redist24_in_rsrvd_fix_numerator_14_rdmux_q <= redist24_in_rsrvd_fix_numerator_14_rdcnt_q;
            WHEN OTHERS => redist24_in_rsrvd_fix_numerator_14_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist24_in_rsrvd_fix_numerator_14_wraddr(REG,351)
    redist24_in_rsrvd_fix_numerator_14_wraddr_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist24_in_rsrvd_fix_numerator_14_wraddr_q <= "1011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist24_in_rsrvd_fix_numerator_14_wraddr_q <= STD_LOGIC_VECTOR(redist24_in_rsrvd_fix_numerator_14_rdmux_q);
        END IF;
    END PROCESS;

    -- redist24_in_rsrvd_fix_numerator_14_mem(DUALMEM,348)
    redist24_in_rsrvd_fix_numerator_14_mem_ia <= STD_LOGIC_VECTOR(numerator);
    redist24_in_rsrvd_fix_numerator_14_mem_aa <= redist24_in_rsrvd_fix_numerator_14_wraddr_q;
    redist24_in_rsrvd_fix_numerator_14_mem_ab <= redist24_in_rsrvd_fix_numerator_14_rdmux_q;
    redist24_in_rsrvd_fix_numerator_14_mem_reset0 <= rst;
    redist24_in_rsrvd_fix_numerator_14_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 12,
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
        clocken1 => redist24_in_rsrvd_fix_numerator_14_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => redist24_in_rsrvd_fix_numerator_14_mem_reset0,
        clock1 => clk,
        address_a => redist24_in_rsrvd_fix_numerator_14_mem_aa,
        data_a => redist24_in_rsrvd_fix_numerator_14_mem_ia,
        wren_a => en(0),
        address_b => redist24_in_rsrvd_fix_numerator_14_mem_ab,
        q_b => redist24_in_rsrvd_fix_numerator_14_mem_iq
    );
    redist24_in_rsrvd_fix_numerator_14_mem_q <= redist24_in_rsrvd_fix_numerator_14_mem_iq(31 downto 0);

    -- redist24_in_rsrvd_fix_numerator_14_outputreg0(DELAY,347)
    redist24_in_rsrvd_fix_numerator_14_outputreg0_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist24_in_rsrvd_fix_numerator_14_outputreg0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist24_in_rsrvd_fix_numerator_14_outputreg0_q <= STD_LOGIC_VECTOR(redist24_in_rsrvd_fix_numerator_14_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_in_rsrvd_fix_numerator_18_wraddr(REG,362)
    redist25_in_rsrvd_fix_numerator_18_wraddr_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist25_in_rsrvd_fix_numerator_18_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist25_in_rsrvd_fix_numerator_18_wraddr_q <= STD_LOGIC_VECTOR(redist25_in_rsrvd_fix_numerator_18_rdmux_q);
        END IF;
    END PROCESS;

    -- redist25_in_rsrvd_fix_numerator_18_mem(DUALMEM,359)
    redist25_in_rsrvd_fix_numerator_18_mem_ia <= STD_LOGIC_VECTOR(redist24_in_rsrvd_fix_numerator_14_outputreg0_q);
    redist25_in_rsrvd_fix_numerator_18_mem_aa <= redist25_in_rsrvd_fix_numerator_18_wraddr_q;
    redist25_in_rsrvd_fix_numerator_18_mem_ab <= redist25_in_rsrvd_fix_numerator_18_rdmux_q;
    redist25_in_rsrvd_fix_numerator_18_mem_reset0 <= rst;
    redist25_in_rsrvd_fix_numerator_18_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => redist25_in_rsrvd_fix_numerator_18_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => redist25_in_rsrvd_fix_numerator_18_mem_reset0,
        clock1 => clk,
        address_a => redist25_in_rsrvd_fix_numerator_18_mem_aa,
        data_a => redist25_in_rsrvd_fix_numerator_18_mem_ia,
        wren_a => en(0),
        address_b => redist25_in_rsrvd_fix_numerator_18_mem_ab,
        q_b => redist25_in_rsrvd_fix_numerator_18_mem_iq
    );
    redist25_in_rsrvd_fix_numerator_18_mem_q <= redist25_in_rsrvd_fix_numerator_18_mem_iq(31 downto 0);

    -- signX_uid45_divider(BITSELECT,44)@18
    signX_uid45_divider_b <= STD_LOGIC_VECTOR(redist25_in_rsrvd_fix_numerator_18_mem_q(31 downto 31));

    -- redist16_signX_uid45_divider_b_4(DELAY,321)
    redist16_signX_uid45_divider_b_4_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist16_signX_uid45_divider_b_4_delay_0 <= (others => '0');
            redist16_signX_uid45_divider_b_4_delay_1 <= (others => '0');
            redist16_signX_uid45_divider_b_4_delay_2 <= (others => '0');
            redist16_signX_uid45_divider_b_4_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist16_signX_uid45_divider_b_4_delay_0 <= STD_LOGIC_VECTOR(signX_uid45_divider_b);
                redist16_signX_uid45_divider_b_4_delay_1 <= redist16_signX_uid45_divider_b_4_delay_0;
                redist16_signX_uid45_divider_b_4_delay_2 <= redist16_signX_uid45_divider_b_4_delay_1;
                redist16_signX_uid45_divider_b_4_q <= redist16_signX_uid45_divider_b_4_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- resultSign_uid55_divider(LOGICAL,54)@22
    resultSign_uid55_divider_q <= redist16_signX_uid45_divider_b_4_q xor redist23_xMSB_uid7_divider_b_22_q;

    -- cstSubFinal_uid63_divider(BITJOIN,62)@22
    cstSubFinal_uid63_divider_q <= resultSign_uid55_divider_q & VCC_q;

    -- resFinalMP1_uid64_divider(SUB,63)@22
    resFinalMP1_uid64_divider_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => redist15_resFinal_uid47_divider_q_4_outputreg0_q(31)) & redist15_resFinal_uid47_divider_q_4_outputreg0_q));
    resFinalMP1_uid64_divider_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 2 => cstSubFinal_uid63_divider_q(1)) & cstSubFinal_uid63_divider_q));
    resFinalMP1_uid64_divider_o <= STD_LOGIC_VECTOR(SIGNED(resFinalMP1_uid64_divider_a) - SIGNED(resFinalMP1_uid64_divider_b));
    resFinalMP1_uid64_divider_q <= resFinalMP1_uid64_divider_o(32 downto 0);

    -- resFinalPostMux_uid65_divider(BITSELECT,64)@22
    resFinalPostMux_uid65_divider_in <= STD_LOGIC_VECTOR(resFinalMP1_uid64_divider_q(31 downto 0));
    resFinalPostMux_uid65_divider_b <= STD_LOGIC_VECTOR(resFinalPostMux_uid65_divider_in(31 downto 0));

    -- cstValOvfneg_uid44_divider(CONSTANT,43)
    cstValOvfneg_uid44_divider_q <= "10000000000000000000000000000000";

    -- cstValOvfPos_uid43_divider(CONSTANT,42)
    cstValOvfPos_uid43_divider_q <= "01111111111111111111111111111111";

    -- cstOvf_uid46_divider(MUX,45)@18
    cstOvf_uid46_divider_s <= signX_uid45_divider_b;
    cstOvf_uid46_divider_combproc: PROCESS (cstOvf_uid46_divider_s, cstValOvfPos_uid43_divider_q, cstValOvfneg_uid44_divider_q)
    BEGIN
        CASE (cstOvf_uid46_divider_s) IS
            WHEN "0" => cstOvf_uid46_divider_q <= cstValOvfPos_uid43_divider_q;
            WHEN "1" => cstOvf_uid46_divider_q <= cstValOvfneg_uid44_divider_q;
            WHEN OTHERS => cstOvf_uid46_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneInvRes_uid27_divider(CONSTANT,26)
    oneInvRes_uid27_divider_q <= "100000000000000000000000000000000";

    -- leftShiftStage2Idx3Rng3_uid206_normY_uid14_divider(BITSELECT,205)@2
    leftShiftStage2Idx3Rng3_uid206_normY_uid14_divider_in <= leftShiftStage1_uid198_normY_uid14_divider_q(28 downto 0);
    leftShiftStage2Idx3Rng3_uid206_normY_uid14_divider_b <= leftShiftStage2Idx3Rng3_uid206_normY_uid14_divider_in(28 downto 0);

    -- leftShiftStage2Idx3Pad3_uid205_normY_uid14_divider(CONSTANT,204)
    leftShiftStage2Idx3Pad3_uid205_normY_uid14_divider_q <= "000";

    -- leftShiftStage2Idx3_uid207_normY_uid14_divider(BITJOIN,206)@2
    leftShiftStage2Idx3_uid207_normY_uid14_divider_q <= leftShiftStage2Idx3Rng3_uid206_normY_uid14_divider_b & leftShiftStage2Idx3Pad3_uid205_normY_uid14_divider_q;

    -- leftShiftStage2Idx2Rng2_uid203_normY_uid14_divider(BITSELECT,202)@2
    leftShiftStage2Idx2Rng2_uid203_normY_uid14_divider_in <= leftShiftStage1_uid198_normY_uid14_divider_q(29 downto 0);
    leftShiftStage2Idx2Rng2_uid203_normY_uid14_divider_b <= leftShiftStage2Idx2Rng2_uid203_normY_uid14_divider_in(29 downto 0);

    -- zs_uid92_zCount_uid13_divider(CONSTANT,91)
    zs_uid92_zCount_uid13_divider_q <= "00";

    -- leftShiftStage2Idx2_uid204_normY_uid14_divider(BITJOIN,203)@2
    leftShiftStage2Idx2_uid204_normY_uid14_divider_q <= leftShiftStage2Idx2Rng2_uid203_normY_uid14_divider_b & zs_uid92_zCount_uid13_divider_q;

    -- leftShiftStage2Idx1Rng1_uid200_normY_uid14_divider(BITSELECT,199)@2
    leftShiftStage2Idx1Rng1_uid200_normY_uid14_divider_in <= leftShiftStage1_uid198_normY_uid14_divider_q(30 downto 0);
    leftShiftStage2Idx1Rng1_uid200_normY_uid14_divider_b <= leftShiftStage2Idx1Rng1_uid200_normY_uid14_divider_in(30 downto 0);

    -- leftShiftStage2Idx1_uid201_normY_uid14_divider(BITJOIN,200)@2
    leftShiftStage2Idx1_uid201_normY_uid14_divider_q <= leftShiftStage2Idx1Rng1_uid200_normY_uid14_divider_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid195_normY_uid14_divider(BITSELECT,194)@2
    leftShiftStage1Idx3Rng12_uid195_normY_uid14_divider_in <= leftShiftStage0_uid187_normY_uid14_divider_q(19 downto 0);
    leftShiftStage1Idx3Rng12_uid195_normY_uid14_divider_b <= leftShiftStage1Idx3Rng12_uid195_normY_uid14_divider_in(19 downto 0);

    -- rightBottomX_bottomExtension_uid165_pT3_uid132_invPolyEval(CONSTANT,164)
    rightBottomX_bottomExtension_uid165_pT3_uid132_invPolyEval_q <= "000000000000";

    -- leftShiftStage1Idx3_uid196_normY_uid14_divider(BITJOIN,195)@2
    leftShiftStage1Idx3_uid196_normY_uid14_divider_q <= leftShiftStage1Idx3Rng12_uid195_normY_uid14_divider_b & rightBottomX_bottomExtension_uid165_pT3_uid132_invPolyEval_q;

    -- leftShiftStage1Idx2Rng8_uid192_normY_uid14_divider(BITSELECT,191)@2
    leftShiftStage1Idx2Rng8_uid192_normY_uid14_divider_in <= leftShiftStage0_uid187_normY_uid14_divider_q(23 downto 0);
    leftShiftStage1Idx2Rng8_uid192_normY_uid14_divider_b <= leftShiftStage1Idx2Rng8_uid192_normY_uid14_divider_in(23 downto 0);

    -- zs_uid80_zCount_uid13_divider(CONSTANT,79)
    zs_uid80_zCount_uid13_divider_q <= "00000000";

    -- leftShiftStage1Idx2_uid193_normY_uid14_divider(BITJOIN,192)@2
    leftShiftStage1Idx2_uid193_normY_uid14_divider_q <= leftShiftStage1Idx2Rng8_uid192_normY_uid14_divider_b & zs_uid80_zCount_uid13_divider_q;

    -- leftShiftStage1Idx1Rng4_uid189_normY_uid14_divider(BITSELECT,188)@2
    leftShiftStage1Idx1Rng4_uid189_normY_uid14_divider_in <= leftShiftStage0_uid187_normY_uid14_divider_q(27 downto 0);
    leftShiftStage1Idx1Rng4_uid189_normY_uid14_divider_b <= leftShiftStage1Idx1Rng4_uid189_normY_uid14_divider_in(27 downto 0);

    -- zs_uid86_zCount_uid13_divider(CONSTANT,85)
    zs_uid86_zCount_uid13_divider_q <= "0000";

    -- leftShiftStage1Idx1_uid190_normY_uid14_divider(BITJOIN,189)@2
    leftShiftStage1Idx1_uid190_normY_uid14_divider_q <= leftShiftStage1Idx1Rng4_uid189_normY_uid14_divider_b & zs_uid86_zCount_uid13_divider_q;

    -- zs_uid68_zCount_uid13_divider(CONSTANT,67)
    zs_uid68_zCount_uid13_divider_q <= "00000000000000000000000000000000";

    -- leftShiftStage0Idx1Rng16_uid182_normY_uid14_divider(BITSELECT,181)@2
    leftShiftStage0Idx1Rng16_uid182_normY_uid14_divider_in <= redist21_yPS_uid12_divider_b_2_q(15 downto 0);
    leftShiftStage0Idx1Rng16_uid182_normY_uid14_divider_b <= leftShiftStage0Idx1Rng16_uid182_normY_uid14_divider_in(15 downto 0);

    -- zs_uid74_zCount_uid13_divider(CONSTANT,73)
    zs_uid74_zCount_uid13_divider_q <= "0000000000000000";

    -- leftShiftStage0Idx1_uid183_normY_uid14_divider(BITJOIN,182)@2
    leftShiftStage0Idx1_uid183_normY_uid14_divider_q <= leftShiftStage0Idx1Rng16_uid182_normY_uid14_divider_b & zs_uid74_zCount_uid13_divider_q;

    -- yPSE_uid9_divider(LOGICAL,8)@0
    yPSE_uid9_divider_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => xMSB_uid7_divider_b(0)) & xMSB_uid7_divider_b));
    yPSE_uid9_divider_q <= denominator xor yPSE_uid9_divider_b;

    -- yPSEA_uid11_divider(ADD,10)@0
    yPSEA_uid11_divider_a <= STD_LOGIC_VECTOR("0" & yPSE_uid9_divider_q);
    yPSEA_uid11_divider_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & xMSB_uid7_divider_b);
    yPSEA_uid11_divider_o <= STD_LOGIC_VECTOR(UNSIGNED(yPSEA_uid11_divider_a) + UNSIGNED(yPSEA_uid11_divider_b));
    yPSEA_uid11_divider_q <= yPSEA_uid11_divider_o(32 downto 0);

    -- yPS_uid12_divider(BITSELECT,11)@0
    yPS_uid12_divider_in <= STD_LOGIC_VECTOR(yPSEA_uid11_divider_q(31 downto 0));
    yPS_uid12_divider_b <= STD_LOGIC_VECTOR(yPS_uid12_divider_in(31 downto 0));

    -- redist21_yPS_uid12_divider_b_2(DELAY,326)
    redist21_yPS_uid12_divider_b_2_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist21_yPS_uid12_divider_b_2_delay_0 <= (others => '0');
            redist21_yPS_uid12_divider_b_2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist21_yPS_uid12_divider_b_2_delay_0 <= STD_LOGIC_VECTOR(yPS_uid12_divider_b);
                redist21_yPS_uid12_divider_b_2_q <= redist21_yPS_uid12_divider_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage0_uid187_normY_uid14_divider(MUX,186)@2
    leftShiftStage0_uid187_normY_uid14_divider_s <= leftShiftStageSel0Dto4_uid186_normY_uid14_divider_merged_bit_select_b;
    leftShiftStage0_uid187_normY_uid14_divider_combproc: PROCESS (leftShiftStage0_uid187_normY_uid14_divider_s, redist21_yPS_uid12_divider_b_2_q, leftShiftStage0Idx1_uid183_normY_uid14_divider_q, zs_uid68_zCount_uid13_divider_q)
    BEGIN
        CASE (leftShiftStage0_uid187_normY_uid14_divider_s) IS
            WHEN "00" => leftShiftStage0_uid187_normY_uid14_divider_q <= redist21_yPS_uid12_divider_b_2_q;
            WHEN "01" => leftShiftStage0_uid187_normY_uid14_divider_q <= leftShiftStage0Idx1_uid183_normY_uid14_divider_q;
            WHEN "10" => leftShiftStage0_uid187_normY_uid14_divider_q <= zs_uid68_zCount_uid13_divider_q;
            WHEN "11" => leftShiftStage0_uid187_normY_uid14_divider_q <= zs_uid68_zCount_uid13_divider_q;
            WHEN OTHERS => leftShiftStage0_uid187_normY_uid14_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid198_normY_uid14_divider(MUX,197)@2
    leftShiftStage1_uid198_normY_uid14_divider_s <= leftShiftStageSel0Dto4_uid186_normY_uid14_divider_merged_bit_select_c;
    leftShiftStage1_uid198_normY_uid14_divider_combproc: PROCESS (leftShiftStage1_uid198_normY_uid14_divider_s, leftShiftStage0_uid187_normY_uid14_divider_q, leftShiftStage1Idx1_uid190_normY_uid14_divider_q, leftShiftStage1Idx2_uid193_normY_uid14_divider_q, leftShiftStage1Idx3_uid196_normY_uid14_divider_q)
    BEGIN
        CASE (leftShiftStage1_uid198_normY_uid14_divider_s) IS
            WHEN "00" => leftShiftStage1_uid198_normY_uid14_divider_q <= leftShiftStage0_uid187_normY_uid14_divider_q;
            WHEN "01" => leftShiftStage1_uid198_normY_uid14_divider_q <= leftShiftStage1Idx1_uid190_normY_uid14_divider_q;
            WHEN "10" => leftShiftStage1_uid198_normY_uid14_divider_q <= leftShiftStage1Idx2_uid193_normY_uid14_divider_q;
            WHEN "11" => leftShiftStage1_uid198_normY_uid14_divider_q <= leftShiftStage1Idx3_uid196_normY_uid14_divider_q;
            WHEN OTHERS => leftShiftStage1_uid198_normY_uid14_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- vCount_uid70_zCount_uid13_divider(LOGICAL,69)@0
    vCount_uid70_zCount_uid13_divider_q <= "1" WHEN yPS_uid12_divider_b = zs_uid68_zCount_uid13_divider_q ELSE "0";

    -- redist14_vCount_uid70_zCount_uid13_divider_q_2(DELAY,319)
    redist14_vCount_uid70_zCount_uid13_divider_q_2_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist14_vCount_uid70_zCount_uid13_divider_q_2_delay_0 <= (others => '0');
            redist14_vCount_uid70_zCount_uid13_divider_q_2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist14_vCount_uid70_zCount_uid13_divider_q_2_delay_0 <= STD_LOGIC_VECTOR(vCount_uid70_zCount_uid13_divider_q);
                redist14_vCount_uid70_zCount_uid13_divider_q_2_q <= redist14_vCount_uid70_zCount_uid13_divider_q_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- mO_uid71_zCount_uid13_divider(CONSTANT,70)
    mO_uid71_zCount_uid13_divider_q <= "11111111111111111111111111111111";

    -- vStagei_uid73_zCount_uid13_divider(MUX,72)@0 + 1
    vStagei_uid73_zCount_uid13_divider_s <= vCount_uid70_zCount_uid13_divider_q;
    vStagei_uid73_zCount_uid13_divider_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            vStagei_uid73_zCount_uid13_divider_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (vStagei_uid73_zCount_uid13_divider_s) IS
                    WHEN "0" => vStagei_uid73_zCount_uid13_divider_q <= yPS_uid12_divider_b;
                    WHEN "1" => vStagei_uid73_zCount_uid13_divider_q <= mO_uid71_zCount_uid13_divider_q;
                    WHEN OTHERS => vStagei_uid73_zCount_uid13_divider_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- rVStage_uid75_zCount_uid13_divider_merged_bit_select(BITSELECT,298)@1
    rVStage_uid75_zCount_uid13_divider_merged_bit_select_b <= vStagei_uid73_zCount_uid13_divider_q(31 downto 16);
    rVStage_uid75_zCount_uid13_divider_merged_bit_select_c <= vStagei_uid73_zCount_uid13_divider_q(15 downto 0);

    -- vCount_uid76_zCount_uid13_divider(LOGICAL,75)@1
    vCount_uid76_zCount_uid13_divider_q <= "1" WHEN rVStage_uid75_zCount_uid13_divider_merged_bit_select_b = zs_uid74_zCount_uid13_divider_q ELSE "0";

    -- redist13_vCount_uid76_zCount_uid13_divider_q_1(DELAY,318)
    redist13_vCount_uid76_zCount_uid13_divider_q_1_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist13_vCount_uid76_zCount_uid13_divider_q_1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist13_vCount_uid76_zCount_uid13_divider_q_1_q <= STD_LOGIC_VECTOR(vCount_uid76_zCount_uid13_divider_q);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid79_zCount_uid13_divider(MUX,78)@1
    vStagei_uid79_zCount_uid13_divider_s <= vCount_uid76_zCount_uid13_divider_q;
    vStagei_uid79_zCount_uid13_divider_combproc: PROCESS (vStagei_uid79_zCount_uid13_divider_s, rVStage_uid75_zCount_uid13_divider_merged_bit_select_b, rVStage_uid75_zCount_uid13_divider_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid79_zCount_uid13_divider_s) IS
            WHEN "0" => vStagei_uid79_zCount_uid13_divider_q <= rVStage_uid75_zCount_uid13_divider_merged_bit_select_b;
            WHEN "1" => vStagei_uid79_zCount_uid13_divider_q <= rVStage_uid75_zCount_uid13_divider_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid79_zCount_uid13_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid81_zCount_uid13_divider_merged_bit_select(BITSELECT,299)@1
    rVStage_uid81_zCount_uid13_divider_merged_bit_select_b <= vStagei_uid79_zCount_uid13_divider_q(15 downto 8);
    rVStage_uid81_zCount_uid13_divider_merged_bit_select_c <= vStagei_uid79_zCount_uid13_divider_q(7 downto 0);

    -- vCount_uid82_zCount_uid13_divider(LOGICAL,81)@1
    vCount_uid82_zCount_uid13_divider_q <= "1" WHEN rVStage_uid81_zCount_uid13_divider_merged_bit_select_b = zs_uid80_zCount_uid13_divider_q ELSE "0";

    -- redist12_vCount_uid82_zCount_uid13_divider_q_1(DELAY,317)
    redist12_vCount_uid82_zCount_uid13_divider_q_1_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist12_vCount_uid82_zCount_uid13_divider_q_1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist12_vCount_uid82_zCount_uid13_divider_q_1_q <= STD_LOGIC_VECTOR(vCount_uid82_zCount_uid13_divider_q);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid85_zCount_uid13_divider(MUX,84)@1
    vStagei_uid85_zCount_uid13_divider_s <= vCount_uid82_zCount_uid13_divider_q;
    vStagei_uid85_zCount_uid13_divider_combproc: PROCESS (vStagei_uid85_zCount_uid13_divider_s, rVStage_uid81_zCount_uid13_divider_merged_bit_select_b, rVStage_uid81_zCount_uid13_divider_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid85_zCount_uid13_divider_s) IS
            WHEN "0" => vStagei_uid85_zCount_uid13_divider_q <= rVStage_uid81_zCount_uid13_divider_merged_bit_select_b;
            WHEN "1" => vStagei_uid85_zCount_uid13_divider_q <= rVStage_uid81_zCount_uid13_divider_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid85_zCount_uid13_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid87_zCount_uid13_divider_merged_bit_select(BITSELECT,300)@1
    rVStage_uid87_zCount_uid13_divider_merged_bit_select_b <= vStagei_uid85_zCount_uid13_divider_q(7 downto 4);
    rVStage_uid87_zCount_uid13_divider_merged_bit_select_c <= vStagei_uid85_zCount_uid13_divider_q(3 downto 0);

    -- vCount_uid88_zCount_uid13_divider(LOGICAL,87)@1 + 1
    vCount_uid88_zCount_uid13_divider_qi <= "1" WHEN rVStage_uid87_zCount_uid13_divider_merged_bit_select_b = zs_uid86_zCount_uid13_divider_q ELSE "0";
    vCount_uid88_zCount_uid13_divider_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid88_zCount_uid13_divider_qi, xout => vCount_uid88_zCount_uid13_divider_q, ena => en(0), clk => clk, aclr => rst );

    -- redist1_rVStage_uid87_zCount_uid13_divider_merged_bit_select_c_1(DELAY,306)
    redist1_rVStage_uid87_zCount_uid13_divider_merged_bit_select_c_1_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist1_rVStage_uid87_zCount_uid13_divider_merged_bit_select_c_1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist1_rVStage_uid87_zCount_uid13_divider_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(rVStage_uid87_zCount_uid13_divider_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_rVStage_uid87_zCount_uid13_divider_merged_bit_select_b_1(DELAY,305)
    redist0_rVStage_uid87_zCount_uid13_divider_merged_bit_select_b_1_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist0_rVStage_uid87_zCount_uid13_divider_merged_bit_select_b_1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist0_rVStage_uid87_zCount_uid13_divider_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(rVStage_uid87_zCount_uid13_divider_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid91_zCount_uid13_divider(MUX,90)@2
    vStagei_uid91_zCount_uid13_divider_s <= vCount_uid88_zCount_uid13_divider_q;
    vStagei_uid91_zCount_uid13_divider_combproc: PROCESS (vStagei_uid91_zCount_uid13_divider_s, redist0_rVStage_uid87_zCount_uid13_divider_merged_bit_select_b_1_q, redist1_rVStage_uid87_zCount_uid13_divider_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid91_zCount_uid13_divider_s) IS
            WHEN "0" => vStagei_uid91_zCount_uid13_divider_q <= redist0_rVStage_uid87_zCount_uid13_divider_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid91_zCount_uid13_divider_q <= redist1_rVStage_uid87_zCount_uid13_divider_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid91_zCount_uid13_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid93_zCount_uid13_divider_merged_bit_select(BITSELECT,301)@2
    rVStage_uid93_zCount_uid13_divider_merged_bit_select_b <= vStagei_uid91_zCount_uid13_divider_q(3 downto 2);
    rVStage_uid93_zCount_uid13_divider_merged_bit_select_c <= vStagei_uid91_zCount_uid13_divider_q(1 downto 0);

    -- vCount_uid94_zCount_uid13_divider(LOGICAL,93)@2
    vCount_uid94_zCount_uid13_divider_q <= "1" WHEN rVStage_uid93_zCount_uid13_divider_merged_bit_select_b = zs_uid92_zCount_uid13_divider_q ELSE "0";

    -- vStagei_uid97_zCount_uid13_divider(MUX,96)@2
    vStagei_uid97_zCount_uid13_divider_s <= vCount_uid94_zCount_uid13_divider_q;
    vStagei_uid97_zCount_uid13_divider_combproc: PROCESS (vStagei_uid97_zCount_uid13_divider_s, rVStage_uid93_zCount_uid13_divider_merged_bit_select_b, rVStage_uid93_zCount_uid13_divider_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid97_zCount_uid13_divider_s) IS
            WHEN "0" => vStagei_uid97_zCount_uid13_divider_q <= rVStage_uid93_zCount_uid13_divider_merged_bit_select_b;
            WHEN "1" => vStagei_uid97_zCount_uid13_divider_q <= rVStage_uid93_zCount_uid13_divider_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid97_zCount_uid13_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid99_zCount_uid13_divider(BITSELECT,98)@2
    rVStage_uid99_zCount_uid13_divider_b <= vStagei_uid97_zCount_uid13_divider_q(1 downto 1);

    -- vCount_uid100_zCount_uid13_divider(LOGICAL,99)@2
    vCount_uid100_zCount_uid13_divider_q <= "1" WHEN rVStage_uid99_zCount_uid13_divider_b = GND_q ELSE "0";

    -- r_uid101_zCount_uid13_divider(BITJOIN,100)@2
    r_uid101_zCount_uid13_divider_q <= redist14_vCount_uid70_zCount_uid13_divider_q_2_q & redist13_vCount_uid76_zCount_uid13_divider_q_1_q & redist12_vCount_uid82_zCount_uid13_divider_q_1_q & vCount_uid88_zCount_uid13_divider_q & vCount_uid94_zCount_uid13_divider_q & vCount_uid100_zCount_uid13_divider_q;

    -- leftShiftStageSel0Dto4_uid186_normY_uid14_divider_merged_bit_select(BITSELECT,302)@2
    leftShiftStageSel0Dto4_uid186_normY_uid14_divider_merged_bit_select_b <= r_uid101_zCount_uid13_divider_q(5 downto 4);
    leftShiftStageSel0Dto4_uid186_normY_uid14_divider_merged_bit_select_c <= r_uid101_zCount_uid13_divider_q(3 downto 2);
    leftShiftStageSel0Dto4_uid186_normY_uid14_divider_merged_bit_select_d <= r_uid101_zCount_uid13_divider_q(1 downto 0);

    -- leftShiftStage2_uid209_normY_uid14_divider(MUX,208)@2
    leftShiftStage2_uid209_normY_uid14_divider_s <= leftShiftStageSel0Dto4_uid186_normY_uid14_divider_merged_bit_select_d;
    leftShiftStage2_uid209_normY_uid14_divider_combproc: PROCESS (leftShiftStage2_uid209_normY_uid14_divider_s, leftShiftStage1_uid198_normY_uid14_divider_q, leftShiftStage2Idx1_uid201_normY_uid14_divider_q, leftShiftStage2Idx2_uid204_normY_uid14_divider_q, leftShiftStage2Idx3_uid207_normY_uid14_divider_q)
    BEGIN
        CASE (leftShiftStage2_uid209_normY_uid14_divider_s) IS
            WHEN "00" => leftShiftStage2_uid209_normY_uid14_divider_q <= leftShiftStage1_uid198_normY_uid14_divider_q;
            WHEN "01" => leftShiftStage2_uid209_normY_uid14_divider_q <= leftShiftStage2Idx1_uid201_normY_uid14_divider_q;
            WHEN "10" => leftShiftStage2_uid209_normY_uid14_divider_q <= leftShiftStage2Idx2_uid204_normY_uid14_divider_q;
            WHEN "11" => leftShiftStage2_uid209_normY_uid14_divider_q <= leftShiftStage2Idx3_uid207_normY_uid14_divider_q;
            WHEN OTHERS => leftShiftStage2_uid209_normY_uid14_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- normYNoLeadOne_uid15_divider(BITSELECT,14)@2
    normYNoLeadOne_uid15_divider_in <= leftShiftStage2_uid209_normY_uid14_divider_q(30 downto 0);
    normYNoLeadOne_uid15_divider_b <= normYNoLeadOne_uid15_divider_in(30 downto 0);

    -- yAddr_uid23_divider_merged_bit_select(BITSELECT,295)@2
    yAddr_uid23_divider_merged_bit_select_b <= normYNoLeadOne_uid15_divider_b(30 downto 23);
    yAddr_uid23_divider_merged_bit_select_c <= normYNoLeadOne_uid15_divider_b(22 downto 0);

    -- redist7_yAddr_uid23_divider_merged_bit_select_c_2(DELAY,312)
    redist7_yAddr_uid23_divider_merged_bit_select_c_2_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist7_yAddr_uid23_divider_merged_bit_select_c_2_delay_0 <= (others => '0');
            redist7_yAddr_uid23_divider_merged_bit_select_c_2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist7_yAddr_uid23_divider_merged_bit_select_c_2_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid23_divider_merged_bit_select_c);
                redist7_yAddr_uid23_divider_merged_bit_select_c_2_q <= redist7_yAddr_uid23_divider_merged_bit_select_c_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- redist8_yAddr_uid23_divider_merged_bit_select_c_5(DELAY,313)
    redist8_yAddr_uid23_divider_merged_bit_select_c_5_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist8_yAddr_uid23_divider_merged_bit_select_c_5_delay_0 <= (others => '0');
            redist8_yAddr_uid23_divider_merged_bit_select_c_5_delay_1 <= (others => '0');
            redist8_yAddr_uid23_divider_merged_bit_select_c_5_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist8_yAddr_uid23_divider_merged_bit_select_c_5_delay_0 <= STD_LOGIC_VECTOR(redist7_yAddr_uid23_divider_merged_bit_select_c_2_q);
                redist8_yAddr_uid23_divider_merged_bit_select_c_5_delay_1 <= redist8_yAddr_uid23_divider_merged_bit_select_c_5_delay_0;
                redist8_yAddr_uid23_divider_merged_bit_select_c_5_q <= redist8_yAddr_uid23_divider_merged_bit_select_c_5_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- redist9_yAddr_uid23_divider_merged_bit_select_c_8(DELAY,314)
    redist9_yAddr_uid23_divider_merged_bit_select_c_8_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist9_yAddr_uid23_divider_merged_bit_select_c_8_delay_0 <= (others => '0');
            redist9_yAddr_uid23_divider_merged_bit_select_c_8_delay_1 <= (others => '0');
            redist9_yAddr_uid23_divider_merged_bit_select_c_8_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist9_yAddr_uid23_divider_merged_bit_select_c_8_delay_0 <= STD_LOGIC_VECTOR(redist8_yAddr_uid23_divider_merged_bit_select_c_5_q);
                redist9_yAddr_uid23_divider_merged_bit_select_c_8_delay_1 <= redist9_yAddr_uid23_divider_merged_bit_select_c_8_delay_0;
                redist9_yAddr_uid23_divider_merged_bit_select_c_8_q <= redist9_yAddr_uid23_divider_merged_bit_select_c_8_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- nx_mergedSignalTM_uid156_pT3_uid132_invPolyEval(BITJOIN,155)@10
    nx_mergedSignalTM_uid156_pT3_uid132_invPolyEval_q <= GND_q & redist9_yAddr_uid23_divider_merged_bit_select_c_8_q;

    -- topRangeX_uid158_pT3_uid132_invPolyEval_merged_bit_select(BITSELECT,304)@10
    topRangeX_uid158_pT3_uid132_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid156_pT3_uid132_invPolyEval_q(23 downto 6));
    topRangeX_uid158_pT3_uid132_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid156_pT3_uid132_invPolyEval_q(5 downto 0));

    -- aboveLeftY_bottomExtension_uid161_pT3_uid132_invPolyEval(CONSTANT,160)
    aboveLeftY_bottomExtension_uid161_pT3_uid132_invPolyEval_q <= "00000";

    -- aboveLeftY_mergedSignalTM_uid163_pT3_uid132_invPolyEval(BITJOIN,162)@10
    aboveLeftY_mergedSignalTM_uid163_pT3_uid132_invPolyEval_q <= topRangeY_uid159_pT3_uid132_invPolyEval_merged_bit_select_c & aboveLeftY_bottomExtension_uid161_pT3_uid132_invPolyEval_q;

    -- memoryC3_uid112_invTabGen_lutmem(DUALMEM,284)@2 + 2
    -- in j@20000000
    memoryC3_uid112_invTabGen_lutmem_aa <= yAddr_uid23_divider_merged_bit_select_b;
    memoryC3_uid112_invTabGen_lutmem_reset0 <= rst;
    memoryC3_uid112_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 14,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_hzr34sy_memoryC3_uid112_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC3_uid112_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid112_invTabGen_lutmem_aa,
        q_a => memoryC3_uid112_invTabGen_lutmem_ir
    );
    memoryC3_uid112_invTabGen_lutmem_r <= memoryC3_uid112_invTabGen_lutmem_ir(13 downto 0);

    -- yT1_uid119_invPolyEval(BITSELECT,118)@4
    yT1_uid119_invPolyEval_b <= redist7_yAddr_uid23_divider_merged_bit_select_c_2_q(22 downto 9);

    -- prodXY_uid138_pT1_uid120_invPolyEval_cma(CHAINMULTADD,285)@4 + 3
    prodXY_uid138_pT1_uid120_invPolyEval_cma_reset <= rst;
    prodXY_uid138_pT1_uid120_invPolyEval_cma_ena0 <= en(0);
    prodXY_uid138_pT1_uid120_invPolyEval_cma_ena1 <= prodXY_uid138_pT1_uid120_invPolyEval_cma_ena0;
    prodXY_uid138_pT1_uid120_invPolyEval_cma_ena2 <= prodXY_uid138_pT1_uid120_invPolyEval_cma_ena0;

    prodXY_uid138_pT1_uid120_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(yT1_uid119_invPolyEval_b),14));
    prodXY_uid138_pT1_uid120_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(memoryC3_uid112_invTabGen_lutmem_r),14));
    prodXY_uid138_pT1_uid120_invPolyEval_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        ax_clock => "0",
        ax_width => 14,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 28
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid138_pT1_uid120_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid138_pT1_uid120_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid138_pT1_uid120_invPolyEval_cma_ena2,
        aclr(0) => prodXY_uid138_pT1_uid120_invPolyEval_cma_reset,
        aclr(1) => prodXY_uid138_pT1_uid120_invPolyEval_cma_reset,
        ay => prodXY_uid138_pT1_uid120_invPolyEval_cma_a0,
        ax => prodXY_uid138_pT1_uid120_invPolyEval_cma_c0,
        resulta => prodXY_uid138_pT1_uid120_invPolyEval_cma_s0
    );
    prodXY_uid138_pT1_uid120_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid138_pT1_uid120_invPolyEval_cma_s0, xout => prodXY_uid138_pT1_uid120_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXY_uid138_pT1_uid120_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid138_pT1_uid120_invPolyEval_cma_qq(27 downto 0));

    -- osig_uid139_pT1_uid120_invPolyEval(BITSELECT,138)@7
    osig_uid139_pT1_uid120_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid138_pT1_uid120_invPolyEval_cma_q(27 downto 14));

    -- highBBits_uid122_invPolyEval(BITSELECT,121)@7
    highBBits_uid122_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid139_pT1_uid120_invPolyEval_b(13 downto 1));

    -- redist4_yAddr_uid23_divider_merged_bit_select_b_3(DELAY,309)
    redist4_yAddr_uid23_divider_merged_bit_select_b_3_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist4_yAddr_uid23_divider_merged_bit_select_b_3_delay_0 <= (others => '0');
            redist4_yAddr_uid23_divider_merged_bit_select_b_3_delay_1 <= (others => '0');
            redist4_yAddr_uid23_divider_merged_bit_select_b_3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist4_yAddr_uid23_divider_merged_bit_select_b_3_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid23_divider_merged_bit_select_b);
                redist4_yAddr_uid23_divider_merged_bit_select_b_3_delay_1 <= redist4_yAddr_uid23_divider_merged_bit_select_b_3_delay_0;
                redist4_yAddr_uid23_divider_merged_bit_select_b_3_q <= redist4_yAddr_uid23_divider_merged_bit_select_b_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC2_uid109_invTabGen_lutmem(DUALMEM,283)@5 + 2
    -- in j@20000000
    memoryC2_uid109_invTabGen_lutmem_aa <= redist4_yAddr_uid23_divider_merged_bit_select_b_3_q;
    memoryC2_uid109_invTabGen_lutmem_reset0 <= rst;
    memoryC2_uid109_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_hzr34sy_memoryC2_uid109_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC2_uid109_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid109_invTabGen_lutmem_aa,
        q_a => memoryC2_uid109_invTabGen_lutmem_ir
    );
    memoryC2_uid109_invTabGen_lutmem_r <= memoryC2_uid109_invTabGen_lutmem_ir(20 downto 0);

    -- s1sumAHighB_uid123_invPolyEval(ADD,122)@7
    s1sumAHighB_uid123_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => memoryC2_uid109_invTabGen_lutmem_r(20)) & memoryC2_uid109_invTabGen_lutmem_r));
    s1sumAHighB_uid123_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid122_invPolyEval_b(12)) & highBBits_uid122_invPolyEval_b));
    s1sumAHighB_uid123_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid123_invPolyEval_a) + SIGNED(s1sumAHighB_uid123_invPolyEval_b));
    s1sumAHighB_uid123_invPolyEval_q <= s1sumAHighB_uid123_invPolyEval_o(21 downto 0);

    -- lowRangeB_uid121_invPolyEval(BITSELECT,120)@7
    lowRangeB_uid121_invPolyEval_in <= osig_uid139_pT1_uid120_invPolyEval_b(0 downto 0);
    lowRangeB_uid121_invPolyEval_b <= lowRangeB_uid121_invPolyEval_in(0 downto 0);

    -- s1_uid124_invPolyEval(BITJOIN,123)@7
    s1_uid124_invPolyEval_q <= s1sumAHighB_uid123_invPolyEval_q & lowRangeB_uid121_invPolyEval_b;

    -- yT2_uid125_invPolyEval(BITSELECT,124)@7
    yT2_uid125_invPolyEval_b <= redist8_yAddr_uid23_divider_merged_bit_select_c_5_q(22 downto 2);

    -- prodXY_uid141_pT2_uid126_invPolyEval_cma(CHAINMULTADD,286)@7 + 3
    prodXY_uid141_pT2_uid126_invPolyEval_cma_reset <= rst;
    prodXY_uid141_pT2_uid126_invPolyEval_cma_ena0 <= en(0);
    prodXY_uid141_pT2_uid126_invPolyEval_cma_ena1 <= prodXY_uid141_pT2_uid126_invPolyEval_cma_ena0;
    prodXY_uid141_pT2_uid126_invPolyEval_cma_ena2 <= prodXY_uid141_pT2_uid126_invPolyEval_cma_ena0;

    prodXY_uid141_pT2_uid126_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(yT2_uid125_invPolyEval_b),21));
    prodXY_uid141_pT2_uid126_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(s1_uid124_invPolyEval_q),23));
    prodXY_uid141_pT2_uid126_invPolyEval_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 21,
        ax_clock => "0",
        ax_width => 23,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 44
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid141_pT2_uid126_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid141_pT2_uid126_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid141_pT2_uid126_invPolyEval_cma_ena2,
        aclr(0) => prodXY_uid141_pT2_uid126_invPolyEval_cma_reset,
        aclr(1) => prodXY_uid141_pT2_uid126_invPolyEval_cma_reset,
        ay => prodXY_uid141_pT2_uid126_invPolyEval_cma_a0,
        ax => prodXY_uid141_pT2_uid126_invPolyEval_cma_c0,
        resulta => prodXY_uid141_pT2_uid126_invPolyEval_cma_s0
    );
    prodXY_uid141_pT2_uid126_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 44, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid141_pT2_uid126_invPolyEval_cma_s0, xout => prodXY_uid141_pT2_uid126_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXY_uid141_pT2_uid126_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid141_pT2_uid126_invPolyEval_cma_qq(43 downto 0));

    -- osig_uid142_pT2_uid126_invPolyEval(BITSELECT,141)@10
    osig_uid142_pT2_uid126_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid141_pT2_uid126_invPolyEval_cma_q(43 downto 21));

    -- highBBits_uid128_invPolyEval(BITSELECT,127)@10
    highBBits_uid128_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid142_pT2_uid126_invPolyEval_b(22 downto 1));

    -- redist5_yAddr_uid23_divider_merged_bit_select_b_6(DELAY,310)
    redist5_yAddr_uid23_divider_merged_bit_select_b_6_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist5_yAddr_uid23_divider_merged_bit_select_b_6_delay_0 <= (others => '0');
            redist5_yAddr_uid23_divider_merged_bit_select_b_6_delay_1 <= (others => '0');
            redist5_yAddr_uid23_divider_merged_bit_select_b_6_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist5_yAddr_uid23_divider_merged_bit_select_b_6_delay_0 <= STD_LOGIC_VECTOR(redist4_yAddr_uid23_divider_merged_bit_select_b_3_q);
                redist5_yAddr_uid23_divider_merged_bit_select_b_6_delay_1 <= redist5_yAddr_uid23_divider_merged_bit_select_b_6_delay_0;
                redist5_yAddr_uid23_divider_merged_bit_select_b_6_q <= redist5_yAddr_uid23_divider_merged_bit_select_b_6_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid106_invTabGen_lutmem(DUALMEM,282)@8 + 2
    -- in j@20000000
    memoryC1_uid106_invTabGen_lutmem_aa <= redist5_yAddr_uid23_divider_merged_bit_select_b_6_q;
    memoryC1_uid106_invTabGen_lutmem_reset0 <= rst;
    memoryC1_uid106_invTabGen_lutmem_dmem : altera_syncram
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
        init_file => "Fix_Div_altera_fxp_functions_191_hzr34sy_memoryC1_uid106_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC1_uid106_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid106_invTabGen_lutmem_aa,
        q_a => memoryC1_uid106_invTabGen_lutmem_ir
    );
    memoryC1_uid106_invTabGen_lutmem_r <= memoryC1_uid106_invTabGen_lutmem_ir(28 downto 0);

    -- s2sumAHighB_uid129_invPolyEval(ADD,128)@10
    s2sumAHighB_uid129_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => memoryC1_uid106_invTabGen_lutmem_r(28)) & memoryC1_uid106_invTabGen_lutmem_r));
    s2sumAHighB_uid129_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid128_invPolyEval_b(21)) & highBBits_uid128_invPolyEval_b));
    s2sumAHighB_uid129_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid129_invPolyEval_a) + SIGNED(s2sumAHighB_uid129_invPolyEval_b));
    s2sumAHighB_uid129_invPolyEval_q <= s2sumAHighB_uid129_invPolyEval_o(29 downto 0);

    -- lowRangeB_uid127_invPolyEval(BITSELECT,126)@10
    lowRangeB_uid127_invPolyEval_in <= osig_uid142_pT2_uid126_invPolyEval_b(0 downto 0);
    lowRangeB_uid127_invPolyEval_b <= lowRangeB_uid127_invPolyEval_in(0 downto 0);

    -- s2_uid130_invPolyEval(BITJOIN,129)@10
    s2_uid130_invPolyEval_q <= s2sumAHighB_uid129_invPolyEval_q & lowRangeB_uid127_invPolyEval_b;

    -- topRangeY_uid159_pT3_uid132_invPolyEval_merged_bit_select(BITSELECT,303)@10
    topRangeY_uid159_pT3_uid132_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(s2_uid130_invPolyEval_q(30 downto 13));
    topRangeY_uid159_pT3_uid132_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(s2_uid130_invPolyEval_q(12 downto 0));

    -- rightBottomX_mergedSignalTM_uid167_pT3_uid132_invPolyEval(BITJOIN,166)@10
    rightBottomX_mergedSignalTM_uid167_pT3_uid132_invPolyEval_q <= topRangeX_uid158_pT3_uid132_invPolyEval_merged_bit_select_c & rightBottomX_bottomExtension_uid165_pT3_uid132_invPolyEval_q;

    -- multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma(CHAINMULTADD,292)@10 + 3
    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_reset <= rst;
    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena0 <= en(0);
    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena2 <= multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena0;

    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid167_pT3_uid132_invPolyEval_q),18));
    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(topRangeY_uid159_pT3_uid132_invPolyEval_merged_bit_select_b),18));
    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_a1 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid163_pT3_uid132_invPolyEval_q),18));
    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_c1 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(topRangeX_uid158_pT3_uid132_invPolyEval_merged_bit_select_b),18));
    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        by_clock => "0",
        by_width => 18,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "false",
        signed_mby => "false",
        signed_max => "true",
        signed_mbx => "true",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 37
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena0,
        ena(1) => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena1,
        ena(2) => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_ena2,
        aclr(0) => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_reset,
        aclr(1) => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_reset,
        ay => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_a1,
        by => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_a0,
        ax => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_c1,
        bx => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_c0,
        resulta => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_s0
    );
    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_s0, xout => multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid174_pT3_uid132_invPolyEval(BITSELECT,173)@13
    highBBits_uid174_pT3_uid132_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_q(36 downto 18));

    -- sm0_uid170_pT3_uid132_invPolyEval_cma(CHAINMULTADD,287)@10 + 3
    sm0_uid170_pT3_uid132_invPolyEval_cma_reset <= rst;
    sm0_uid170_pT3_uid132_invPolyEval_cma_ena0 <= en(0);
    sm0_uid170_pT3_uid132_invPolyEval_cma_ena1 <= sm0_uid170_pT3_uid132_invPolyEval_cma_ena0;
    sm0_uid170_pT3_uid132_invPolyEval_cma_ena2 <= sm0_uid170_pT3_uid132_invPolyEval_cma_ena0;

    sm0_uid170_pT3_uid132_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(topRangeX_uid158_pT3_uid132_invPolyEval_merged_bit_select_b),18));
    sm0_uid170_pT3_uid132_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(topRangeY_uid159_pT3_uid132_invPolyEval_merged_bit_select_b),18));
    sm0_uid170_pT3_uid132_invPolyEval_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        ax_clock => "0",
        ax_width => 18,
        signed_may => "true",
        signed_max => "true",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 36
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => sm0_uid170_pT3_uid132_invPolyEval_cma_ena0,
        ena(1) => sm0_uid170_pT3_uid132_invPolyEval_cma_ena1,
        ena(2) => sm0_uid170_pT3_uid132_invPolyEval_cma_ena2,
        aclr(0) => sm0_uid170_pT3_uid132_invPolyEval_cma_reset,
        aclr(1) => sm0_uid170_pT3_uid132_invPolyEval_cma_reset,
        ay => sm0_uid170_pT3_uid132_invPolyEval_cma_a0,
        ax => sm0_uid170_pT3_uid132_invPolyEval_cma_c0,
        resulta => sm0_uid170_pT3_uid132_invPolyEval_cma_s0
    );
    sm0_uid170_pT3_uid132_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid170_pT3_uid132_invPolyEval_cma_s0, xout => sm0_uid170_pT3_uid132_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    sm0_uid170_pT3_uid132_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid170_pT3_uid132_invPolyEval_cma_qq(35 downto 0));

    -- lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval(ADD,174)@13
    lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => sm0_uid170_pT3_uid132_invPolyEval_cma_q(35)) & sm0_uid170_pT3_uid132_invPolyEval_cma_q));
    lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 19 => highBBits_uid174_pT3_uid132_invPolyEval_b(18)) & highBBits_uid174_pT3_uid132_invPolyEval_b));
    lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_b));
    lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_q <= lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_o(36 downto 0);

    -- lowRangeB_uid173_pT3_uid132_invPolyEval(BITSELECT,172)@13
    lowRangeB_uid173_pT3_uid132_invPolyEval_in <= multSumOfTwoTS_uid171_pT3_uid132_invPolyEval_cma_q(17 downto 0);
    lowRangeB_uid173_pT3_uid132_invPolyEval_b <= lowRangeB_uid173_pT3_uid132_invPolyEval_in(17 downto 0);

    -- lev1_a0_uid176_pT3_uid132_invPolyEval(BITJOIN,175)@13
    lev1_a0_uid176_pT3_uid132_invPolyEval_q <= lev1_a0sumAHighB_uid175_pT3_uid132_invPolyEval_q & lowRangeB_uid173_pT3_uid132_invPolyEval_b;

    -- os_uid177_pT3_uid132_invPolyEval(BITSELECT,176)@13
    os_uid177_pT3_uid132_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid176_pT3_uid132_invPolyEval_q(52 downto 0));
    os_uid177_pT3_uid132_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid177_pT3_uid132_invPolyEval_in(52 downto 21));

    -- highBBits_uid134_invPolyEval(BITSELECT,133)@13
    highBBits_uid134_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid177_pT3_uid132_invPolyEval_b(31 downto 2));

    -- redist6_yAddr_uid23_divider_merged_bit_select_b_9(DELAY,311)
    redist6_yAddr_uid23_divider_merged_bit_select_b_9_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist6_yAddr_uid23_divider_merged_bit_select_b_9_delay_0 <= (others => '0');
            redist6_yAddr_uid23_divider_merged_bit_select_b_9_delay_1 <= (others => '0');
            redist6_yAddr_uid23_divider_merged_bit_select_b_9_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist6_yAddr_uid23_divider_merged_bit_select_b_9_delay_0 <= STD_LOGIC_VECTOR(redist5_yAddr_uid23_divider_merged_bit_select_b_6_q);
                redist6_yAddr_uid23_divider_merged_bit_select_b_9_delay_1 <= redist6_yAddr_uid23_divider_merged_bit_select_b_9_delay_0;
                redist6_yAddr_uid23_divider_merged_bit_select_b_9_q <= redist6_yAddr_uid23_divider_merged_bit_select_b_9_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid103_invTabGen_lutmem(DUALMEM,281)@11 + 2
    -- in j@20000000
    memoryC0_uid103_invTabGen_lutmem_aa <= redist6_yAddr_uid23_divider_merged_bit_select_b_9_q;
    memoryC0_uid103_invTabGen_lutmem_reset0 <= rst;
    memoryC0_uid103_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 38,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_hzr34sy_memoryC0_uid103_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC0_uid103_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid103_invTabGen_lutmem_aa,
        q_a => memoryC0_uid103_invTabGen_lutmem_ir
    );
    memoryC0_uid103_invTabGen_lutmem_r <= memoryC0_uid103_invTabGen_lutmem_ir(37 downto 0);

    -- s3sumAHighB_uid135_invPolyEval(ADD,134)@13
    s3sumAHighB_uid135_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => memoryC0_uid103_invTabGen_lutmem_r(37)) & memoryC0_uid103_invTabGen_lutmem_r));
    s3sumAHighB_uid135_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 30 => highBBits_uid134_invPolyEval_b(29)) & highBBits_uid134_invPolyEval_b));
    s3sumAHighB_uid135_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid135_invPolyEval_a) + SIGNED(s3sumAHighB_uid135_invPolyEval_b));
    s3sumAHighB_uid135_invPolyEval_q <= s3sumAHighB_uid135_invPolyEval_o(38 downto 0);

    -- lowRangeB_uid133_invPolyEval(BITSELECT,132)@13
    lowRangeB_uid133_invPolyEval_in <= os_uid177_pT3_uid132_invPolyEval_b(1 downto 0);
    lowRangeB_uid133_invPolyEval_b <= lowRangeB_uid133_invPolyEval_in(1 downto 0);

    -- s3_uid136_invPolyEval(BITJOIN,135)@13
    s3_uid136_invPolyEval_q <= s3sumAHighB_uid135_invPolyEval_q & lowRangeB_uid133_invPolyEval_b;

    -- fxpInverseRes_uid26_divider(BITSELECT,25)@13
    fxpInverseRes_uid26_divider_in <= s3_uid136_invPolyEval_q(38 downto 0);
    fxpInverseRes_uid26_divider_b <= fxpInverseRes_uid26_divider_in(38 downto 6);

    -- redist17_fxpInverseRes_uid26_divider_b_1(DELAY,322)
    redist17_fxpInverseRes_uid26_divider_b_1_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist17_fxpInverseRes_uid26_divider_b_1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist17_fxpInverseRes_uid26_divider_b_1_q <= STD_LOGIC_VECTOR(fxpInverseRes_uid26_divider_b);
            END IF;
        END IF;
    END PROCESS;

    -- paddingY_uid16_divider(CONSTANT,15)
    paddingY_uid16_divider_q <= "0000000000000000000000000000000";

    -- updatedY_uid17_divider(BITJOIN,16)@3
    updatedY_uid17_divider_q <= GND_q & paddingY_uid16_divider_q;

    -- redist20_normYNoLeadOne_uid15_divider_b_1(DELAY,325)
    redist20_normYNoLeadOne_uid15_divider_b_1_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist20_normYNoLeadOne_uid15_divider_b_1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist20_normYNoLeadOne_uid15_divider_b_1_q <= STD_LOGIC_VECTOR(normYNoLeadOne_uid15_divider_b);
            END IF;
        END IF;
    END PROCESS;

    -- normYIsOneC2_uid16_divider(LOGICAL,17)@3
    normYIsOneC2_uid16_divider_a <= STD_LOGIC_VECTOR("0" & redist20_normYNoLeadOne_uid15_divider_b_1_q);
    normYIsOneC2_uid16_divider_q <= "1" WHEN normYIsOneC2_uid16_divider_a = updatedY_uid17_divider_q ELSE "0";

    -- normYIsOneC2_uid19_divider(BITSELECT,18)@2
    normYIsOneC2_uid19_divider_b <= STD_LOGIC_VECTOR(leftShiftStage2_uid209_normY_uid14_divider_q(31 downto 31));

    -- redist19_normYIsOneC2_uid19_divider_b_1(DELAY,324)
    redist19_normYIsOneC2_uid19_divider_b_1_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist19_normYIsOneC2_uid19_divider_b_1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist19_normYIsOneC2_uid19_divider_b_1_q <= STD_LOGIC_VECTOR(normYIsOneC2_uid19_divider_b);
            END IF;
        END IF;
    END PROCESS;

    -- normYIsOne_uid20_divider(LOGICAL,19)@3 + 1
    normYIsOne_uid20_divider_qi <= redist19_normYIsOneC2_uid19_divider_b_1_q and normYIsOneC2_uid16_divider_q;
    normYIsOne_uid20_divider_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => normYIsOne_uid20_divider_qi, xout => normYIsOne_uid20_divider_q, ena => en(0), clk => clk, aclr => rst );

    -- redist18_normYIsOne_uid20_divider_q_11(DELAY,323)
    redist18_normYIsOne_uid20_divider_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => normYIsOne_uid20_divider_q, xout => redist18_normYIsOne_uid20_divider_q_11_q, ena => en(0), clk => clk, aclr => rst );

    -- invResPostOneHandling2_uid28_divider(MUX,27)@14
    invResPostOneHandling2_uid28_divider_s <= redist18_normYIsOne_uid20_divider_q_11_q;
    invResPostOneHandling2_uid28_divider_combproc: PROCESS (invResPostOneHandling2_uid28_divider_s, redist17_fxpInverseRes_uid26_divider_b_1_q, oneInvRes_uid27_divider_q)
    BEGIN
        CASE (invResPostOneHandling2_uid28_divider_s) IS
            WHEN "0" => invResPostOneHandling2_uid28_divider_q <= redist17_fxpInverseRes_uid26_divider_b_1_q;
            WHEN "1" => invResPostOneHandling2_uid28_divider_q <= oneInvRes_uid27_divider_q;
            WHEN OTHERS => invResPostOneHandling2_uid28_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodXInvY_uid36_divider_bs2(BITSELECT,212)@14
    prodXInvY_uid36_divider_bs2_b <= STD_LOGIC_VECTOR(invResPostOneHandling2_uid28_divider_q(32 downto 18));

    -- prodXInvY_uid36_divider_bjB6(BITJOIN,216)@14
    prodXInvY_uid36_divider_bjB6_q <= GND_q & prodXInvY_uid36_divider_bs2_b;

    -- prodXInvY_uid36_divider_bs8(BITSELECT,218)@14
    prodXInvY_uid36_divider_bs8_in <= STD_LOGIC_VECTOR(invResPostOneHandling2_uid28_divider_q(17 downto 0));
    prodXInvY_uid36_divider_bs8_b <= STD_LOGIC_VECTOR(prodXInvY_uid36_divider_bs8_in(17 downto 0));

    -- zMsbY0_uid33_divider(BITJOIN,32)@14
    zMsbY0_uid33_divider_q <= GND_q & redist22_xMSB_uid7_divider_b_14_q;

    -- xPSX_uid31_divider(LOGICAL,30)@14
    xPSX_uid31_divider_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => redist22_xMSB_uid7_divider_b_14_q(0)) & redist22_xMSB_uid7_divider_b_14_q));
    xPSX_uid31_divider_q <= redist24_in_rsrvd_fix_numerator_14_outputreg0_q xor xPSX_uid31_divider_b;

    -- xPSXE_uid34_divider(ADD,33)@14
    xPSXE_uid34_divider_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => xPSX_uid31_divider_q(31)) & xPSX_uid31_divider_q));
    xPSXE_uid34_divider_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 2 => zMsbY0_uid33_divider_q(1)) & zMsbY0_uid33_divider_q));
    xPSXE_uid34_divider_o <= STD_LOGIC_VECTOR(SIGNED(xPSXE_uid34_divider_a) + SIGNED(xPSXE_uid34_divider_b));
    xPSXE_uid34_divider_q <= xPSXE_uid34_divider_o(32 downto 0);

    -- prodXInvY_uid36_divider_bs1_merged_bit_select(BITSELECT,297)@14
    prodXInvY_uid36_divider_bs1_merged_bit_select_b <= xPSXE_uid34_divider_q(32 downto 18);
    prodXInvY_uid36_divider_bs1_merged_bit_select_c <= xPSXE_uid34_divider_q(17 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- prodXInvY_uid36_divider_ma3_cma(CHAINMULTADD,293)@14 + 3
    prodXInvY_uid36_divider_ma3_cma_reset <= rst;
    prodXInvY_uid36_divider_ma3_cma_ena0 <= en(0);
    prodXInvY_uid36_divider_ma3_cma_ena1 <= prodXInvY_uid36_divider_ma3_cma_ena0;
    prodXInvY_uid36_divider_ma3_cma_ena2 <= prodXInvY_uid36_divider_ma3_cma_ena0;

    prodXInvY_uid36_divider_ma3_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(prodXInvY_uid36_divider_bs1_merged_bit_select_b),16));
    prodXInvY_uid36_divider_ma3_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(prodXInvY_uid36_divider_bs8_b),18));
    prodXInvY_uid36_divider_ma3_cma_a1 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(prodXInvY_uid36_divider_bjB6_q),16));
    prodXInvY_uid36_divider_ma3_cma_c1 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(prodXInvY_uid36_divider_bs1_merged_bit_select_c),18));
    prodXInvY_uid36_divider_ma3_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 16,
        by_clock => "0",
        by_width => 16,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "true",
        signed_mby => "true",
        signed_max => "false",
        signed_mbx => "false",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 35
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXInvY_uid36_divider_ma3_cma_ena0,
        ena(1) => prodXInvY_uid36_divider_ma3_cma_ena1,
        ena(2) => prodXInvY_uid36_divider_ma3_cma_ena2,
        aclr(0) => prodXInvY_uid36_divider_ma3_cma_reset,
        aclr(1) => prodXInvY_uid36_divider_ma3_cma_reset,
        ay => prodXInvY_uid36_divider_ma3_cma_a1,
        by => prodXInvY_uid36_divider_ma3_cma_a0,
        ax => prodXInvY_uid36_divider_ma3_cma_c1,
        bx => prodXInvY_uid36_divider_ma3_cma_c0,
        resulta => prodXInvY_uid36_divider_ma3_cma_s0
    );
    prodXInvY_uid36_divider_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 35, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXInvY_uid36_divider_ma3_cma_s0, xout => prodXInvY_uid36_divider_ma3_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXInvY_uid36_divider_ma3_cma_q <= STD_LOGIC_VECTOR(prodXInvY_uid36_divider_ma3_cma_qq(34 downto 0));

    -- prodXInvY_uid36_divider_sums_align_1(BITSHIFT,223)@17
    prodXInvY_uid36_divider_sums_align_1_qint <= prodXInvY_uid36_divider_ma3_cma_q & "000000000000000000";
    prodXInvY_uid36_divider_sums_align_1_q <= prodXInvY_uid36_divider_sums_align_1_qint(52 downto 0);

    -- prodXInvY_uid36_divider_im0_cma(CHAINMULTADD,288)@14 + 3
    prodXInvY_uid36_divider_im0_cma_reset <= rst;
    prodXInvY_uid36_divider_im0_cma_ena0 <= en(0);
    prodXInvY_uid36_divider_im0_cma_ena1 <= prodXInvY_uid36_divider_im0_cma_ena0;
    prodXInvY_uid36_divider_im0_cma_ena2 <= prodXInvY_uid36_divider_im0_cma_ena0;

    prodXInvY_uid36_divider_im0_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(prodXInvY_uid36_divider_bs2_b),15));
    prodXInvY_uid36_divider_im0_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(prodXInvY_uid36_divider_bs1_merged_bit_select_b),15));
    prodXInvY_uid36_divider_im0_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 15,
        ax_clock => "0",
        ax_width => 15,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 30
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXInvY_uid36_divider_im0_cma_ena0,
        ena(1) => prodXInvY_uid36_divider_im0_cma_ena1,
        ena(2) => prodXInvY_uid36_divider_im0_cma_ena2,
        aclr(0) => prodXInvY_uid36_divider_im0_cma_reset,
        aclr(1) => prodXInvY_uid36_divider_im0_cma_reset,
        ay => prodXInvY_uid36_divider_im0_cma_a0,
        ax => prodXInvY_uid36_divider_im0_cma_c0,
        resulta => prodXInvY_uid36_divider_im0_cma_s0
    );
    prodXInvY_uid36_divider_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 30, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXInvY_uid36_divider_im0_cma_s0, xout => prodXInvY_uid36_divider_im0_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXInvY_uid36_divider_im0_cma_q <= STD_LOGIC_VECTOR(prodXInvY_uid36_divider_im0_cma_qq(29 downto 0));

    -- prodXInvY_uid36_divider_bs11(BITSELECT,221)@14
    prodXInvY_uid36_divider_bs11_in <= invResPostOneHandling2_uid28_divider_q(17 downto 0);
    prodXInvY_uid36_divider_bs11_b <= prodXInvY_uid36_divider_bs11_in(17 downto 0);

    -- prodXInvY_uid36_divider_im9_cma(CHAINMULTADD,289)@14 + 3
    prodXInvY_uid36_divider_im9_cma_reset <= rst;
    prodXInvY_uid36_divider_im9_cma_ena0 <= en(0);
    prodXInvY_uid36_divider_im9_cma_ena1 <= prodXInvY_uid36_divider_im9_cma_ena0;
    prodXInvY_uid36_divider_im9_cma_ena2 <= prodXInvY_uid36_divider_im9_cma_ena0;

    prodXInvY_uid36_divider_im9_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(prodXInvY_uid36_divider_bs1_merged_bit_select_c),18));
    prodXInvY_uid36_divider_im9_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(prodXInvY_uid36_divider_bs11_b),18));
    prodXInvY_uid36_divider_im9_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        ax_clock => "0",
        ax_width => 18,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 36
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXInvY_uid36_divider_im9_cma_ena0,
        ena(1) => prodXInvY_uid36_divider_im9_cma_ena1,
        ena(2) => prodXInvY_uid36_divider_im9_cma_ena2,
        aclr(0) => prodXInvY_uid36_divider_im9_cma_reset,
        aclr(1) => prodXInvY_uid36_divider_im9_cma_reset,
        ay => prodXInvY_uid36_divider_im9_cma_a0,
        ax => prodXInvY_uid36_divider_im9_cma_c0,
        resulta => prodXInvY_uid36_divider_im9_cma_s0
    );
    prodXInvY_uid36_divider_im9_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXInvY_uid36_divider_im9_cma_s0, xout => prodXInvY_uid36_divider_im9_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXInvY_uid36_divider_im9_cma_q <= STD_LOGIC_VECTOR(prodXInvY_uid36_divider_im9_cma_qq(35 downto 0));

    -- prodXInvY_uid36_divider_sums_join_0(BITJOIN,222)@17
    prodXInvY_uid36_divider_sums_join_0_q <= prodXInvY_uid36_divider_im0_cma_q & prodXInvY_uid36_divider_im9_cma_q;

    -- prodXInvY_uid36_divider_sums_result_add_0_0(ADD,225)@17
    prodXInvY_uid36_divider_sums_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 66 => prodXInvY_uid36_divider_sums_join_0_q(65)) & prodXInvY_uid36_divider_sums_join_0_q));
    prodXInvY_uid36_divider_sums_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 53 => prodXInvY_uid36_divider_sums_align_1_q(52)) & prodXInvY_uid36_divider_sums_align_1_q));
    prodXInvY_uid36_divider_sums_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(prodXInvY_uid36_divider_sums_result_add_0_0_a) + SIGNED(prodXInvY_uid36_divider_sums_result_add_0_0_b));
    prodXInvY_uid36_divider_sums_result_add_0_0_q <= prodXInvY_uid36_divider_sums_result_add_0_0_o(66 downto 0);

    -- rightShiftInput_uid37_divider(BITSELECT,36)@17
    rightShiftInput_uid37_divider_in <= STD_LOGIC_VECTOR(prodXInvY_uid36_divider_sums_result_add_0_0_q(64 downto 0));
    rightShiftInput_uid37_divider_b <= STD_LOGIC_VECTOR(rightShiftInput_uid37_divider_in(64 downto 0));

    -- xMSB_uid227_prodPostRightShift_uid38_divider(BITSELECT,226)@17
    xMSB_uid227_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftInput_uid37_divider_b(64 downto 64));

    -- redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1(DELAY,315)
    redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q <= STD_LOGIC_VECTOR(xMSB_uid227_prodPostRightShift_uid38_divider_b);
            END IF;
        END IF;
    END PROCESS;

    -- seMsb_to64_uid261(BITSELECT,260)@18
    seMsb_to64_uid261_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((63 downto 1 => redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q(0)) & redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q));
    seMsb_to64_uid261_b <= STD_LOGIC_VECTOR(seMsb_to64_uid261_in(63 downto 0));

    -- rightShiftStage3Idx1Rng64_uid262_prodPostRightShift_uid38_divider(BITSELECT,261)@18
    rightShiftStage3Idx1Rng64_uid262_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftStage2_uid260_prodPostRightShift_uid38_divider_q(64 downto 64));

    -- rightShiftStage3Idx1_uid263_prodPostRightShift_uid38_divider(BITJOIN,262)@18
    rightShiftStage3Idx1_uid263_prodPostRightShift_uid38_divider_q <= seMsb_to64_uid261_b & rightShiftStage3Idx1Rng64_uid262_prodPostRightShift_uid38_divider_b;

    -- seMsb_to48_uid256(BITSELECT,255)@18
    seMsb_to48_uid256_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 1 => redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q(0)) & redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q));
    seMsb_to48_uid256_b <= STD_LOGIC_VECTOR(seMsb_to48_uid256_in(47 downto 0));

    -- rightShiftStage2Idx3Rng48_uid257_prodPostRightShift_uid38_divider(BITSELECT,256)@18
    rightShiftStage2Idx3Rng48_uid257_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q(64 downto 48));

    -- rightShiftStage2Idx3_uid258_prodPostRightShift_uid38_divider(BITJOIN,257)@18
    rightShiftStage2Idx3_uid258_prodPostRightShift_uid38_divider_q <= seMsb_to48_uid256_b & rightShiftStage2Idx3Rng48_uid257_prodPostRightShift_uid38_divider_b;

    -- seMsb_to32_uid253(BITSELECT,252)@18
    seMsb_to32_uid253_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q(0)) & redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q));
    seMsb_to32_uid253_b <= STD_LOGIC_VECTOR(seMsb_to32_uid253_in(31 downto 0));

    -- rightShiftStage2Idx2Rng32_uid254_prodPostRightShift_uid38_divider(BITSELECT,253)@18
    rightShiftStage2Idx2Rng32_uid254_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q(64 downto 32));

    -- rightShiftStage2Idx2_uid255_prodPostRightShift_uid38_divider(BITJOIN,254)@18
    rightShiftStage2Idx2_uid255_prodPostRightShift_uid38_divider_q <= seMsb_to32_uid253_b & rightShiftStage2Idx2Rng32_uid254_prodPostRightShift_uid38_divider_b;

    -- seMsb_to16_uid250(BITSELECT,249)@18
    seMsb_to16_uid250_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q(0)) & redist10_xMSB_uid227_prodPostRightShift_uid38_divider_b_1_q));
    seMsb_to16_uid250_b <= STD_LOGIC_VECTOR(seMsb_to16_uid250_in(15 downto 0));

    -- rightShiftStage2Idx1Rng16_uid251_prodPostRightShift_uid38_divider(BITSELECT,250)@18
    rightShiftStage2Idx1Rng16_uid251_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q(64 downto 16));

    -- rightShiftStage2Idx1_uid252_prodPostRightShift_uid38_divider(BITJOIN,251)@18
    rightShiftStage2Idx1_uid252_prodPostRightShift_uid38_divider_q <= seMsb_to16_uid250_b & rightShiftStage2Idx1Rng16_uid251_prodPostRightShift_uid38_divider_b;

    -- seMsb_to12_uid245(BITSELECT,244)@17
    seMsb_to12_uid245_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => xMSB_uid227_prodPostRightShift_uid38_divider_b(0)) & xMSB_uid227_prodPostRightShift_uid38_divider_b));
    seMsb_to12_uid245_b <= STD_LOGIC_VECTOR(seMsb_to12_uid245_in(11 downto 0));

    -- rightShiftStage1Idx3Rng12_uid246_prodPostRightShift_uid38_divider(BITSELECT,245)@17
    rightShiftStage1Idx3Rng12_uid246_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftStage0_uid238_prodPostRightShift_uid38_divider_q(64 downto 12));

    -- rightShiftStage1Idx3_uid247_prodPostRightShift_uid38_divider(BITJOIN,246)@17
    rightShiftStage1Idx3_uid247_prodPostRightShift_uid38_divider_q <= seMsb_to12_uid245_b & rightShiftStage1Idx3Rng12_uid246_prodPostRightShift_uid38_divider_b;

    -- seMsb_to8_uid242(BITSELECT,241)@17
    seMsb_to8_uid242_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid227_prodPostRightShift_uid38_divider_b(0)) & xMSB_uid227_prodPostRightShift_uid38_divider_b));
    seMsb_to8_uid242_b <= STD_LOGIC_VECTOR(seMsb_to8_uid242_in(7 downto 0));

    -- rightShiftStage1Idx2Rng8_uid243_prodPostRightShift_uid38_divider(BITSELECT,242)@17
    rightShiftStage1Idx2Rng8_uid243_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftStage0_uid238_prodPostRightShift_uid38_divider_q(64 downto 8));

    -- rightShiftStage1Idx2_uid244_prodPostRightShift_uid38_divider(BITJOIN,243)@17
    rightShiftStage1Idx2_uid244_prodPostRightShift_uid38_divider_q <= seMsb_to8_uid242_b & rightShiftStage1Idx2Rng8_uid243_prodPostRightShift_uid38_divider_b;

    -- seMsb_to4_uid239(BITSELECT,238)@17
    seMsb_to4_uid239_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid227_prodPostRightShift_uid38_divider_b(0)) & xMSB_uid227_prodPostRightShift_uid38_divider_b));
    seMsb_to4_uid239_b <= STD_LOGIC_VECTOR(seMsb_to4_uid239_in(3 downto 0));

    -- rightShiftStage1Idx1Rng4_uid240_prodPostRightShift_uid38_divider(BITSELECT,239)@17
    rightShiftStage1Idx1Rng4_uid240_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftStage0_uid238_prodPostRightShift_uid38_divider_q(64 downto 4));

    -- rightShiftStage1Idx1_uid241_prodPostRightShift_uid38_divider(BITJOIN,240)@17
    rightShiftStage1Idx1_uid241_prodPostRightShift_uid38_divider_q <= seMsb_to4_uid239_b & rightShiftStage1Idx1Rng4_uid240_prodPostRightShift_uid38_divider_b;

    -- seMsb_to3_uid234(BITSELECT,233)@17
    seMsb_to3_uid234_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 1 => xMSB_uid227_prodPostRightShift_uid38_divider_b(0)) & xMSB_uid227_prodPostRightShift_uid38_divider_b));
    seMsb_to3_uid234_b <= STD_LOGIC_VECTOR(seMsb_to3_uid234_in(2 downto 0));

    -- rightShiftStage0Idx3Rng3_uid235_prodPostRightShift_uid38_divider(BITSELECT,234)@17
    rightShiftStage0Idx3Rng3_uid235_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftInput_uid37_divider_b(64 downto 3));

    -- rightShiftStage0Idx3_uid236_prodPostRightShift_uid38_divider(BITJOIN,235)@17
    rightShiftStage0Idx3_uid236_prodPostRightShift_uid38_divider_q <= seMsb_to3_uid234_b & rightShiftStage0Idx3Rng3_uid235_prodPostRightShift_uid38_divider_b;

    -- seMsb_to2_uid231(BITSELECT,230)@17
    seMsb_to2_uid231_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid227_prodPostRightShift_uid38_divider_b(0)) & xMSB_uid227_prodPostRightShift_uid38_divider_b));
    seMsb_to2_uid231_b <= STD_LOGIC_VECTOR(seMsb_to2_uid231_in(1 downto 0));

    -- rightShiftStage0Idx2Rng2_uid232_prodPostRightShift_uid38_divider(BITSELECT,231)@17
    rightShiftStage0Idx2Rng2_uid232_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftInput_uid37_divider_b(64 downto 2));

    -- rightShiftStage0Idx2_uid233_prodPostRightShift_uid38_divider(BITJOIN,232)@17
    rightShiftStage0Idx2_uid233_prodPostRightShift_uid38_divider_q <= seMsb_to2_uid231_b & rightShiftStage0Idx2Rng2_uid232_prodPostRightShift_uid38_divider_b;

    -- rightShiftStage0Idx1Rng1_uid229_prodPostRightShift_uid38_divider(BITSELECT,228)@17
    rightShiftStage0Idx1Rng1_uid229_prodPostRightShift_uid38_divider_b <= STD_LOGIC_VECTOR(rightShiftInput_uid37_divider_b(64 downto 1));

    -- rightShiftStage0Idx1_uid230_prodPostRightShift_uid38_divider(BITJOIN,229)@17
    rightShiftStage0Idx1_uid230_prodPostRightShift_uid38_divider_q <= xMSB_uid227_prodPostRightShift_uid38_divider_b & rightShiftStage0Idx1Rng1_uid229_prodPostRightShift_uid38_divider_b;

    -- rightShiftStage0_uid238_prodPostRightShift_uid38_divider(MUX,237)@17
    rightShiftStage0_uid238_prodPostRightShift_uid38_divider_s <= rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_b;
    rightShiftStage0_uid238_prodPostRightShift_uid38_divider_combproc: PROCESS (rightShiftStage0_uid238_prodPostRightShift_uid38_divider_s, rightShiftInput_uid37_divider_b, rightShiftStage0Idx1_uid230_prodPostRightShift_uid38_divider_q, rightShiftStage0Idx2_uid233_prodPostRightShift_uid38_divider_q, rightShiftStage0Idx3_uid236_prodPostRightShift_uid38_divider_q)
    BEGIN
        CASE (rightShiftStage0_uid238_prodPostRightShift_uid38_divider_s) IS
            WHEN "00" => rightShiftStage0_uid238_prodPostRightShift_uid38_divider_q <= rightShiftInput_uid37_divider_b;
            WHEN "01" => rightShiftStage0_uid238_prodPostRightShift_uid38_divider_q <= rightShiftStage0Idx1_uid230_prodPostRightShift_uid38_divider_q;
            WHEN "10" => rightShiftStage0_uid238_prodPostRightShift_uid38_divider_q <= rightShiftStage0Idx2_uid233_prodPostRightShift_uid38_divider_q;
            WHEN "11" => rightShiftStage0_uid238_prodPostRightShift_uid38_divider_q <= rightShiftStage0Idx3_uid236_prodPostRightShift_uid38_divider_q;
            WHEN OTHERS => rightShiftStage0_uid238_prodPostRightShift_uid38_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist11_r_uid101_zCount_uid13_divider_q_15_notEnable(LOGICAL,341)
    redist11_r_uid101_zCount_uid13_divider_q_15_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist11_r_uid101_zCount_uid13_divider_q_15_nor(LOGICAL,342)
    redist11_r_uid101_zCount_uid13_divider_q_15_nor_q <= not (redist11_r_uid101_zCount_uid13_divider_q_15_notEnable_q or redist11_r_uid101_zCount_uid13_divider_q_15_sticky_ena_q);

    -- redist11_r_uid101_zCount_uid13_divider_q_15_mem_last(CONSTANT,338)
    redist11_r_uid101_zCount_uid13_divider_q_15_mem_last_q <= "01011";

    -- redist11_r_uid101_zCount_uid13_divider_q_15_cmp(LOGICAL,339)
    redist11_r_uid101_zCount_uid13_divider_q_15_cmp_b <= STD_LOGIC_VECTOR("0" & redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_q);
    redist11_r_uid101_zCount_uid13_divider_q_15_cmp_q <= "1" WHEN redist11_r_uid101_zCount_uid13_divider_q_15_mem_last_q = redist11_r_uid101_zCount_uid13_divider_q_15_cmp_b ELSE "0";

    -- redist11_r_uid101_zCount_uid13_divider_q_15_cmpReg(REG,340)
    redist11_r_uid101_zCount_uid13_divider_q_15_cmpReg_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist11_r_uid101_zCount_uid13_divider_q_15_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist11_r_uid101_zCount_uid13_divider_q_15_cmpReg_q <= STD_LOGIC_VECTOR(redist11_r_uid101_zCount_uid13_divider_q_15_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_r_uid101_zCount_uid13_divider_q_15_sticky_ena(REG,343)
    redist11_r_uid101_zCount_uid13_divider_q_15_sticky_ena_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist11_r_uid101_zCount_uid13_divider_q_15_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist11_r_uid101_zCount_uid13_divider_q_15_nor_q = "1") THEN
                redist11_r_uid101_zCount_uid13_divider_q_15_sticky_ena_q <= STD_LOGIC_VECTOR(redist11_r_uid101_zCount_uid13_divider_q_15_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_r_uid101_zCount_uid13_divider_q_15_enaAnd(LOGICAL,344)
    redist11_r_uid101_zCount_uid13_divider_q_15_enaAnd_q <= redist11_r_uid101_zCount_uid13_divider_q_15_sticky_ena_q and en;

    -- redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt(COUNTER,335)
    -- low=0, high=12, step=1, init=0
    redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_i = TO_UNSIGNED(11, 4)) THEN
                    redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_eq <= '1';
                ELSE
                    redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_eq <= '0';
                END IF;
                IF (redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_eq = '1') THEN
                    redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_i <= redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_i + 4;
                ELSE
                    redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_i <= redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_i, 4)));

    -- redist11_r_uid101_zCount_uid13_divider_q_15_rdmux(MUX,336)
    redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_s <= en;
    redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_combproc: PROCESS (redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_s, redist11_r_uid101_zCount_uid13_divider_q_15_wraddr_q, redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_q)
    BEGIN
        CASE (redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_s) IS
            WHEN "0" => redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_q <= redist11_r_uid101_zCount_uid13_divider_q_15_wraddr_q;
            WHEN "1" => redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_q <= redist11_r_uid101_zCount_uid13_divider_q_15_rdcnt_q;
            WHEN OTHERS => redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist11_r_uid101_zCount_uid13_divider_q_15_wraddr(REG,337)
    redist11_r_uid101_zCount_uid13_divider_q_15_wraddr_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist11_r_uid101_zCount_uid13_divider_q_15_wraddr_q <= "1100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist11_r_uid101_zCount_uid13_divider_q_15_wraddr_q <= STD_LOGIC_VECTOR(redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_q);
        END IF;
    END PROCESS;

    -- redist11_r_uid101_zCount_uid13_divider_q_15_mem(DUALMEM,334)
    redist11_r_uid101_zCount_uid13_divider_q_15_mem_ia <= STD_LOGIC_VECTOR(r_uid101_zCount_uid13_divider_q);
    redist11_r_uid101_zCount_uid13_divider_q_15_mem_aa <= redist11_r_uid101_zCount_uid13_divider_q_15_wraddr_q;
    redist11_r_uid101_zCount_uid13_divider_q_15_mem_ab <= redist11_r_uid101_zCount_uid13_divider_q_15_rdmux_q;
    redist11_r_uid101_zCount_uid13_divider_q_15_mem_reset0 <= rst;
    redist11_r_uid101_zCount_uid13_divider_q_15_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 6,
        widthad_b => 4,
        numwords_b => 13,
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
        clocken1 => redist11_r_uid101_zCount_uid13_divider_q_15_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => redist11_r_uid101_zCount_uid13_divider_q_15_mem_reset0,
        clock1 => clk,
        address_a => redist11_r_uid101_zCount_uid13_divider_q_15_mem_aa,
        data_a => redist11_r_uid101_zCount_uid13_divider_q_15_mem_ia,
        wren_a => en(0),
        address_b => redist11_r_uid101_zCount_uid13_divider_q_15_mem_ab,
        q_b => redist11_r_uid101_zCount_uid13_divider_q_15_mem_iq
    );
    redist11_r_uid101_zCount_uid13_divider_q_15_mem_q <= redist11_r_uid101_zCount_uid13_divider_q_15_mem_iq(5 downto 0);

    -- redist11_r_uid101_zCount_uid13_divider_q_15_outputreg0(DELAY,333)
    redist11_r_uid101_zCount_uid13_divider_q_15_outputreg0_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist11_r_uid101_zCount_uid13_divider_q_15_outputreg0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist11_r_uid101_zCount_uid13_divider_q_15_outputreg0_q <= STD_LOGIC_VECTOR(redist11_r_uid101_zCount_uid13_divider_q_15_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- cWOut_uid29_divider(CONSTANT,28)
    cWOut_uid29_divider_q <= "100000";

    -- rShiftCount_uid30_divider(SUB,29)@17
    rShiftCount_uid30_divider_a <= STD_LOGIC_VECTOR("0" & cWOut_uid29_divider_q);
    rShiftCount_uid30_divider_b <= STD_LOGIC_VECTOR("0" & redist11_r_uid101_zCount_uid13_divider_q_15_outputreg0_q);
    rShiftCount_uid30_divider_o <= STD_LOGIC_VECTOR(UNSIGNED(rShiftCount_uid30_divider_a) - UNSIGNED(rShiftCount_uid30_divider_b));
    rShiftCount_uid30_divider_q <= rShiftCount_uid30_divider_o(6 downto 0);

    -- rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select(BITSELECT,296)@17
    rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_b <= rShiftCount_uid30_divider_q(1 downto 0);
    rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_c <= rShiftCount_uid30_divider_q(3 downto 2);
    rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_d <= rShiftCount_uid30_divider_q(5 downto 4);
    rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_e <= rShiftCount_uid30_divider_q(6 downto 6);

    -- rightShiftStage1_uid249_prodPostRightShift_uid38_divider(MUX,248)@17 + 1
    rightShiftStage1_uid249_prodPostRightShift_uid38_divider_s <= rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_c;
    rightShiftStage1_uid249_prodPostRightShift_uid38_divider_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (rightShiftStage1_uid249_prodPostRightShift_uid38_divider_s) IS
                    WHEN "00" => rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q <= rightShiftStage0_uid238_prodPostRightShift_uid38_divider_q;
                    WHEN "01" => rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q <= rightShiftStage1Idx1_uid241_prodPostRightShift_uid38_divider_q;
                    WHEN "10" => rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q <= rightShiftStage1Idx2_uid244_prodPostRightShift_uid38_divider_q;
                    WHEN "11" => rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q <= rightShiftStage1Idx3_uid247_prodPostRightShift_uid38_divider_q;
                    WHEN OTHERS => rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist2_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_d_1(DELAY,307)
    redist2_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_d_1_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist2_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_d_1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist2_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_d_1_q <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_d);
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid260_prodPostRightShift_uid38_divider(MUX,259)@18
    rightShiftStage2_uid260_prodPostRightShift_uid38_divider_s <= redist2_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_d_1_q;
    rightShiftStage2_uid260_prodPostRightShift_uid38_divider_combproc: PROCESS (rightShiftStage2_uid260_prodPostRightShift_uid38_divider_s, rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q, rightShiftStage2Idx1_uid252_prodPostRightShift_uid38_divider_q, rightShiftStage2Idx2_uid255_prodPostRightShift_uid38_divider_q, rightShiftStage2Idx3_uid258_prodPostRightShift_uid38_divider_q)
    BEGIN
        CASE (rightShiftStage2_uid260_prodPostRightShift_uid38_divider_s) IS
            WHEN "00" => rightShiftStage2_uid260_prodPostRightShift_uid38_divider_q <= rightShiftStage1_uid249_prodPostRightShift_uid38_divider_q;
            WHEN "01" => rightShiftStage2_uid260_prodPostRightShift_uid38_divider_q <= rightShiftStage2Idx1_uid252_prodPostRightShift_uid38_divider_q;
            WHEN "10" => rightShiftStage2_uid260_prodPostRightShift_uid38_divider_q <= rightShiftStage2Idx2_uid255_prodPostRightShift_uid38_divider_q;
            WHEN "11" => rightShiftStage2_uid260_prodPostRightShift_uid38_divider_q <= rightShiftStage2Idx3_uid258_prodPostRightShift_uid38_divider_q;
            WHEN OTHERS => rightShiftStage2_uid260_prodPostRightShift_uid38_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_e_1(DELAY,308)
    redist3_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_e_1_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist3_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_e_1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist3_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_e_1_q <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_e);
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage3_uid265_prodPostRightShift_uid38_divider(MUX,264)@18
    rightShiftStage3_uid265_prodPostRightShift_uid38_divider_s <= redist3_rightShiftStageSel0Dto0_uid237_prodPostRightShift_uid38_divider_merged_bit_select_e_1_q;
    rightShiftStage3_uid265_prodPostRightShift_uid38_divider_combproc: PROCESS (rightShiftStage3_uid265_prodPostRightShift_uid38_divider_s, rightShiftStage2_uid260_prodPostRightShift_uid38_divider_q, rightShiftStage3Idx1_uid263_prodPostRightShift_uid38_divider_q)
    BEGIN
        CASE (rightShiftStage3_uid265_prodPostRightShift_uid38_divider_s) IS
            WHEN "0" => rightShiftStage3_uid265_prodPostRightShift_uid38_divider_q <= rightShiftStage2_uid260_prodPostRightShift_uid38_divider_q;
            WHEN "1" => rightShiftStage3_uid265_prodPostRightShift_uid38_divider_q <= rightShiftStage3Idx1_uid263_prodPostRightShift_uid38_divider_q;
            WHEN OTHERS => rightShiftStage3_uid265_prodPostRightShift_uid38_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodPostRightShiftPost_uid39_divider(BITSELECT,38)@18
    prodPostRightShiftPost_uid39_divider_in <= rightShiftStage3_uid265_prodPostRightShift_uid38_divider_q(62 downto 0);
    prodPostRightShiftPost_uid39_divider_b <= prodPostRightShiftPost_uid39_divider_in(62 downto 30);

    -- prodPostRightShiftPostRnd_uid41_divider(ADD,40)@18
    prodPostRightShiftPostRnd_uid41_divider_a <= STD_LOGIC_VECTOR("0" & prodPostRightShiftPost_uid39_divider_b);
    prodPostRightShiftPostRnd_uid41_divider_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000" & VCC_q);
    prodPostRightShiftPostRnd_uid41_divider_o <= STD_LOGIC_VECTOR(UNSIGNED(prodPostRightShiftPostRnd_uid41_divider_a) + UNSIGNED(prodPostRightShiftPostRnd_uid41_divider_b));
    prodPostRightShiftPostRnd_uid41_divider_q <= prodPostRightShiftPostRnd_uid41_divider_o(33 downto 0);

    -- prodPostRightShiftPostRndRange_uid42_divider(BITSELECT,41)@18
    prodPostRightShiftPostRndRange_uid42_divider_in <= prodPostRightShiftPostRnd_uid41_divider_q(32 downto 0);
    prodPostRightShiftPostRndRange_uid42_divider_b <= prodPostRightShiftPostRndRange_uid42_divider_in(32 downto 1);

    -- redist27_in_rsrvd_fix_denominator_18_notEnable(LOGICAL,388)
    redist27_in_rsrvd_fix_denominator_18_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist27_in_rsrvd_fix_denominator_18_nor(LOGICAL,389)
    redist27_in_rsrvd_fix_denominator_18_nor_q <= not (redist27_in_rsrvd_fix_denominator_18_notEnable_q or redist27_in_rsrvd_fix_denominator_18_sticky_ena_q);

    -- redist27_in_rsrvd_fix_denominator_18_mem_last(CONSTANT,385)
    redist27_in_rsrvd_fix_denominator_18_mem_last_q <= "01110";

    -- redist27_in_rsrvd_fix_denominator_18_cmp(LOGICAL,386)
    redist27_in_rsrvd_fix_denominator_18_cmp_b <= STD_LOGIC_VECTOR("0" & redist27_in_rsrvd_fix_denominator_18_rdmux_q);
    redist27_in_rsrvd_fix_denominator_18_cmp_q <= "1" WHEN redist27_in_rsrvd_fix_denominator_18_mem_last_q = redist27_in_rsrvd_fix_denominator_18_cmp_b ELSE "0";

    -- redist27_in_rsrvd_fix_denominator_18_cmpReg(REG,387)
    redist27_in_rsrvd_fix_denominator_18_cmpReg_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist27_in_rsrvd_fix_denominator_18_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist27_in_rsrvd_fix_denominator_18_cmpReg_q <= STD_LOGIC_VECTOR(redist27_in_rsrvd_fix_denominator_18_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist27_in_rsrvd_fix_denominator_18_sticky_ena(REG,390)
    redist27_in_rsrvd_fix_denominator_18_sticky_ena_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist27_in_rsrvd_fix_denominator_18_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist27_in_rsrvd_fix_denominator_18_nor_q = "1") THEN
                redist27_in_rsrvd_fix_denominator_18_sticky_ena_q <= STD_LOGIC_VECTOR(redist27_in_rsrvd_fix_denominator_18_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist27_in_rsrvd_fix_denominator_18_enaAnd(LOGICAL,391)
    redist27_in_rsrvd_fix_denominator_18_enaAnd_q <= redist27_in_rsrvd_fix_denominator_18_sticky_ena_q and en;

    -- redist27_in_rsrvd_fix_denominator_18_rdcnt(COUNTER,382)
    -- low=0, high=15, step=1, init=0
    redist27_in_rsrvd_fix_denominator_18_rdcnt_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist27_in_rsrvd_fix_denominator_18_rdcnt_i <= TO_UNSIGNED(0, 4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist27_in_rsrvd_fix_denominator_18_rdcnt_i <= redist27_in_rsrvd_fix_denominator_18_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist27_in_rsrvd_fix_denominator_18_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist27_in_rsrvd_fix_denominator_18_rdcnt_i, 4)));

    -- redist27_in_rsrvd_fix_denominator_18_rdmux(MUX,383)
    redist27_in_rsrvd_fix_denominator_18_rdmux_s <= en;
    redist27_in_rsrvd_fix_denominator_18_rdmux_combproc: PROCESS (redist27_in_rsrvd_fix_denominator_18_rdmux_s, redist27_in_rsrvd_fix_denominator_18_wraddr_q, redist27_in_rsrvd_fix_denominator_18_rdcnt_q)
    BEGIN
        CASE (redist27_in_rsrvd_fix_denominator_18_rdmux_s) IS
            WHEN "0" => redist27_in_rsrvd_fix_denominator_18_rdmux_q <= redist27_in_rsrvd_fix_denominator_18_wraddr_q;
            WHEN "1" => redist27_in_rsrvd_fix_denominator_18_rdmux_q <= redist27_in_rsrvd_fix_denominator_18_rdcnt_q;
            WHEN OTHERS => redist27_in_rsrvd_fix_denominator_18_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist27_in_rsrvd_fix_denominator_18_wraddr(REG,384)
    redist27_in_rsrvd_fix_denominator_18_wraddr_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist27_in_rsrvd_fix_denominator_18_wraddr_q <= "1111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist27_in_rsrvd_fix_denominator_18_wraddr_q <= STD_LOGIC_VECTOR(redist27_in_rsrvd_fix_denominator_18_rdmux_q);
        END IF;
    END PROCESS;

    -- redist27_in_rsrvd_fix_denominator_18_mem(DUALMEM,381)
    redist27_in_rsrvd_fix_denominator_18_mem_ia <= STD_LOGIC_VECTOR(denominator);
    redist27_in_rsrvd_fix_denominator_18_mem_aa <= redist27_in_rsrvd_fix_denominator_18_wraddr_q;
    redist27_in_rsrvd_fix_denominator_18_mem_ab <= redist27_in_rsrvd_fix_denominator_18_rdmux_q;
    redist27_in_rsrvd_fix_denominator_18_mem_reset0 <= rst;
    redist27_in_rsrvd_fix_denominator_18_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 16,
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
        clocken1 => redist27_in_rsrvd_fix_denominator_18_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => redist27_in_rsrvd_fix_denominator_18_mem_reset0,
        clock1 => clk,
        address_a => redist27_in_rsrvd_fix_denominator_18_mem_aa,
        data_a => redist27_in_rsrvd_fix_denominator_18_mem_ia,
        wren_a => en(0),
        address_b => redist27_in_rsrvd_fix_denominator_18_mem_ab,
        q_b => redist27_in_rsrvd_fix_denominator_18_mem_iq
    );
    redist27_in_rsrvd_fix_denominator_18_mem_q <= redist27_in_rsrvd_fix_denominator_18_mem_iq(31 downto 0);

    -- redist27_in_rsrvd_fix_denominator_18_outputreg0(DELAY,380)
    redist27_in_rsrvd_fix_denominator_18_outputreg0_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist27_in_rsrvd_fix_denominator_18_outputreg0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist27_in_rsrvd_fix_denominator_18_outputreg0_q <= STD_LOGIC_VECTOR(redist27_in_rsrvd_fix_denominator_18_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- yIsZero_uid21_divider(LOGICAL,20)@18
    yIsZero_uid21_divider_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000" & GND_q);
    yIsZero_uid21_divider_q <= "1" WHEN redist27_in_rsrvd_fix_denominator_18_outputreg0_q = yIsZero_uid21_divider_b ELSE "0";

    -- resFinal_uid47_divider(MUX,46)@18
    resFinal_uid47_divider_s <= yIsZero_uid21_divider_q;
    resFinal_uid47_divider_combproc: PROCESS (resFinal_uid47_divider_s, prodPostRightShiftPostRndRange_uid42_divider_b, cstOvf_uid46_divider_q)
    BEGIN
        CASE (resFinal_uid47_divider_s) IS
            WHEN "0" => resFinal_uid47_divider_q <= prodPostRightShiftPostRndRange_uid42_divider_b;
            WHEN "1" => resFinal_uid47_divider_q <= cstOvf_uid46_divider_q;
            WHEN OTHERS => resFinal_uid47_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist15_resFinal_uid47_divider_q_4_inputreg0(DELAY,345)
    redist15_resFinal_uid47_divider_q_4_inputreg0_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist15_resFinal_uid47_divider_q_4_inputreg0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist15_resFinal_uid47_divider_q_4_inputreg0_q <= STD_LOGIC_VECTOR(resFinal_uid47_divider_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_resFinal_uid47_divider_q_4(DELAY,320)
    redist15_resFinal_uid47_divider_q_4_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist15_resFinal_uid47_divider_q_4_delay_0 <= (others => '0');
            redist15_resFinal_uid47_divider_q_4_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist15_resFinal_uid47_divider_q_4_delay_0 <= STD_LOGIC_VECTOR(redist15_resFinal_uid47_divider_q_4_inputreg0_q);
                redist15_resFinal_uid47_divider_q_4_q <= redist15_resFinal_uid47_divider_q_4_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- redist15_resFinal_uid47_divider_q_4_outputreg0(DELAY,346)
    redist15_resFinal_uid47_divider_q_4_outputreg0_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist15_resFinal_uid47_divider_q_4_outputreg0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist15_resFinal_uid47_divider_q_4_outputreg0_q <= STD_LOGIC_VECTOR(redist15_resFinal_uid47_divider_q_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- signResFinal_uid56_divider(BITSELECT,55)@22
    signResFinal_uid56_divider_b <= STD_LOGIC_VECTOR(redist15_resFinal_uid47_divider_q_4_outputreg0_q(31 downto 31));

    -- OverflowCond_uid57_divider(LOGICAL,56)@22
    OverflowCond_uid57_divider_q <= redist16_signX_uid45_divider_b_4_q and redist23_xMSB_uid7_divider_b_22_q and signResFinal_uid56_divider_b;

    -- redist26_in_rsrvd_fix_numerator_22_notEnable(LOGICAL,376)
    redist26_in_rsrvd_fix_numerator_22_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist26_in_rsrvd_fix_numerator_22_nor(LOGICAL,377)
    redist26_in_rsrvd_fix_numerator_22_nor_q <= not (redist26_in_rsrvd_fix_numerator_22_notEnable_q or redist26_in_rsrvd_fix_numerator_22_sticky_ena_q);

    -- redist26_in_rsrvd_fix_numerator_22_cmpReg(REG,375)
    redist26_in_rsrvd_fix_numerator_22_cmpReg_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist26_in_rsrvd_fix_numerator_22_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist26_in_rsrvd_fix_numerator_22_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist26_in_rsrvd_fix_numerator_22_sticky_ena(REG,378)
    redist26_in_rsrvd_fix_numerator_22_sticky_ena_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist26_in_rsrvd_fix_numerator_22_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist26_in_rsrvd_fix_numerator_22_nor_q = "1") THEN
                redist26_in_rsrvd_fix_numerator_22_sticky_ena_q <= STD_LOGIC_VECTOR(redist26_in_rsrvd_fix_numerator_22_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist26_in_rsrvd_fix_numerator_22_enaAnd(LOGICAL,379)
    redist26_in_rsrvd_fix_numerator_22_enaAnd_q <= redist26_in_rsrvd_fix_numerator_22_sticky_ena_q and en;

    -- redist26_in_rsrvd_fix_numerator_22_rdcnt(COUNTER,372)
    -- low=0, high=1, step=1, init=0
    redist26_in_rsrvd_fix_numerator_22_rdcnt_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist26_in_rsrvd_fix_numerator_22_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist26_in_rsrvd_fix_numerator_22_rdcnt_i <= redist26_in_rsrvd_fix_numerator_22_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist26_in_rsrvd_fix_numerator_22_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist26_in_rsrvd_fix_numerator_22_rdcnt_i, 1)));

    -- redist26_in_rsrvd_fix_numerator_22_rdmux(MUX,373)
    redist26_in_rsrvd_fix_numerator_22_rdmux_s <= en;
    redist26_in_rsrvd_fix_numerator_22_rdmux_combproc: PROCESS (redist26_in_rsrvd_fix_numerator_22_rdmux_s, redist26_in_rsrvd_fix_numerator_22_wraddr_q, redist26_in_rsrvd_fix_numerator_22_rdcnt_q)
    BEGIN
        CASE (redist26_in_rsrvd_fix_numerator_22_rdmux_s) IS
            WHEN "0" => redist26_in_rsrvd_fix_numerator_22_rdmux_q <= redist26_in_rsrvd_fix_numerator_22_wraddr_q;
            WHEN "1" => redist26_in_rsrvd_fix_numerator_22_rdmux_q <= redist26_in_rsrvd_fix_numerator_22_rdcnt_q;
            WHEN OTHERS => redist26_in_rsrvd_fix_numerator_22_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist26_in_rsrvd_fix_numerator_22_wraddr(REG,374)
    redist26_in_rsrvd_fix_numerator_22_wraddr_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist26_in_rsrvd_fix_numerator_22_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist26_in_rsrvd_fix_numerator_22_wraddr_q <= STD_LOGIC_VECTOR(redist26_in_rsrvd_fix_numerator_22_rdmux_q);
        END IF;
    END PROCESS;

    -- redist26_in_rsrvd_fix_numerator_22_mem(DUALMEM,371)
    redist26_in_rsrvd_fix_numerator_22_mem_ia <= STD_LOGIC_VECTOR(redist25_in_rsrvd_fix_numerator_18_mem_q);
    redist26_in_rsrvd_fix_numerator_22_mem_aa <= redist26_in_rsrvd_fix_numerator_22_wraddr_q;
    redist26_in_rsrvd_fix_numerator_22_mem_ab <= redist26_in_rsrvd_fix_numerator_22_rdmux_q;
    redist26_in_rsrvd_fix_numerator_22_mem_reset0 <= rst;
    redist26_in_rsrvd_fix_numerator_22_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
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
        clocken1 => redist26_in_rsrvd_fix_numerator_22_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => redist26_in_rsrvd_fix_numerator_22_mem_reset0,
        clock1 => clk,
        address_a => redist26_in_rsrvd_fix_numerator_22_mem_aa,
        data_a => redist26_in_rsrvd_fix_numerator_22_mem_ia,
        wren_a => en(0),
        address_b => redist26_in_rsrvd_fix_numerator_22_mem_ab,
        q_b => redist26_in_rsrvd_fix_numerator_22_mem_iq
    );
    redist26_in_rsrvd_fix_numerator_22_mem_q <= redist26_in_rsrvd_fix_numerator_22_mem_iq(31 downto 0);

    -- redist26_in_rsrvd_fix_numerator_22_outputreg0(DELAY,370)
    redist26_in_rsrvd_fix_numerator_22_outputreg0_clkproc_0: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            redist26_in_rsrvd_fix_numerator_22_outputreg0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist26_in_rsrvd_fix_numerator_22_outputreg0_q <= STD_LOGIC_VECTOR(redist26_in_rsrvd_fix_numerator_22_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- prodResY_uid48_divider_bs4(BITSELECT,270)@18
    prodResY_uid48_divider_bs4_in <= resFinal_uid47_divider_q(17 downto 0);
    prodResY_uid48_divider_bs4_b <= prodResY_uid48_divider_bs4_in(17 downto 0);

    -- prodResY_uid48_divider_bs2(BITSELECT,268)@18
    prodResY_uid48_divider_bs2_b <= STD_LOGIC_VECTOR(redist27_in_rsrvd_fix_denominator_18_outputreg0_q(31 downto 18));

    -- prodResY_uid48_divider_bs7(BITSELECT,273)@18
    prodResY_uid48_divider_bs7_in <= STD_LOGIC_VECTOR(redist27_in_rsrvd_fix_denominator_18_outputreg0_q(17 downto 0));
    prodResY_uid48_divider_bs7_b <= STD_LOGIC_VECTOR(prodResY_uid48_divider_bs7_in(17 downto 0));

    -- prodResY_uid48_divider_bs6(BITSELECT,272)@18
    prodResY_uid48_divider_bs6_b <= resFinal_uid47_divider_q(31 downto 18);

    -- prodResY_uid48_divider_ma3_cma(CHAINMULTADD,294)@18 + 3
    prodResY_uid48_divider_ma3_cma_reset <= rst;
    prodResY_uid48_divider_ma3_cma_ena0 <= en(0);
    prodResY_uid48_divider_ma3_cma_ena1 <= prodResY_uid48_divider_ma3_cma_ena0;
    prodResY_uid48_divider_ma3_cma_ena2 <= prodResY_uid48_divider_ma3_cma_ena0;

    prodResY_uid48_divider_ma3_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(prodResY_uid48_divider_bs6_b),14));
    prodResY_uid48_divider_ma3_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(prodResY_uid48_divider_bs7_b),18));
    prodResY_uid48_divider_ma3_cma_a1 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(prodResY_uid48_divider_bs2_b),14));
    prodResY_uid48_divider_ma3_cma_c1 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(prodResY_uid48_divider_bs4_b),18));
    prodResY_uid48_divider_ma3_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        by_clock => "0",
        by_width => 14,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "true",
        signed_mby => "true",
        signed_max => "false",
        signed_mbx => "false",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 33
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodResY_uid48_divider_ma3_cma_ena0,
        ena(1) => prodResY_uid48_divider_ma3_cma_ena1,
        ena(2) => prodResY_uid48_divider_ma3_cma_ena2,
        aclr(0) => prodResY_uid48_divider_ma3_cma_reset,
        aclr(1) => prodResY_uid48_divider_ma3_cma_reset,
        ay => prodResY_uid48_divider_ma3_cma_a1,
        by => prodResY_uid48_divider_ma3_cma_a0,
        ax => prodResY_uid48_divider_ma3_cma_c1,
        bx => prodResY_uid48_divider_ma3_cma_c0,
        resulta => prodResY_uid48_divider_ma3_cma_s0
    );
    prodResY_uid48_divider_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 33, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodResY_uid48_divider_ma3_cma_s0, xout => prodResY_uid48_divider_ma3_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodResY_uid48_divider_ma3_cma_q <= STD_LOGIC_VECTOR(prodResY_uid48_divider_ma3_cma_qq(32 downto 0));

    -- prodResY_uid48_divider_sums_align_1(BITSHIFT,278)@21
    prodResY_uid48_divider_sums_align_1_qint <= prodResY_uid48_divider_ma3_cma_q & "000000000000000000";
    prodResY_uid48_divider_sums_align_1_q <= prodResY_uid48_divider_sums_align_1_qint(50 downto 0);

    -- prodResY_uid48_divider_bs1(BITSELECT,267)@18
    prodResY_uid48_divider_bs1_b <= STD_LOGIC_VECTOR(resFinal_uid47_divider_q(31 downto 18));

    -- prodResY_uid48_divider_im0_cma(CHAINMULTADD,290)@18 + 3
    prodResY_uid48_divider_im0_cma_reset <= rst;
    prodResY_uid48_divider_im0_cma_ena0 <= en(0);
    prodResY_uid48_divider_im0_cma_ena1 <= prodResY_uid48_divider_im0_cma_ena0;
    prodResY_uid48_divider_im0_cma_ena2 <= prodResY_uid48_divider_im0_cma_ena0;

    prodResY_uid48_divider_im0_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(prodResY_uid48_divider_bs1_b),14));
    prodResY_uid48_divider_im0_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(SIGNED(prodResY_uid48_divider_bs2_b),14));
    prodResY_uid48_divider_im0_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        ax_clock => "0",
        ax_width => 14,
        signed_may => "true",
        signed_max => "true",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 28
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodResY_uid48_divider_im0_cma_ena0,
        ena(1) => prodResY_uid48_divider_im0_cma_ena1,
        ena(2) => prodResY_uid48_divider_im0_cma_ena2,
        aclr(0) => prodResY_uid48_divider_im0_cma_reset,
        aclr(1) => prodResY_uid48_divider_im0_cma_reset,
        ay => prodResY_uid48_divider_im0_cma_a0,
        ax => prodResY_uid48_divider_im0_cma_c0,
        resulta => prodResY_uid48_divider_im0_cma_s0
    );
    prodResY_uid48_divider_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodResY_uid48_divider_im0_cma_s0, xout => prodResY_uid48_divider_im0_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodResY_uid48_divider_im0_cma_q <= STD_LOGIC_VECTOR(prodResY_uid48_divider_im0_cma_qq(27 downto 0));

    -- prodResY_uid48_divider_bs10(BITSELECT,276)@18
    prodResY_uid48_divider_bs10_in <= redist27_in_rsrvd_fix_denominator_18_outputreg0_q(17 downto 0);
    prodResY_uid48_divider_bs10_b <= prodResY_uid48_divider_bs10_in(17 downto 0);

    -- prodResY_uid48_divider_im8_cma(CHAINMULTADD,291)@18 + 3
    prodResY_uid48_divider_im8_cma_reset <= rst;
    prodResY_uid48_divider_im8_cma_ena0 <= en(0);
    prodResY_uid48_divider_im8_cma_ena1 <= prodResY_uid48_divider_im8_cma_ena0;
    prodResY_uid48_divider_im8_cma_ena2 <= prodResY_uid48_divider_im8_cma_ena0;

    prodResY_uid48_divider_im8_cma_a0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(prodResY_uid48_divider_bs4_b),18));
    prodResY_uid48_divider_im8_cma_c0 <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(prodResY_uid48_divider_bs10_b),18));
    prodResY_uid48_divider_im8_cma_DSP0 : twentynm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        ax_clock => "0",
        ax_width => 18,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 36
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodResY_uid48_divider_im8_cma_ena0,
        ena(1) => prodResY_uid48_divider_im8_cma_ena1,
        ena(2) => prodResY_uid48_divider_im8_cma_ena2,
        aclr(0) => prodResY_uid48_divider_im8_cma_reset,
        aclr(1) => prodResY_uid48_divider_im8_cma_reset,
        ay => prodResY_uid48_divider_im8_cma_a0,
        ax => prodResY_uid48_divider_im8_cma_c0,
        resulta => prodResY_uid48_divider_im8_cma_s0
    );
    prodResY_uid48_divider_im8_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodResY_uid48_divider_im8_cma_s0, xout => prodResY_uid48_divider_im8_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodResY_uid48_divider_im8_cma_q <= STD_LOGIC_VECTOR(prodResY_uid48_divider_im8_cma_qq(35 downto 0));

    -- prodResY_uid48_divider_sums_join_0(BITJOIN,277)@21
    prodResY_uid48_divider_sums_join_0_q <= prodResY_uid48_divider_im0_cma_q & prodResY_uid48_divider_im8_cma_q;

    -- prodResY_uid48_divider_sums_result_add_0_0(ADD,280)@21 + 1
    prodResY_uid48_divider_sums_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((64 downto 64 => prodResY_uid48_divider_sums_join_0_q(63)) & prodResY_uid48_divider_sums_join_0_q));
    prodResY_uid48_divider_sums_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((64 downto 51 => prodResY_uid48_divider_sums_align_1_q(50)) & prodResY_uid48_divider_sums_align_1_q));
    prodResY_uid48_divider_sums_result_add_0_0_clkproc: PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            prodResY_uid48_divider_sums_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodResY_uid48_divider_sums_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(prodResY_uid48_divider_sums_result_add_0_0_a) + SIGNED(prodResY_uid48_divider_sums_result_add_0_0_b));
            END IF;
        END IF;
    END PROCESS;
    prodResY_uid48_divider_sums_result_add_0_0_q <= prodResY_uid48_divider_sums_result_add_0_0_o(64 downto 0);

    -- prod_qy_LT_x_uid50_divider(COMPARE,49)@22
    prod_qy_LT_x_uid50_divider_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((65 downto 65 => prodResY_uid48_divider_sums_result_add_0_0_q(64)) & prodResY_uid48_divider_sums_result_add_0_0_q));
    prod_qy_LT_x_uid50_divider_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((65 downto 32 => redist26_in_rsrvd_fix_numerator_22_outputreg0_q(31)) & redist26_in_rsrvd_fix_numerator_22_outputreg0_q));
    prod_qy_LT_x_uid50_divider_o <= STD_LOGIC_VECTOR(SIGNED(prod_qy_LT_x_uid50_divider_a) - SIGNED(prod_qy_LT_x_uid50_divider_b));
    prod_qy_LT_x_uid50_divider_c(0) <= prod_qy_LT_x_uid50_divider_o(65);

    -- CondNegX_uid58_divider(LOGICAL,57)@22
    CondNegX_uid58_divider_q <= prod_qy_LT_x_uid50_divider_c and redist16_signX_uid45_divider_b_4_q;

    -- invSignX_uid59_divider(LOGICAL,58)@22
    invSignX_uid59_divider_q <= not (redist16_signX_uid45_divider_b_4_q);

    -- prod_qy_GT_x_uid49_divider(COMPARE,48)@22
    prod_qy_GT_x_uid49_divider_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((65 downto 32 => redist26_in_rsrvd_fix_numerator_22_outputreg0_q(31)) & redist26_in_rsrvd_fix_numerator_22_outputreg0_q));
    prod_qy_GT_x_uid49_divider_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((65 downto 65 => prodResY_uid48_divider_sums_result_add_0_0_q(64)) & prodResY_uid48_divider_sums_result_add_0_0_q));
    prod_qy_GT_x_uid49_divider_o <= STD_LOGIC_VECTOR(SIGNED(prod_qy_GT_x_uid49_divider_a) - SIGNED(prod_qy_GT_x_uid49_divider_b));
    prod_qy_GT_x_uid49_divider_c(0) <= prod_qy_GT_x_uid49_divider_o(65);

    -- CondPosX_uid60_divider(LOGICAL,59)@22
    CondPosX_uid60_divider_q <= prod_qy_GT_x_uid49_divider_c and invSignX_uid59_divider_q;

    -- postMuxSelect_uid61_divider(LOGICAL,60)@22
    postMuxSelect_uid61_divider_q <= CondPosX_uid60_divider_q or CondNegX_uid58_divider_q or OverflowCond_uid57_divider_q;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- resFinalIntDiv_uid66_divider(MUX,65)@22
    resFinalIntDiv_uid66_divider_s <= postMuxSelect_uid61_divider_q;
    resFinalIntDiv_uid66_divider_combproc: PROCESS (resFinalIntDiv_uid66_divider_s, redist15_resFinal_uid47_divider_q_4_outputreg0_q, resFinalPostMux_uid65_divider_b)
    BEGIN
        CASE (resFinalIntDiv_uid66_divider_s) IS
            WHEN "0" => resFinalIntDiv_uid66_divider_q <= redist15_resFinal_uid47_divider_q_4_outputreg0_q;
            WHEN "1" => resFinalIntDiv_uid66_divider_q <= resFinalPostMux_uid65_divider_b;
            WHEN OTHERS => resFinalIntDiv_uid66_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_rsrvd_fix(GPOUT,5)@22
    result <= resFinalIntDiv_uid66_divider_q;

END normal;
