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
      BUILD_INFO_G : BuildInfoType);
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

   
   signal dmaClk       : sl;
   signal dmaRst       : sl;
   signal dmaObMasters : AxiStreamMasterArray(0 downto 0) := (others => AXI_STREAM_MASTER_INIT_C);
   signal dmaObSlaves  : AxiStreamSlaveArray(0 downto 0)  := (others => AXI_STREAM_SLAVE_FORCE_C);
   signal dmaIbMasters : AxiStreamMasterArray(0 downto 0) := (others => AXI_STREAM_MASTER_INIT_C);
   signal dmaIbSlaves  : AxiStreamSlaveArray(0 downto 0)  := (others => AXI_STREAM_SLAVE_FORCE_C);

   signal axilClk           : sl;
   signal axilRst           : sl;
   signal mAxilReadMasters  : AxiLiteReadMasterArray(0 downto 0);
   signal mAxilReadSlaves   : AxiLiteReadSlaveArray(0 downto 0)  := (others => AXI_LITE_READ_SLAVE_EMPTY_DECERR_C);
   signal mAxilWriteMasters : AxiLiteWriteMasterArray(0 downto 0);
   signal mAxilWriteSlaves  : AxiLiteWriteSlaveArray(0 downto 0) := (others => AXI_LITE_WRITE_SLAVE_EMPTY_DECERR_C);

begin


  U_Core : entity axi_soc_ultra_plus_core.AxiSocUltraPlusCore
      generic map (
         TPD_G             => TPD_G,
         BUILD_INFO_G      => BUILD_INFO_G,
         EXT_AXIL_MASTER_G => false,
         DMA_SIZE_G        => 1)
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
         appReadMaster  => mAxilReadMasters(0),
         appReadSlave   => mAxilReadSlaves(0),
         appWriteMaster => mAxilWriteMasters(0),
         appWriteSlave  => mAxilWriteSlaves(0),
         -- PMU Ports
         fanEnableL     => fanEnableL,
         -- SYSMON Ports
         vPIn           => vPIn,
         vNIn           => vNIn);

   --------------
   -- Application
   --------------
   U_App : entity ldmx_ts.Application
      generic map (
         TPD_G            => TPD_G,
         AXIL_CLK_FREQ_G  => 100.0E+6, -- 100MHz
         AXIL_BASE_ADDR_G => APP_ADDR_OFFSET_C)
      port map (
         -- PMOD Ports
         pmod              => pmod,
         -- AXI-Lite Interface (axilClk domain)
         axilClk           => axilClk,
         axilRst           => axilRst,
         mAxilWriteMasters => mAxilWriteMasters,
         mAxilWriteSlaves  => mAxilWriteSlaves,
         mAxilReadMasters  => mAxilReadMasters,
         mAxilReadSlaves   => mAxilReadSlaves);
   
end Behavioral;

