class Name {
  static int lastId = 0;
  int id = 0;
  String name = "";

  Name(this.id, this.name);
}

List<Name> responsibilities = [
  Name(1, "Incoterms / responsabilidades"), //1
  Name(2, "Incoterms / responsabilidades"),
  Name(3, "Incoterms / responsabilidades"),
];

List<Name> sources = [
  Name(1, "Fabrica"), //4
  Name(2, "No fabrica"),
];

List<Name> documents = [
  Name(1, "Documentos"), //6
  Name(2, "Recibos"),
  Name(3, "Facturas"),
  Name(4, "Comprobantes"),
];

List<Name> orderTypes = [
  Name(1, "Incoterms"), //10
  Name(2, "Incoterms"),
  Name(3, "Incoterms"),
  Name(4, "Incoterms"),
];

List<Name> orders = [
  Name(1, "#563"), //14
  Name(2, "#245"),
  Name(3, "#4800"),
  Name(4, "#568"),
  Name(5, "#356"),
  Name(6, "#897"),
  Name(7, "#245"),
  Name(8, "#4800"),
  Name(9, "#568"),
  Name(10, "#356"),
  Name(11, "#897"),
  Name(12, "#245"),
  Name(13, "#4800"),
  Name(14, "#568"),
  Name(15, "#356"),
  Name(16, "#897"),
  Name(17, "#245"),
  Name(18, "#4800"),
  Name(19, "#568"),
  Name(20, "#356"),
  Name(21, "#897"),
];

List<Name> months = [
  Name(1, "Enero"),
  Name(2, "Febrero"),
  Name(3, "Marzo"),
  Name(4, "Abril"),
  Name(5, "Mayo"),
  Name(6, "Junio"),
  Name(7, "Julio"),
  Name(8, "Agosto"),
  Name(9, "Septiembre"),
  Name(10, "Octubre"),
  Name(11, "Noviembre"),
  Name(12, "Diciembre"),
];

List<Name> days =
    List.generate(31, (index) => Name(index + 1, (index + 1).toString()))
        .toList();

List<Name> quality1 = [Name(1, "Cuello de Botella")];
List<Name> quality2 = [Name(1, "Calidad del producto")];
List<Name> quality3 = [Name(1, "Manejo del producto")];
