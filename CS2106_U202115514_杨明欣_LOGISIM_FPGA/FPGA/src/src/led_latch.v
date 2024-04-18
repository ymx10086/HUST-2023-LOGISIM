// latch the value of led_data
module LedLatch (
    input if_led, clk, rst,
    input [31:0] data_in,
    output [31:0] data_out
);
    reg [31:0] led_in;
    always @(if_led) begin
        if (if_led) led_in = data_in;
        else led_in = 32'b0;
    end
    register led_reg(
        .clk        (clk), 
        .rst        (rst), 
        .en         (if_led),
        .din        (led_in), 
        .dout       (data_out)
    );
    
endmodule