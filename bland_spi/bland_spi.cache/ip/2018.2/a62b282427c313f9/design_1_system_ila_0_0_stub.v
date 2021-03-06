// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Thu May 21 17:56:34 2020
// Host        : LAPTOP-RI5OSPDL running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_system_ila_0_0_stub.v
// Design      : design_1_system_ila_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_f60c,Vivado 2018.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, SLOT_0_SPI_ss_i, SLOT_0_SPI_ss_o, 
  SLOT_0_SPI_ss_t, SLOT_0_SPI_sck_i, SLOT_0_SPI_sck_o, SLOT_0_SPI_sck_t, SLOT_0_SPI_io0_i, 
  SLOT_0_SPI_io0_o, SLOT_0_SPI_io0_t, SLOT_0_SPI_io1_i, SLOT_0_SPI_io1_o, SLOT_0_SPI_io1_t)
/* synthesis syn_black_box black_box_pad_pin="clk,SLOT_0_SPI_ss_i,SLOT_0_SPI_ss_o,SLOT_0_SPI_ss_t,SLOT_0_SPI_sck_i,SLOT_0_SPI_sck_o,SLOT_0_SPI_sck_t,SLOT_0_SPI_io0_i,SLOT_0_SPI_io0_o,SLOT_0_SPI_io0_t,SLOT_0_SPI_io1_i,SLOT_0_SPI_io1_o,SLOT_0_SPI_io1_t" */;
  input clk;
  input SLOT_0_SPI_ss_i;
  input SLOT_0_SPI_ss_o;
  input SLOT_0_SPI_ss_t;
  input SLOT_0_SPI_sck_i;
  input SLOT_0_SPI_sck_o;
  input SLOT_0_SPI_sck_t;
  input SLOT_0_SPI_io0_i;
  input SLOT_0_SPI_io0_o;
  input SLOT_0_SPI_io0_t;
  input SLOT_0_SPI_io1_i;
  input SLOT_0_SPI_io1_o;
  input SLOT_0_SPI_io1_t;
endmodule
