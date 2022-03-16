# 4 bit Unsigned-Binary-Divison-Implementation-at-RTL-Level-using-Booth's-Algorithm

## Description
This project is based upon the implementation of 4 bit Divider using Booth's algorithm at RTL level. Here A is reperesenting as Remainder which is actually used as reg_r in datapath , while M is used as Divisor(0011) which is reg B in datapath while Q is Quotient(0111) Register . 













After four consecutive (S0 , S1, S2)state transitions, output reg_R is loaded with remainder in S1 and Quotient is available in S2 state which are 0001(1) and 0010(2) in simulation respectively. This project was implemented in Xilinx VIVADO and VERILOG HDL was used to write the RTL description of entire DATAPATH and CONTROLLER unit. 






## FLOW CHART
![binary_unsigned_division](https://user-images.githubusercontent.com/98607828/158212530-53c79683-0a50-4fc6-995a-53f105319150.jpg)
![algorithm](https://user-images.githubusercontent.com/98607828/158212580-d319a9f8-b411-4e91-9109-354c84a5be90.jpg)










![FLOWCHART](https://user-images.githubusercontent.com/98607828/158296967-a8aceb29-8a3e-4c6a-8941-7a7713d292e5.png)


















![datapath](https://user-images.githubusercontent.com/98607828/158296899-a69c5cdf-f3da-42c6-aefd-9ddae15b28b8.gif)








![IMG20220315082846](https://user-images.githubusercontent.com/98607828/158297530-d4b560eb-068c-41b0-a298-305a972721ea.jpg)





## RTL VIEW
![DIVIDER_RTL_DESIGN](https://user-images.githubusercontent.com/98607828/158213660-0d1b66e0-7569-49b9-b01a-0b31c008d742.jpg)
## Simulation_Result










![SIM_RTL_DIVIDER](https://user-images.githubusercontent.com/98607828/158646925-2d0d04a0-f2c6-4d9f-bd2b-101ed7d95cb6.jpg)
