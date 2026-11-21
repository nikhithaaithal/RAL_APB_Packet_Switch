class register_block extends uvm_reg_block;
  `uvm_object_utils(register_block)
  rand device_id r1;
  rand version r2;
  rand switch_status r3;
  rand port_status r4;
  rand gen_status r5;
  rand stat_rx r6;
  rand stat_tx r7;
  rand stat_drop r8;
  rand switch_ctrl r9;
  rand port_enable r10;
  rand fwd_enable r11;
  rand gen_ctrl r12;
  rand gen_pkt_cfg r13;
  rand gen_interval r14;
  rand gen_count r15;
  rand irq_status r16;
  rand irq_enable r17;
  rand irq_force r18;
  rand err_status r19;
  rand err_enable r20;
  rand err_inject r21;
  rand err_count r22;
  rand err_info r23;
  rand lock r24;
  rand soft_reset r25;

  function new(string name="register_block");
   super.new(name,UVM_NO_COVERAGE);
  endfunction

  function void build;
   r1=device_id::type_id::create("r1");
   r1.build();
   r1.configure(this);

   r2=version::type_id::create("r2");
   r2.build();
   r2.configure(this);

   r3=switch_status::type_id::create("r3");
   r3.build();
   r3.configure(this);

   r4=port_status::type_id::create("r4");
   r4.build();
   r4.configure(this);

   r5=gen_status::type_id::create("r5");
   r5.build();
   r5.configure(this);

   r6=stat_rx::type_id::create("r6");
   r6.build();
   r6.configure(this);

   r7=stat_tx::type_id::create("r7");
   r7.build();
   r7.configure(this);

   r8=stat_drop::type_id::create("r8");
   r8.build();
   r8.configure(this);

   r9=switch_ctrl::type_id::create("r9");
   r9.build();
   r9.configure(this);

   r10=port_enable::type_id::create("r10");
   r10.build();
   r10.configure(this);

   r11=fwd_enable::type_id::create("r11");
   r11.build();
   r11.configure(this);

   r12=gen_ctrl::type_id::create("r12");
   r12.build();
   r12.configure(this);

   r13=gen_pkt_cfg::type_id::create("r13");
   r13.build();
   r13.configure(this);

   r14=gen_interval::type_id::create("r14");
   r14.build();
   r14.configure(this);

   r15=gen_count::type_id::create("r15");
   r15.build();
   r15.configure(this);

   r16=irq_status::type_id::create("r16");
   r16.build();
   r16.configure(this);

   r17=irq_enable::type_id::create("r17");
   r17.build();
   r17.configure(this);

   r18=irq_force::type_id::create("r18");
   r18.build();
   r18.configure(this);

   r19=err_status::type_id::create("r19");
   r19.build();
   r19.configure(this);

   r20=err_enable::type_id::create("r20");
   r20.build();
   r20.configure(this);

   r21=err_inject::type_id::create("r21");
   r21.build();
   r21.configure(this);

   r22=err_count::type_id::create("r22");
   r22.build();
   r22.configure(this);

   r23=err_info::type_id::create("r23");
   r23.build();
   r23.configure(this);

   r24=lock::type_id::create("r24");
   r24.build();
   r24.configure(this);

   r25=soft_reset::type_id::create("r25");
   r25.build();
   r25.configure(this);

   default_map=create_map("default_map",0,4,UVM_LITTLE_ENDIAN);
   default_map.add_reg(r1,8'h00,"RO");
   default_map.add_reg(r2,8'h04,"RO");
   default_map.add_reg(r3,8'h08,"RO");
   default_map.add_reg(r4,8'h0C,"RO");
   default_map.add_reg(r5,8'h10,"RO");
   default_map.add_reg(r6,8'h14,"RO");
   default_map.add_reg(r7,8'h18,"RO");
   default_map.add_reg(r8,8'h1C,"RO");
   default_map.add_reg(r9,8'h20,"RW");//
   default_map.add_reg(r10,8'h24,"RW");
   default_map.add_reg(r11,8'h28,"RW");
   default_map.add_reg(r12,8'h2C,"RW");//
   default_map.add_reg(r13,8'h30,"RW");
   default_map.add_reg(r14,8'h34,"RW");
   default_map.add_reg(r15,8'h38,"RW");
    default_map.add_reg(r16,8'h3C,"RW");
   default_map.add_reg(r17,8'h40,"RW");
   default_map.add_reg(r18,8'h44,"WO");
    default_map.add_reg(r19,8'h48,"RW");
   default_map.add_reg(r20,8'h4C,"RW");
   default_map.add_reg(r21,8'h50,"WO");
   default_map.add_reg(r22,8'h54,"RO");
   default_map.add_reg(r23,8'h58,"RO");
   default_map.add_reg(r24,8'h5C,"RO");//
   default_map.add_reg(r25,8'h60,"WO");
   lock_model();
endfunction
endclass
