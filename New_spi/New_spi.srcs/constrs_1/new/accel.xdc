## Clock signal
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports sys_clock]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports sys_clock]


##Switches
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports reset]


## LEDs
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports LED1]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports LED2]


##Accelerometer
set_property -dict {PACKAGE_PIN E15 IOSTANDARD LVCMOS33} [get_ports ACL_MISO]
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports ACL_MOSI]
set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports ACL_SCLK]
set_property -dict {PACKAGE_PIN D15 IOSTANDARD LVCMOS33} [get_ports ACL_CSN]
set_property -dict {PACKAGE_PIN B13 IOSTANDARD LVCMOS33} [get_ports ACL_INT1]
set_property -dict {PACKAGE_PIN C16 IOSTANDARD LVCMOS33} [get_ports ACL_INT2]


##USB-RS232 Interface
set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS33} [get_ports RXD]
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports TXD]
set_property -dict {PACKAGE_PIN D3 IOSTANDARD LVCMOS33} [get_ports CTS]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports RTS]

