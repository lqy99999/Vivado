# Clock signal
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

#7 segment display
#Bank = 34, Pin name = IO_L2N_T0_34,						Sch name = CA
set_property PACKAGE_PIN L3 [get_ports {cathode[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathode[0]}]
#Bank = 34, Pin name = IO_L3N_T0_DQS_34,					Sch name = CB
set_property PACKAGE_PIN N1 [get_ports {cathode[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathode[1]}]
#Bank = 34, Pin name = IO_L6N_T0_VREF_34,					Sch name = CC
set_property PACKAGE_PIN L5 [get_ports {cathode[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathode[2]}]
#Bank = 34, Pin name = IO_L5N_T0_34,						Sch name = CD
set_property PACKAGE_PIN L4 [get_ports {cathode[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathode[3]}]
#Bank = 34, Pin name = IO_L2P_T0_34,						Sch name = CE
set_property PACKAGE_PIN K3 [get_ports {cathode[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathode[4]}]
#Bank = 34, Pin name = IO_L4N_T0_34,						Sch name = CF
set_property PACKAGE_PIN M2 [get_ports {cathode[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathode[5]}]
#Bank = 34, Pin name = IO_L6P_T0_34,						Sch name = CG
set_property PACKAGE_PIN L6 [get_ports {cathode[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathode[6]}]
#Bank = 34, Pin name = IO_L16P_T2_34,						Sch name = DP
set_property PACKAGE_PIN M4 [get_ports {cathode[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathode[7]}]


#Bank = 34, Pin name = IO_L18N_T2_34,						Sch name = AN0
set_property PACKAGE_PIN N6 [get_ports {anode[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
#Banodek = 34, Pin name = IO_L18P_T2_34,						Sch name = anode1
set_property PACKAGE_PIN M6 [get_ports {anode[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
#Banodek = 34, Pin name = IO_L4P_T0_34,						Sch name = anode2
set_property PACKAGE_PIN M3 [get_ports {anode[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
#Banodek = 34, Pin name = IO_L13_T2_MRCC_34,					Sch name = anode3
set_property PACKAGE_PIN N5 [get_ports {anode[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]


#Buttons
#Bank = 15, Pin name = IO_L11N_T1_SRCC_15,					Sch name = BTNC
set_property PACKAGE_PIN E16 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
#Bank = 14, Pin name = IO_25_14,							Sch name = BTNR
set_property PACKAGE_PIN R10 [get_ports button]
set_property IOSTANDARD LVCMOS33 [get_ports button]



