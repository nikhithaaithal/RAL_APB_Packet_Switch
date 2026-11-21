class switch_adapter extends uvm_reg_adapter;
 `uvm_object_utils(switch_adapter)
  function new( string name="switch_adapter");
    super.new(name);
  endfunction

  function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    seq_item tr;
    tr=seq_item::type_id::create("tr");
    tr.paddr= rw.addr;
    tr.pwrite=(rw.kind==UVM_WRITE);
    if(tr.pwrite) tr.pwdata=rw.data;
    return tr;
  endfunction

function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
  seq_item tr;
  assert($cast(tr,bus_item));
  rw.kind = (tr.pwrite ==1'b1)? UVM_WRITE: UVM_READ;
  rw.data = (tr.pwrite ==1'b1)?tr.pwdata:tr.prdata;
  rw.addr = tr.paddr;
  rw.status = UVM_IS_OK;
 endfunction
endclass
