module D_FF_(
    q,
    q_,
    clk,
    pre_n,
    clr_n,
    d
    );
    
    output q;
    output q_;
    input clk;
    input pre_n;
    input clr_n;
    input d;
    
    assign q = ~(q_ & ~(d & clk) & pre_n);
    assign q_ = ~(q & ~(~(d & d) & clk) & clr_n);
endmodule
