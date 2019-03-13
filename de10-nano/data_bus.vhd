-- megafunction wizard: %ALTIOBUF%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altiobuf_bidir 

-- ============================================================
-- File Name: data_bus.vhd
-- Megafunction Name(s):
-- 			altiobuf_bidir
--
-- Simulation Library Files(s):
-- 			cyclonev
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 18.1.0 Build 625 09/12/2018 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2018  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details.


--altiobuf_bidir CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Cyclone V" ENABLE_BUS_HOLD="FALSE" NUMBER_OF_CHANNELS=8 OPEN_DRAIN_OUTPUT="FALSE" USE_DIFFERENTIAL_MODE="FALSE" USE_DYNAMIC_TERMINATION_CONTROL="FALSE" USE_TERMINATION_CONTROL="FALSE" datain dataio dataout oe
--VERSION_BEGIN 18.1 cbx_altiobuf_bidir 2018:09:12:13:04:24:SJ cbx_mgl 2018:09:12:13:10:36:SJ cbx_stratixiii 2018:09:12:13:04:24:SJ cbx_stratixv 2018:09:12:13:04:24:SJ  VERSION_END

 LIBRARY cyclonev;
 USE cyclonev.all;

--synthesis_resources = cyclonev_io_ibuf 8 cyclonev_io_obuf 8 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  data_bus_iobuf_bidir_soo IS 
	 PORT 
	 ( 
		 datain	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 dataio	:	INOUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 dataout	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 oe	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0)
	 ); 
 END data_bus_iobuf_bidir_soo;

 ARCHITECTURE RTL OF data_bus_iobuf_bidir_soo IS

	 SIGNAL  wire_ibufa_i	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_ibufa_o	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_obufa_i	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_obufa_o	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_obufa_oe	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 COMPONENT  cyclonev_io_ibuf
	 GENERIC 
	 (
		bus_hold	:	STRING := "false";
		differential_mode	:	STRING := "false";
		simulate_z_as	:	STRING := "z";
		lpm_type	:	STRING := "cyclonev_io_ibuf"
	 );
	 PORT
	 ( 
		dynamicterminationcontrol	:	IN STD_LOGIC := '0';
		i	:	IN STD_LOGIC := '0';
		ibar	:	IN STD_LOGIC := '0';
		o	:	OUT STD_LOGIC
	 ); 
	 END COMPONENT;
	 COMPONENT  cyclonev_io_obuf
	 GENERIC 
	 (
		bus_hold	:	STRING := "false";
		open_drain_output	:	STRING := "false";
		shift_series_termination_control	:	STRING := "false";
		lpm_type	:	STRING := "cyclonev_io_obuf"
	 );
	 PORT
	 ( 
		dynamicterminationcontrol	:	IN STD_LOGIC := '0';
		i	:	IN STD_LOGIC := '0';
		o	:	OUT STD_LOGIC;
		obar	:	OUT STD_LOGIC;
		oe	:	IN STD_LOGIC := '1';
		parallelterminationcontrol	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
		seriesterminationcontrol	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
 BEGIN

	dataio <= wire_obufa_o;
	dataout <= wire_ibufa_o;
	wire_ibufa_i <= dataio;
	loop0 : FOR i IN 0 TO 7 GENERATE 
	  ibufa :  cyclonev_io_ibuf
	  GENERIC MAP (
		bus_hold => "false",
		differential_mode => "false"
	  )
	  PORT MAP ( 
		i => wire_ibufa_i(i),
		o => wire_ibufa_o(i)
	  );
	END GENERATE loop0;
	wire_obufa_i <= datain;
	wire_obufa_oe <= oe;
	loop1 : FOR i IN 0 TO 7 GENERATE 
	  obufa :  cyclonev_io_obuf
	  GENERIC MAP (
		bus_hold => "false",
		open_drain_output => "false"
	  )
	  PORT MAP ( 
		i => wire_obufa_i(i),
		o => wire_obufa_o(i),
		oe => wire_obufa_oe(i)
	  );
	END GENERATE loop1;

 END RTL; --data_bus_iobuf_bidir_soo
--VALID FILE


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY data_bus IS
	PORT
	(
		datain		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		oe		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		dataio		: INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		dataout		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END data_bus;


ARCHITECTURE RTL OF data_bus IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (7 DOWNTO 0);



	COMPONENT data_bus_iobuf_bidir_soo
	PORT (
			datain	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			oe	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			dataout	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			dataio	: INOUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	dataout    <= sub_wire0(7 DOWNTO 0);

	data_bus_iobuf_bidir_soo_component : data_bus_iobuf_bidir_soo
	PORT MAP (
		datain => datain,
		oe => oe,
		dataout => sub_wire0,
		dataio => dataio
	);



END RTL;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: CONSTANT: enable_bus_hold STRING "FALSE"
-- Retrieval info: CONSTANT: left_shift_series_termination_control STRING "FALSE"
-- Retrieval info: CONSTANT: number_of_channels NUMERIC "8"
-- Retrieval info: CONSTANT: open_drain_output STRING "FALSE"
-- Retrieval info: CONSTANT: use_differential_mode STRING "FALSE"
-- Retrieval info: CONSTANT: use_dynamic_termination_control STRING "FALSE"
-- Retrieval info: CONSTANT: use_termination_control STRING "FALSE"
-- Retrieval info: USED_PORT: datain 0 0 8 0 INPUT NODEFVAL "datain[7..0]"
-- Retrieval info: USED_PORT: dataio 0 0 8 0 BIDIR NODEFVAL "dataio[7..0]"
-- Retrieval info: USED_PORT: dataout 0 0 8 0 OUTPUT NODEFVAL "dataout[7..0]"
-- Retrieval info: USED_PORT: oe 0 0 8 0 INPUT NODEFVAL "oe[7..0]"
-- Retrieval info: CONNECT: @datain 0 0 8 0 datain 0 0 8 0
-- Retrieval info: CONNECT: @oe 0 0 8 0 oe 0 0 8 0
-- Retrieval info: CONNECT: dataio 0 0 8 0 @dataio 0 0 8 0
-- Retrieval info: CONNECT: dataout 0 0 8 0 @dataout 0 0 8 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL data_bus.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL data_bus.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL data_bus.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL data_bus.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL data_bus_inst.vhd TRUE
-- Retrieval info: LIB_FILE: cyclonev