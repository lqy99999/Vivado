## This file is a general .xdc for the Nexys4 DDR Rev. C
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]


##Switches
#Bank = 34, Pin name = IO_L21P_T3_DQS_34,					Sch name = SW0
set_property PACKAGE_PIN U9 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]


## LEDs
#Bank = 34, Pin name = IO_L24N_T3_34,						Sch name = LED0
set_property PACKAGE_PIN T8 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]
#Bank = 34, Pin name = IO_L21N_T3_DQS_34,					Sch name = LED1
set_property PACKAGE_PIN V9 [get_ports sd_sw]
set_property IOSTANDARD LVCMOS33 [get_ports sd_sw]


##Omnidirectional Microphone
#Bank = 35, Pin name = IO_25_35,							Sch name = M_CLK
set_property PACKAGE_PIN J5 [get_ports MIC_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports MIC_CLK]
#Bank = 35, Pin name = IO_L24N_T3_35,						Sch name = M_DATA
set_property PACKAGE_PIN H5 [get_ports MIC_DATA]
set_property IOSTANDARD LVCMOS33 [get_ports MIC_DATA]
#Bank = 35, Pin name = IO_0_35,								Sch name = M_LRSEL
set_property PACKAGE_PIN F5 [get_ports MIC_LR_SEL]
set_property IOSTANDARD LVCMOS33 [get_ports MIC_LR_SEL]



##PWM Audio Amplifier
#Bank = 15, Pin name = IO_L4N_T0_15,						Sch name = AUD_PWM
set_property PACKAGE_PIN A11 [get_ports AUD_PWM]
set_property IOSTANDARD LVCMOS33 [get_ports AUD_PWM]
#Bank = 15, Pin name = IO_L6P_T0_15,						Sch name = AUD_SD
set_property PACKAGE_PIN D12 [get_ports AUD_SD]
set_property IOSTANDARD LVCMOS33 [get_ports AUD_SD]



##USB-RS232 Interface

#set_property -dict { PACKAGE_PIN C4    IOSTANDARD LVCMOS33 } [get_ports { UART_TXD_IN }]; #IO_L7P_T1_AD6P_35 Sch=uart_txd_in
#set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { UART_RXD_OUT }]; #IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
#set_property -dict { PACKAGE_PIN D3    IOSTANDARD LVCMOS33 } [get_ports { UART_CTS }]; #IO_L12N_T1_MRCC_35 Sch=uart_cts
#set_property -dict { PACKAGE_PIN E5    IOSTANDARD LVCMOS33 } [get_ports { UART_RTS }]; #IO_L5N_T0_AD13N_35 Sch=uart_rts

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list AUD_PWM_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list AUD_SD_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list MIC_CLK_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list MIC_DATA_IBUF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
