--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2.1 (lin64) Build 4081461 Thu Dec 14 12:22:04 MST 2023
--Date        : Mon Jun 10 16:36:01 2024
--Host        : correlator8.fnal.gov running 64-bit unknown
--Command     : generate_target project_1_wrapper.bd
--Design      : project_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity project_1_wrapper is
  port (
    M_AXI_HPM1_FPD_0_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_HPM1_FPD_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_HPM1_FPD_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_HPM1_FPD_0_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_HPM1_FPD_0_arlock : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_HPM1_FPD_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_HPM1_FPD_0_arready : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_HPM1_FPD_0_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_arvalid : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_HPM1_FPD_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_HPM1_FPD_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_HPM1_FPD_0_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_HPM1_FPD_0_awlock : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_HPM1_FPD_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_HPM1_FPD_0_awready : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_HPM1_FPD_0_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_awvalid : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_bready : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_HPM1_FPD_0_bvalid : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXI_HPM1_FPD_0_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_rlast : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_rready : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_HPM1_FPD_0_rvalid : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXI_HPM1_FPD_0_wlast : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_wready : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_wvalid : out STD_LOGIC;
    fast_command_config_BCR_tri_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    fast_command_config_LED_tri_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_PLtoPS_rtl : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_PStoPL_rtl : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_rtl_CLK0_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_rtl_CLK1_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_rtl_RM0_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_RM1_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_SFP0_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_SFP1_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_SFP2_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_SFP3_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    iic_CLK0_rtl_scl_io : inout STD_LOGIC;
    iic_CLK0_rtl_sda_io : inout STD_LOGIC;
    iic_CLK1_rtl_scl_io : inout STD_LOGIC;
    iic_CLK1_rtl_sda_io : inout STD_LOGIC;
    iic_RM0_rtl_scl_io : inout STD_LOGIC;
    iic_RM0_rtl_sda_io : inout STD_LOGIC;
    iic_RM1_rtl_scl_io : inout STD_LOGIC;
    iic_RM1_rtl_sda_io : inout STD_LOGIC;
    iic_RM2_rtl_scl_io : inout STD_LOGIC;
    iic_RM2_rtl_sda_io : inout STD_LOGIC;
    iic_RM3_rtl_scl_io : inout STD_LOGIC;
    iic_RM3_rtl_sda_io : inout STD_LOGIC;
    iic_RM4_rtl_scl_io : inout STD_LOGIC;
    iic_RM4_rtl_sda_io : inout STD_LOGIC;
    iic_RM5_rtl_scl_io : inout STD_LOGIC;
    iic_RM5_rtl_sda_io : inout STD_LOGIC;
    iic_SFP0_rtl_scl_io : inout STD_LOGIC;
    iic_SFP0_rtl_sda_io : inout STD_LOGIC;
    iic_SFP1_rtl_scl_io : inout STD_LOGIC;
    iic_SFP1_rtl_sda_io : inout STD_LOGIC;
    iic_SFP2_rtl_scl_io : inout STD_LOGIC;
    iic_SFP2_rtl_sda_io : inout STD_LOGIC;
    iic_SFP3_rtl_scl_io : inout STD_LOGIC;
    iic_SFP3_rtl_sda_io : inout STD_LOGIC
  );
end project_1_wrapper;

architecture STRUCTURE of project_1_wrapper is
  component project_1 is
  port (
    iic_RM0_rtl_scl_i : in STD_LOGIC;
    iic_RM0_rtl_scl_o : out STD_LOGIC;
    iic_RM0_rtl_scl_t : out STD_LOGIC;
    iic_RM0_rtl_sda_i : in STD_LOGIC;
    iic_RM0_rtl_sda_o : out STD_LOGIC;
    iic_RM0_rtl_sda_t : out STD_LOGIC;
    iic_RM1_rtl_scl_i : in STD_LOGIC;
    iic_RM1_rtl_scl_o : out STD_LOGIC;
    iic_RM1_rtl_scl_t : out STD_LOGIC;
    iic_RM1_rtl_sda_i : in STD_LOGIC;
    iic_RM1_rtl_sda_o : out STD_LOGIC;
    iic_RM1_rtl_sda_t : out STD_LOGIC;
    iic_RM2_rtl_scl_i : in STD_LOGIC;
    iic_RM2_rtl_scl_o : out STD_LOGIC;
    iic_RM2_rtl_scl_t : out STD_LOGIC;
    iic_RM2_rtl_sda_i : in STD_LOGIC;
    iic_RM2_rtl_sda_o : out STD_LOGIC;
    iic_RM2_rtl_sda_t : out STD_LOGIC;
    iic_RM3_rtl_scl_i : in STD_LOGIC;
    iic_RM3_rtl_scl_o : out STD_LOGIC;
    iic_RM3_rtl_scl_t : out STD_LOGIC;
    iic_RM3_rtl_sda_i : in STD_LOGIC;
    iic_RM3_rtl_sda_o : out STD_LOGIC;
    iic_RM3_rtl_sda_t : out STD_LOGIC;
    iic_RM4_rtl_scl_i : in STD_LOGIC;
    iic_RM4_rtl_scl_o : out STD_LOGIC;
    iic_RM4_rtl_scl_t : out STD_LOGIC;
    iic_RM4_rtl_sda_i : in STD_LOGIC;
    iic_RM4_rtl_sda_o : out STD_LOGIC;
    iic_RM4_rtl_sda_t : out STD_LOGIC;
    iic_RM5_rtl_scl_i : in STD_LOGIC;
    iic_RM5_rtl_scl_o : out STD_LOGIC;
    iic_RM5_rtl_scl_t : out STD_LOGIC;
    iic_RM5_rtl_sda_i : in STD_LOGIC;
    iic_RM5_rtl_sda_o : out STD_LOGIC;
    iic_RM5_rtl_sda_t : out STD_LOGIC;
    iic_SFP0_rtl_scl_i : in STD_LOGIC;
    iic_SFP0_rtl_scl_o : out STD_LOGIC;
    iic_SFP0_rtl_scl_t : out STD_LOGIC;
    iic_SFP0_rtl_sda_i : in STD_LOGIC;
    iic_SFP0_rtl_sda_o : out STD_LOGIC;
    iic_SFP0_rtl_sda_t : out STD_LOGIC;
    iic_SFP1_rtl_scl_i : in STD_LOGIC;
    iic_SFP1_rtl_scl_o : out STD_LOGIC;
    iic_SFP1_rtl_scl_t : out STD_LOGIC;
    iic_SFP1_rtl_sda_i : in STD_LOGIC;
    iic_SFP1_rtl_sda_o : out STD_LOGIC;
    iic_SFP1_rtl_sda_t : out STD_LOGIC;
    iic_SFP2_rtl_scl_i : in STD_LOGIC;
    iic_SFP2_rtl_scl_o : out STD_LOGIC;
    iic_SFP2_rtl_scl_t : out STD_LOGIC;
    iic_SFP2_rtl_sda_i : in STD_LOGIC;
    iic_SFP2_rtl_sda_o : out STD_LOGIC;
    iic_SFP2_rtl_sda_t : out STD_LOGIC;
    iic_SFP3_rtl_scl_i : in STD_LOGIC;
    iic_SFP3_rtl_scl_o : out STD_LOGIC;
    iic_SFP3_rtl_scl_t : out STD_LOGIC;
    iic_SFP3_rtl_sda_i : in STD_LOGIC;
    iic_SFP3_rtl_sda_o : out STD_LOGIC;
    iic_SFP3_rtl_sda_t : out STD_LOGIC;
    iic_CLK0_rtl_scl_i : in STD_LOGIC;
    iic_CLK0_rtl_scl_o : out STD_LOGIC;
    iic_CLK0_rtl_scl_t : out STD_LOGIC;
    iic_CLK0_rtl_sda_i : in STD_LOGIC;
    iic_CLK0_rtl_sda_o : out STD_LOGIC;
    iic_CLK0_rtl_sda_t : out STD_LOGIC;
    iic_CLK1_rtl_scl_i : in STD_LOGIC;
    iic_CLK1_rtl_scl_o : out STD_LOGIC;
    iic_CLK1_rtl_scl_t : out STD_LOGIC;
    iic_CLK1_rtl_sda_i : in STD_LOGIC;
    iic_CLK1_rtl_sda_o : out STD_LOGIC;
    iic_CLK1_rtl_sda_t : out STD_LOGIC;
    gpio_rtl_RM1_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_RM0_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_SFP1_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_SFP0_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_SFP3_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_SFP2_tri_i : in STD_LOGIC_VECTOR ( 23 downto 0 );
    gpio_rtl_CLK1_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_rtl_CLK0_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fast_command_config_LED_tri_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    fast_command_config_BCR_tri_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_PStoPL_rtl : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_PLtoPS_rtl : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_HPM1_FPD_0_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_HPM1_FPD_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_HPM1_FPD_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_HPM1_FPD_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_HPM1_FPD_0_awlock : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_HPM1_FPD_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_HPM1_FPD_0_awvalid : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_awready : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXI_HPM1_FPD_0_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_wlast : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_wvalid : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_wready : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_HPM1_FPD_0_bvalid : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_bready : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_HPM1_FPD_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_HPM1_FPD_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_HPM1_FPD_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_HPM1_FPD_0_arlock : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_HPM1_FPD_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_HPM1_FPD_0_arvalid : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_arready : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_HPM1_FPD_0_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXI_HPM1_FPD_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_HPM1_FPD_0_rlast : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_rvalid : in STD_LOGIC;
    M_AXI_HPM1_FPD_0_rready : out STD_LOGIC;
    M_AXI_HPM1_FPD_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_HPM1_FPD_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component project_1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal iic_CLK0_rtl_scl_i : STD_LOGIC;
  signal iic_CLK0_rtl_scl_o : STD_LOGIC;
  signal iic_CLK0_rtl_scl_t : STD_LOGIC;
  signal iic_CLK0_rtl_sda_i : STD_LOGIC;
  signal iic_CLK0_rtl_sda_o : STD_LOGIC;
  signal iic_CLK0_rtl_sda_t : STD_LOGIC;
  signal iic_CLK1_rtl_scl_i : STD_LOGIC;
  signal iic_CLK1_rtl_scl_o : STD_LOGIC;
  signal iic_CLK1_rtl_scl_t : STD_LOGIC;
  signal iic_CLK1_rtl_sda_i : STD_LOGIC;
  signal iic_CLK1_rtl_sda_o : STD_LOGIC;
  signal iic_CLK1_rtl_sda_t : STD_LOGIC;
  signal iic_RM0_rtl_scl_i : STD_LOGIC;
  signal iic_RM0_rtl_scl_o : STD_LOGIC;
  signal iic_RM0_rtl_scl_t : STD_LOGIC;
  signal iic_RM0_rtl_sda_i : STD_LOGIC;
  signal iic_RM0_rtl_sda_o : STD_LOGIC;
  signal iic_RM0_rtl_sda_t : STD_LOGIC;
  signal iic_RM1_rtl_scl_i : STD_LOGIC;
  signal iic_RM1_rtl_scl_o : STD_LOGIC;
  signal iic_RM1_rtl_scl_t : STD_LOGIC;
  signal iic_RM1_rtl_sda_i : STD_LOGIC;
  signal iic_RM1_rtl_sda_o : STD_LOGIC;
  signal iic_RM1_rtl_sda_t : STD_LOGIC;
  signal iic_RM2_rtl_scl_i : STD_LOGIC;
  signal iic_RM2_rtl_scl_o : STD_LOGIC;
  signal iic_RM2_rtl_scl_t : STD_LOGIC;
  signal iic_RM2_rtl_sda_i : STD_LOGIC;
  signal iic_RM2_rtl_sda_o : STD_LOGIC;
  signal iic_RM2_rtl_sda_t : STD_LOGIC;
  signal iic_RM3_rtl_scl_i : STD_LOGIC;
  signal iic_RM3_rtl_scl_o : STD_LOGIC;
  signal iic_RM3_rtl_scl_t : STD_LOGIC;
  signal iic_RM3_rtl_sda_i : STD_LOGIC;
  signal iic_RM3_rtl_sda_o : STD_LOGIC;
  signal iic_RM3_rtl_sda_t : STD_LOGIC;
  signal iic_RM4_rtl_scl_i : STD_LOGIC;
  signal iic_RM4_rtl_scl_o : STD_LOGIC;
  signal iic_RM4_rtl_scl_t : STD_LOGIC;
  signal iic_RM4_rtl_sda_i : STD_LOGIC;
  signal iic_RM4_rtl_sda_o : STD_LOGIC;
  signal iic_RM4_rtl_sda_t : STD_LOGIC;
  signal iic_RM5_rtl_scl_i : STD_LOGIC;
  signal iic_RM5_rtl_scl_o : STD_LOGIC;
  signal iic_RM5_rtl_scl_t : STD_LOGIC;
  signal iic_RM5_rtl_sda_i : STD_LOGIC;
  signal iic_RM5_rtl_sda_o : STD_LOGIC;
  signal iic_RM5_rtl_sda_t : STD_LOGIC;
  signal iic_SFP0_rtl_scl_i : STD_LOGIC;
  signal iic_SFP0_rtl_scl_o : STD_LOGIC;
  signal iic_SFP0_rtl_scl_t : STD_LOGIC;
  signal iic_SFP0_rtl_sda_i : STD_LOGIC;
  signal iic_SFP0_rtl_sda_o : STD_LOGIC;
  signal iic_SFP0_rtl_sda_t : STD_LOGIC;
  signal iic_SFP1_rtl_scl_i : STD_LOGIC;
  signal iic_SFP1_rtl_scl_o : STD_LOGIC;
  signal iic_SFP1_rtl_scl_t : STD_LOGIC;
  signal iic_SFP1_rtl_sda_i : STD_LOGIC;
  signal iic_SFP1_rtl_sda_o : STD_LOGIC;
  signal iic_SFP1_rtl_sda_t : STD_LOGIC;
  signal iic_SFP2_rtl_scl_i : STD_LOGIC;
  signal iic_SFP2_rtl_scl_o : STD_LOGIC;
  signal iic_SFP2_rtl_scl_t : STD_LOGIC;
  signal iic_SFP2_rtl_sda_i : STD_LOGIC;
  signal iic_SFP2_rtl_sda_o : STD_LOGIC;
  signal iic_SFP2_rtl_sda_t : STD_LOGIC;
  signal iic_SFP3_rtl_scl_i : STD_LOGIC;
  signal iic_SFP3_rtl_scl_o : STD_LOGIC;
  signal iic_SFP3_rtl_scl_t : STD_LOGIC;
  signal iic_SFP3_rtl_sda_i : STD_LOGIC;
  signal iic_SFP3_rtl_sda_o : STD_LOGIC;
  signal iic_SFP3_rtl_sda_t : STD_LOGIC;
begin
iic_CLK0_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_CLK0_rtl_scl_o,
      IO => iic_CLK0_rtl_scl_io,
      O => iic_CLK0_rtl_scl_i,
      T => iic_CLK0_rtl_scl_t
    );
iic_CLK0_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_CLK0_rtl_sda_o,
      IO => iic_CLK0_rtl_sda_io,
      O => iic_CLK0_rtl_sda_i,
      T => iic_CLK0_rtl_sda_t
    );
iic_CLK1_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_CLK1_rtl_scl_o,
      IO => iic_CLK1_rtl_scl_io,
      O => iic_CLK1_rtl_scl_i,
      T => iic_CLK1_rtl_scl_t
    );
iic_CLK1_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_CLK1_rtl_sda_o,
      IO => iic_CLK1_rtl_sda_io,
      O => iic_CLK1_rtl_sda_i,
      T => iic_CLK1_rtl_sda_t
    );
iic_RM0_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_RM0_rtl_scl_o,
      IO => iic_RM0_rtl_scl_io,
      O => iic_RM0_rtl_scl_i,
      T => iic_RM0_rtl_scl_t
    );
iic_RM0_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_RM0_rtl_sda_o,
      IO => iic_RM0_rtl_sda_io,
      O => iic_RM0_rtl_sda_i,
      T => iic_RM0_rtl_sda_t
    );
iic_RM1_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_RM1_rtl_scl_o,
      IO => iic_RM1_rtl_scl_io,
      O => iic_RM1_rtl_scl_i,
      T => iic_RM1_rtl_scl_t
    );
iic_RM1_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_RM1_rtl_sda_o,
      IO => iic_RM1_rtl_sda_io,
      O => iic_RM1_rtl_sda_i,
      T => iic_RM1_rtl_sda_t
    );
iic_RM2_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_RM2_rtl_scl_o,
      IO => iic_RM2_rtl_scl_io,
      O => iic_RM2_rtl_scl_i,
      T => iic_RM2_rtl_scl_t
    );
iic_RM2_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_RM2_rtl_sda_o,
      IO => iic_RM2_rtl_sda_io,
      O => iic_RM2_rtl_sda_i,
      T => iic_RM2_rtl_sda_t
    );
iic_RM3_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_RM3_rtl_scl_o,
      IO => iic_RM3_rtl_scl_io,
      O => iic_RM3_rtl_scl_i,
      T => iic_RM3_rtl_scl_t
    );
iic_RM3_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_RM3_rtl_sda_o,
      IO => iic_RM3_rtl_sda_io,
      O => iic_RM3_rtl_sda_i,
      T => iic_RM3_rtl_sda_t
    );
iic_RM4_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_RM4_rtl_scl_o,
      IO => iic_RM4_rtl_scl_io,
      O => iic_RM4_rtl_scl_i,
      T => iic_RM4_rtl_scl_t
    );
iic_RM4_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_RM4_rtl_sda_o,
      IO => iic_RM4_rtl_sda_io,
      O => iic_RM4_rtl_sda_i,
      T => iic_RM4_rtl_sda_t
    );
iic_RM5_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_RM5_rtl_scl_o,
      IO => iic_RM5_rtl_scl_io,
      O => iic_RM5_rtl_scl_i,
      T => iic_RM5_rtl_scl_t
    );
iic_RM5_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_RM5_rtl_sda_o,
      IO => iic_RM5_rtl_sda_io,
      O => iic_RM5_rtl_sda_i,
      T => iic_RM5_rtl_sda_t
    );
iic_SFP0_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_SFP0_rtl_scl_o,
      IO => iic_SFP0_rtl_scl_io,
      O => iic_SFP0_rtl_scl_i,
      T => iic_SFP0_rtl_scl_t
    );
iic_SFP0_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_SFP0_rtl_sda_o,
      IO => iic_SFP0_rtl_sda_io,
      O => iic_SFP0_rtl_sda_i,
      T => iic_SFP0_rtl_sda_t
    );
iic_SFP1_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_SFP1_rtl_scl_o,
      IO => iic_SFP1_rtl_scl_io,
      O => iic_SFP1_rtl_scl_i,
      T => iic_SFP1_rtl_scl_t
    );
iic_SFP1_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_SFP1_rtl_sda_o,
      IO => iic_SFP1_rtl_sda_io,
      O => iic_SFP1_rtl_sda_i,
      T => iic_SFP1_rtl_sda_t
    );
iic_SFP2_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_SFP2_rtl_scl_o,
      IO => iic_SFP2_rtl_scl_io,
      O => iic_SFP2_rtl_scl_i,
      T => iic_SFP2_rtl_scl_t
    );
iic_SFP2_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_SFP2_rtl_sda_o,
      IO => iic_SFP2_rtl_sda_io,
      O => iic_SFP2_rtl_sda_i,
      T => iic_SFP2_rtl_sda_t
    );
iic_SFP3_rtl_scl_iobuf: component IOBUF
     port map (
      I => iic_SFP3_rtl_scl_o,
      IO => iic_SFP3_rtl_scl_io,
      O => iic_SFP3_rtl_scl_i,
      T => iic_SFP3_rtl_scl_t
    );
iic_SFP3_rtl_sda_iobuf: component IOBUF
     port map (
      I => iic_SFP3_rtl_sda_o,
      IO => iic_SFP3_rtl_sda_io,
      O => iic_SFP3_rtl_sda_i,
      T => iic_SFP3_rtl_sda_t
    );
project_1_i: component project_1
     port map (
      M_AXI_HPM1_FPD_0_araddr(39 downto 0) => M_AXI_HPM1_FPD_0_araddr(39 downto 0),
      M_AXI_HPM1_FPD_0_arburst(1 downto 0) => M_AXI_HPM1_FPD_0_arburst(1 downto 0),
      M_AXI_HPM1_FPD_0_arcache(3 downto 0) => M_AXI_HPM1_FPD_0_arcache(3 downto 0),
      M_AXI_HPM1_FPD_0_arid(15 downto 0) => M_AXI_HPM1_FPD_0_arid(15 downto 0),
      M_AXI_HPM1_FPD_0_arlen(7 downto 0) => M_AXI_HPM1_FPD_0_arlen(7 downto 0),
      M_AXI_HPM1_FPD_0_arlock => M_AXI_HPM1_FPD_0_arlock,
      M_AXI_HPM1_FPD_0_arprot(2 downto 0) => M_AXI_HPM1_FPD_0_arprot(2 downto 0),
      M_AXI_HPM1_FPD_0_arqos(3 downto 0) => M_AXI_HPM1_FPD_0_arqos(3 downto 0),
      M_AXI_HPM1_FPD_0_arready => M_AXI_HPM1_FPD_0_arready,
      M_AXI_HPM1_FPD_0_arsize(2 downto 0) => M_AXI_HPM1_FPD_0_arsize(2 downto 0),
      M_AXI_HPM1_FPD_0_aruser(15 downto 0) => M_AXI_HPM1_FPD_0_aruser(15 downto 0),
      M_AXI_HPM1_FPD_0_arvalid => M_AXI_HPM1_FPD_0_arvalid,
      M_AXI_HPM1_FPD_0_awaddr(39 downto 0) => M_AXI_HPM1_FPD_0_awaddr(39 downto 0),
      M_AXI_HPM1_FPD_0_awburst(1 downto 0) => M_AXI_HPM1_FPD_0_awburst(1 downto 0),
      M_AXI_HPM1_FPD_0_awcache(3 downto 0) => M_AXI_HPM1_FPD_0_awcache(3 downto 0),
      M_AXI_HPM1_FPD_0_awid(15 downto 0) => M_AXI_HPM1_FPD_0_awid(15 downto 0),
      M_AXI_HPM1_FPD_0_awlen(7 downto 0) => M_AXI_HPM1_FPD_0_awlen(7 downto 0),
      M_AXI_HPM1_FPD_0_awlock => M_AXI_HPM1_FPD_0_awlock,
      M_AXI_HPM1_FPD_0_awprot(2 downto 0) => M_AXI_HPM1_FPD_0_awprot(2 downto 0),
      M_AXI_HPM1_FPD_0_awqos(3 downto 0) => M_AXI_HPM1_FPD_0_awqos(3 downto 0),
      M_AXI_HPM1_FPD_0_awready => M_AXI_HPM1_FPD_0_awready,
      M_AXI_HPM1_FPD_0_awsize(2 downto 0) => M_AXI_HPM1_FPD_0_awsize(2 downto 0),
      M_AXI_HPM1_FPD_0_awuser(15 downto 0) => M_AXI_HPM1_FPD_0_awuser(15 downto 0),
      M_AXI_HPM1_FPD_0_awvalid => M_AXI_HPM1_FPD_0_awvalid,
      M_AXI_HPM1_FPD_0_bid(15 downto 0) => M_AXI_HPM1_FPD_0_bid(15 downto 0),
      M_AXI_HPM1_FPD_0_bready => M_AXI_HPM1_FPD_0_bready,
      M_AXI_HPM1_FPD_0_bresp(1 downto 0) => M_AXI_HPM1_FPD_0_bresp(1 downto 0),
      M_AXI_HPM1_FPD_0_bvalid => M_AXI_HPM1_FPD_0_bvalid,
      M_AXI_HPM1_FPD_0_rdata(127 downto 0) => M_AXI_HPM1_FPD_0_rdata(127 downto 0),
      M_AXI_HPM1_FPD_0_rid(15 downto 0) => M_AXI_HPM1_FPD_0_rid(15 downto 0),
      M_AXI_HPM1_FPD_0_rlast => M_AXI_HPM1_FPD_0_rlast,
      M_AXI_HPM1_FPD_0_rready => M_AXI_HPM1_FPD_0_rready,
      M_AXI_HPM1_FPD_0_rresp(1 downto 0) => M_AXI_HPM1_FPD_0_rresp(1 downto 0),
      M_AXI_HPM1_FPD_0_rvalid => M_AXI_HPM1_FPD_0_rvalid,
      M_AXI_HPM1_FPD_0_wdata(127 downto 0) => M_AXI_HPM1_FPD_0_wdata(127 downto 0),
      M_AXI_HPM1_FPD_0_wlast => M_AXI_HPM1_FPD_0_wlast,
      M_AXI_HPM1_FPD_0_wready => M_AXI_HPM1_FPD_0_wready,
      M_AXI_HPM1_FPD_0_wstrb(15 downto 0) => M_AXI_HPM1_FPD_0_wstrb(15 downto 0),
      M_AXI_HPM1_FPD_0_wvalid => M_AXI_HPM1_FPD_0_wvalid,
      fast_command_config_BCR_tri_o(31 downto 0) => fast_command_config_BCR_tri_o(31 downto 0),
      fast_command_config_LED_tri_o(31 downto 0) => fast_command_config_LED_tri_o(31 downto 0),
      gpio_PLtoPS_rtl(31 downto 0) => gpio_PLtoPS_rtl(31 downto 0),
      gpio_PStoPL_rtl(31 downto 0) => gpio_PStoPL_rtl(31 downto 0),
      gpio_rtl_CLK0_tri_i(15 downto 0) => gpio_rtl_CLK0_tri_i(15 downto 0),
      gpio_rtl_CLK1_tri_i(15 downto 0) => gpio_rtl_CLK1_tri_i(15 downto 0),
      gpio_rtl_RM0_tri_i(23 downto 0) => gpio_rtl_RM0_tri_i(23 downto 0),
      gpio_rtl_RM1_tri_i(23 downto 0) => gpio_rtl_RM1_tri_i(23 downto 0),
      gpio_rtl_SFP0_tri_i(23 downto 0) => gpio_rtl_SFP0_tri_i(23 downto 0),
      gpio_rtl_SFP1_tri_i(23 downto 0) => gpio_rtl_SFP1_tri_i(23 downto 0),
      gpio_rtl_SFP2_tri_i(23 downto 0) => gpio_rtl_SFP2_tri_i(23 downto 0),
      gpio_rtl_SFP3_tri_i(23 downto 0) => gpio_rtl_SFP3_tri_i(23 downto 0),
      iic_CLK0_rtl_scl_i => iic_CLK0_rtl_scl_i,
      iic_CLK0_rtl_scl_o => iic_CLK0_rtl_scl_o,
      iic_CLK0_rtl_scl_t => iic_CLK0_rtl_scl_t,
      iic_CLK0_rtl_sda_i => iic_CLK0_rtl_sda_i,
      iic_CLK0_rtl_sda_o => iic_CLK0_rtl_sda_o,
      iic_CLK0_rtl_sda_t => iic_CLK0_rtl_sda_t,
      iic_CLK1_rtl_scl_i => iic_CLK1_rtl_scl_i,
      iic_CLK1_rtl_scl_o => iic_CLK1_rtl_scl_o,
      iic_CLK1_rtl_scl_t => iic_CLK1_rtl_scl_t,
      iic_CLK1_rtl_sda_i => iic_CLK1_rtl_sda_i,
      iic_CLK1_rtl_sda_o => iic_CLK1_rtl_sda_o,
      iic_CLK1_rtl_sda_t => iic_CLK1_rtl_sda_t,
      iic_RM0_rtl_scl_i => iic_RM0_rtl_scl_i,
      iic_RM0_rtl_scl_o => iic_RM0_rtl_scl_o,
      iic_RM0_rtl_scl_t => iic_RM0_rtl_scl_t,
      iic_RM0_rtl_sda_i => iic_RM0_rtl_sda_i,
      iic_RM0_rtl_sda_o => iic_RM0_rtl_sda_o,
      iic_RM0_rtl_sda_t => iic_RM0_rtl_sda_t,
      iic_RM1_rtl_scl_i => iic_RM1_rtl_scl_i,
      iic_RM1_rtl_scl_o => iic_RM1_rtl_scl_o,
      iic_RM1_rtl_scl_t => iic_RM1_rtl_scl_t,
      iic_RM1_rtl_sda_i => iic_RM1_rtl_sda_i,
      iic_RM1_rtl_sda_o => iic_RM1_rtl_sda_o,
      iic_RM1_rtl_sda_t => iic_RM1_rtl_sda_t,
      iic_RM2_rtl_scl_i => iic_RM2_rtl_scl_i,
      iic_RM2_rtl_scl_o => iic_RM2_rtl_scl_o,
      iic_RM2_rtl_scl_t => iic_RM2_rtl_scl_t,
      iic_RM2_rtl_sda_i => iic_RM2_rtl_sda_i,
      iic_RM2_rtl_sda_o => iic_RM2_rtl_sda_o,
      iic_RM2_rtl_sda_t => iic_RM2_rtl_sda_t,
      iic_RM3_rtl_scl_i => iic_RM3_rtl_scl_i,
      iic_RM3_rtl_scl_o => iic_RM3_rtl_scl_o,
      iic_RM3_rtl_scl_t => iic_RM3_rtl_scl_t,
      iic_RM3_rtl_sda_i => iic_RM3_rtl_sda_i,
      iic_RM3_rtl_sda_o => iic_RM3_rtl_sda_o,
      iic_RM3_rtl_sda_t => iic_RM3_rtl_sda_t,
      iic_RM4_rtl_scl_i => iic_RM4_rtl_scl_i,
      iic_RM4_rtl_scl_o => iic_RM4_rtl_scl_o,
      iic_RM4_rtl_scl_t => iic_RM4_rtl_scl_t,
      iic_RM4_rtl_sda_i => iic_RM4_rtl_sda_i,
      iic_RM4_rtl_sda_o => iic_RM4_rtl_sda_o,
      iic_RM4_rtl_sda_t => iic_RM4_rtl_sda_t,
      iic_RM5_rtl_scl_i => iic_RM5_rtl_scl_i,
      iic_RM5_rtl_scl_o => iic_RM5_rtl_scl_o,
      iic_RM5_rtl_scl_t => iic_RM5_rtl_scl_t,
      iic_RM5_rtl_sda_i => iic_RM5_rtl_sda_i,
      iic_RM5_rtl_sda_o => iic_RM5_rtl_sda_o,
      iic_RM5_rtl_sda_t => iic_RM5_rtl_sda_t,
      iic_SFP0_rtl_scl_i => iic_SFP0_rtl_scl_i,
      iic_SFP0_rtl_scl_o => iic_SFP0_rtl_scl_o,
      iic_SFP0_rtl_scl_t => iic_SFP0_rtl_scl_t,
      iic_SFP0_rtl_sda_i => iic_SFP0_rtl_sda_i,
      iic_SFP0_rtl_sda_o => iic_SFP0_rtl_sda_o,
      iic_SFP0_rtl_sda_t => iic_SFP0_rtl_sda_t,
      iic_SFP1_rtl_scl_i => iic_SFP1_rtl_scl_i,
      iic_SFP1_rtl_scl_o => iic_SFP1_rtl_scl_o,
      iic_SFP1_rtl_scl_t => iic_SFP1_rtl_scl_t,
      iic_SFP1_rtl_sda_i => iic_SFP1_rtl_sda_i,
      iic_SFP1_rtl_sda_o => iic_SFP1_rtl_sda_o,
      iic_SFP1_rtl_sda_t => iic_SFP1_rtl_sda_t,
      iic_SFP2_rtl_scl_i => iic_SFP2_rtl_scl_i,
      iic_SFP2_rtl_scl_o => iic_SFP2_rtl_scl_o,
      iic_SFP2_rtl_scl_t => iic_SFP2_rtl_scl_t,
      iic_SFP2_rtl_sda_i => iic_SFP2_rtl_sda_i,
      iic_SFP2_rtl_sda_o => iic_SFP2_rtl_sda_o,
      iic_SFP2_rtl_sda_t => iic_SFP2_rtl_sda_t,
      iic_SFP3_rtl_scl_i => iic_SFP3_rtl_scl_i,
      iic_SFP3_rtl_scl_o => iic_SFP3_rtl_scl_o,
      iic_SFP3_rtl_scl_t => iic_SFP3_rtl_scl_t,
      iic_SFP3_rtl_sda_i => iic_SFP3_rtl_sda_i,
      iic_SFP3_rtl_sda_o => iic_SFP3_rtl_sda_o,
      iic_SFP3_rtl_sda_t => iic_SFP3_rtl_sda_t
    );
end STRUCTURE;
