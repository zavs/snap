----------------------------------------------------------------------------
----------------------------------------------------------------------------
--
-- Copyright 2017 International Business Machines
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions AND
-- limitations under the License.
--
----------------------------------------------------------------------------
----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_misc.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

USE work.psl_accel_types.ALL;
USE work.snap_core_types.all;

PACKAGE dma_types IS

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- ******************************************************
-- ***** READ CONTROL REGISTER                      *****
-- ******************************************************
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  --
  -- CONSTANT
  CONSTANT CL_NOT_USED       : std_logic_vector( 2 DOWNTO 0) := "000";
  CONSTANT CL_COMPLETE_DATA  : std_logic_vector( 2 DOWNTO 0) := "011";
  CONSTANT EVEN_64B_CL       : integer                      :=  0;     -- 
  CONSTANT ODD_64B_CL        : integer                      :=  1;     -- 
  CONSTANT LAST_CL           : integer                      :=  2;     -- 

  --
  -- TYPES
  TYPE BUF_INDICATION_T  IS (EMPTY, FULL);
  TYPE COM_INDICATION_T  IS (ACTIVE, INACTIVE);
  TYPE CLT_INDICATION_T  IS (NOT_USED, PARTIAL_DATA, COMPLETE_DATA);

  --
  --
  TYPE DMA_CTL_T IS RECORD
    com        : COM_INDICATION_T;               -- command indication
    rsp        : RSP_CODES_T;                    -- response indication
    buf        : BUF_INDICATION_T;               -- buffer indication
    clt        : std_logic_vector( 2 DOWNTO 0);  -- cache line type indication
    cla        : std_logic_vector(63 DOWNTO 7);  -- cache line address
  END RECORD DMA_CTL_T;
  TYPE ARR_DMA_CTL_T IS ARRAY (0 TO 31) OF DMA_CTL_T;    
END dma_types;
