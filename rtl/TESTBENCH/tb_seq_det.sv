//====================================================
// Testbench for 4-Pattern Overlapping Sequence Detector
// Detects: 1101, 1010, 1001, 0110
//====================================================

`timescale 1ns/1ns

module tb_seqdet;

    // DUT signals
    reg  clock_i;
    reg  areset_ni;
    reg  in_i;
    wire out_o;

    // Instantiate the DUT (Device Under Test)
    p4_O_SEQdet dut (
        .clock_i(clock_i),
        .areset_ni(areset_ni),
        .in_i(in_i),
        .out_o(out_o)
    );

    //====================================================
    // Clock Generation (period = 10ns -> 100MHz)
    //====================================================
    initial begin
        clock_i = 1'b0;
        forever #5 clock_i = ~clock_i;
    end

    //====================================================
    // Stimulus Process
    //====================================================
    integer i;
    reg [15:0] test_data; // Test vector (16-bit sequence)
    initial begin
        // Initialize
        areset_ni = 1'b0;
        in_i = 1'b0;

        // Apply reset
        #12 areset_ni = 1'b1;  // Deassert reset after some delay

        // Define test sequence: try multiple overlapping patterns
        // Example sequence: 1 0 1 0 1 1 0 1 0 0 1 1 0
        // Expected outputs occur when patterns 1101, 1010, 1001, 0110 appear
        test_data = 16'b1010110100110110;

        // Apply serial input, MSB?LSB
        for (i = 15; i >= 0; i = i - 1) begin
            in_i = test_data[i];
            #10;  // Wait one clock period
        end

        // Wait and finish
        #20;
        $display("Simulation complete.");
        $finish;
    end

    //====================================================
    // Monitor Output
    //====================================================
    initial begin
        $display("Time | in_i | out_o | state");
        $monitor("%4t  |  %b   |   %b", $time, in_i, out_o);
    end

    //====================================================
    // Waveform Dump
    //====================================================
    initial begin
        $dumpfile("p4_seqdet.vcd");
        $dumpvars(0, tb_seqdet);
    end

endmodule
