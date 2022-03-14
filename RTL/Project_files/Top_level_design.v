`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2022 09:21:36 PM
// Design Name: 
// Module Name: Top_level_design
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define WIDTH1 4
//`define WIDTH2 4
`define WIDTH3 3
`define WIDTH4 3
module Top_level_design(
i_clk , data_in_1 , data_in_2 , start , p_STATE , o_reg_Q , o_reg_R  , o_reg_B ,Count_out , done );

input i_clk ;
input [`WIDTH1-1:0] data_in_1 ;     ////divisor B ///
//input rst_n ;
input start ;
input [`WIDTH1-1:0] data_in_2 ;         ///dividened Q///
output [`WIDTH1-1:0] o_reg_B ;
output [`WIDTH1-1:0] o_reg_R ;
output [`WIDTH1-1:0] o_reg_Q ;
output [`WIDTH3-1:0] p_STATE ; 
wire R_out , add_enable  , load_b , load_r, load_q, clr_nn;
wire  enable_q  , done , shift_en_q , clr_Reg_r , clr_ADD , clr_d, z_cnt,load_cnt ;
output [`WIDTH4-1:0] Count_out ;
output done ;
 DATAPATH DU(
i_clk ,
clr_d , 
clr_nn ,   
shift_en_q , 
enable_q , 
enable_r ,
data_in_1 ,
data_in_2 , 
o_reg_B , 
o_reg_R ,
o_reg_Q  ,
load_b ,
load_cnt,
load_r , 
load_q  , 
add_enable ,
R_out , 
clr_ADD ,
clr_Reg_r, 
z_cnt , 
Count_out 
);


CONTROLLER CU(
i_clk,
clr_d , 
start,
load_r ,
load_b ,
load_q ,
R_out, 
enable_r ,
enable_q , 
p_STATE ,
add_enable , 
done , 
shift_en_q ,
clr_ADD , 
clr_Reg_r , 
load_cnt , 
z_cnt , 
clr_nn);






endmodule


