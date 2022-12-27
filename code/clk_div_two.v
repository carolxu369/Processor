module clk_div_two(new_clk, clk, clr);
    //Inputs
   input clk, clr;
   
   //Internal wire
   wire clr;

   //Output
   output new_clk;
   
   //Register
   reg new_clk;

   //Intialize new_clk to 0
   initial
   begin
       new_clk = 1'b0;
   end

   //Set value of new_clk on positive edge of the clock or clear
   always @(posedge clk or posedge clr) begin
       //If clear is high, set new_clk to 0
       if (clr) begin
           new_clk <= 1'b0;
       //If enable is high, set new_clk to the value of d
       end else begin
           new_clk <= ~new_clk;
       end
   end

endmodule
