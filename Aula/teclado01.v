#! /usr/local/iverilog/bin/vvp
:ivl_version "11.0 (devel)" "(s20150603-642-g3bdb50da)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "vhdl_textio";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_00000000001c6870 .scope module, "DecTeclado" "DecTeclado" 2 1;
 .timescale 0 0;
    .port_info 0 /INPUT 10 "t";
    .port_info 1 /OUTPUT 4 "s";
    .port_info 2 /OUTPUT 1 "p";
L_00000000008b7818 .functor BUFT 1, C4<01>, C4<0>, C4<0>, C4<0>;
v00000000001ceed0_0 .net/2s *"_s0", 1 0, L_00000000008b7818;  1 drivers
L_00000000008b7860 .functor BUFT 1, C4<00>, C4<0>, C4<0>, C4<0>;
v00000000001c6a00_0 .net/2s *"_s2", 1 0, L_00000000008b7860;  1 drivers
v00000000001c6aa0_0 .net *"_s4", 1 0, L_00000000001cb6d0;  1 drivers
v00000000001c6b40_0 .net "p", 0 0, L_00000000001cb770;  1 drivers
v00000000001c6be0_0 .var "p1", 0 0;
v00000000001cb590_0 .var "s", 3 0;
o00000000008770d8 .functor BUFZ 10, C4<zzzzzzzzzz>; HiZ drive
v00000000001cb630_0 .net "t", 9 0, o00000000008770d8;  0 drivers
E_00000000001cca30 .event edge, v00000000001cb630_0;
L_00000000001cb6d0 .functor MUXZ 2, L_00000000008b7860, L_00000000008b7818, v00000000001c6be0_0, C4<>;
L_00000000001cb770 .part L_00000000001cb6d0, 0, 1;
    .scope S_00000000001c6870;
T_0 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %end;
    .thread T_0;
    .scope S_00000000001c6870;
T_1 ;
    %wait E_00000000001cca30;
    %load/vec4 v00000000001cb630_0;
    %dup/vec4;
    %pushi/vec4 1, 0, 10;
    %cmp/u;
    %jmp/1 T_1.0, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 10;
    %cmp/u;
    %jmp/1 T_1.1, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 10;
    %cmp/u;
    %jmp/1 T_1.2, 6;
    %dup/vec4;
    %pushi/vec4 8, 0, 10;
    %cmp/u;
    %jmp/1 T_1.3, 6;
    %dup/vec4;
    %pushi/vec4 16, 0, 10;
    %cmp/u;
    %jmp/1 T_1.4, 6;
    %dup/vec4;
    %pushi/vec4 32, 0, 10;
    %cmp/u;
    %jmp/1 T_1.5, 6;
    %dup/vec4;
    %pushi/vec4 64, 0, 10;
    %cmp/u;
    %jmp/1 T_1.6, 6;
    %dup/vec4;
    %pushi/vec4 128, 0, 10;
    %cmp/u;
    %jmp/1 T_1.7, 6;
    %dup/vec4;
    %pushi/vec4 256, 0, 10;
    %cmp/u;
    %jmp/1 T_1.8, 6;
    %dup/vec4;
    %pushi/vec4 512, 0, 10;
    %cmp/u;
    %jmp/1 T_1.9, 6;
    %pushi/vec4 30, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.0 ;
    %pushi/vec4 1, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.1 ;
    %pushi/vec4 3, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.2 ;
    %pushi/vec4 5, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.3 ;
    %pushi/vec4 7, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.4 ;
    %pushi/vec4 9, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.5 ;
    %pushi/vec4 11, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.6 ;
    %pushi/vec4 13, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.7 ;
    %pushi/vec4 15, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.8 ;
    %pushi/vec4 17, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.9 ;
    %pushi/vec4 19, 0, 5;
    %split/vec4 1;
    %store/vec4 v00000000001c6be0_0, 0, 1;
    %store/vec4 v00000000001cb590_0, 0, 4;
    %jmp T_1.11;
T_1.11 ;
    %pop/vec4 1;
    %jmp T_1;
    .thread T_1, $push;
# The file index is used to find the file name in the following table.
:file_names 3;
    "N/A";
    "<interactive>";
    "teclado01.v";
