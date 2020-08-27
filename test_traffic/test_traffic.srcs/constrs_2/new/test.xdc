create_clock -period 10.000 [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]


set_property PACKAGE_PIN T17 [get_ports {clk_o[3]}]
set_property PACKAGE_PIN R18 [get_ports {clk_o[2]}]
set_property PACKAGE_PIN P18 [get_ports {clk_o[1]}]
set_property PACKAGE_PIN U16 [get_ports {clk_o[0]}]

set_property PACKAGE_PIN G14 [get_ports {light[0]}]

set_property PACKAGE_PIN R16 [get_ports {state[1]}]
set_property PACKAGE_PIN R17 [get_ports {state[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {clk_o[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {light[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {light[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {light[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {state[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {state[0]}]


set_property PACKAGE_PIN L23 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN D23 [get_ports clk]
