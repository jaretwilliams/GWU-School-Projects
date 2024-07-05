
module exmem #(parameter WIDTH = 8, RAM_ADDR_BITS = 8)
   (input clk, en, memwrite,
    input [7:0] adr,
    input [7:0] writedata,
    output reg [7:0] memdata
    );

	integer i;
   reg [7:0] mips_ram [0:256];
 
 initial
 	begin
	for(i=0; i<256; i=i+1)
	begin
		mips_ram[i]=8'b0;
		end
	$display("memory scrubbed");
	$readmemh("fib.dat", mips_ram); //hex
//	$readmemb("fib.dat", mips_ram); //binary
	$display ("File loaded.");
	end

	integer k;
	initial begin
		$display("Contents of Mem after reading data file:");
		for (k=0; k<256; k=k+1) $display("%d:%h",k,mips_ram[k]);
	end

   always @(negedge clk)
      if (en) begin
         if (memwrite)
            mips_ram[adr] <= writedata;
         memdata <= mips_ram[adr];
      end
endmodule
