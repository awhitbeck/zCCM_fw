----------------------------------------------------------------------------------
-- Company: FNAL
-- Engineer: A. Whitbeck
-- 
-- Create Date: 05/30/2024 12:46:12 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: LDMX zCCM 
-- Target Devices: k26 on custom zCCM baseboard
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------



Library UNISIM;
use UNISIM.vcomponents.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library surf;
use surf.StdRtlPkg.all;
use surf.AxiStreamPkg.all;
use surf.AxiLitePkg.all;

use surf.I2cPkg.all;

library axi_soc_ultra_plus_core;
use axi_soc_ultra_plus_core.AxiSocUltraPlusPkg.all;

library ldmx_ts;

entity test_kv260 is
    generic (
      TPD_G        : time                      := 1 ns;
      BUILD_INFO_G : BuildInfoType;
      SIMULATION_G      : boolean              := false;
      AXIL_CLK_FREQ_G   : real                 := 125.0e6;
      AXIL_BASE_ADDR_G  : slv(31 downto 0)     := X"8000_0000");
    Port (
      -- Kria K26 I/O Ports
      pmod       : inout slv(7 downto 0);
      -- PMU Ports
      fanEnableL : out   sl;
      -- SYSMON Ports
      vPIn       : in    sl;
      vNIn       : in    sl
         );
end test_kv260;

architecture Behavioral of test_kv260 is    

   constant DMA_SIZE_C           : positive := 2;
   constant AXIL_CLK_FREQ_C      : real     := 1.0/AXIL_CLK_FREQ_G;  
   constant MAIN_XBAR_MASTERS_C  : natural  := 3;
   constant AXIL_VERSION_INDEX_C : natural  := 0;
   constant AXIL_LOC_I2C_INDEX_C : natural  := 1;
   constant AXIL_TOP_REG_INDEX_C : natural  := 2;    

   constant MAIN_XBAR_CFG_C : AxiLiteCrossbarMasterConfigArray(MAIN_XBAR_MASTERS_C-1 downto 0) := (
     AXIL_VERSION_INDEX_C             => (
       baseAddr                       => AXIL_BASE_ADDR_G + X"0000",
       addrBits                       => 12,
       connectivity                   => X"0001"),
     AXIL_LOC_I2C_INDEX_C             => (    -- backplane I2C Interface
         baseAddr                     => AXIL_BASE_ADDR_G + X"1000",
         addrBits                     => 8,
         connectivity                 => X"0001"),
     AXIL_TOP_REG_INDEX_C             => (    -- Register Interface
         baseAddr                     => AXIL_BASE_ADDR_G + X"3000",
         addrBits                     => 8,
         connectivity                 => X"0001"));

   constant I2C_SCL_FREQ_C  : real := ite(SIMULATION_G, 2.0e6, 100.0E+3);
   constant I2C_MIN_PULSE_C : real := ite(SIMULATION_G, 50.0e-9, 100.0E-9);
   
   signal dmaClk       : sl;
   signal dmaRst       : sl;
   signal dmaObMasters : AxiStreamMasterArray(DMA_SIZE_C-1 downto 0) := (others => AXI_STREAM_MASTER_INIT_C);
   signal dmaObSlaves  : AxiStreamSlaveArray(DMA_SIZE_C-1 downto 0)  := (others => AXI_STREAM_SLAVE_FORCE_C);
   signal dmaIbMasters : AxiStreamMasterArray(DMA_SIZE_C-1 downto 0) := (others => AXI_STREAM_MASTER_INIT_C);
   signal dmaIbSlaves  : AxiStreamSlaveArray(DMA_SIZE_C-1 downto 0)  := (others => AXI_STREAM_SLAVE_FORCE_C);

   signal axilClk         : sl;
   signal axilRst         : sl;
   signal axilReadMaster  : AxiLiteReadMasterType;
   signal axilReadSlave   : AxiLiteReadSlaveType  := AXI_LITE_READ_SLAVE_EMPTY_DECERR_C;
   signal axilWriteMaster : AxiLiteWriteMasterType;
   signal axilWriteSlave  : AxiLiteWriteSlaveType := AXI_LITE_WRITE_SLAVE_EMPTY_DECERR_C;

   signal mainAxilWriteMasters : AxiLiteWriteMasterArray(MAIN_XBAR_MASTERS_C-1 downto 0) := (others => AXI_LITE_WRITE_MASTER_INIT_C);
   signal mainAxilWriteSlaves  : AxiLiteWriteSlaveArray(MAIN_XBAR_MASTERS_C-1 downto 0)  := (others => AXI_LITE_WRITE_SLAVE_EMPTY_DECERR_C);
   signal mainAxilReadMasters  : AxiLiteReadMasterArray(MAIN_XBAR_MASTERS_C-1 downto 0)  := (others => AXI_LITE_READ_MASTER_INIT_C);
   signal mainAxilReadSlaves   : AxiLiteReadSlaveArray(MAIN_XBAR_MASTERS_C-1 downto 0)   := (others => AXI_LITE_READ_SLAVE_EMPTY_DECERR_C);

begin


  U_Core : entity axi_soc_ultra_plus_core.AxiSocUltraPlusCore
      generic map (
         TPD_G             => TPD_G,
         BUILD_INFO_G      => BUILD_INFO_G,
         EXT_AXIL_MASTER_G => false,
         DMA_SIZE_G        => DMA_SIZE_C)
      port map (
         ------------------------
         --  Top Level Interfaces
         ------------------------
         -- DSP Clock and Reset Monitoring
         dspClk         => '0',
         dspRst         => '0',
         -- AUX Clock and Reset
         auxClk         => axilClk,     -- 100 MHz
         auxRst         => axilRst,
         -- DMA Interfaces  (dmaClk domain)
         dmaClk         => dmaClk,      -- 250 MHz
         dmaRst         => dmaRst,
         dmaObMasters   => dmaObMasters,
         dmaObSlaves    => dmaObSlaves,
         dmaIbMasters   => dmaIbMasters,
         dmaIbSlaves    => dmaIbSlaves,
         -- Application AXI-Lite Interfaces [0x80000000:0xFFFFFFFF] (appClk domain)
         appClk         => axilClk,
         appRst         => axilRst,
         appReadMaster  => axilReadMaster,
         appReadSlave   => axilReadSlave,
         appWriteMaster => axilWriteMaster,
         appWriteSlave  => axilWriteSlave,
         -- PMU Ports
         fanEnableL     => fanEnableL,
         -- SYSMON Ports
         vPIn           => vPIn,
         vNIn           => vNIn);


   -------------------------------------------------------------------------------------------------
   -- Main Axi Crossbar
   -------------------------------------------------------------------------------------------------
   Reg0 : entity ldmx_ts.zCCM_Registers
     generic map(
       TPD_G          => TPD_G)
     port map(
       -- Axil interface
       axilClk        => axilClk,
       axilRst        => axilRst,
       axilReadMaster  => mainAxilReadMasters(AXIL_TOP_REG_INDEX_C),   -- [in]
       axilReadSlave   => mainAxilReadSlaves(AXIL_TOP_REG_INDEX_C),    -- [out]
       axilWriteMaster => mainAxilWriteMasters(AXIL_TOP_REG_INDEX_C),  -- [in]
       axilWriteSlave  => mainAxilWriteSlaves(AXIL_TOP_REG_INDEX_C));  -- [out

   -------------------------------------------------------------------------------------------------
   -- Main Axi Crossbar
   -------------------------------------------------------------------------------------------------
   HpsAxiCrossbar : entity surf.AxiLiteCrossbar
      generic map (
         TPD_G              => TPD_G,
         NUM_SLAVE_SLOTS_G  => 1,
         NUM_MASTER_SLOTS_G => MAIN_XBAR_MASTERS_C,
         MASTERS_CONFIG_G   => MAIN_XBAR_CFG_C)
      port map (
         axiClk              => axilClk,
         axiClkRst           => axilRst,
         sAxiWriteMasters(0) => axilWriteMaster,
         sAxiWriteSlaves(0)  => axilWriteSlave,
         sAxiReadMasters(0)  => axilReadMaster,
         sAxiReadSlaves(0)   => axilReadSlave,
         mAxiWriteMasters    => mainAxilWriteMasters,
         mAxiWriteSlaves     => mainAxilWriteSlaves,
         mAxiReadMasters     => mainAxilReadMasters,
         mAxiReadSlaves      => mainAxilReadSlaves);

   
   -------------------------------------------------------------------------------------------------
   -- Local I2C
   -------------------------------------------------------------------------------------------------
   U_AxiI2cRegMaster_LOC : entity surf.AxiI2cRegMaster
      generic map (
         TPD_G             => TPD_G,
         AXIL_PROXY_G      => false,
         DEVICE_MAP_G      => (
            0              => MakeI2cAxiLiteDevType(                    -- GPIO
               i2cAddress  => "1000001",
               dataSize    => 8,
               addrSize    => 8,
               endianness  => '1'),
            1              => MakeI2cAxiLiteDevType(                    -- EEPROM
               i2cAddress  => "1010000",
               dataSize    => 8,
               addrSize    => 8,
               endianness  => '1',
               repeatStart => '0'),
            2              => MakeI2cAxiLiteDevType(                    -- UART-bridge
               i2cAddress  => "1001101",
               dataSize    => 8, 
               addrSize    => 8,
               endianness  => '1',
               repeatStart => '0')),
         I2C_SCL_FREQ_G    => I2C_SCL_FREQ_C,
         I2C_MIN_PULSE_G   => I2C_MIN_PULSE_C,
         AXI_CLK_FREQ_G    => AXIL_CLK_FREQ_G)
      port map (
         axiClk         => axilClk,                                     -- [in]
         axiRst         => axilRst,                                     -- [in]
         axiReadMaster  => mainAxilReadMasters(AXIL_LOC_I2C_INDEX_C),   -- [in]
         axiReadSlave   => mainAxilReadSlaves(AXIL_LOC_I2C_INDEX_C),    -- [out]
         axiWriteMaster => mainAxilWriteMasters(AXIL_LOC_I2C_INDEX_C),  -- [in]
         axiWriteSlave  => mainAxilWriteSlaves(AXIL_LOC_I2C_INDEX_C),   -- [out]
         --         sel            => sel,             -- [out]
         scl            => pmod(3),                                     -- [inout]
         sda            => pmod(4));                                    -- [inout]
   
end Behavioral;

