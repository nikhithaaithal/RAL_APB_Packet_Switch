
class device_id extends uvm_reg;
 `uvm_object_utils(device_id)
  rand uvm_reg_field product_id;
  rand uvm_reg_field vendor_id;
  rand uvm_reg_field revision;

    
  function new( string name="device_id");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    product_id=uvm_reg_field::type_id::create("product_id");
    product_id.configure( this,16,0,"RO",0,16'h5357,1,1,1);

    vendor_id=uvm_reg_field::type_id::create("vendor_id");
    vendor_id.configure( this,8,16,"RO",0,8'hA5,1,1,1);

    revision=uvm_reg_field::type_id::create("revision");
    revision.configure( this,8,24,"RO",0,8'h02,1,1,1);
  endfunction
endclass

class version extends uvm_reg;
 `uvm_object_utils(version)
  rand uvm_reg_field patch;
  rand uvm_reg_field minor;
  rand uvm_reg_field major;
  rand uvm_reg_field reserved;

  function new( string name="version");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    patch=uvm_reg_field::type_id::create("patch");
    patch.configure( this,8,0,"RO",0,0,1,1,1);

    minor=uvm_reg_field::type_id::create("minor");
    minor.configure( this,8,8,"RO",0,8'h2,1,1,1);

    major=uvm_reg_field::type_id::create("major");
    major.configure( this,8,16,"RO",0,8'h1,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,8,24,"RO",0,0,1,1,1);//
  endfunction
endclass

class switch_status extends uvm_reg;
 `uvm_object_utils(switch_status)
  rand uvm_reg_field ready;
  rand uvm_reg_field busy;
  rand uvm_reg_field switch_enabled;
  rand uvm_reg_field locked;
  rand uvm_reg_field port_enabled;
  rand uvm_reg_field gen_running;
  rand uvm_reg_field err_pending;
  rand uvm_reg_field reserved0;
  rand uvm_reg_field gen_fsm;
  rand uvm_reg_field reserved;

  function new( string name="switch_status");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    ready=uvm_reg_field::type_id::create("ready");
    ready.configure( this,1,0,"RO",1,1,1,1,1);

    busy=uvm_reg_field::type_id::create("busy");
    busy.configure( this,1,1,"RO",1,0,1,1,1);

    switch_enabled=uvm_reg_field::type_id::create("switch_enabled");
    switch_enabled.configure( this,1,2,"RO",1,0,1,1,1);

    locked=uvm_reg_field::type_id::create("locked");
    locked.configure( this,1,3,"RO",1,1,1,1,1);
    
    port_enabled=uvm_reg_field::type_id::create("port_enabled");
    port_enabled.configure( this,4,4,"RO",1,4'hF,1,1,1);

    gen_running=uvm_reg_field::type_id::create("gen_running");
    gen_running.configure( this,1,8,"RO",1,0,1,1,1);

    err_pending=uvm_reg_field::type_id::create("err_pending");
    err_pending.configure( this,1,9,"RO",1,0,1,1,1);

    reserved0=uvm_reg_field::type_id::create("reserved0");
    reserved0.configure( this,6,10,"RO",0,0,1,1,1);

    gen_fsm=uvm_reg_field::type_id::create("gen_fsm");
    gen_fsm.configure( this,2,16,"RO",1,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,14,18,"RO",0,0,1,1,1);//
  endfunction
endclass

class port_status extends uvm_reg;
 `uvm_object_utils(port_status)
  rand uvm_reg_field port0_level;
  rand uvm_reg_field port1_level;
  rand uvm_reg_field port2_level;
  rand uvm_reg_field port3_level;

  function new( string name="port_status");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    port0_level=uvm_reg_field::type_id::create("port0_level");
    port0_level.configure( this,8,0,"RO",1,0,1,1,1);

    port1_level=uvm_reg_field::type_id::create("port1_level");
    port1_level.configure( this,8,8,"RO",1,0,1,1,1);

    port2_level=uvm_reg_field::type_id::create("port2_level");
    port2_level.configure( this,8,16,"RO",1,0,1,1,1);

    port3_level=uvm_reg_field::type_id::create("port3_level");
    port3_level.configure( this,8,24,"RO",1,0,1,1,1);
  endfunction
endclass

class gen_status extends uvm_reg;
 `uvm_object_utils(gen_status)
  rand uvm_reg_field running;
  rand uvm_reg_field done;
  rand uvm_reg_field fsm;
  rand uvm_reg_field reserved0;
  rand uvm_reg_field remaining;
  rand uvm_reg_field reserved;

  function new( string name="gen_status");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    running=uvm_reg_field::type_id::create("running");
    running.configure( this,1,0,"RO",1,0,1,1,1);

    done=uvm_reg_field::type_id::create("done");
    done.configure( this,1,1,"RO",1,0,1,1,1);

    fsm=uvm_reg_field::type_id::create("fsm");
    fsm.configure( this,2,2,"RO",1,0,1,1,1);

    reserved0=uvm_reg_field::type_id::create("reserved0");
    reserved0.configure( this,4,4,"RO",0,0,1,1,1);

    remaining=uvm_reg_field::type_id::create("remaining");
    remaining.configure( this,16,8,"RO",1,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,8,24,"RO",0,0,1,1,1);//
  endfunction
endclass

class stat_rx extends uvm_reg;
 `uvm_object_utils(stat_rx)
  rand uvm_reg_field rx_packets;
  rand uvm_reg_field reserved;
  
  function new( string name="stat_rx");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    rx_packets=uvm_reg_field::type_id::create("rx_packets");
    rx_packets.configure( this,16,0,"RO",1,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,16,16,"RO",0,0,1,1,1);//
  endfunction
endclass

class stat_tx extends uvm_reg;
 `uvm_object_utils(stat_tx)
  rand uvm_reg_field tx_packets;
  rand uvm_reg_field reserved;
  
  function new( string name="stat_tx");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    tx_packets=uvm_reg_field::type_id::create("tx_packets");
    tx_packets.configure( this,16,0,"RO",1,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,16,16,"RO",0,0,1,1,1);//
  endfunction
endclass

class stat_drop extends uvm_reg;
 `uvm_object_utils(stat_drop)
  rand uvm_reg_field dropped_packets;
  rand uvm_reg_field reserved;  

  function new( string name="stat_drop");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    dropped_packets=uvm_reg_field::type_id::create("dropped_packets");
    dropped_packets.configure( this,16,0,"RO",1,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,16,16,"RO",0,0,1,1,1);//
  endfunction
endclass

class switch_ctrl extends uvm_reg;
 `uvm_object_utils(switch_ctrl)
  rand uvm_reg_field enable;
  rand uvm_reg_field stat_clear;
  rand uvm_reg_field reserved0;
  rand uvm_reg_field irq_global_en;
  rand uvm_reg_field reserved;

  function new( string name="switch_ctrl");
    super.new(name,32,UVM_NO_COVERAGE);   
  endfunction
  
  function void build;
    enable=uvm_reg_field::type_id::create("enable");
    enable.configure( this,1,0,"RW",0,0,1,1,1);

    stat_clear=uvm_reg_field::type_id::create("stat_clear");
    stat_clear.configure( this,1,1,"WO",0,0,1,1,1);

    reserved0=uvm_reg_field::type_id::create("reserved0");
    reserved0.configure( this,1,2,"RO",0,0,1,1,1);

    irq_global_en=uvm_reg_field::type_id::create("irq_global_en");
    irq_global_en.configure( this,1,3,"RW",0,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,28,4,"RO",0,0,1,1,1);
  endfunction
endclass

class port_enable extends uvm_reg;
 `uvm_object_utils(port_enable)
  rand uvm_reg_field port3_en;
  rand uvm_reg_field port2_en;
  rand uvm_reg_field port1_en;
  rand uvm_reg_field port0_en;
  rand uvm_reg_field reserved;

  function new( string name="port_enable");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  

  function void build;
    port0_en=uvm_reg_field::type_id::create("port0_en");
    port0_en.configure( this,1,0,"RW",0,1,1,1,1);

    port1_en=uvm_reg_field::type_id::create("port1_en");
    port1_en.configure( this,1,1,"RW",0,1,1,1,1);

    port2_en=uvm_reg_field::type_id::create("port2_en");
    port2_en.configure( this,1,2,"RW",0,1,1,1,1);

    port3_en=uvm_reg_field::type_id::create("port3_en");
    port3_en.configure( this,1,3,"RW",0,1,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,28,4,"RO",0,0,1,1,1);
  endfunction
endclass

class fwd_enable extends uvm_reg;
 `uvm_object_utils(fwd_enable)
  rand uvm_reg_field fwd3_en;
  rand uvm_reg_field fwd2_en;
  rand uvm_reg_field fwd1_en;
  rand uvm_reg_field fwd0_en;
  rand uvm_reg_field reserved;

  function new( string name="fwd_enable");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction


  
  function void build;
    fwd0_en=uvm_reg_field::type_id::create("fwd0_en");
    fwd0_en.configure( this,1,0,"RW",0,1,1,1,1);

    fwd1_en=uvm_reg_field::type_id::create("fwd1_en");
    fwd1_en.configure( this,1,1,"RW",0,1,1,1,1);

    fwd2_en=uvm_reg_field::type_id::create("fwd2_en");
    fwd2_en.configure( this,1,2,"RW",0,1,1,1,1);

    fwd3_en=uvm_reg_field::type_id::create("fwd3_en");
    fwd3_en.configure( this,1,3,"RW",0,1,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,28,4,"RO",0,0,1,1,1);//
  endfunction
endclass

class gen_ctrl extends uvm_reg;
 `uvm_object_utils(gen_ctrl)
  rand uvm_reg_field enable;
  rand uvm_reg_field start;
  rand uvm_reg_field stop;
  rand uvm_reg_field continuous;
  rand uvm_reg_field reserved;

  function new( string name="gen_ctrl");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  
  function void build;
    enable=uvm_reg_field::type_id::create("enable");
    enable.configure( this,1,0,"RW",0,0,1,1,1);

    start=uvm_reg_field::type_id::create("start");
    start.configure( this,1,1,"WO",0,0,1,1,1);

    stop=uvm_reg_field::type_id::create("stop");
    stop.configure( this,1,2,"WO",0,0,1,1,1);

    continuous=uvm_reg_field::type_id::create("continuous");
    continuous.configure( this,1,3,"RW",0,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,28,4,"RO",0,0,1,1,1);//
  endfunction
endclass

class gen_pkt_cfg extends uvm_reg;
  `uvm_object_utils(gen_pkt_cfg)
  rand uvm_reg_field dst_port;
  rand uvm_reg_field src_port;
  rand uvm_reg_field reserved0;
  rand uvm_reg_field length;
  rand uvm_reg_field seed;
  rand uvm_reg_field reserved;
  
  function new( string name="gen_pkt_cfg");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    dst_port=uvm_reg_field::type_id::create("dst_port");
    dst_port.configure( this,2,0,"RW",0,1,1,1,1);

    src_port=uvm_reg_field::type_id::create("src_port");
    src_port.configure( this,2,2,"RW",0,0,1,1,1);

    reserved0=uvm_reg_field::type_id::create("reserved0");
    reserved0.configure( this,4,4,"RO",0,0,1,1,1);

    length=uvm_reg_field::type_id::create("length");
    length.configure( this,8,8,"RW",0,4,1,1,1);

    seed=uvm_reg_field::type_id::create("seed");
    seed.configure( this,8,16,"RW",0,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,8,24,"RO",0,0,1,1,1);//
  endfunction
endclass

class gen_interval extends uvm_reg;
 `uvm_object_utils(gen_interval)
  rand uvm_reg_field interval;
  rand uvm_reg_field reserved;
  
  function new( string name="gen_interval");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    interval=uvm_reg_field::type_id::create("interval");
    interval.configure( this,16,0,"RW",0,2,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,16,16,"RO",0,0,1,1,1);
  endfunction
endclass

class gen_count extends uvm_reg;
 `uvm_object_utils(gen_count)
  rand uvm_reg_field reserved;
  rand uvm_reg_field packet_count;
  
  function new( string name="gen_count");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  
  function void build;
    packet_count=uvm_reg_field::type_id::create("packet_count");
    packet_count.configure( this,16,0,"RW",0,4,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,16,16,"RO",0,0,1,1,1);
  endfunction
endclass

class irq_status extends uvm_reg;
 `uvm_object_utils(irq_status)
  rand uvm_reg_field gen_done;
  rand uvm_reg_field error;
  rand uvm_reg_field queue_overflow;
  rand uvm_reg_field packet_dropped;
  rand uvm_reg_field packet_forwarded;
  rand uvm_reg_field queue_almost_full;
  rand uvm_reg_field start_ack;
  rand uvm_reg_field sw_event;
  rand uvm_reg_field reserved;

  function new( string name="irq_status");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    gen_done=uvm_reg_field::type_id::create("gen_done");
    gen_done.configure( this,1,0,"W1C",0,0,1,1,1);///////////////////////////reset

    error=uvm_reg_field::type_id::create("error");////////////
    error.configure( this,1,1,"W1C",0,0,1,1,1);

    queue_overflow=uvm_reg_field::type_id::create("queue_overflow");
    queue_overflow.configure( this,1,2,"W1C",0,0,1,1,1);

    packet_dropped=uvm_reg_field::type_id::create("packet_dropped");
    packet_dropped.configure( this,1,3,"W1C",0,0,1,1,1);

    packet_forwarded=uvm_reg_field::type_id::create("packet_forwarded");
    packet_forwarded.configure( this,1,4,"W1C",0,0,1,1,1);
   
    queue_almost_full=uvm_reg_field::type_id::create("queue_almost_full");
    queue_almost_full.configure( this,1,5,"W1C",0,0,1,1,1);

    start_ack=uvm_reg_field::type_id::create("start_ack");
    start_ack.configure( this,1,6,"W1C",0,0,1,1,1);

    sw_event=uvm_reg_field::type_id::create("sw_event");
    sw_event.configure( this,1,7,"W1C",0,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,24,8,"RO",0,0,1,1,1);
  endfunction
endclass

class irq_enable extends uvm_reg;
 `uvm_object_utils(irq_enable)
  rand uvm_reg_field gen_done_en;
  rand uvm_reg_field error_en;
  rand uvm_reg_field overflow_en;
  rand uvm_reg_field packet_drop_en;
  rand uvm_reg_field packet_fwd_en;
  rand uvm_reg_field queue_af_en;
  rand uvm_reg_field start_ack_en;
  rand uvm_reg_field sw_event_en;
  rand uvm_reg_field reserved;

  function new( string name="irq_enable");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    gen_done_en=uvm_reg_field::type_id::create("gen_done_en");
    gen_done_en.configure( this,1,0,"RW",0,0,1,1,1);

    error_en=uvm_reg_field::type_id::create("error_en");
    error_en.configure( this,1,1,"RW",0,0,1,1,1);

    overflow_en=uvm_reg_field::type_id::create("overflow_en");
    overflow_en.configure( this,1,2,"RW",0,0,1,1,1);

    packet_drop_en=uvm_reg_field::type_id::create("packet_drop_en");
    packet_drop_en.configure( this,1,3,"RW",0,0,1,1,1);

    packet_fwd_en=uvm_reg_field::type_id::create("packet_fwd_en");
    packet_fwd_en.configure( this,1,4,"RW",0,0,1,1,1);
   
    queue_af_en=uvm_reg_field::type_id::create("queue_af_en");
    queue_af_en.configure( this,1,5,"RW",0,0,1,1,1);

    start_ack_en=uvm_reg_field::type_id::create("start_ack_en");
    start_ack_en.configure( this,1,6,"RW",0,0,1,1,1);

    sw_event_en=uvm_reg_field::type_id::create("sw_event_en");
    sw_event_en.configure( this,1,7,"RW",0,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,24,8,"RO",0,0,1,1,1);
  endfunction
endclass

class irq_force extends uvm_reg;
 `uvm_object_utils(irq_force)
  rand uvm_reg_field reserved;
  rand uvm_reg_field forced;
  
  function new( string name="irq_force");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,24,8,"RO",0,0,1,1,1);

    forced=uvm_reg_field::type_id::create("forced");
    forced.configure( this,8,0,"WO",0,0,1,1,1);
  endfunction
endclass

class err_enable extends uvm_reg;
 `uvm_object_utils(err_enable)
  rand uvm_reg_field bus_en;
  rand uvm_reg_field dest_en;
  rand uvm_reg_field overflow_en;
  rand uvm_reg_field undersize_en;
  rand uvm_reg_field protocol_en;
  rand uvm_reg_field crc_en;
  rand uvm_reg_field length_en;
  rand uvm_reg_field injected_en;
  rand uvm_reg_field reserved;

  function new( string name="err_enable");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    bus_en=uvm_reg_field::type_id::create("bus_en");
    bus_en.configure( this,1,0,"RW",0,0,1,1,1);

    dest_en=uvm_reg_field::type_id::create("dest_en");
    dest_en.configure( this,1,1,"RW",0,0,1,1,1);

    overflow_en=uvm_reg_field::type_id::create("overflow_en");
    overflow_en.configure( this,1,2,"RW",0,0,1,1,1);

    undersize_en=uvm_reg_field::type_id::create("undersize_en");
    undersize_en.configure( this,1,3,"RW",0,0,1,1,1);

    protocol_en=uvm_reg_field::type_id::create("protocol_en");
    protocol_en.configure( this,1,4,"RW",0,0,1,1,1);
   
    crc_en=uvm_reg_field::type_id::create("crc_en");
    crc_en.configure( this,1,5,"RW",0,0,1,1,1);

    length_en=uvm_reg_field::type_id::create("length_en");
    length_en.configure( this,1,6,"RW",0,0,1,1,1);

    injected_en=uvm_reg_field::type_id::create("injected_en");
    injected_en.configure( this,1,7,"RW",0,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,24,8,"RO",0,0,1,1,1);
  endfunction
endclass

class err_status extends uvm_reg;
 `uvm_object_utils(err_status)
  rand uvm_reg_field bus_error;
  rand uvm_reg_field dest_error;
  rand uvm_reg_field queue_overflow;
  rand uvm_reg_field undersize;
  rand uvm_reg_field protocol_error;
  rand uvm_reg_field crc_error;
  rand uvm_reg_field length_error;
  rand uvm_reg_field injected;
  rand uvm_reg_field reserved;

  function new( string name="err_status");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    bus_error=uvm_reg_field::type_id::create("bus_error");
    bus_error.configure( this,1,0,"W1C",0,0,1,1,1);

    dest_error=uvm_reg_field::type_id::create("dest_error");
    dest_error.configure( this,1,1,"W1C",0,0,1,1,1);

    queue_overflow=uvm_reg_field::type_id::create("queue_overflow");
    queue_overflow.configure( this,1,2,"W1C",0,0,1,1,1);

    undersize=uvm_reg_field::type_id::create("undersize");
    undersize.configure( this,1,3,"W1C",0,0,1,1,1);

    protocol_error=uvm_reg_field::type_id::create("protocol_error");
    protocol_error.configure( this,1,4,"W1C",0,0,1,1,1);
   
    crc_error=uvm_reg_field::type_id::create("crc_error");
    crc_error.configure( this,1,5,"W1C",0,0,1,1,1);

    length_error=uvm_reg_field::type_id::create("length_error");
    length_error.configure( this,1,6,"W1C",0,0,1,1,1);

    injected=uvm_reg_field::type_id::create("injected");
    injected.configure( this,1,7,"W1C",0,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,24,8,"W1C",0,0,1,1,1);
  endfunction
endclass

class err_inject extends uvm_reg;
 `uvm_object_utils(err_inject)
  rand uvm_reg_field bus;
  rand uvm_reg_field dest;
  rand uvm_reg_field overflow;
  rand uvm_reg_field undersize;
  rand uvm_reg_field protocol;
  rand uvm_reg_field crc;
  rand uvm_reg_field length;
  rand uvm_reg_field injected;
  rand uvm_reg_field reserved;
  rand uvm_reg_field clear_count;

  function new( string name="err_inject");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    bus=uvm_reg_field::type_id::create("bus");
    bus.configure( this,1,0,"WO",0,0,1,1,1);

    dest=uvm_reg_field::type_id::create("dest");
    dest.configure( this,1,1,"WO",0,0,1,1,1);

    overflow=uvm_reg_field::type_id::create("overflow");
    overflow.configure( this,1,2,"WO",0,0,1,1,1);

    undersize=uvm_reg_field::type_id::create("undersize");
    undersize.configure( this,1,3,"WO",0,0,1,1,1);

    protocol=uvm_reg_field::type_id::create("protocol");
    protocol.configure( this,1,4,"WO",0,0,1,1,1);
   
    crc=uvm_reg_field::type_id::create("crc");
    crc.configure( this,1,5,"WO",0,0,1,1,1);

    length=uvm_reg_field::type_id::create("length");
    length.configure( this,1,6,"WO",0,0,1,1,1);

    injected=uvm_reg_field::type_id::create("injected");
    injected.configure( this,1,7,"WO",0,0,1,1,1);

    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,23,8,"RO",0,0,1,1,1);

    clear_count=uvm_reg_field::type_id::create("clear_count");
    clear_count.configure( this,1,31,"WO",0,0,1,1,1);
  endfunction
endclass

class err_count extends uvm_reg;
 `uvm_object_utils(err_count)
  rand uvm_reg_field reserved;
  rand uvm_reg_field error_count;

  function new( string name="err_count");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,16,16,"RO",0,0,1,1,1);

    error_count=uvm_reg_field::type_id::create("error_count");
    error_count.configure( this,16,0,"RO",0,0,1,1,1);
  endfunction
endclass

class err_info extends uvm_reg;
 `uvm_object_utils(err_info)

  rand uvm_reg_field last_code;
  rand uvm_reg_field source;
  rand uvm_reg_field dest_port;
  rand uvm_reg_field reserved;
  rand uvm_reg_field tx_snapshot;
  
  function new( string name="err_info");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    last_code=uvm_reg_field::type_id::create("last_code");//////
    last_code.configure( this,8,0,"RO",1,0,1,1,1);

    source=uvm_reg_field::type_id::create("source");/////////////////////////////////////
    source.configure( this,8,8,"RO",1,0,1,1,1);

    dest_port=uvm_reg_field::type_id::create("dest_port");
    dest_port.configure( this,2,16,"RO",1,0,1,1,1);
    
    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,2,18,"RO",0,0,1,1,1);

    tx_snapshot=uvm_reg_field::type_id::create("tx_snapshot");
    tx_snapshot.configure( this,12,20,"RO",1,0,1,1,1);
  endfunction
endclass

class lock extends uvm_reg;
 `uvm_object_utils(lock)
  rand uvm_reg_field reserved;
  rand uvm_reg_field locked;
  
  function new( string name="lock");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,31,1,"WO",0,0,1,1,1);

    locked=uvm_reg_field::type_id::create("locked");
    locked.configure( this,1,0,"RO",0,1,1,1,1);
  endfunction
endclass

class soft_reset extends uvm_reg;
 `uvm_object_utils(soft_reset)
  rand uvm_reg_field reserved;
  rand uvm_reg_field pulse;
  
  function new( string name="soft_reset");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    reserved=uvm_reg_field::type_id::create("reserved");
    reserved.configure( this,31,1,"RO",0,0,1,1,1);

    pulse=uvm_reg_field::type_id::create("pulse");
    pulse.configure( this,1,0,"WO",0,0,1,1,1);
  endfunction
endclass


