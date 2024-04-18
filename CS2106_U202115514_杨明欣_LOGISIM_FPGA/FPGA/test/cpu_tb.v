`timescale 1ns / 1ps

module CPUTest();
    reg clk, rst, pause;
    wire [31:0] led_data;
    
    initial begin
        clk <= 0;
        rst <= 0;
        pause <= 0;
    end
    
    always begin
        #1 clk = ~clk;
    end

    //simulation finish
    always begin
        #100;
        if ($time >= 2000)  begin
            $display("-------------------------------------");
            $display("Data process is OK!!!");
            $display("-------------------------------------");
            #1 ;
            $finish ;
        end
    end

    RiscvCPU cpu(
        .clk            (clk),
        .rst            (rst),
        .pause          (pause),
        .led_data_o     (led_data)
    );
endmodule
    