module bcd(
    input clk,          
    input reset,        
    output reg [3:0] bcd_lsb,
    output reg [3:0] bcd_msb  
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        bcd_lsb <= 4'b0000;
        bcd_msb <= 4'b0000;
    end else begin
        bcd_lsb <= (bcd_lsb == 4'b1001) ? 4'b0000 : bcd_lsb + 1;
        bcd_msb <= (bcd_lsb == 4'b1001) ? 
                   ((bcd_msb == 4'b1001) ? 4'b0000 : bcd_msb + 1) : 
                   bcd_msb;
    end
end

endmodule
