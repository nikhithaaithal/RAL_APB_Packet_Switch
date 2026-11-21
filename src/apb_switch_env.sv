class apb_switch_env extends uvm_env;
  `uvm_component_utils(apb_switch_env)
   apb_switch_agent agt;
   switch_adapter adp;
   register_block reg_block;
   uvm_reg_predictor #(seq_item)predictor;
   
  function new(string name="apb_switch_env",uvm_component parent);
    super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
    agt=apb_switch_agent::type_id::create("agt",this);
    adp=switch_adapter::type_id::create("adp",,get_full_name());
    reg_block=register_block::type_id::create("reg_lock",this);
    reg_block.build();
     predictor=uvm_reg_predictor#(seq_item)::type_id::create("predictor",this);
   endfunction

   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    reg_block.default_map.set_sequencer(.sequencer(agt.seqr),.adapter(adp));
    reg_block.default_map.set_auto_predict(0);
    agt.mon.mon_port.connect(predictor.bus_in);
    predictor.map=reg_block.default_map;
    predictor.adapter=adp;
   endfunction
endclass
