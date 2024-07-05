module controller(alusrca, alusrcb, aluop, pcen, iord, irwrite, 
                  memread, memwrite, memtoreg, 
		  pcsource, regwrite, regdst,
                  op, clk, reset, zero) ;

   // INPUTS (3)
   input  [5:0]   op         ;	// OPCODE
   input          clk, reset, zero ;

   // OUTPUTS (12)
   output         alusrca    ;	// ALUSrcA
   output [1:0]   alusrcb    ;	// ALUSrcB
   output [1:0]   aluop      ;	// ALUOp
   output         pcen     ;	// Program Counter enable
   output         iord       ;	// IorD
   output [3:0]   irwrite    ;	// irwrite [0] = IRWrite0, irwrite[1] = IRWrite1, etc.
   output         memread    ;	// MemRead
   output         memwrite   ;	// MemWrite
   output         memtoreg   ;	// MemtoReg
   output [1:0]   pcsource   ;	// PCSrc
   output         regwrite   ;	// RegWrite
   output	  regdst     ;	// RegDst

   // REGISTERS
   reg 		  alusrca ;
   reg [1:0]      alusrcb    ;	// ALUSrcB
   reg [1:0]      aluop      ;	// ALUOp
   reg            branch     ;	// Branch
   reg            iord       ;	// IorD
   reg [3:0]      irwrite    ;	// irwrite [0] = IRWrite0, irwrite[1] = IRWrite1, etc.
   reg            memread    ;	// MemRead
   reg            memwrite   ;	// MemWrite
   reg            memtoreg   ;	// MemtoReg
   reg            pcwrite    ;	// PCWrite
   reg [1:0]      pcsource   ;	// PCSrc
   reg            regwrite   ;	// RegWrite
   reg   	  regdst     ;	// RegDst



   // STATES (12)
   //
   parameter      FETCH1  =  4'b0001;	// state 0
   parameter      FETCH2  =  4'b0010;	// state 1
   parameter      FETCH3  =  4'b0011;	// state 2 
   parameter      FETCH4  =  4'b0100;	// state 3
   parameter      DECODE  =  4'b0101;   // state 4
   parameter      MEMADR  =  4'b0110;	// state 5
   parameter      LBRD    =  4'b0111;	// state 6
   parameter      LBWR    =  4'b1000;	// state 7
   parameter      SBWR    =  4'b1001;	// state 8
   parameter      RTYPEEX =  4'b1010;	// state 9
   parameter      RTYPEWR =  4'b1011;	// state 10
   parameter      BEQEX   =  4'b1100;	// state 11
   parameter      JEX     =  4'b1101;	// state 12
   parameter	  ADDIWR  =  4'b1110;	// state 13

   // OPCODES  -- Make input decoding simpler
   // 
   parameter      LB      =  6'b100000;	// load byte
   parameter      SB      =  6'b101000; // store byte
   parameter      RTYPE   =  6'b0; // Regsiter type instuction TODO - see lecture 4b 
   parameter      BEQ     =  6'b000100; // Branch if Equal instruction i-type TODO
   parameter      J       =  6'b000010; //  Jump TODO
   parameter	  ADDI	  =  6'b001000; // addi op

   // STATE REGISTERS
   reg [3:0] state, nextstate;

   // state register
   always @(posedge clk)
      if(reset) state <= FETCH1;
	else state <= nextstate;
	
   // next state logic
   always @(*)
      begin
	case(state)
	FETCH1: nextstate <= FETCH2;
	FETCH2: nextstate <= FETCH3;
	FETCH3: nextstate <= FETCH4;
	FETCH4: nextstate <= DECODE;
	DECODE: case(op)
		LB: nextstate <= MEMADR;
		SB: nextstate <= MEMADR;
		RTYPE: nextstate <= RTYPEEX;
		BEQ: nextstate <= BEQEX;
		J: nextstate <= JEX;
		ADDI: nextstate <= MEMADR;
		//should never happen
		default: nextstate <= FETCH1;
		endcase
	MEMADR: case(op)
		LB: nextstate <= LBRD;
		SB: nextstate <= SBWR;
		ADDI: nextstate <= ADDIWR;
		//should never happen
		default: nextstate <= FETCH1;
		endcase
	LBRD: nextstate <= LBWR;
	RTYPEEX: nextstate <= RTYPEWR;
	LBWR: nextstate <= FETCH1;
	SBWR: nextstate <= FETCH1;
	RTYPEWR: nextstate <= FETCH1;
	BEQEX: nextstate <= FETCH1;
	JEX: nextstate <= FETCH1;
	ADDIWR: nextstate <= FETCH1;
	//should never happen
	default: nextstate <= FETCH1;
	endcase
     end

   // registered outputs
   always @(*)
      begin
	// set all outputs to zero then conditionally assert
	// the apropriate ones
	irwrite <= 4'b0000;
	alusrca <= 0;	
	alusrcb <= 2'b00;	
	aluop <= 2'b00;
        iord <= 0;
	memread <= 0;
	memwrite <= 0;
        memtoreg <= 0;
        pcwrite <= 0;
	pcsource <= 2'b00;
        regwrite <= 0;	
	regdst <= 0;
	branch <= 0;
	case(state)
	FETCH1:
	   begin
	      memread <= 1;
	      irwrite <= 4'b0001;
	      alusrcb <= 2'b01;
	      pcwrite <= 1;
	   end
	FETCH2:
	   begin
	      memread <= 1;
	      irwrite <= 4'b0010;
	      alusrcb <= 2'b01;
	      pcwrite <= 1;
	   end
	FETCH3:
	   begin
	      memread <= 1;
	      irwrite <= 4'b0100;
	      alusrcb <= 2'b01;
	      pcwrite <= 1;
	   end
	FETCH4:
	   begin
	      memread <= 1;
	      irwrite <= 4'b1000;
	      alusrcb <= 2'b01;
	      pcwrite <= 1;
	   end
	DECODE:alusrcb <= 2'b11;
	MEMADR:
	   begin
	      alusrca <= 1;
	      alusrcb <= 2'b10;
	   end
	LBRD:
	   begin
	      memread <= 1;
	      iord <= 1;
	   end
	LBWR:
	   begin
	      regwrite <= 1;
	      memtoreg <= 1;
	   end
	SBWR:
	   begin
	      memwrite <= 1;
	      iord <= 1;
	   end
	RTYPEEX:
	   begin
	      alusrca <= 1;
	      aluop <= 2'b10;
	   end
	RTYPEWR:
	   begin
	      regdst <= 1;
	      regwrite <= 1;
	   end
	BEQEX:
	   begin
	      alusrca <= 1;
	      aluop <= 2'b01;
	      branch <= 1;
	      pcsource <= 2'b01;
	   end
	JEX:
	   begin
	      pcwrite <= 1;
	      pcsource <= 2'b10;
	   end
	ADDIWR:
	   begin
	      regdst <= 1;
	      iord <= 1;
	   end
	endcase
     end

  assign pcen = pcwrite | (branch & zero); //pc enable
   
endmodule
