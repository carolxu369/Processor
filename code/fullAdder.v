module fullAdder(ina, inb, cin, cout, sum);
 input ina, inb, cin;
 output cout, sum;
 
 
 wire co1, co2, co3; 
 
 xor firstXOR(co1, ina, inb);
 xor secondXOR(sum, cin, co1);
 
 and firstAND(co2, cin, co1);
 and secondAND(co3, ina, inb);
 
 or finalOR(cout, co2, co3);
 
endmodule
