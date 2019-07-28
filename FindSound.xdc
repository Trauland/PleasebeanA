    
## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports {clk}]
	set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]
	
# Switches
set_property PACKAGE_PIN V17 [get_ports {enable}]
	set_property IOSTANDARD LVCMOS33 [get_ports {enable}]
	
# LEDs
set_property PACKAGE_PIN U16 [get_ports {led}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led}]
set_property PACKAGE_PIN E19 [get_ports {led2}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led2}]
set_property PACKAGE_PIN U19 [get_ports {direction[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {direction[0]}]
set_property PACKAGE_PIN V19 [get_ports {direction[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {direction[1]}]
#set_property PACKAGE_PIN W18 [get_ports {led2}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {led2}]
		
#Pmod Header JB
#Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {LMic}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LMic}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {RMic}]
	set_property IOSTANDARD LVCMOS33 [get_ports {RMic}]