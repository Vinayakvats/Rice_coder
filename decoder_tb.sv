`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2024 18:06:43
// Design Name: 
// Module Name: decoder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench_decoder;

    // Inputs
    reg clk;
    reg rst_n;
    reg [7:0] encoded_data;
    reg [3:0] K;

    // Outputs
    wire [7:0] decoded_input_data;

    // Instantiate rice_decoder module
    rice_decoder decoder (
        .clk(clk),
        .rst_n(rst_n),
        .encoded_data(encoded_data),
        .k(K),
        .decoded_data(decoded_input_data)
    );

    // Clock generation
    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end

    // Testbench stimulus
    initial begin
        // Reset
        rst_n = 0;
        #10;
        rst_n = 1;

        // Provide encoded data
        encoded_data = 8'b100001; // For example, use the same encoded data as input data for testing

        // Set K value
        K = 4; // Set K value

        // Wait for some time
        #100;

        // Print encoded data and decoded data
        $display("Encoded Data: %b", encoded_data);
        $display("Decoded input data: %d", decoded_input_data);

        // Finish the simulation
        $finish;
    end

endmodule

