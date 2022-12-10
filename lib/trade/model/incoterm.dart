class Incoterm {
  static int lastId = 0;
  int id = 0;
  String name = "";
  String code = "";
  String assetName = "";
  Incoterm(this.name, this.code, this.assetName) {
    lastId++;
    id = lastId;
  }
}

List<Incoterm> myIncoterms = [
  Incoterm("Ex works", "EXW", "2_exw"),
  Incoterm("Free On Board", "FOB", "2_fob"),
  Incoterm("Insurance and Freight", "CIF", "2_cif"),
  Incoterm("Free Carrier", "FCA", "2_fca"),
  Incoterm("Free Alongside Ship ", "FAS", "2_fas"),
  Incoterm("Cost and Freight", "CFR", "2_cfr"),
  Incoterm("Carriage Paid To", "CPT", "2_cpt"),
  Incoterm("Carriage and InsurancePaid to", "CIP", "2_cip"),
  Incoterm("Delivery at Place Unloaded", "DPU", "2_dpu"),
  Incoterm("Delivery At Place", "DAP", "2_dap"),
  Incoterm("Delivery Duty Paid", "DDP", "2_ddp"),
];
