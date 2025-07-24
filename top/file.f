// 64 bit option for AWS labs
-64bit

-uvmhome /home/cc/mnt/XCELIUM2309/tools/methodology/UVM/CDNS-1.2

// Include directories
-incdir ../AXI4_Master_UVC
-incdir ../AXI4_Slave_UVC
-incdir ../AXI4_Master_UVC/AXI_M_read_agent
-incdir ../AXI4_Master_UVC/AXI_M_write_agent
-incdir ../AXI4_Slave_UVC/AXI_S_read_agent
-incdir ../AXI4_Slave_UVC/AXI_S_write_agent

// AXI-Lite interface
// Compile files
../top/AXI_macros.sv
../rtl/AXI_if.sv
../AXI4_Master_UVC/AXI_M_pkg.sv
../AXI4_Slave_UVC/AXI_S_pkg.sv
../top/AXI_tb.sv
../top/AXI_test_lib.sv
../top/tb_top.sv

