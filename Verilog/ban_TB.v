`timescale 1ns / 1ps
module TB_design_controller_01;
	// Inputs to module being verified
	reg clock, button, sense, reset;
	// Outputs from module being verified
	wire enable, motor;
	// Instantiate module
	design_controller_01 uut (
		.clock(clock),
		.button(button),
		.sense(sense),
		.reset(reset),
		.enable(enable),
		.motor(motor)
	);
	
	// Generate clock signal
	initial
    begin
        clock  = 1'b1;
        forever
            #50000 clock  = ~clock ;
    end
    
	// Generate other input signals
	initial
    begin
        button = 1'b0;
        sense = 1'b0;
        reset = 1'b0;
        #75000
        reset = 1'b1;
        #100000
        reset = 1'b0;
        #300000
        button = 1'b1;
        #50000
        sense = 1'b1;
        #400000
        sense = 1'b0;
        #50000
        button = 1'b0;
        #550000
        button = 1'b1;
        #150000
        sense = 1'b1;
        #750000
        button = 1'b0;
        #750000
        sense = 1'b0;
        #500000
        reset = 1'b1;
        #3100000
        reset = 1'b0;
        #500000
        button = 1'b1;
        #50000
        sense = 1'b1;
        #900000
        button = 1'b0;
        #350000
        button = 1'b1;
        #150000
        sense = 1'b0;
        #350000
        button = 1'b0;
        #850000
        reset = 1'b1;
        #200000
        reset = 1'b0;
        #450000
        button = 1'b1;
        #100000
        sense = 1'b1;
        #1050000
        button = 1'b0;
        #950000
        sense = 1'b0;
        #250000
        button = 1'b1;
        #650000
        button = 1'b0;
        #250000
        reset = 1'b1;
        #250000
        reset = 1'b0;
        #550000
        button = 1'b1;
        #100000
        sense = 1'b1;
        #900000
        reset = 1'b1;
        #100000
        sense = 1'b0;
        #200000
        reset = 1'b0;
        #150000
        sense = 1'b1;
        #500000
        sense = 1'b0;
        #100000
        button = 1'b0;
        #400000
        button = 1'b1;
        #300000
        sense = 1'b1;
        #300000
        button = 1'b0;
        #400000
        button = 1'b1;
        sense = 1'b0;
        #650000
        button = 1'b0;
        #1275000
        $stop;
    end
    
    initial
    begin
        $dumpfile ("dump.vcd");
        $dumpvars(2);
    end

endmodule