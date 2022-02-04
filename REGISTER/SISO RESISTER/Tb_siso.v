module Tb_SISO();
    reg clk, clr_n, i;
    wire o;
    
    SISO sim_SISO(.o(o), .clk(clk), .clear_n(clr_n), .i(i));
    
    initial
    begin
        clr_n = 1'b0;
        i = 1'b0;
        
        clk =1'b0;
        forever
            #10 clk = ~clk;
    end
    
    initial
    begin
        #20 i=1'b0; clr_n=1'b0;
        #20 i=1'b1; clr_n=1'b0;
        #20 i=1'b1; clr_n=1'b1;
        #20 i=1'b0; clr_n=1'b1;
        #20 i=1'b1; clr_n=1'b1;
        #20 i=1'b0; clr_n=1'b1;
        #20 i=1'b0; clr_n=1'b1;
        #20 i=1'b0; clr_n=1'b1;
        #20 i=1'b0; clr_n=1'b1;
    end
endmodule
