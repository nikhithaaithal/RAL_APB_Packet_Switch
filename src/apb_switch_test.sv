class apb_switch_test extends uvm_test;
 `uvm_component_utils(apb_switch_test)

 apb_switch_env env;

 function new(string name="apb_switch_test",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  env=apb_switch_env::type_id::create("env",this);
 endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
endclass


class tx_test extends apb_switch_test;
 `uvm_component_utils(tx_test)
   apb_switch_sequence seq;
  
  function new(string name="tx_test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     seq=apb_switch_sequence::type_id::create("seq",this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass

class lock_test extends apb_switch_test;
 `uvm_component_utils(lock_test)

 lock_enable_seq seq;

 function new(string name="lock_test",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seq=lock_enable_seq::type_id::create("seq",this);
 endfunction

 virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seq.regblock=env.reg_block;
  seq.start(env.agt.seqr);
  phase.drop_objection(this);
  endtask

endclass



class unlock_test extends apb_switch_test;
 `uvm_component_utils(unlock_test)
 unlock_enable_seq seq;

 function new(string name="unlock_test",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seq=unlock_enable_seq::type_id::create("seq",this);
 endfunction
  
 virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seq.regblock=env.reg_block;
  seq.start(env.agt.seqr);
  phase.drop_objection(this);
  endtask

endclass



class clear_stat_test extends apb_switch_test;
 `uvm_component_utils(clear_stat_test)

 clear_stat_seq seq;

 function new(string name="clear_stat_test",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seq=clear_stat_seq::type_id::create("seq",this);
 endfunction
  
 virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seq.regblock=env.reg_block;
  seq.start(env.agt.seqr);
  phase.drop_objection(this);
  endtask

endclass


class soft_rst_test extends apb_switch_test;
  `uvm_component_utils(soft_rst_test)

 soft_rst seq;

 function new(string name="soft_rst",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seq=soft_rst::type_id::create("seq",this);
 endfunction
  
 virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seq.regblock=env.reg_block;
  seq.start(env.agt.seqr);
  phase.drop_objection(this);
  endtask

endclass




class continuous extends apb_switch_test;
  `uvm_component_utils(continuous)

 continuous_seq seq;

 function new(string name="continuous",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seq=continuous_seq::type_id::create("seq",this);
 endfunction
  
 virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seq.regblock=env.reg_block;
  seq.start(env.agt.seqr);
  phase.drop_objection(this);
  endtask

endclass


class drop extends apb_switch_test;
  `uvm_component_utils(drop)

 drop_seq seq;

 function new(string name="drop",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seq=drop_seq::type_id::create("seq",this);
 endfunction
  
 virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seq.regblock=env.reg_block;
  seq.start(env.agt.seqr);
  phase.drop_objection(this);
  endtask

endclass


class len_0 extends apb_switch_test;
  `uvm_component_utils(len_0)

 len_0_seq seq;

 function new(string name="len_0",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seq=len_0_seq::type_id::create("seq",this);
 endfunction
  
 virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seq.regblock=env.reg_block;
  seq.start(env.agt.seqr);
  phase.drop_objection(this);
  endtask

endclass


class error extends apb_switch_test;
  `uvm_component_utils(error)

 error_seq seq;

 function new(string name="error",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seq=error_seq::type_id::create("seq",this);
 endfunction
  
 virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seq.regblock=env.reg_block;
  seq.start(env.agt.seqr);
  phase.drop_objection(this);
  endtask

endclass

class err_enable_irq_test extends apb_switch_test;
  `uvm_component_utils(err_enable_irq_test)

  err_enable_irq_seq seq;

  function new(string name="err_enable_irq_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq=err_enable_irq_seq::type_id::create("seq",this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

class write_RO extends apb_switch_test;
  `uvm_component_utils(write_RO)

 write_RO_seq seq;

 function new(string name="write_RO",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seq=write_RO_seq::type_id::create("seq",this);
 endfunction
  
 virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seq.regblock=env.reg_block;
  seq.start(env.agt.seqr);
  phase.drop_objection(this);
  endtask

endclass

class read_WO extends apb_switch_test;
  `uvm_component_utils(read_WO)

 read_WO_seq seq;

 function new(string name="read_WO",uvm_component parent); 
  super.new(name,parent);
 endfunction

 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seq=read_WO_seq::type_id::create("seq",this);
 endfunction
  
 virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seq.regblock=env.reg_block;
  seq.start(env.agt.seqr);
  phase.drop_objection(this);
  endtask

endclass


class port_en_test extends apb_switch_test;
  `uvm_component_utils(port_en_test)

  port_en_sweep seq;

  function new(string name="port_en_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq=port_en_sweep::type_id::create("seq",this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass


class fwd_en_test extends apb_switch_test;
  `uvm_component_utils(fwd_en_test)

  fwd_en_sweep seq;

  function new(string name="fwd_en_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq=fwd_en_sweep::type_id::create("seq",this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass


class w1c_test extends apb_switch_test;
  `uvm_component_utils(w1c_test)

  w1c_reg_test seq;

  function new(string name="w1c_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq=w1c_reg_test::type_id::create("seq",this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass


class stop_without_start_test extends apb_switch_test;
  `uvm_component_utils(stop_without_start_test)

  stop_without_start_enable seq;

  function new(string name="stop_without_start_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq=stop_without_start_enable::type_id::create("seq",this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass


class start_enable_disable_test extends apb_switch_test;
  `uvm_component_utils(start_enable_disable_test)

  start_enable_disable_seq seq;

  function new(string name="start_enable_disable_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq=start_enable_disable_seq::type_id::create("seq",this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

class irq_enable_disable_test extends apb_switch_test;
  `uvm_component_utils(irq_enable_disable_test)
  irq_enable_disable_seq seq;

  function new(string name = "irq_enable_disable_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq = irq_enable_disable_seq::type_id::create("seq");
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regblock = env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

class irq_global_enable_test extends apb_switch_test;
  `uvm_component_utils(irq_global_enable_test)
  irq_global_enable_seq seq;

  function new(string name = "irq_global_enable_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq = irq_global_enable_seq::type_id::create("seq");
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regblock = env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

class irq_force_test extends apb_switch_test;
  `uvm_component_utils(irq_force_test)
  irq_force_seq seq;

  function new(string name = "irq_force_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq = irq_force_seq::type_id::create("seq");
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regblock = env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass



class gen_count_sweep_test extends apb_switch_test;
  `uvm_component_utils(gen_count_sweep_test)

  function new(string name="gen_count_sweep_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    gen_count_sweep_seq seq;
    phase.raise_objection(this);
    seq=gen_count_sweep_seq::type_id::create("seq");
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass


class gen_stop_during_run_test extends apb_switch_test;
  `uvm_component_utils(gen_stop_during_run_test)

  function new(string name="gen_stop_during_run_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    gen_stop_during_run_seq seq;
    phase.raise_objection(this);
    seq=gen_stop_during_run_seq::type_id::create("seq");
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

class gen_start_while_busy_test extends apb_switch_test;
  `uvm_component_utils(gen_start_while_busy_test)

  function new(string name="gen_start_while_busy_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    gen_start_while_busy_seq seq;
    phase.raise_objection(this);
    seq=gen_start_while_busy_seq::type_id::create("seq");
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass



class apb_invalid_access_test extends apb_switch_test;
  `uvm_component_utils(apb_invalid_access_test)

  function new(string name="apb_invalid_access_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    apb_invalid_access_seq seq;
    phase.raise_objection(this);
    seq=apb_invalid_access_seq::type_id::create("seq");
    seq.regblock=env.reg_block;
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass
