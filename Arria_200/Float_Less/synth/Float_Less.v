// Float_Less.v

// Generated using ACDS version 19.2 57

`timescale 1 ps / 1 ps
module Float_Less (
		input  wire        clk,    //    clk.clk
		input  wire        areset, // areset.reset
		input  wire [0:0]  en,     //     en.en
		input  wire [31:0] a,      //      a.a
		input  wire [31:0] b,      //      b.b
		output wire [0:0]  q       //      q.q
	);

	Float_Less_altera_fp_functions_191_bitaw5i fp_functions_0 (
		.clk    (clk),    //   input,   width = 1,    clk.clk
		.areset (areset), //   input,   width = 1, areset.reset
		.en     (en),     //   input,   width = 1,     en.en
		.a      (a),      //   input,  width = 32,      a.a
		.b      (b),      //   input,  width = 32,      b.b
		.q      (q)       //  output,   width = 1,      q.q
	);

endmodule
