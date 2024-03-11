`timescale 1ns / 1ps

module quartus_tb;

    // Inputs
    reg clk;
    reg tx_rx_ctrl;
    
    // Outputs
    wire [7:0] rx_data;
    wire ack;
    wire tx_valid;

    // Instantiate the Unit Under Test (UUT)
    quartus uut (
        .clk(clk), 
        .tx_rx_ctrl(tx_rx_ctrl),
        .rx_data(rx_data),
        .ack(ack),
        .tx_valid(tx_valid)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        tx_rx_ctrl = 0;
        
        // Reset
        #10;
        tx_rx_ctrl = 1;
        #10;
        tx_rx_ctrl = 0;
        
        // Stimulus
        #50;
        tx_rx_ctrl = 1;
        #50;
        tx_rx_ctrl = 0;
        #200;
        tx_rx_ctrl=1;
        #200;
        tx_rx_ctrl=0;
        #100;
        
        
        // End simulation
        $finish;
    end

endmodule
