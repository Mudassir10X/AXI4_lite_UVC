class axi_lite_txn extends uvm_sequence_item;

  `uvm_object_utils(axi_lite_txn)

  typedef enum {READ, WRITE} txn_type_e;
  txn_type_e txn_type;

  
  rand bit [31:0] addr;
  rand bit [31:0] data;
  rand bit [3:0]  strb;    

  
  bit [1:0]       resp;    

 
  function new(string name = "axi_lite_txn");

    super.new(name);

  endfunction


  function string convert2string();

    return $sformatf("type=%s addr=0x%08x data=0x%08x strb=0x%x resp=0x%x",
                      (txn_type == WRITE) ? "WRITE" : "READ",
                      addr, data, strb, resp);
                      
  endfunction


endclass