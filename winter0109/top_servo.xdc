## This file is a general .xdc for the Cmod S7-25 Rev. B
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## 12 MHz System Clock
set_property -dict { PACKAGE_PIN M9    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L13P_T2_MRCC_14 Sch=gclk
create_clock -add -name sys_clk_pin -period 83.33 -waveform {0 41.66} [get_ports { clk }];


## Pmod Header JA
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { PWM_1 }]; #IO_L14P_T2_SRCC_34 Sch=ja[1]
#set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { dir[0] }]; #IO_L14N_T2_SRCC_34 Sch=ja[2]
#set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { dir[1] }]; #IO_L13P_T2_MRCC_34 Sch=ja[3]
#set_property -dict { PACKAGE_PIN F3    IOSTANDARD LVCMOS33 } [get_ports { PWM_out2 }]; #IO_L11N_T1_SRCC_34 Sch=ja[4]
set_property -dict { PACKAGE_PIN H3    IOSTANDARD LVCMOS33 } [get_ports { PWM_2 }]; #IO_L13N_T2_MRCC_34 Sch=ja[7]
#set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { dir[2] }]; #IO_L12P_T1_MRCC_34 Sch=ja[8]
#set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { dir[3] }]; #IO_L12N_T1_MRCC_34 Sch=ja[9]
#set_property -dict { PACKAGE_PIN F4    IOSTANDARD LVCMOS33 } [get_ports { ja[7] }]; #IO_L11P_T1_SRCC_34 Sch=ja[10]

## Dedicated Digital I/O on the PIO Headers

set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { cmd[0] }]; #IO_L11P_T1_SRCC_14 Sch=pio[16]
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { cmd[1] }]; #IO_L11N_T1_SRCC_14 Sch=pio[17]
set_property -dict { PACKAGE_PIN N13   IOSTANDARD LVCMOS33 } [get_ports { cmd[2] }]; #IO_L8N_T1_D12_14 Sch=pio[18]
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { rst}];  #IO_L10N_T1_D15_14 Sch=pio[19]
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { servo }]; #IO_L7N_T1_D10_14 Sch=pio[26] //servo output Ãß°¡. 


set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]