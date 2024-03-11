`timescale 1ns / 1ps
module quartus(
    input clk, 
    input tx_rx_ctrl,
    output reg [7:0] rx_data,
    output reg ack,
    output reg tx_valid
);


reg [7:0] shifted_data = 8'b10110111;
reg [7:0] received_data_reg;

always @(posedge clk) begin
    if (tx_rx_ctrl == 1) begin
        shifted_data <= {shifted_data[0], shifted_data[7:1]};
        received_data_reg <= shifted_data;
        tx_valid <= 1'b1;
        ack <= 1'b0;
       
    end else begin
        rx_data <= received_data_reg;
        
        ack <= 1'b1;
        tx_valid <= 1'b0;
    end
end

endmodule
