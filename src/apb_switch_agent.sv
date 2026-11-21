class apb_switch_agent extends uvm_agent;
 `uvm_component_utils(apb_switch_agent)
  function new(string name="apb_switch_agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  apb_switch_driver drv;
  apb_switch_seqr seqr;
  apb_switch_monitor mon;
 
  virtual function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   drv=apb_switch_driver::type_id::create("drv",this);
   mon=apb_switch_monitor::type_id::create("mon",this);
   seqr=apb_switch_seqr::type_id::create("seqr",this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass

