`timescale 1ns/10ps
module datapath (const_gnd,clk, rst,memdata,alusrca, memtoreg,
 iord, pcen, regwrite, regdst,pcsource, alusrcb,irwrite,
 alucont,zero,instr,adr, writedata);

input const_gnd; //constant 0
input clk, rst;
input [7:0] memdata;
input alusrca, memtoreg, iord, pcen, regwrite, regdst;
input [1:0] pcsource, alusrcb; // mux select bits
input [3:0] irwrite; // InstReg write flags
input [2:0] alucont; // ALU control bits
output zero; // "ALU output is zero" flag
output [31:0] instr; // 32-bit instruction register
output [7:0] adr, writedata; // 8-bit address and write-data registers



wire [2:0] ra1, ra2, wa; // register address bits
wire [7:0] pc, nextpc, md, rd1, rd2, wd, a, srca, srcb, aluresult, aluout, constx4;

// shift left constant field by 2
assign constx4 = {instr[5:0], {2{const_gnd}}}; 

// register file address fields
assign ra1 = instr[23:21];
assign ra2 = instr[18:16];

// independent of bit width, load instruction into four 8-bit registers over four cycles
ff8bit ir0(instr[7:0],memdata[7:0],irwrite[3],clk,~const_gnd);
ff8bit ir1(instr[15:8],memdata[7:0],irwrite[2],clk,~const_gnd);
ff8bit ir2(instr[23:16],memdata[7:0],irwrite[1],clk,~const_gnd);
ff8bit ir3(instr[31:24],memdata[7:0],irwrite[0],clk,~const_gnd);

 // datapath
ff8bit pcreg(pc,nextpc,pcen,clk,rst);
ff8bit mdreg(md,memdata,~const_gnd,clk,~const_gnd);
ff8bit areg(a,rd1,~const_gnd,clk,~const_gnd);
ff8bit breg(writedata,rd2,~const_gnd,clk,~const_gnd);
ff8bit alureg(aluout,aluresult,~const_gnd,clk,~const_gnd);


mux2 adrmux(adr,iord,pc,aluout);
mux23bit regmux(wa,regdst,instr[18:16], instr[13:11]);
mux2 wdmux(wd,memtoreg,aluout,md);
mux2 srcamux(srca,alusrca,pc, a);
mux4 srcbmux(srcb,alusrcb,writedata,{{7{const_gnd}},{~{const_gnd}}},instr[7:0],constx4);
mux4 pcmux(nextpc,pcsource,aluresult,aluout,constx4,{8{const_gnd}});
regfile rf(rd1, rd2, clk, regwrite, ra1, ra2, wa, wd);
alu alunit(aluresult,srca, srcb, alucont);
zerodetect zd(zero,aluresult);
endmodule
