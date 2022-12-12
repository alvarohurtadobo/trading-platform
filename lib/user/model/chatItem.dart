class ChatItem {
  static int lastId = 0;
  int id = 0;
  String message = "";
  DateTime? datetime = DateTime.now();
  bool placeholder = false;
  bool? sent = false;

  ChatItem(this.message, {this.datetime, this.placeholder = false, this.sent}) {
    lastId++;
    id = lastId;
    datetime ??= DateTime.now();
    sent ??= id % 2 == 0;
  }
}

List<ChatItem> myChatItems = [
  ChatItem("Hola que tal?"),
  ChatItem("Bien y tu?"),
  ChatItem("Todo bien\n Como va el proyecto?"),
  ChatItem("", datetime: DateTime.now(), placeholder: true)
];
