//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Thu May 14 14:43:39 2020
//Host        : LAPTOP-RI5OSPDL running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (ACL_CSN,
    ACL_INT1,
    ACL_INT2,
    ACL_MISO,
    ACL_MOSI,
    ACL_SCLK,
    CTS,
    LED1,
    LED2,
    RTS,
    RXD,
    TXD,
    reset,
    sys_clock);
  output ACL_CSN;
  input ACL_INT1;
  input ACL_INT2;
  input ACL_MISO;
  output ACL_MOSI;
  output ACL_SCLK;
  output CTS;
  output LED1;
  output LED2;
  input RTS;
  input RXD;
  output TXD;
  input reset;
  input sys_clock;

  wire ACL_CSN;
  wire ACL_INT1;
  wire ACL_INT2;
  wire ACL_MISO;
  wire ACL_MOSI;
  wire ACL_SCLK;
  wire CTS;
  wire LED1;
  wire LED2;
  wire RTS;
  wire RXD;
  wire TXD;
  wire reset;
  wire sys_clock;

  design_1 design_1_i
       (.ACL_CSN(ACL_CSN),
        .ACL_INT1(ACL_INT1),
        .ACL_INT2(ACL_INT2),
        .ACL_MISO(ACL_MISO),
        .ACL_MOSI(ACL_MOSI),
        .ACL_SCLK(ACL_SCLK),
        .CTS(CTS),
        .LED1(LED1),
        .LED2(LED2),
        .RTS(RTS),
        .RXD(RXD),
        .TXD(TXD),
        .reset(reset),
        .sys_clock(sys_clock));
endmodule
