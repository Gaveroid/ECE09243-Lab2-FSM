module FSM (i, f, clk, reset);

output reg f;
input i, clk, reset;

parameter S0=3'b000,
	S1=3'b001,
	S2=3'b010,
	S3=3'b011,
	S4=3'b100;

reg [2:0] NS, CS;
	
always @(posedge clk)
begin
	if (reset==1)
		CS <= S0;
	else
		CS <= NS;
end


always @(CS, i)
begin
	case(CS)
		S0:begin
			if (i==1)
				NS=S1;
			else
				NS=S0;
			end
		
		S1:begin
			if (i==1)
				NS=S1;
			else
				NS=S2;
			end
		
		S2:begin
			if (i==1)
				NS=S1;
			else
				NS=S3;
			end
			
		S3:begin
			if (i==1)
				NS=S4;
			else
				NS=S1;
			end
		
		S4:begin
			if (i==1)
				NS=S1;
			else
				NS=S0;
			end
			
		
		default:NS = S0;
	endcase
	
	if (CS==S4)
		f = 1;
	else
		f = 0;
	
	//f = (CS==S4)? 1:0;
end

endmodule
