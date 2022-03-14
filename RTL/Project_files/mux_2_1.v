`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2022 10:20:07 PM
// Design Name: 
// Module Name: mux_2_1
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

`define DataWidth 4
module mux_2_1(
a , b, sel , out
    );
input [`DataWidth-1:0] a , b ;
input sel ;
output [`DataWidth-1:0] out ;

assign out = sel? a : b ;    
    
endmodule
