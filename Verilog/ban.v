module design_controller_01 (button , sense, clock, reset, enable, motor);

    input button, sense, reset, clock;
    output enable, motor;
    reg [1:0] current_state, next_state;
    localparam [1:0] IDLE = 2'b00, // initial state
    STARTING = 2'b11,                // the button has been pressed, motor is rotating
    RUNNING = 2'b10,                 // the engine is running
    DELAY_STOP = 2'b01;              // button is pressed again, the engine is killed slowly!
    assign enable = (current_state == STARTING) || (current_state == RUNNING);
    assign motor = (current_state == RUNNING);
   
    always @(posedge clock or posedge reset)
    begin
        if (reset)
            current_state <= IDLE;
        else
            current_state = next_state;
    end
       
    always @(current_state, button, sense)
    begin
        case (current_state)
            IDLE:
                if (button && !sense)
                    next_state = STARTING;
                else
                    next_state = IDLE;
            STARTING:
                if (button)
                    next_state = STARTING;
                else if (!button && sense)
                    next_state = RUNNING;
                else
                    next_state = IDLE;
            RUNNING:
                if (button)
                    next_state = DELAY_STOP;
                else if (sense)
                    next_state = RUNNING;
                else
                    next_state = IDLE;
            DELAY_STOP:
                if (button)
                    next_state = DELAY_STOP;
                else if (sense)
                    next_state = DELAY_STOP;
                else
                    next_state = IDLE;
            default:
                next_state = IDLE;
        endcase
    end
endmodule