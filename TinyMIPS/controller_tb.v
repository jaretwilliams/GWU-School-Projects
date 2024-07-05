`timescale 1ns/10ps
module controller_tb();

reg [5:0]   	op;
reg 		reset,clk;

wire 		alusrca;
wire [1:0]      alusrcb;	// ALUSrcB
wire [1:0]      aluop;	// ALUOp
wire            branch;	// Branch
wire            iord;	// IorD
wire [3:0]      irwrite;	// irwrite [0] = IRWrite0, irwrite[1] = IRWrite1, etc.
wire            memread;	// MemRead
wire            memwrite;	// MemWrite
wire            memtoreg;	// MemtoReg
wire            pcwrite;	// PCWrite
wire [1:0]      pcsource;	// PCSrc
wire            regwrite;	// RegWrite
wire 	 	  regdst;	// RegDst
wire [3:0] 	state;

// OPCODES  -- Make input decoding simpler
 
parameter      LB      =  6'b100000;	// load byte
parameter      SB      =  6'b101000; // store byte
parameter      RTYPE   =  6'b0; // Regsiter type instuction 
parameter      BEQ     =  6'b000100; // Branch if Equal instruction i-type 
parameter      J       =  6'b000010; //  Jump
parameter	ADDI  =  6'b001000; // addi op


controller  cont(.clk(clk), .reset(reset), .op(op), .zero(zero), .memread(memread), .memwrite(memwrite), 
                    .alusrca(alusrca), .memtoreg(memtoreg), .iord(iord), .pcen(pcen), .regwrite(regwrite), .regdst(regdst),
                    .pcsource(pcsource), .alusrcb(alusrcb), .aluop(aluop), .irwrite(irwrite));


initial
    begin
    op <= LB;
    reset <= 0;
    $monitor("op: %6b, state: %d", op, state-1);

    #90
    op <= SB;

    #80 
    op <= RTYPE;

    #80 
    op <= BEQ;
    
    #70
    op <= J;

    #70
    op <= ADDI;
    
    #90 
    reset <= 1;
	
    #30 
    reset <= 0;

    #40
    $finish;

    end

initial 
    begin
    clk=1'b0;
    end

always #5
    begin
    clk=~clk;
    if (clk) $display("posedge clk");
    end

initial
 begin
    // Open a db file for saving simulation data
  $shm_open ("controller_tb.db");
    // Collect all signals (hierarchically) from the module "controller_tb"
  $shm_probe (controller_tb,"AS");
 end
endmodule


