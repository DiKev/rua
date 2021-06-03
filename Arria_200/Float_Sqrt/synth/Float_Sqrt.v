// Float_Sqrt.v

// Generated using ACDS version 19.2 57

`timescale 1 ps / 1 ps
module Float_Sqrt (
		input  wire        clk,    //    clk.clk
		input  wire        areset, // areset.reset
		input  wire [0:0]  en,     //     en.en
		input  wire [31:0] a,      //      a.a
		output wire [31:0] q       //      q.q
	);

	Float_Sqrt_altera_fp_functions_191_tk56cni fp_functions_0 (
		.clk    (clk),    //   input,   width = 1,    clk.clk
		.areset (areset), //   input,   width = 1, areset.reset
		.en     (en),     //   input,   width = 1,     en.en
		.a      (a),      //   input,  width = 32,      a.a
		.q      (q)       //  output,  width = 32,      q.q
	);

endmodule
