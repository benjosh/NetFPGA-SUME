-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not deunsigned or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--


entity tb_xge_sub_timer_sync_tx_0 is
end tb_xge_sub_timer_sync_tx_0;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


architecture behav of tb_xge_sub_timer_sync_tx_0 is

  component xge_sub_timer_sync_tx_0
  port (
    -- 1588 Timer input
    timer_clk               : in  std_logic;
    timer_nanosec           : in  std_logic_vector(31 downto 0);
    timer_sec               : in  std_logic_vector(47 downto 0);

    -- Resynchronised 1588 Timer output
    resync_clk              : in  std_logic;
    resync_nanosec          : out std_logic_vector(31 downto 0);
    resync_sec              : out std_logic_vector(47 downto 0);
  
    resync_clk_locked       : in  std_logic
  );
  end component;
  
  

  signal reset                   : std_logic := '1';

  -- 1588 SystemTimer signals
  signal systemtimer_clk         : std_logic := '0';
  signal s_field                 : unsigned(47 downto 0) := (others => '0');
  signal ns_field                : unsigned(31 downto 0) := (others => '0');
  signal systemtimer_s_field     : std_logic_vector(47 downto 0) := (others => '0');
  signal systemtimer_ns_field    : std_logic_vector(31 downto 0) := (others => '0');
  
  
  -- 1588 Local Timer signals
  signal local_clk               : std_logic := '0';
  signal local_s_field           : std_logic_vector(47 downto 0) := (others => '0');
  signal local_ns_field          : std_logic_vector(31 downto 0) := (others => '0');
  
  
 -- accuracy analysis
  signal systemtimer_error : signed(8 downto 0);
  signal achieved_error    : signed(31 downto 0);


begin

 
  p_reset : process
  begin
    reset <= '1';
    wait for 100 ns;
    reset <= '0';
    wait;
  end process p_reset;

  
  ------------------------------------------------------------------------------
  -- System 1588 Timer (an input to our core)
  ------------------------------------------------------------------------------

  -- Create a perfect nanoseconds and seconds fields
  process
  begin
    s_field   <= (others => '0');
    ns_field  <= X"00000000";
    loop
      wait for 1 ns;
      if ns_field = X"3B9ACA00" then
        ns_field <= (others => '0');
        s_field  <= s_field + 1;
      else
        ns_field <= ns_field + 1;
      end if;
    end loop;
  end process;

 
  -- drives systemtimer_clk at desired MHz
  p_systemtimer_clk : process
  begin
    systemtimer_clk <= '0';
    wait for 1 ns;
    loop
      wait for 2.0 ns;
      systemtimer_clk <= '1';
      wait for 2.0 ns;
      systemtimer_clk <= '0';
    end loop;
  end process p_systemtimer_clk;


  -- Sample the perfect nanoseconds and seconds fields on systemtimer_clk
  process (systemtimer_clk)
  begin
    if systemtimer_clk'event and systemtimer_clk = '1' then
      systemtimer_ns_field <= std_logic_vector(ns_field);
      systemtimer_s_field  <= std_logic_vector(s_field);
    end if;
  end process;
  


  ------------------------------------------------------------------------------
  -- Model our local Timer reference clock 
  ------------------------------------------------------------------------------


  p_local_clk : process
  begin
    local_clk <= '0';
    wait for 1 ns;
    loop
      wait for 3.2 ns;
      local_clk <= '1';
      wait for 3.2 ns;
      local_clk <= '0';
    end loop;
  end process p_local_clk;


  ------------------------------------------------------------------------------
  -- Instantiate the DUT
  ------------------------------------------------------------------------------


  dut: xge_sub_timer_sync_tx_0
  port map (
    timer_clk               => systemtimer_clk,
    timer_nanosec           => systemtimer_ns_field,
    timer_sec               => systemtimer_s_field,
    resync_clk              => local_clk,
    resync_nanosec          => local_ns_field,
    resync_sec              => local_s_field,
	resync_clk_locked       => '1'
  );


  ------------------------------------------------------------------------------
  -- Analyze the accuracy achieved
  ------------------------------------------------------------------------------
 
  systemtimer_error <= signed(ns_field(8 downto 0) )- signed(systemtimer_ns_field(8 downto 0));
  
  process
  begin
    wait until local_clk'event and local_clk = '1';
	wait for 1 ps;
      achieved_error <= (signed(local_ns_field) - signed(systemtimer_ns_field) - systemtimer_error);
  end process;


  ------------------------------------------------------------------------------
  -- Simulation control
  -- The simulation will run for 100 us, then end with a test completed message
  ------------------------------------------------------------------------------
  sim_control : process
  begin
    -- Allow the simulation to run
    wait for 100 us;

    -- End of simulation
    report "Not a real failure. Simulation finished successfully." severity failure;
    wait;
  end process sim_control;


  
end behav;

