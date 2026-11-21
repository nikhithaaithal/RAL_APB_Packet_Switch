class apb_switch_driver extends uvm_driver#(seq_item);
 `uvm_component_utils(apb_switch_driver)
  virtual switch_inf vif;
  seq_item tr;
 
  function new(string name="apb_switch_driver",uvm_component parent);
   super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
   super.build_phase(phase);
    if(!uvm_config_db#(virtual switch_inf)::get(this,"","vif",vif))
    `uvm_fatal(get_type_name(), "Unable to access interface in the driver")
  endfunction

  task run_phase(uvm_phase phase);
     @(posedge vif.pclk);
    forever begin
      tr=seq_item::type_id::create("tr");
      seq_item_port.get_next_item(tr);
      drive();
      seq_item_port.item_done();
    end  
  endtask
    
 task drive();

  @(posedge vif.pclk);
  vif.psel    <= 1'b1;
  vif.penable <= 1'b0;
  vif.pwrite  <= tr.pwrite;
  vif.paddr   <= tr.paddr;
 
  if (tr.pwrite)
    vif.pwdata <= tr.pwdata;

  @(posedge vif.pclk);
  vif.penable <= 1'b1;

  @(posedge vif.pclk);
  tr.prdata = vif.prdata;
  tr.pslverr = vif.pslverr;
  vif.psel    <= 1'b0;
  vif.penable <= 1'b0;
 endtask
endclass

       

