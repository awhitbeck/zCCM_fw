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

entity Application is
   generic (
      TPD_G            : time := 1 ns;
      SIMULATION_G      : boolean              := false;
      AXIL_CLK_FREQ_G   : real                 := 125.0e6;
      AXIL_BASE_ADDR_G : slv(31 downto 0));
   port (
      -- PMOD Ports
      pmod              : inout slv(7 downto 0);
      -- AXI-Lite Interface (axilClk domain)
      axilClk           : in    sl;
      axilRst           : in    sl;
      mAxilWriteMasters : in    AxiLiteWriteMasterArray(0 downto 0);
      mAxilWriteSlaves  : out   AxiLiteWriteSlaveArray(0 downto 0);
      mAxilReadMasters  : in    AxiLiteReadMasterArray(0 downto 0);
      mAxilReadSlaves   : out   AxiLiteReadSlaveArray(0 downto 0));
end Application;

architecture mapping of Application is

   constant DMA_SIZE_C           : positive := 1;
   constant AXIL_CLK_FREQ_C      : real     := 1.0/AXIL_CLK_FREQ_G;  
   constant MAIN_XBAR_MASTERS_C  : natural  := 3;
   constant AXIL_VERSION_INDEX_C : natural  := 0;
   constant AXIL_LOC_I2C_INDEX_C : natural  := 1;
   constant AXIL_TOP_REG_INDEX_C : natural  := 2;    

   constant MAIN_XBAR_CFG_C : AxiLiteCrossbarMasterConfigArray(MAIN_XBAR_MASTERS_C-1 downto 0) := (
     AXIL_VERSION_INDEX_C             => (
       baseAddr                       => AXIL_BASE_ADDR_G + X"0000",
       addrBits                       => 16,
       connectivity                   => X"0001"),
     AXIL_LOC_I2C_INDEX_C             => (    -- backplane I2C Interface
         baseAddr                     => AXIL_BASE_ADDR_G + X"100000",
         addrBits                     => 16,
         connectivity                 => X"0001"),
     AXIL_TOP_REG_INDEX_C             => (    -- Register Interface
         baseAddr                     => AXIL_BASE_ADDR_G + X"200000",
         addrBits                     => 16,
         connectivity                 => X"0001"));

   constant I2C_SCL_FREQ_C  : real := ite(SIMULATION_G, 2.0e6, 100.0E+3);
   constant I2C_MIN_PULSE_C : real := ite(SIMULATION_G, 50.0e-9, 100.0E-9);
   
   signal axilWriteMasters : AxiLiteWriteMasterArray(MAIN_XBAR_MASTERS_C-1 downto 0) := (others => AXI_LITE_WRITE_MASTER_INIT_C);
   signal axilWriteSlaves  : AxiLiteWriteSlaveArray(MAIN_XBAR_MASTERS_C-1 downto 0)  := (others => AXI_LITE_WRITE_SLAVE_EMPTY_DECERR_C);
   signal axilReadMasters  : AxiLiteReadMasterArray(MAIN_XBAR_MASTERS_C-1 downto 0)  := (others => AXI_LITE_READ_MASTER_INIT_C);
   signal axilReadSlaves   : AxiLiteReadSlaveArray(MAIN_XBAR_MASTERS_C-1 downto 0)   := (others => AXI_LITE_READ_SLAVE_EMPTY_DECERR_C);

   constant INI_WRITE_REG_C : Slv32Array(1 downto 0) := (others => x"DEAD_BEEF");
   signal readReg  : slv32Array(1 downto 0) := (others => x"DEAD_BEEF");
   signal writeReg : Slv32Array(1 downto 0) := (others => x"DEAD_BEEF");
   
begin

  U_AxiLiteRegs : entity surf.AxiLiteRegs
      generic map (
         TPD_G           => TPD_G,
         NUM_WRITE_REG_G => 2,
         INI_WRITE_REG_G => INI_WRITE_REG_C,
         NUM_READ_REG_G  => 2)
      port map (
         -- AXI-Lite Bus
         axiClk          => axilClk,
         axiClkRst       => axilRst,
         axiReadMaster   => axilReadMasters(AXIL_VERSION_INDEX_C),
         axiReadSlave    => axilReadSlaves(AXIL_VERSION_INDEX_C),
         axiWriteMaster  => axilWriteMasters(AXIL_VERSION_INDEX_C),
         axiWriteSlave   => axilWriteSlaves(AXIL_VERSION_INDEX_C),
         -- User Read/Write registers
         writeRegister   => writeReg,
         readRegister    => readReg);


  
   -------------------------------------------------------------------------------------------------
   -- Register Definitions
   -------------------------------------------------------------------------------------------------
   Reg0 : entity ldmx_ts.zCCM_Registers
     generic map(
       TPD_G          => TPD_G)
     port map(
       -- Axil interface
       axilClk        => axilClk,
       axilRst        => axilRst,
       axilReadMaster  => axilReadMasters(AXIL_TOP_REG_INDEX_C),   -- [in]
       axilReadSlave   => axilReadSlaves(AXIL_TOP_REG_INDEX_C),    -- [out]
       axilWriteMaster => axilWriteMasters(AXIL_TOP_REG_INDEX_C),  -- [in]
       axilWriteSlave  => axilWriteSlaves(AXIL_TOP_REG_INDEX_C));  -- [out

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
         sAxiWriteMasters(0) => mAxilWriteMasters(0),
         sAxiWriteSlaves(0)  => mAxilWriteSlaves(0),
         sAxiReadMasters(0)  => mAxilReadMasters(0),
         sAxiReadSlaves(0)   => mAxilReadSlaves(0),
         mAxiWriteMasters    => axilWriteMasters,
         mAxiWriteSlaves     => axilWriteSlaves,
         mAxiReadMasters     => axilReadMasters,
         mAxiReadSlaves      => axilReadSlaves);

   
   -------------------------------------------------------------------------------------------------
   -- Local I2C
   -------------------------------------------------------------------------------------------------
   U_AxiI2cRegMaster_LOC : entity surf.AxiI2cRegMaster
      generic map (
         TPD_G             => TPD_G,
         AXIL_PROXY_G      => false,
         DEVICE_MAP_G      => (
            0              => MakeI2cAxiLiteDevType(                    -- GPIO
               i2cAddress  => "1000001",                                --x41
               dataSize    => 8,
               addrSize    => 8,
               endianness  => '1'),
            1              => MakeI2cAxiLiteDevType(                    -- EEPROM
               i2cAddress  => "1010000",                                --x50
               dataSize    => 8,
               addrSize    => 8,
               endianness  => '1',
               repeatStart => '0'),
            2              => MakeI2cAxiLiteDevType(                    -- I2C
                                                                        --extenderv1
               i2cAddress  => "0111101",                                --x3D
               dataSize    => 8, 
               addrSize    => 8,
               endianness  => '1',
               repeatStart => '0'),
            3              => MakeI2cAxiLiteDevType(                    -- I2C
                                                                        --extenderv2
               i2cAddress  => "1110101",                                --x75
               dataSize    => 8, 
               addrSize    => 8,
               endianness  => '1',
               repeatStart => '0'),
            4              => MakeI2cAxiLiteDevType(                    -- UART-bridge
               i2cAddress  => "1001101",                                --x4D
               dataSize    => 8, 
               addrSize    => 12,
               endianness  => '1',
               repeatStart => '0')

            ),
         I2C_SCL_FREQ_G    => I2C_SCL_FREQ_C,
         I2C_MIN_PULSE_G   => I2C_MIN_PULSE_C,
         AXI_CLK_FREQ_G    => AXIL_CLK_FREQ_G)
      port map (
         axiClk         => axilClk,                                     -- [in]
         axiRst         => axilRst,                                     -- [in]
         axiReadMaster  => axilReadMasters(AXIL_LOC_I2C_INDEX_C),   -- [in]
         axiReadSlave   => axilReadSlaves(AXIL_LOC_I2C_INDEX_C),    -- [out]
         axiWriteMaster => axilWriteMasters(AXIL_LOC_I2C_INDEX_C),  -- [in]
         axiWriteSlave  => axilWriteSlaves(AXIL_LOC_I2C_INDEX_C),   -- [out]
         --         sel            => sel,             -- [out]
         scl            => pmod(0),                                     -- [inout]
         sda            => pmod(1));                                    -- [inout]

  ------------------------
  -- PMOD IO buffer
  ------------------------
  GEN_VEC : for i in 7 downto 2 generate
    U_IOBUF : entity surf.IoBufWrapper
      port map (
        I  => writeReg(0)(i-2),
        O  => readReg(0)(i-2),
        IO => pmod(i),
        T  => writeReg(1)(i-2));
  end generate GEN_VEC;
  
end mapping;  
