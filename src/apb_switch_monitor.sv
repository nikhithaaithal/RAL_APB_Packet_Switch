class apb_switch_monitor extends uvm_monitor;
 `uvm_component_utils(apb_switch_monitor)

  virtual switch_inf vif;
  uvm_analysis_port #(seq_item)mon_port;
  seq_item tr;

  function new(string name="apb_switch_monitor",uvm_component parent);
   super.new(name,parent);
   cg = new(); 
  endfunction

 function void build_phase(uvm_phase phase);
  super.build_phase(phase);
   if(!uvm_config_db#(virtual switch_inf)::get(this,"","vif",vif))
    `uvm_fatal(get_type_name(),"Unable to get interface handle in monitor")
     mon_port=new("mon_port",this);
 endfunction
  
  covergroup cg;
  option.per_instance = 1;
  c1  : coverpoint tr.paddr { bins dev_id       = {32'h00}; }
  c2  : coverpoint tr.paddr { bins ver_id       = {32'h04}; }
  c3  : coverpoint tr.paddr { bins switch_id    = {32'h08}; }
  c4  : coverpoint tr.paddr { bins port_id      = {32'h0C}; }
  c5  : coverpoint tr.paddr { bins gen_id       = {32'h10}; }
  c6  : coverpoint tr.paddr { bins stat_rx_id   = {32'h14}; }
  c7  : coverpoint tr.paddr { bins stat_tx_id   = {32'h18}; }
  c8  : coverpoint tr.paddr { bins stat_drop_id = {32'h1C}; }
  c9  : coverpoint tr.pwdata[3:0] iff (tr.paddr == 32'h20 && tr.pwrite)
  {
  wildcard bins enable_0   = {4'b???0};
  wildcard bins enable_1   = {4'b???1};
  wildcard bins stat_clr_0 = {4'b??0?};
  wildcard bins stat_clr_1 = {4'b??1?};
  wildcard bins irq_0      = {4'b0???};
  wildcard bins irq_1      = {4'b1???};
  }
  c10 : coverpoint tr.pwdata[3:0] iff (tr.paddr == 32'h24)
  {
    bins all_disabled = {4'h0};
    bins partial_en   = {[4'h1:4'hE]};
    bins all_enabled  = {4'hF};
  }
  c11 : coverpoint tr.pwdata[3:0] iff (tr.paddr == 32'h28)
  {
    bins all_blocked = {4'h0};
    bins partial_fwd = {[4'h1:4'hE]};
    bins all_fwd     = {4'hF};
  }
    c13 : coverpoint tr.pwdata[3:0] iff (tr.paddr == 32'h2C && tr.pwrite)
  {
    wildcard bins enable_0    = {4'b???0};
    wildcard bins enable_1    = {4'b???1};
    wildcard bins start_0     = {4'b??0?};
    wildcard bins start_1     = {4'b??1?};
    wildcard bins stop_0      = {4'b?0??};
    wildcard bins stop_1      = {4'b?1??};
    wildcard bins continous_0 = {4'b0???};
    wildcard bins continous_1 = {4'b1???};
  }
  c14 : coverpoint tr.pwdata[23:0] iff (tr.paddr == 32'h30)
  {
    bins seed     = {0,4,65536,131072,196608,262144,327680,458752,524288,589824,655360,720896};
    bins length   = {0,6,4,256,512,768,1024,1280,1792,2048,2304,2816,3840,3328,1536};
    bins src_port = {0,4,8,12};
    bins dst_port = {0,1,2,3};
  }
  c15 : coverpoint tr.pwdata[15:0] iff (tr.paddr == 32'h34) { bins interval = {[0:32768]}; }
  c16 : coverpoint tr.pwdata[15:0] iff (tr.paddr == 32'h38) { bins packet_count = {[0:32768]}; }
  c17 : coverpoint tr.pwdata[7:0] iff (tr.paddr == 32'h3C) { bins irq_st = {[0:128]}; }
  c18 : coverpoint tr.pwdata[7:0] iff (tr.paddr == 32'h40 && tr.pwrite)
  {
    wildcard bins gen_done_en_0 = {8'b???????0};
    wildcard bins gen_done_en_1 = {8'b???????1};
    wildcard bins err_en_0      = {8'b??????0?};
    wildcard bins err_en_1      = {8'b??????1?};
    wildcard bins oflow_en_0    = {8'b?????0??};
    wildcard bins oflow_en_1    = {8'b?????1??};
    wildcard bins pkt_drp_en_0  = {8'b????0???};
    wildcard bins pkt_drp_en_1  = {8'b????1???};
    wildcard bins pkt_fwd_en_0  = {8'b???0????};
    wildcard bins pkt_fwd_en_1  = {8'b???1????};
    wildcard bins q_af_en_0     = {8'b??0?????};
    wildcard bins q_af_en_1     = {8'b??1?????};
    wildcard bins stat_ack_en_0 = {8'b?0??????};
    wildcard bins stat_ack_en_1 = {8'b?1??????};
    wildcard bins sw_event_en_0 = {8'b0???????};
    wildcard bins sw_event_en_1 = {8'b1???????};
  }
  c19 : coverpoint tr.pwdata[7:0] iff (tr.paddr == 32'h44) { bins force_q = {[0:128]}; }
   c20 : coverpoint tr.pwdata[7:0] iff (tr.paddr == 32'h48 && tr.pwrite)
  {
    wildcard bins bus_err_0   = {8'b???????0};
    wildcard bins bus_err_1   = {8'b???????1};
    wildcard bins dest_err_0  = {8'b??????0?};
    wildcard bins dest_err_1  = {8'b??????1?};
    wildcard bins q_of_0      = {8'b?????0??};
    wildcard bins q_of_1      = {8'b?????1??};
    wildcard bins undersize_0 = {8'b????0???};
    wildcard bins undersize_1 = {8'b????1???};
    wildcard bins p_err_0     = {8'b???0????};
    wildcard bins p_err_1     = {8'b???1????};
    wildcard bins crc_err_0   = {8'b??0?????};
    wildcard bins crc_err_1   = {8'b??1?????};
    wildcard bins l_err_0     = {8'b?0??????};
    wildcard bins l_err_1     = {8'b?1??????};
    wildcard bins injected_0  = {8'b0???????};
    wildcard bins injected_1  = {8'b1???????};
  }
 c21 : coverpoint tr.pwdata[7:0] iff (tr.paddr == 32'h4C && tr.pwrite)
 {
  wildcard bins bus_en_0       = {8'b???????0};
  wildcard bins bus_en_1       = {8'b???????1};
  wildcard bins dest_en_0      = {8'b??????0?};
  wildcard bins dest_en_1      = {8'b??????1?};
  wildcard bins q_en_0         = {8'b?????0??};
  wildcard bins q_en_1         = {8'b?????1??};
  wildcard bins undersize_en_0 = {8'b????0???};
  wildcard bins undersize_en_1 = {8'b????1???};
  wildcard bins p_en_0         = {8'b???0????};
  wildcard bins p_en_1         = {8'b???1????};
  wildcard bins crc_en_0       = {8'b??0?????};
  wildcard bins crc_en_1       = {8'b??1?????};
  wildcard bins l_en_0         = {8'b?0??????};
  wildcard bins l_en_1         = {8'b?1??????};
  wildcard bins injected_en_0  = {8'b0???????};
  wildcard bins injected_en_1  = {8'b1???????};
 }
  c22 : coverpoint tr.pwdata[7:0] iff (tr.paddr == 32'h50 && tr.pwrite)
  {
    wildcard bins bus_0       = {8'b???????0};
    wildcard bins bus_1       = {8'b???????1};
    wildcard bins dest_0      = {8'b??????0?};
    wildcard bins dest_1      = {8'b??????1?};
    wildcard bins q_0         = {8'b?????0??};
    wildcard bins q_1         = {8'b?????1??};
    wildcard bins undersize_0 = {8'b????0???};
    wildcard bins undersize_1 = {8'b????1???};
    wildcard bins p_0         = {8'b???0????};
    wildcard bins p_1         = {8'b???1????};
    wildcard bins crc_0       = {8'b??0?????};
    wildcard bins crc_1       = {8'b??1?????};
    wildcard bins l_0         = {8'b?0??????};
    wildcard bins l_1         = {8'b?1??????};
    wildcard bins injected_0  = {8'b0???????};
    wildcard bins injected_1  = {8'b1???????};
  }
  c22_clr : coverpoint tr.pwdata[31] iff (tr.paddr == 32'h50 && tr.pwrite)
  {
    bins clr_cnt_0 = {0};
    bins clr_cnt_1 = {1};
  }
  c23 : coverpoint tr.paddr { bins err_count = {32'h54}; }
  c24 : coverpoint tr.paddr { bins err_info  = {32'h58}; }
  c25 : coverpoint tr.pwdata[31:0] iff (tr.paddr == 32'h5C) { bins unlock = {32'hA5A5_C3C3}; }
  c26 : coverpoint tr.pwdata[0] iff (tr.paddr == 32'h60) { bins reset_pulse[] = {0,1}; }
endgroup
  
 task run_phase(uvm_phase phase);

  forever begin
    repeat(3) @(posedge vif.pclk);
      tr=seq_item::type_id::create("tr");
      tr.pwrite=vif.pwrite;
      tr.paddr=vif.paddr;
      tr.pwdata=vif.pwdata;
      tr.psel=vif.psel;
      tr.penable=vif.penable;
      tr.pready=vif.pready;
      tr.pslverr=vif.pslverr;
      tr.irq=vif.irq;
      tr.prdata=vif.prdata;
        cg.sample();
      mon_port.write(tr);
    //`uvm_info("MON",$sformatf("prdata=%0h  irq=%0h  pslverr=%0h psel=%0h penable=%0h paddr=%0h pwrite=%0d", tr.prdata,tr.irq,tr.pslverr,tr.psel,tr.penable, tr.paddr, tr.pwrite),UVM_NONE)
   end
    $display("COVERAGE = %0.2f %%", cg.get_inst_coverage());
 endtask
endclass
      
  
