# 4 bit Unsigned-Binary-Divison-Implementation-at-RTL-Level-using-Booth's-Algorithm

This project is based upon the implementation of 4 bit Divider using Booth's algorithm at RTL level. Here A is reperesenting as Remainder which is actually used as reg_r in datapath , while M is used as Divisor which is reg B in datapath while Q is Quotient Register . After four consecutive (S0 , S1, S2)state transitions, output reg_R is loaded with remainder in S1 and Quotient is available after S2 which are 0001(1) and 0010(2) in simulation respectively. This project was implemented in Xilinx VIVADO and VERILOG HDL was used to write the RTL description of entire DATAPATH and CONTROLLER unit. 

![binary_unsigned_division](https://user-images.githubusercontent.com/98607828/158212530-53c79683-0a50-4fc6-995a-53f105319150.jpg)
![algorithm](https://user-images.githubusercontent.com/98607828/158212580-d319a9f8-b411-4e91-9109-354c84a5be90.jpg)
![DIVIDER_RTL_DESIGN](https://user-images.githubusercontent.com/98607828/158213660-0d1b66e0-7569-49b9-b01a-0b31c008d742.jpg)

![SIM_RTL_DIV](https://user-images.githubusercontent.com/98607828/158225845-c30e2fb3-8e03-42dc-a655-17edcfead2ed.gif)
