`timescale 1ns/10ps
module cpu_tb ();

wire memread, memwrite;
wire [7:0] adr, writedata;
wire [7:0] memdata;

reg clk, rst,const_gnd;

ram memory (.memdata(memdata), .memwrite(memwrite), .adr(adr), .writedata(writedata), .clk(clk)) ;
mips cpu(.clk(clk), .reset(reset), .const_gnd(const_gnd), .memdata(memdata), .memread(memread), .memwrite(memwrite), .adr(adr), .writedata(writedata));


initial begin
    clk=1'b0;
// wire const_gnd to 0
    const_gnd=1'b0;

// send in rst signal
    rst=1'b0;
    #40 rst=1'b1;
// finish after X clk pulses
// x being the number of instructions you have in your program
    while (~memwrite) begin
        #40;
    end
    #40 $finish;
end


// create a clk in always block
always 
    #20 clk = ~clk;

initial	
	begin
		// for generic verilog
		//$dumpfile("waves.lxt");
		//$dumpvars(0,top_tb);
		// for cadence
		$shm_open("cpu_tb.db");
		$shm_probe(cpu_tb,"AS");

	end
endmodule
