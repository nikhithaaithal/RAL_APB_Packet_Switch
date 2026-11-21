
class apb_switch_sequence extends uvm_sequence#(seq_item);
  `uvm_object_utils(apb_switch_sequence)
   register_block regblock;
   bit [31:0]des,mir,rx,tx,drop,s;
   int timeout_count;
    function new(string name="apb_switch_sequence");
      super.new(name);
    endfunction
  task body();
    uvm_status_e status;
    regblock.r24.write(status,32'hA5A5C3C3);
    
    regblock.r10.write(status,32'h0000000F);
    des=regblock.r10.get();
    mir=regblock.r10.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Write-> Des:%0h Mir:%0h",des,mir),UVM_NONE)
     
    regblock.r11.write(status,32'h0000000F);
    des=regblock.r11.get();
    mir=regblock.r11.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Write-> Des:%0h Mir:%0h",des,mir),UVM_NONE)
    
    regblock.r9.write(status,32'h00000009);
    des=regblock.r9.get();
    mir=regblock.r9.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Write-> Des:%0h Mir:%0h",des,mir),UVM_NONE)
    
    regblock.r13.write(status,32'h00100401);
    des=regblock.r13.get();
    mir=regblock.r13.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Write-> Des:%0h Mir:%0h",des,mir),UVM_NONE)
     
    regblock.r14.write(status,32'h00000002);
    des=regblock.r14.get();
    mir=regblock.r14.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Write-> Des:%0h Mir:%0h",des,mir),UVM_NONE)
     
    regblock.r15.write(status,32'h00000004);
    des=regblock.r15.get();
    mir=regblock.r15.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Write-> Des:%0h Mir:%0h",des,mir),UVM_NONE)
     
    regblock.r17.write(status,32'h00000041);
    des=regblock.r17.get();
    mir=regblock.r17.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Write-> Des:%0h Mir:%0h",des,mir),UVM_NONE)
     
    regblock.r12.write(status,32'h00000003);
    des=regblock.r12.get();
    mir=regblock.r12.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Write-> Des:%0h Mir:%0h",des,mir),UVM_NONE)
    
    timeout_count =0;
    
    do begin
      regblock.r5.read(status, s);
            timeout_count++;
    end while (s[1] !== 1'b1 && timeout_count < 200);
    
    regblock.r6.read(status,rx);
    des=regblock.r6.get();
    mir=regblock.r6.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Read-> Des:%0d Mir:%0h stat_rx:%0h",des,mir,rx),UVM_NONE)
     
    regblock.r7.read(status,tx);
    des=regblock.r7.get();
    mir=regblock.r7.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Read-> Des:%0h Mir:%0h stat_tx:%0h",des,mir,tx),UVM_NONE)
     
    regblock.r8.read(status,drop);
    des=regblock.r8.get();
    mir=regblock.r8.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Read-> Des:%0h Mir:%0h drop:%0h",des,mir,drop),UVM_NONE)
    
    regblock.r5.read(status,s);
    des=regblock.r5.get();
    mir=regblock.r5.get_mirrored_value();
    `uvm_info("SEQ",$sformatf("Read-> Des:%0h Mir:%0h gen_status:%0h",des,mir,s),UVM_NONE)

  endtask
endclass

class lock_enable_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(lock_enable_seq)
   register_block regblock;  
    bit [31:0]s;
   int timeout_count;
  
   function new(string name="lock_enable_seq");
     super.new(name);
   endfunction
  
  task body();
    uvm_status_e status;
    regblock.r24.write(status,32'h5A5AC3C3);
    regblock.r9.write(status,32'h00000001);
    regblock.r9.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> switch_ctrl:%0h",s),UVM_NONE)
    regblock.r10.write(status,32'h0000000A);
    regblock.r10.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> port_enb:%0h",s),UVM_NONE)
    regblock.r11.write(status,32'h00000001);
    regblock.r11.read(status,s);
    `uvm_info("SEQ",$sformatf("Read->  fwd_enb:%0h",s),UVM_NONE)
    regblock.r12.write(status,32'h00000001);
    regblock.r12.read(status,s);
     `uvm_info("SEQ",$sformatf("Read->  gen_ctrl:%0h",s),UVM_NONE)
    regblock.r13.write(status,32'h00000001);
    regblock.r13.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_pkt_cfg:%0h",s),UVM_NONE)
    regblock.r14.write(status,32'h00000001);
    regblock.r14.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_inv:%0h",s),UVM_NONE)
    regblock.r15.write(status,32'h00000001);
    regblock.r15.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_count:%0h",s),UVM_NONE)
    regblock.r17.write(status,32'h00000001);
    regblock.r17.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> irq_enb:%0h",s),UVM_NONE)
    regblock.r20.write(status,32'h00000001);
    regblock.r20.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_enb:%0h",s),UVM_NONE)
  endtask
endclass



class unlock_enable_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(unlock_enable_seq)
   register_block regblock;  
    bit [31:0]s;
   int timeout_count;
  
   function new(string name="unlock_enable_seq");
     super.new(name);
   endfunction
  
  task body();
    uvm_status_e status;
    regblock.r24.write(status,32'hA5A5C3C3);
    regblock.r9.write(status,32'h00000004);
    regblock.r9.read(status,s);//
    `uvm_info("SEQ",$sformatf("Read-> switch_ctrl:%0h",s),UVM_NONE)    
    regblock.r10.write(status,32'h0000000A);
    regblock.r10.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> port_enb:%0h",s),UVM_NONE)
    regblock.r11.write(status,32'h00000001);
    regblock.r11.read(status,s);
    `uvm_info("SEQ",$sformatf("Read->  fwd_enb:%0h",s),UVM_NONE)
    regblock.r12.write(status,32'h00000001);
    regblock.r12.read(status,s);
     `uvm_info("SEQ",$sformatf("Read->  gen_ctrl:%0h",s),UVM_NONE)
    regblock.r13.write(status,32'h00000003);//
    regblock.r13.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_pkt_cfg:%0h",s),UVM_NONE)
    regblock.r14.write(status,32'h00000001);
    regblock.r14.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_inv:%0h",s),UVM_NONE)
    regblock.r15.write(status,32'h00000006);
    regblock.r15.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_count:%0h",s),UVM_NONE)
    regblock.r17.write(status,32'h00000001);
    regblock.r17.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> irq_enb:%0h",s),UVM_NONE)
    regblock.r20.write(status,32'h00000001);
    regblock.r20.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_enb:%0h",s),UVM_NONE)
  endtask
endclass


class clear_stat_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(clear_stat_seq)
   register_block regblock;  
  bit [31:0]rx,tx,drop,s;
   int timeout_count;
  
   function new(string name="clear_stat_seq");
     super.new(name);
   endfunction
  
 task body();
    uvm_status_e status;
    regblock.r24.write(status,32'hA5A5C3C3);  
    regblock.r10.write(status,32'h0000000F);
    regblock.r11.write(status,32'h0000000F);
    regblock.r9.write(status,32'h00000009);
    regblock.r13.write(status,32'h00100401);
    regblock.r14.write(status,32'h00000002);
    regblock.r15.write(status,32'h00000003);
    regblock.r17.write(status,32'h00000041);
    regblock.r12.write(status,32'h00000003);
    timeout_count =0;
    
    do begin
      regblock.r5.read(status, s);
            timeout_count++;
    end while (s[1] !== 1'b1 && timeout_count < 200);
    
    regblock.r6.read(status,rx);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",rx),UVM_NONE)
    regblock.r7.read(status,tx);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",tx),UVM_NONE)
    regblock.r8.read(status,drop);
    `uvm_info("SEQ",$sformatf("Read-> drop:%0h",drop),UVM_NONE)
    regblock.r5.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_status:%0h",s),UVM_NONE)
    regblock.r9.write(status,32'h00000002); 
   timeout_count =0;
    do begin
      regblock.r5.read(status, s);
            timeout_count++;
    end while (s[1] !== 1'b1 && timeout_count < 200);
     regblock.r6.read(status,rx);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",rx),UVM_NONE)  
    regblock.r7.read(status,tx);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",tx),UVM_NONE)
  endtask
endclass


class soft_rst extends uvm_sequence#(seq_item);
  `uvm_object_utils(soft_rst)
   register_block regblock;  
   bit [31:0]des,mir,rx,tx,drop,s;
   int timeout_count;
  
   function new(string name="soft_rst");
     super.new(name);
   endfunction
  
   task body();
     uvm_status_e status;
     regblock.r24.write(status,32'hA5A5C3C3);
     regblock.r10.write(status,32'h0000000F);
     regblock.r11.write(status,32'h0000000F);
     regblock.r9.write(status,32'h00000009);
     regblock.r13.write(status,32'h00100401);
     regblock.r14.write(status,32'h00000002);
     regblock.r15.write(status,32'h00000003);
     regblock.r17.write(status,32'h00000041);
     regblock.r12.write(status,32'h00000003);
     timeout_count =0;
    
    do begin
      regblock.r5.read(status, s);
            timeout_count++;
    end while (s[1] !== 1'b1 && timeout_count < 200);
     
     regblock.r6.read(status,rx);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",rx),UVM_NONE)
     
    regblock.r7.read(status,tx);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",tx),UVM_NONE)
     
    regblock.r8.read(status,drop);
    `uvm_info("SEQ",$sformatf("Read-> drop:%0h",drop),UVM_NONE)
    
    regblock.r5.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_status:%0h",s),UVM_NONE)
    
    regblock.r6.read(status,des);
    regblock.r25.write(status,32'h00000000);
    regblock.r6.read(status,mir);
    if (des !== mir)
      `uvm_error("SRST0",$sformatf("Zero write to SOFT_RESET changed STAT_RX: %0h -> %0h",des,mir))

    regblock.r25.write(status,32'hFFFFFFFE);
    regblock.r6.read(status,mir);
    if (des !== mir)
      `uvm_error("SRST0",$sformatf("Write FFFFFFFE to SOFT_RESET changed STAT_RX: %0h -> %0h",des,mir))

    regblock.r24.read(status,s);
    if (s[0] !== 1'b0)
      `uvm_error("SRST0","Write with bit0=0 to SOFT_RESET locked the block")

    regblock.r25.write(status,32'h00000001);
     
    regblock.r6.read(status,rx);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",rx),UVM_NONE)
     
    regblock.r7.read(status,tx);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",tx),UVM_NONE)
     
    regblock.r8.read(status,drop);
    `uvm_info("SEQ",$sformatf("Read-> drop:%0h",drop),UVM_NONE)
     
     regblock.r5.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_status:%0h",s),UVM_NONE)
     
     regblock.r9.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> switch_ctrl:%0h",s),UVM_NONE)
    
    regblock.r10.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> port_enb:%0h",s),UVM_NONE)
    
    regblock.r11.read(status,s);
    `uvm_info("SEQ",$sformatf("Read->  fwd_enb:%0h",s),UVM_NONE)
    
    regblock.r12.read(status,s);
     `uvm_info("SEQ",$sformatf("Read->  gen_ctrl:%0h",s),UVM_NONE)
        
    regblock.r13.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_pkt_cfg:%0h",s),UVM_NONE)
            
    regblock.r14.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_inv:%0h",s),UVM_NONE)
                
    regblock.r15.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_count:%0h",s),UVM_NONE)
     
    regblock.r24.read(status,s);
     `uvm_info("SEQ",$sformatf("Read-> lock:%0h",s),UVM_NONE)
     
   endtask
endclass
    
  class continuous_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(continuous_seq)
   register_block regblock;  
    bit [31:0]des,mir,rx,tx,drop,s;
   int timeout_count;
  
   function new(string name="continuous_seq");
     super.new(name);
   endfunction
  
  task body();
     uvm_status_e status;
     regblock.r24.write(status,32'hA5A5C3C3);
     regblock.r10.write(status,32'h0000000F);
     regblock.r11.write(status,32'h0000000F);
     regblock.r9.write(status,32'h00000009);
     regblock.r13.write(status,32'h00100401);
     regblock.r14.write(status,32'h00000002);
     regblock.r15.write(status,32'h00000003);
     regblock.r17.write(status,32'h00000041);
    regblock.r12.write(status,32'h0000000B);
     
     regblock.r6.read(status,rx);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",rx),UVM_NONE)
     
    regblock.r7.read(status,tx);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",tx),UVM_NONE)
     
    regblock.r8.read(status,drop);
    `uvm_info("SEQ",$sformatf("Read-> drop:%0h",drop),UVM_NONE)
    
    regblock.r5.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_status:%0h",s),UVM_NONE)
    
    #1000;
    
     regblock.r6.read(status,rx);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",rx),UVM_NONE)
     
    regblock.r7.read(status,tx);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",tx),UVM_NONE)
     
    regblock.r8.read(status,drop);
    `uvm_info("SEQ",$sformatf("Read-> drop:%0h",drop),UVM_NONE)
    
    regblock.r5.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_status:%0h",s),UVM_NONE)
    
    regblock.r12.write(status,32'h00000000);
    
     regblock.r6.read(status,rx);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",rx),UVM_NONE)
     
    regblock.r7.read(status,tx);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",tx),UVM_NONE)
     
    regblock.r8.read(status,drop);
    `uvm_info("SEQ",$sformatf("Read-> drop:%0h",drop),UVM_NONE)
    
    regblock.r5.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_status:%0h",s),UVM_NONE)
    
  endtask
endclass
     
  class drop_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(drop_seq)
   register_block regblock;  
    bit [31:0]des,mir,rx,tx,drop,s;
   int timeout_count;
  
   function new(string name="drop_seq");
     super.new(name);
   endfunction
  
  task body();
     uvm_status_e status;
     regblock.r24.write(status,32'hA5A5C3C3);
     regblock.r10.write(status,32'h0000000F);
     regblock.r11.write(status,32'h0000000F);
     regblock.r9.write(status,32'h00000009);
     regblock.r13.write(status,32'h00100401);
     regblock.r14.write(status,32'h00000002);
     regblock.r15.write(status,32'h00000003);
     regblock.r17.write(status,32'h00000041);
    regblock.r12.write(status,32'h0000000B);
     
     timeout_count =0;
    
    do begin
      regblock.r5.read(status, s);
            timeout_count++;
    end while (s[1] !== 1'b1 && timeout_count < 200);
    
     regblock.r6.read(status,rx);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",rx),UVM_NONE)
     
    regblock.r7.read(status,tx);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",tx),UVM_NONE)
     
    regblock.r8.read(status,drop);
    `uvm_info("SEQ",$sformatf("Read-> drop:%0h",drop),UVM_NONE)
    
    regblock.r5.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_status:%0h",s),UVM_NONE)
    
    regblock.r10.write(status,32'h00000000);
    
    regblock.r6.read(status,rx);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",rx),UVM_NONE)
     
    regblock.r7.read(status,tx);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",tx),UVM_NONE)
     
    regblock.r8.read(status,drop);
    `uvm_info("SEQ",$sformatf("Read-> drop:%0h",drop),UVM_NONE)
    
    regblock.r5.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_status:%0h",s),UVM_NONE)
  endtask
endclass


class len_0_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(len_0_seq)
   register_block regblock;  
    bit [31:0]des,mir,rx,tx,drop,s;
   int timeout_count;
  
   function new(string name="len_0_seq");
     super.new(name);
   endfunction
  
  task body();
     uvm_status_e status;
     regblock.r24.write(status,32'hA5A5C3C3);
     regblock.r10.write(status,32'h0000000F);
     regblock.r11.write(status,32'h0000000F);
     regblock.r9.write(status,32'h00000009);
     regblock.r13.write(status,32'h00000001);
     regblock.r14.write(status,32'h00000002);
     regblock.r15.write(status,32'h00000003);
     regblock.r17.write(status,32'h00000041);
     regblock.r12.write(status,32'h0000000B);
     
     timeout_count =0;
    
    do begin
      regblock.r5.read(status, s);
            timeout_count++;
    end while (s[1] !== 1'b1 && timeout_count < 200);
    
     regblock.r6.read(status,rx);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",rx),UVM_NONE)
     
    regblock.r7.read(status,tx);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",tx),UVM_NONE)
     
    regblock.r8.read(status,drop);
    `uvm_info("SEQ",$sformatf("Read-> drop:%0h",drop),UVM_NONE)
    
    regblock.r5.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_status:%0h",s),UVM_NONE)
    
     regblock.r13.read(status,s);
     if(s[15:8] === 8'd1)
      `uvm_info("LEN_0_SEQ","PASS: Length zero is stored as one",UVM_NONE)
    else
      `uvm_error("LEN_0_SEQ",
        $sformatf("FAIL: Expected length = 1, Actual length = %0d",s[15:8]))
  endtask
endclass

class err_enable_irq_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(err_enable_irq_seq)
  register_block regblock;
  uvm_reg_data_t s;

  function new(string name = "err_enable_irq_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;

    regblock.r24.write(status, 32'hA5A5C3C3);
    regblock.r16.write(status, 32'h000000FF);
    regblock.r19.write(status, 32'h000000FF);

    regblock.r20.write(status, 32'h00000000);
    regblock.r21.write(status, 32'h00000001);
    regblock.r16.read(status, s);
    if (s[1] !== 1'b0)
      `uvm_error("ERR_EN_IRQ", "ERROR set in IRQ_STATUS with ERR_ENABLE=0")

    regblock.r20.write(status, 32'h00000001);
    regblock.r16.read(status, s);
    if (s[1] !== 1'b1)
      `uvm_error("ERR_EN_IRQ", "ERROR not set in IRQ_STATUS after enabling BUS_EN")

    regblock.r19.write(status, 32'h000000FF);
    regblock.r16.write(status, 32'h000000FF);
    regblock.r20.write(status, 32'h00000000);
    regblock.r20.write(status, 32'h000000FF);
    regblock.r20.read(status, s);
    if (s[7:0] !== 8'hFF)
  `uvm_error("ERR_EN_IRQ", $sformatf("ERR_ENABLE readback expected FF, got %02h", s[7:0]))
  endtask
endclass


class error_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(error_seq)
   register_block regblock;  
    bit [31:0]des,mir,rx,tx,drop,s;
   int timeout_count;
  
   function new(string name="error_seq");
     super.new(name);
   endfunction
  
  task body();
     uvm_status_e status;
     
     regblock.r19.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_status:%0h",s),UVM_NONE)
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)
    
     regblock.r21.write(status,32'h00000001);
     regblock.r19.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_status:%0h",s),UVM_NONE)
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)
    
    regblock.r21.write(status,32'h00000002);
     regblock.r19.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_status:%0h",s),UVM_NONE)
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)

    regblock.r21.write(status,32'h00000004);
     regblock.r19.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_status:%0h",s),UVM_NONE)
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)
    
    regblock.r21.write(status,32'h00000008);
     regblock.r19.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_status:%0h",s),UVM_NONE)
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)
    
    regblock.r21.write(status,32'h00000010);
     regblock.r19.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_status:%0h",s),UVM_NONE)
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)
    
    regblock.r21.write(status,32'h00000020);
     regblock.r19.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_status:%0h",s),UVM_NONE)
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)
    
    regblock.r21.write(status,32'h00000040);
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)
    
    regblock.r21.write(status,32'h00000080);
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)

    regblock.r21.write(status,32'h80000000);
     regblock.r19.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_status:%0h",s),UVM_NONE)
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)
    
    regblock.r21.write(status,32'h0000000F);
     regblock.r19.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_status:%0h",s),UVM_NONE)
    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)
  endtask
endclass

class write_RO_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(write_RO_seq)
  register_block regblock;
  bit [31:0] des,mir,rx,tx,drop,s;
  int timeout_count;

  function new(string name="write_RO_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;

    regblock.r25.write(status,32'h00000001);

    regblock.r1.write(status,32'h0000000F);
    regblock.r2.write(status,32'h0000000F);
    regblock.r3.write(status,32'h0000000F);
    regblock.r4.write(status,32'h00000001);
    regblock.r5.write(status,32'h00000001);
    regblock.r6.write(status,32'h00000001);
    regblock.r7.write(status,32'h00000001);
    regblock.r8.write(status,32'h0000000B);
    regblock.r22.write(status,32'h00000001);
    regblock.r23.write(status,32'h0000000B);

    regblock.r1.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> device_id:%0h",s),UVM_NONE)
    if(s === 32'h02A55357)
      `uvm_info("RO_SEQ","PASS: DEVICE_ID write ignored",UVM_NONE)
    else
      `uvm_error("RO_SEQ","FAIL: DEVICE_ID value changed")

    regblock.r2.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> version:%0h",s),UVM_NONE)
    if(s === 32'h00010200)
      `uvm_info("RO_SEQ","PASS: VERSION write ignored",UVM_NONE)
    else
      `uvm_error("RO_SEQ","FAIL: VERSION value changed")

    regblock.r3.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> switch_status:%0h",s),UVM_NONE)
    if(s === 32'h000000F9)
      `uvm_info("RO_SEQ","PASS: SWITCH_STATUS write ignored",UVM_NONE)
    else
      `uvm_error("RO_SEQ","FAIL: SWITCH_STATUS value changed")

    regblock.r4.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> port_status:%0h",s),UVM_NONE)
    if(s === 32'h00000000)
      `uvm_info("RO_SEQ","PASS: PORT_STATUS write ignored",UVM_NONE)
    else
      `uvm_error("RO_SEQ","FAIL: PORT_STATUS value changed")

    regblock.r5.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> gen_status:%0h",s),UVM_NONE)
    if(s === 32'h00000000)
      `uvm_info("RO_SEQ","PASS: GEN_STATUS write ignored",UVM_NONE)
    else
      `uvm_error("RO_SEQ","FAIL: GEN_STATUS value changed")

    regblock.r6.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> stat_rx:%0h",s),UVM_NONE)
    if(s === 32'h00000000)
      `uvm_info("RO_SEQ","PASS: STAT_RX write ignored",UVM_NONE)
    else
      `uvm_error("RO_SEQ","FAIL: STAT_RX value changed")

    regblock.r7.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> stat_tx:%0h",s),UVM_NONE)
    if(s === 32'h00000000)
      `uvm_info("RO_SEQ","PASS: STAT_TX write ignored",UVM_NONE)
    else
      `uvm_error("RO_SEQ","FAIL: STAT_TX value changed")

    regblock.r8.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> stat_drop:%0h",s),UVM_NONE)
    if(s === 32'h00000000)
      `uvm_info("RO_SEQ","PASS: STAT_DROP write ignored",UVM_NONE)
    else
      `uvm_error("RO_SEQ","FAIL: STAT_DROP value changed")

    regblock.r22.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> error_count:%0h",s),UVM_NONE)
    if(s === 32'h00000000)
      `uvm_info("RO_SEQ","PASS: ERR_COUNT write ignored",UVM_NONE)
    else
      `uvm_error("RO_SEQ","FAIL: ERR_COUNT value changed")

    regblock.r23.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_info:%0h",s),UVM_NONE)
    if(s === 32'h00000000)
      `uvm_info("RO_SEQ","PASS: ERR_INFO write ignored",UVM_NONE)
    else
      `uvm_error("RO_SEQ","FAIL: ERR_INFO value changed")
  endtask
endclass
      
class read_WO_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(read_WO_seq)
  register_block regblock;
  uvm_reg_data_t s;
  int timeout_count;

  function new(string name="read_WO_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;

    regblock.r18.write(status,32'h0000000F);
    regblock.r21.write(status,32'h0000000F);
    regblock.r25.write(status,32'h0000000F);

    regblock.r18.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> irq_force:%0h",s),UVM_NONE)
    if(s === 32'h00000000)
      `uvm_info("WO_SEQ","PASS: IRQ_FORCE read returns zero",UVM_NONE)
    else
      `uvm_error("WO_SEQ","FAIL: IRQ_FORCE read is not zero")

    regblock.r21.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> err_inject:%0h",s),UVM_NONE)
    if(s === 32'h00000000)
      `uvm_info("WO_SEQ","PASS: ERR_INJECT read returns zero",UVM_NONE)
    else
      `uvm_error("WO_SEQ","FAIL: ERR_INJECT read is not zero")

    regblock.r25.read(status,s);
    `uvm_info("SEQ",$sformatf("Read-> soft_reset:%0h",s),UVM_NONE)
    if(s === 32'h00000000)
      `uvm_info("WO_SEQ","PASS: SOFT_RESET read returns zero",UVM_NONE)
    else
      `uvm_error("WO_SEQ","FAIL: SOFT_RESET read is not zero")
  endtask
endclass

class port_en_sweep extends uvm_sequence#(seq_item);
  `uvm_object_utils(port_en_sweep)
  register_block regblock;
  uvm_reg_data_t s;
  int i;
  function new(string name = "port_en_sweep");
    super.new(name);
  endfunction
  
  task body();
    uvm_status_e status;
    regblock.r24.write(status, 32'hA5A5C3C3);
    for (int i = 0; i < 16; i++) begin
      regblock.r10.write(status, i);
      if (status != UVM_IS_OK)
        `uvm_error("PORT_EN", $sformatf("Write failed for pattern %0h", i))
        
      regblock.r10.read(status, s);
      if (status != UVM_IS_OK)
        `uvm_error("PORT_EN", $sformatf("Read failed for pattern %0h", i))
      else begin
        `uvm_info("PORT_EN",$sformatf("Expected = %04b, Read = %04b", i[3:0], s[3:0]), UVM_MEDIUM)

        if (s[3:0] !== i[3:0])
          `uvm_error("PORT_EN",$sformatf("Mismatch: expected %04b, got %04b", i[3:0], s[3:0]))
        else
          `uvm_info("PORT_EN", $sformatf("PASS: PORT_ENABLE = %04b", i[3:0]),UVM_LOW)
      end
    end
  endtask
endclass

class fwd_en_sweep extends uvm_sequence#(seq_item);
  `uvm_object_utils(fwd_en_sweep)

  register_block regblock;
  uvm_reg_data_t s;
  int i;

  function new(string name = "fwd_en_sweep");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;
    regblock.r24.write(status, 32'hA5A5C3C3);
    for (i = 0; i < 16; i++) begin
      regblock.r11.write(status, i);

      regblock.r11.read(status, s);

      if (status != UVM_IS_OK)
        `uvm_error("FWD_EN", $sformatf("Read failed for pattern %04b", i[3:0]))
      else begin
        `uvm_info("FWD_EN", $sformatf("Expected = %04b, Read = %04b",i[3:0], s[3:0]), UVM_MEDIUM)

        if (s[3:0] !== i[3:0])
          `uvm_error("FWD_EN", $sformatf("Mismatch: expected %04b, got %04b", i[3:0], s[3:0]))
        else
          `uvm_info("FWD_EN", $sformatf("PASS: FWD_ENABLE = %04b", i[3:0]),UVM_LOW)
      end
    end

    regblock.r11.write(status, 32'h0000000F);
  endtask
endclass


class w1c_reg_test extends uvm_sequence#(seq_item);
  `uvm_object_utils(w1c_reg_test)
  register_block regblock;
  uvm_reg_data_t s;

  function new(string name = "w1c_reg_test");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;
    regblock.r16.write(status, 32'h000000FF);
    regblock.r18.write(status, 32'h00000005);
    
    regblock.r16.read(status, s);
    if (s[7:0] !== 8'h05)
      `uvm_error("W1C", $sformatf("IRQ_STATUS set failed: got %02h", s[7:0]))
    else
      `uvm_info("W1C", "IRQ_STATUS set test PASS", UVM_NONE)

    regblock.r16.write(status, 32'h00000001);
    regblock.r16.read(status, s);

    if (s[7:0] !== 8'h04)
      `uvm_error("W1C", $sformatf("IRQ_STATUS partial clear failed: got %02h", s[7:0]))
    else
      `uvm_info("W1C", "IRQ_STATUS partial clear PASS", UVM_NONE)

    regblock.r16.write(status, 32'h00000000);
    regblock.r16.read(status, s);

    if (s[7:0] !== 8'h04)
      `uvm_error("W1C", $sformatf("IRQ_STATUS zero write failed: got %02h", s[7:0]))
    else
      `uvm_info("W1C", "IRQ_STATUS zero write PASS", UVM_NONE)

    regblock.r16.write(status, 32'h00000004);
    regblock.r16.read(status, s);

    if (s[7:0] !== 8'h00)
      `uvm_error("W1C", $sformatf("IRQ_STATUS final clear failed: got %02h", s[7:0]))
    else
      `uvm_info("W1C", "IRQ_STATUS W1C test PASS", UVM_NONE)

    regblock.r19.write(status, 32'h000000FF);
    regblock.r21.write(status, 32'h00000003);
    regblock.r19.read(status, s);

    if (s[7:0] !== 8'h83)
      `uvm_error("W1C", $sformatf("ERR_STATUS set failed: got %02h", s[7:0]))
    else
      `uvm_info("W1C", "ERR_STATUS set test PASS", UVM_NONE)

    regblock.r19.write(status, 32'h00000001);
    regblock.r19.read(status, s);

    if (s[7:0] !== 8'h82)
      `uvm_error("W1C", $sformatf("ERR_STATUS partial clear failed: got %02h", s[7:0]))
    else
      `uvm_info("W1C", "ERR_STATUS partial clear PASS", UVM_NONE)

    regblock.r19.write(status, 32'h00000000);
    regblock.r19.read(status, s);

    if (s[7:0] !== 8'h82)
      `uvm_error("W1C", $sformatf("ERR_STATUS zero write failed: got %02h", s[7:0]))
    else
      `uvm_info("W1C", "ERR_STATUS zero write PASS", UVM_NONE)

    regblock.r19.write(status, 32'h00000082);
    regblock.r19.read(status, s);

    if (s[7:0] !== 8'h00)
      `uvm_error("W1C", $sformatf("ERR_STATUS final clear failed: got %02h", s[7:0]))
    else
      `uvm_info("W1C", "ERR_STATUS W1C test PASS", UVM_NONE)

  endtask
endclass


class stop_without_start_enable extends uvm_sequence#(seq_item);
  `uvm_object_utils(stop_without_start_enable)

  register_block regblock;
  uvm_reg_data_t s;
  int timeout_count;

  function new(string name = "stop_without_start_enable");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;

    regblock.r24.write(status, 32'hA5A5C3C3);
    regblock.r12.write(status,32'h00000001);

    regblock.r12.write(status, 32'h00000004);

    #100;

    regblock.r5.read(status, s);
    `uvm_info("STOP_TEST",
      $sformatf("GEN_STATUS after STOP without START/ENABLE = %0h", s),
      UVM_NONE)

    if(s === 32'h00000000)
      `uvm_info("STOP_TEST","PASS: Generator remains in IDLE state",UVM_NONE)
    else
      `uvm_error("STOP_TEST",$sformatf("FAIL: Unexpected GEN_STATUS = %0h",s))

    regblock.r6.read(status,s);
    `uvm_info("STOP_TEST",$sformatf("STAT_RX = %0d",s),UVM_NONE)

    if(s === 32'h00000000)
      `uvm_info("STOP_TEST","PASS: No packets received",UVM_NONE)
    else
      `uvm_error("STOP_TEST","FAIL: Unexpected RX packets")

    regblock.r7.read(status,s);
    `uvm_info("STOP_TEST",$sformatf("STAT_TX = %0d",s),UVM_NONE)

    if(s === 32'h00000000)
      `uvm_info("STOP_TEST","PASS: No packets transmitted",UVM_NONE)
    else
      `uvm_error("STOP_TEST","FAIL: Unexpected TX packets")
  endtask
endclass
      
      

class start_enable_disable_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(start_enable_disable_seq)

  register_block regblock;
  
  uvm_reg_data_t status_before, status_after;
  uvm_reg_data_t rx_before, rx_after;
  uvm_reg_data_t tx_before, tx_after;

  function new(string name = "start_enable_disable_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;

    regblock.r24.write(status, 32'hA5A5C3C3);

    regblock.r10.write(status, 32'h0000000F);
    regblock.r11.write(status, 32'h0000000F);
    regblock.r9.write(status, 32'h00000009);
    regblock.r13.write(status, 32'h00100401);
    regblock.r14.write(status, 32'h00000002);
    regblock.r15.write(status, 32'h00000004);

    regblock.r6.read(status, rx_before);
    regblock.r7.read(status, tx_before);

    regblock.r12.write(status, 32'h00000003);

    #100;

    regblock.r5.read(status, status_after);
    regblock.r6.read(status, rx_after);
    regblock.r7.read(status, tx_after);

    `uvm_info("START_ENABLE",
      $sformatf("GEN_STATUS=%0h STAT_RX=%0d STAT_TX=%0d",
      status_after, rx_after, tx_after), UVM_NONE)

    if ((rx_after > rx_before) && (tx_after > tx_before))
      `uvm_info("START_ENABLE", "PASS: START with ENABLE=1 generated packets", UVM_NONE)
    else
      `uvm_error("START_ENABLE", "FAIL: No packet generation observed with ENABLE=1")

    regblock.r12.write(status, 32'h00000000);

    regblock.r6.read(status, rx_before);
    regblock.r7.read(status, tx_before);

    regblock.r12.write(status, 32'h00000002);

    #100;

    regblock.r5.read(status, status_after);
    regblock.r6.read(status, rx_after);
    regblock.r7.read(status, tx_after);

    `uvm_info("START_DISABLE",
      $sformatf("GEN_STATUS=%0h STAT_RX=%0d STAT_TX=%0d",
      status_after, rx_after, tx_after), UVM_NONE)

    if ((rx_after == rx_before) && (tx_after == tx_before))
      `uvm_info("START_DISABLE", "PASS: START with ENABLE=0 did not generate packets", UVM_NONE)
    else
      `uvm_error("START_DISABLE", "FAIL: Packet counters changed with ENABLE=0")

  endtask
endclass    
      
class irq_enable_disable_seq extends uvm_sequence #(seq_item);
  `uvm_object_utils(irq_enable_disable_seq)
  register_block regblock;
  virtual switch_inf vif;

  function new(string name = "irq_enable_disable_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;
    uvm_reg_data_t s;

    if (!uvm_config_db#(virtual switch_inf)::get(null, "*", "vif", vif))
      `uvm_fatal("NO_VIF", "switch_inf not found")

    regblock.r24.write(status, 32'hA5A5C3C3);
    regblock.r9.write(status, 32'h9);
    regblock.r17.write(status, 32'h0);
    regblock.r16.write(status, 32'hFF);
    regblock.r18.write(status, 32'h1);

    regblock.r16.read(status, s);
    if (s[0] !== 1'b1)
      `uvm_error("IRQ", "GEN_DONE status bit not set")

    #1;
    if (vif.irq !== 1'b0)
      `uvm_error("IRQ", "IRQ asserted when mask is disabled")

    regblock.r17.write(status, 32'h1);

    #1;
    if (vif.irq !== 1'b1)
      `uvm_error("IRQ", "IRQ did not assert after enabling mask")

    regblock.r17.write(status, 32'h0);

    #1;
    if (vif.irq !== 1'b0)
      `uvm_error("IRQ", "IRQ did not deassert after disabling mask")

    regblock.r16.write(status, 32'hFF);
  endtask
endclass
    
class irq_global_enable_seq extends uvm_sequence #(seq_item);
  `uvm_object_utils(irq_global_enable_seq)
  register_block regblock;
  virtual switch_inf vif;

  function new(string name = "irq_global_enable_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;
    uvm_reg_data_t s;

    if (!uvm_config_db#(virtual switch_inf)::get(null, "*", "vif", vif))
      `uvm_fatal("NO_VIF", "switch_inf not found")

    regblock.r24.write(status, 32'hA5A5C3C3);
    regblock.r16.write(status, 32'hFF);
    regblock.r17.write(status, 32'h1);
    regblock.r9.write(status, 32'h1);
    regblock.r18.write(status, 32'h1);

    regblock.r16.read(status, s);
    if (s[0] !== 1'b1)
      `uvm_error("IRQ", "GEN_DONE status bit not set")

    #1;
    if (vif.irq !== 1'b0)
      `uvm_error("IRQ", "IRQ asserted when global enable is disabled")

    regblock.r9.write(status, 32'h9);

    #1;
    if (vif.irq !== 1'b1)
      `uvm_error("IRQ", "IRQ did not assert after enabling global IRQ")

    regblock.r9.write(status, 32'h1);

    #1;
    if (vif.irq !== 1'b0)
      `uvm_error("IRQ", "IRQ did not deassert after disabling global IRQ")

    regblock.r16.write(status, 32'hFF);
  endtask
endclass
    
class irq_force_seq extends uvm_sequence #(seq_item);
  `uvm_object_utils(irq_force_seq)
  register_block regblock;

  function new(string name = "irq_force_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;
    uvm_reg_data_t s;

    regblock.r24.write(status, 32'hA5A5C3C3);
    regblock.r16.write(status, 32'hFF);

    regblock.r18.write(status, 32'h5);
    regblock.r16.read(status, s);

    if (s[2:0] !== 3'b101)
      `uvm_error("IRQ_FORCE", $sformatf("Expected 101, got %b", s[2:0]))

    regblock.r18.write(status, 32'h0);
    regblock.r16.read(status, s);

    if (s[2:0] !== 3'b101)
      `uvm_error("IRQ_FORCE", $sformatf("Writing zero changed IRQ_STATUS. Actual=%b", s[2:0]))

    regblock.r18.write(status, 32'h2);
    regblock.r16.read(status, s);

    if (s[2:0] !== 3'b111)
      `uvm_error("IRQ_FORCE", $sformatf("Expected 111, got %b", s[2:0]))

    regblock.r16.write(status, 32'hFF);
  endtask
endclass
    

    
class gen_count_sweep_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(gen_count_sweep_seq)
  register_block regblock;

  function new(string name="gen_count_sweep_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;
    uvm_reg_data_t s,tx_before,tx_after;
    int count_values[11]='{0,1,2,4,5,6,7,8,10,12,15};
    int expected;
    int timeout_count;

    regblock.r24.write(status,32'hA5A5C3C3);
    regblock.r10.write(status,32'hF);
    regblock.r11.write(status,32'hF);
    regblock.r9.write(status,32'h9);
    regblock.r13.write(status,32'h00100101);
    regblock.r14.write(status,32'd2);

    foreach(count_values[i]) begin
      expected=(count_values[i]==0)?1:count_values[i];

      regblock.r7.read(status,tx_before);
      regblock.r15.write(status,count_values[i]);
      regblock.r12.write(status,32'h1);
      regblock.r12.write(status,32'h3);

      timeout_count=0;
      do begin
        regblock.r5.read(status,s);
        timeout_count++;
      end while(s[1] !== 1'b1 && timeout_count < 200);

      if(s[1] !== 1'b1)
        `uvm_error("GEN_COUNT",$sformatf("Generator timeout for count %0d",count_values[i]))

      regblock.r7.read(status,tx_after);

      if((tx_after-tx_before)!=expected)
        `uvm_error("GEN_COUNT",$sformatf("Count=%0d Expected TX increment=%0d Actual=%0d",count_values[i],expected,tx_after-tx_before))
      else
        `uvm_info("GEN_COUNT",$sformatf("Count=%0d Expected=%0d Actual=%0d",count_values[i],expected,tx_after-tx_before),UVM_MEDIUM)

      regblock.r12.write(status,32'h0);
    end
  endtask
endclass
      
class gen_stop_during_run_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(gen_stop_during_run_seq)
  register_block regblock;

  function new(string name="gen_stop_during_run_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;
    uvm_reg_data_t s,tx_before,tx_after;
    bit running;
    int timeout_count;

    regblock.r24.write(status,32'hA5A5C3C3);
    regblock.r10.write(status,32'hF);
    regblock.r11.write(status,32'hF);
    regblock.r9.write(status,32'h9);
    regblock.r13.write(status,32'h00101001);
    regblock.r14.write(status,32'd100);
    regblock.r15.write(status,32'd255);

    regblock.r7.read(status,tx_before);

    regblock.r12.write(status,32'h3);

    timeout_count=0;
    do begin
      regblock.r5.read(status,s);
      timeout_count++;
    end while(s[0] !== 1'b1 && timeout_count < 200);

    running=(s[0] === 1'b1);

    if(!running)
      `uvm_error("GEN_STOP","Generator did not enter running state")
    else begin
      regblock.r12.write(status,32'h5);
      regblock.r12.write(status,32'h1);
    end

    timeout_count=0;
    do begin
      regblock.r5.read(status,s);
      timeout_count++;
    end while(s[0] !== 1'b0 && timeout_count < 200);

    regblock.r5.read(status,s);
    regblock.r7.read(status,tx_after);

    if(s[0] !== 1'b0)
      `uvm_error("GEN_STOP","Generator is still running after STOP")

    if((tx_after-tx_before)>=255)
      `uvm_error("GEN_STOP","All packets were transmitted; STOP may not have taken effect")

    `uvm_info("GEN_STOP",$sformatf("GEN_STATUS=%0h TX before=%0d TX after=%0d",s,tx_before,tx_after),UVM_MEDIUM)
  endtask
endclass
      
class gen_start_while_busy_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(gen_start_while_busy_seq)
  register_block regblock;

  function new(string name="gen_start_while_busy_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e status;
    uvm_reg_data_t s,tx_before,tx_after;
    bit running,done;
    int timeout_count;

    regblock.r24.write(status,32'hA5A5C3C3);
    regblock.r10.write(status,32'hF);
    regblock.r11.write(status,32'hF);
    regblock.r9.write(status,32'h9);
    regblock.r13.write(status,32'h00101001);
    regblock.r14.write(status,32'd100);
    regblock.r15.write(status,32'd4);

    regblock.r7.read(status,tx_before);
    regblock.r12.write(status,32'h1);
    regblock.r12.write(status,32'h3);

    timeout_count=0;
    do begin
      regblock.r5.read(status,s);
      timeout_count++;
    end while(s[0] !== 1'b1 && timeout_count < 200);

    running=(s[0] === 1'b1);

    if(!running)
      `uvm_error("GEN_BUSY","Generator did not enter running state")
    else begin
      regblock.r12.write(status,32'h3);
      regblock.r12.write(status,32'h1);
    end

    timeout_count=0;
    do begin
      regblock.r5.read(status,s);
      timeout_count++;
    end while(s[3:2] !== 2'b11 && timeout_count < 500);

    done=(s[3:2] === 2'b11);

    if(!done)
      `uvm_error("GEN_BUSY","Generator did not complete")

    regblock.r7.read(status,tx_after);

    if((tx_after-tx_before)!=4)
      `uvm_error("GEN_BUSY",$sformatf("Expected 4 packets, actual TX increment=%0d",tx_after-tx_before))
    else
      `uvm_info("GEN_BUSY","START while busy was ignored; exactly 4 packets transmitted",UVM_MEDIUM)

    `uvm_info("GEN_BUSY",$sformatf("TX before=%0d TX after=%0d",tx_before,tx_after),UVM_MEDIUM)
  endtask
endclass


class apb_invalid_access_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(apb_invalid_access_seq)
  register_block regblock;
  virtual switch_inf vif;

  function new(string name="apb_invalid_access_seq");
    super.new(name);
  endfunction

  task apb_transfer(input bit wr,input bit [15:0] addr,input bit [31:0] wdata,output bit err,output bit [31:0] rdata);
    @(negedge vif.pclk);
    vif.psel=1'b1;
    vif.penable=1'b0;
    vif.pwrite=wr;
    vif.paddr=addr;
    vif.pwdata=wdata;

    @(negedge vif.pclk);
    vif.penable=1'b1;

    @(posedge vif.pclk);
    #1;
    err=vif.pslverr;
    rdata=vif.prdata;

    @(negedge vif.pclk);
    vif.psel=1'b0;
    vif.penable=1'b0;
    vif.pwrite=1'b0;
    vif.paddr='0;
    vif.pwdata='0;
  endtask

  task body();
    bit err;
    bit [31:0] rdata;

    if(!uvm_config_db#(virtual switch_inf)::get(null,"*","vif",vif))
      `uvm_fatal("NO_VIF","switch_inf not found")

    apb_transfer(0,16'h0002,32'h0,err,rdata);
    if(err!==1'b1)
      `uvm_error("APB_INVALID","PSLVERR not asserted for unaligned read")
    if(rdata!==32'h0)
      `uvm_error("APB_INVALID",$sformatf("Unaligned read returned %0h instead of zero",rdata))

    apb_transfer(1,16'h0002,32'h12345678,err,rdata);
    if(err!==1'b1)
      `uvm_error("APB_INVALID","PSLVERR not asserted for unaligned write")

    apb_transfer(0,16'h0064,32'h0,err,rdata);
    if(err!==1'b1)
      `uvm_error("APB_INVALID","PSLVERR not asserted for out-of-range read")
    if(rdata!==32'h0)
      `uvm_error("APB_INVALID",$sformatf("Out-of-range read returned %0h instead of zero",rdata))

    apb_transfer(1,16'h0064,32'h12345678,err,rdata);
    if(err!==1'b1)
      `uvm_error("APB_INVALID","PSLVERR not asserted for out-of-range write")

    `uvm_info("APB_INVALID","Invalid APB access tests completed",UVM_MEDIUM)
  endtask
endclass
      
      

