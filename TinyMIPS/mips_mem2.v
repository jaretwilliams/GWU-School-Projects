module mips_mem2 #(parameter WIDTH = 8, REGBITS = 3)(clk, reset, const_gnd);
   input clk, reset,const_gnd;

   wire    memread, memwrite;
   wire    [WIDTH-1:0] adr, writedata;
   wire    [WIDTH-1:0] memdata;

   // instantiate the mips processor
   ram memory (.memdata(memdata), .memwrite(memwrite), .adr(adr), .writedata(writedata), .clk(clk)) ;
   mips cpu(.clk(clk), .reset(reset), .const_gnd(const_gnd), .memdata(memdata), .memread(memread), .memwrite(memwrite), .adr(adr), .writedata(writedata));



endmodule
