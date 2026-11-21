class seq_item extends uvm_sequence_item;
 `uvm_object_utils(seq_item)
  function new(string name="seq_item");
   super.new(name);
  endfunction
  bit psel;
  bit penable;
  bit pwrite;
  bit [15:0] paddr;
  bit [31:0] pwdata;
  bit [31:0] prdata;
  bit pready;
  bit pslverr;
  bit irq;
endclass



