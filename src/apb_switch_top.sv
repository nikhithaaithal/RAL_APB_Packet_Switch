
`include "switch_inf.sv"
`include "pkg.sv"
`include "apb_pkt_pkg.sv"
`include "pkt_generator.sv"
`include "pkt_switch.sv"
`include "apb_pkt_switch.sv"

module top;
  import uvm_pkg::*;
  import pkg::*;
  bit pclk=0;
  bit presetn;
  switch_inf vif(pclk,presetn);
  always #5 pclk = ~pclk;
  
  apb_pkt_switch dut (vif.pclk, vif.presetn, vif.psel, vif.penable, vif.pwrite, vif.paddr, vif.pwdata, vif.prdata, vif.pready, vif.pslverr, vif.irq);

 initial begin
   presetn =0;
   #6;
   presetn=1;
 end
  
initial begin
  $dumpfile("top.vcd");
  $dumpvars(0, top);
end
  
 initial begin
   uvm_config_db #(virtual switch_inf)::set(null,"*","vif",vif);
   run_test();
 end
endmodule
