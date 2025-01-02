module tb_bcd;
    reg clk;
    reg reset;
    wire [3:0] bcd_lsb;
    wire [3:0] bcd_msb;
    bcd dut (
        .clk(clk),
        .reset(reset),
        .bcd_lsb(bcd_lsb),
        .bcd_msb(bcd_msb)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    initial begin
        reset = 1;      
        #15;            
        reset = 0;      
        #200;          
        reset = 1;      
        #10;
        reset = 0;      
        #100;          
        $finish;        
    end
    initial begin
        $monitor($time, " ns | Reset = %b | BCD LSB = %d | BCD MSB = %d",
                 reset, bcd_lsb, bcd_msb);
    end

    initial begin
        $dumpfile("bcd_waveform.vcd");
        $dumpvars(0, tb_bcd);        
    end

endmodule
