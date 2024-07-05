// top level testing 
module top_tb #(parameter WIDTH = 8, REGBITS = 3)();
   parameter FINISHTIME = 20000;
   parameter CLKPERIOD  = 20;
   parameter const_gnd = 1'b0;
   reg clk = 0;
   reg reset = 1;
   // testing mips memory module
   mips_mem2 #(WIDTH,REGBITS) dut(.clk(clk), .reset(reset), .const_gnd(const_gnd));
   // initialize 
   initial
      begin
         reset <= 1; 
         #(4*CLKPERIOD) reset <= 0;
         #FINISHTIME 
	 $display("Finishing Simulation due to simulation constraint.");
	$finish; 
      end
   // clock gen
   always #CLKPERIOD clk <= ~clk; 
   // test Fibonacci Simulation
   always@(negedge clk)
      begin
         if(dut.memwrite)
            if(dut.adr == 8'hFF & dut.writedata == 8'h0D)
		begin
                     $display("Fibonacci Simulation was successful!!!");
       		     #(4*CLKPERIOD)
	             $display("Ending Simulation.");
                     $finish;
		end
            else 
                begin 
                     $display("Fibonacci Simulation has failed...");
                     $display("Data at address FF should be 0D");
		     #(4*CLKPERIOD)
	             $display("Ending Simulation.");
                     $finish;
                end
      end
	initial	
	begin
		$shm_open("top_tb.db");
		$shm_probe(top_tb,"AS");
	end
endmodule


