module rice_decoder (
    input clk,
    input rst_n,
    input [7:0] encoded_data,
    input [3:0] k,
    output reg [7:0] decoded_data,
    output reg done
);

// Rice decoder state
reg [7:0] q=1;
reg [3:0] r;
;
always @(posedge clk or negedge rst_n) begin
reg [3:0] count=2;
    if (!rst_n) begin
        // Reset values
        q <= 0;
        r <= 0;
        decoded_data <= 0;
        done <= 0;
    end else begin
        // Initialize q based on the first two bits of encoded_data
        if (count == 2) begin
            if (encoded_data[2] == 1)
                q <= q + 1;
        end else if (count == 1) begin
            if (encoded_data[1] == 1)
                q <= q + 1;
        end

        // Calculate r based on the first four bits of encoded_data
        r <= encoded_data[0] * 1 + encoded_data[1] * 2 + encoded_data[2] * 4 + encoded_data[3] * 8;

        // Calculate decoded_data
        decoded_data <= (1*(2**k) + r);

        // Set done signal
        done <= 1;
    end
end

endmodule
