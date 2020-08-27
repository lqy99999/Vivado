
# Clock signal
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports sys_clock]							
	set_property IOSTANDARD LVCMOS33 [get_ports sys_clock]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports sys_clock]

# Switches
#Bank = 34, Pin name = IO_L21P_T3_DQS_34,					Sch name = SW0
set_property PACKAGE_PIN U9 [get_ports reset]					
	set_property IOSTANDARD LVCMOS33 [get_ports reset]

#Accelerometer
#Bank = 15, Pin name = IO_L6N_T0_VREF_15,					Sch name = ACL_MISO
set_property PACKAGE_PIN D13 [get_ports acl_spi_io1_io]					
	set_property IOSTANDARD LVCMOS33 [get_ports acl_spi_io1_io]
#Bank = 15, Pin name = IO_L2N_T0_AD8N_15,					Sch name = ACL_MOSI
set_property PACKAGE_PIN B14 [get_ports acl_spi_io0_io]					
	set_property IOSTANDARD LVCMOS33 [get_ports acl_spi_io0_io]
#Bank = 15, Pin name = IO_L12P_T1_MRCC_15,					Sch name = ACL_SCLK
set_property PACKAGE_PIN D15 [get_ports acl_spi_sck_io]					
	set_property IOSTANDARD LVCMOS33 [get_ports acl_spi_sck_io]
#Bank = 15, Pin name = IO_L12N_T1_MRCC_15,					Sch name = ACL_CSN
set_property PACKAGE_PIN C15 [get_ports acl_spi_ss_io]						
	set_property IOSTANDARD LVCMOS33 [get_ports acl_spi_ss_io]


##Pmod Header JC
##Bank = 35, Pin name = IO_L23P_T3_35,						Sch name = JC1
#set_property PACKAGE_PIN K2 [get_ports {pmod_jc[0]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {pmod_jc[0]}]
##Bank = 35, Pin name = IO_L6P_T0_35,						Sch name = JC2 
#set_property PACKAGE_PIN E7 [get_ports {pmod_jc[1]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {pmod_jc[1]}]
##Bank = 35, Pin name = IO_L22P_T3_35,						Sch name = JC3 
#set_property PACKAGE_PIN J3 [get_ports {pmod_jc[2]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {pmod_jc[2]}]
##Bank = 35, Pin name = IO_L21P_T3_DQS_35,					Sch name = JC4 
#set_property PACKAGE_PIN J4 [get_ports {pmod_jc[3]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {pmod_jc[3]}]
	
	



