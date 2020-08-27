set_property PACKAGE_PIN H16 [get_ports clk_in];
create_clock -period 8.000 [get_ports clk_in];
set_property PACKAGE_PIN D20 [get_ports reset];
set_property PACKAGE_PIN M15 [get_ports {light[2]}];
set_property PACKAGE_PIN L14 [get_ports {light[1]}];
set_property PACKAGE_PIN G14 [get_ports {light[0]}];

set_property IOSTANDARD LVCMOS33 [get_ports {light[2]}];
set_property IOSTANDARD LVCMOS33 [get_ports {light[1]}];
set_property IOSTANDARD LVCMOS33 [get_ports {light[0]}];
set_property IOSTANDARD LVCMOS33 [get_ports clk_in];
set_property IOSTANDARD LVCMOS33 [get_ports reset];