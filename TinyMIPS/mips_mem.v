//-------------------------------------------------------
// mips_mem.v - connect mips to memory
// Erik Brunvand
//-------------------------------------------------------

// top level design includes both mips processor and memory
module mips_mem #(parameter WIDTH = 8, REGBITS = 3)(clk, reset, const_gnd);
   input clk, reset,const_gnd;

   wire    memread, memwrite;
   wire    [WIDTH-1:0] adr, writedata;
   wire    [WIDTH-1:0] memdata;

   // instantiate the mips processor
   mips #(WIDTH,REGBITS) mips(.clk(clk), .reset(reset),.const_gnd(const_gnd), .memdata(memdata), .memread(memread), .memwrite(memwrite), .adr(adr), .writedata(writedata));

   // instantiate memory for code and data
   ram ram(.clk(clk), .memwrite(memwrite), .adr(adr), .writedata(writedata), .memdata(memdata));

endmodule
