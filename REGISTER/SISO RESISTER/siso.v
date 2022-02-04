module SISO #(parameter size=4) (
    o,
    clk,
    clear_n,
    i
    );
    
    output o;
    input clk;
    input clear_n;
    input i;
    
    reg [size-1:0]R;
    
    assign o = R[size-1];
    
    always@(posedge clk or negedge clear_n)
    begin
        if(!clear_n)
            R[0] <= 0;
            
        else
            R <= {R[size-2:0], i};
    end
endmodule
