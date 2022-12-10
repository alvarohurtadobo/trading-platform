class Name {
  static int lastId = 0;
  int id = 0;
  String name = "";

  Name(this.name) {
    lastId++;
    id = lastId;
  }
}

List<Name> responsibilities = [
  Name("Incoterms / responsabilidades"), //1
  Name("Incoterms / responsabilidades"),
  Name("Incoterms / responsabilidades"),
];

List<Name> sources = [
  Name("Fabrica"), //4
  Name("No fabrica"),
];

List<Name> documents = [
  Name("Documentos"), //6
  Name("Recibos"),
  Name("Facturas"),
  Name("Comprobantes"),
];

List<Name> orderTypes = [
  Name("Incoterms"), //10
  Name("Incoterms"),
  Name("Incoterms"),
  Name("Incoterms"),
];

List<Name> orders = [
  Name("#563"), //14
  Name("#245"),
  Name("#4800"),
  Name("#568"),
  Name("#356"),
  Name("#897"),
  Name("#245"),
  Name("#4800"),
  Name("#568"),
  Name("#356"),
  Name("#897"),
  Name("#245"),
  Name("#4800"),
  Name("#568"),
  Name("#356"),
  Name("#897"),
  Name("#245"),
  Name("#4800"),
  Name("#568"),
  Name("#356"),
  Name("#897"),
];
