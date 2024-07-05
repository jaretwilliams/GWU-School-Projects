//`timescale 1ns/10ps
module mips #(parameter WIDTH = 8, REGBITS = 3)
             (input              clk, reset, const_gnd, 
              input  [WIDTH-1:0] memdata, 
              output             memread, memwrite, 
              output [WIDTH-1:0] adr, writedata);

   wire [31:0] instr;
   wire        zero, alusrca, memtoreg, iord, pcen, regwrite, regdst;
   wire [1:0]  aluop,pcsource,alusrcb;
   wire [3:0]  irwrite;
   wire [2:0]  alucont;

   controller  cont(.clk(clk), .reset(reset), .op(instr[31:26]), .zero(zero), .memread(memread), .memwrite(memwrite), 
                    .alusrca(alusrca), .memtoreg(memtoreg), .iord(iord), .pcen(pcen), .regwrite(regwrite), .regdst(regdst),
                    .pcsource(pcsource), .alusrcb(alusrcb), .aluop(aluop), .irwrite(irwrite));
   alucontrol  ac(.aluop(aluop), .funct(instr[5:0]), .alucont(alucont));
   datapath    #(WIDTH, REGBITS)  dp(.clk(clk), .reset(reset), .const_gnd(const_gnd), .memdata(memdata), .alusrca(alusrca), .memtoreg(memtoreg), .iord(iord), .pcen(pcen),
                  .regwrite(regwrite), .regdst(regdst), .pcsource(pcsource), .alusrcb(alusrcb), .irwrite(irwrite), .alucont(alucont),
                  .zero(zero), .instr(instr), .adr(adr), .writedata(writedata));

endmodule



