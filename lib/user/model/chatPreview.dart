class ChatPreview {
  int id = 0;
  int count = 0;
  String name = "";
  String message = "";
  String time = "";

  ChatPreview(this.id, this.count, this.name, this.message, this.time);
}

List<ChatPreview> myChats = [
  ChatPreview(1, 3, "Pedro",
      "Lorem ipsum dolor sit amet, consecteturlop miuyt nsmaos", "10:00am"),
  ChatPreview(2, 0, "Javier Ad",
      "Lorem ipsum dolor sit amet, consecteturlop miuyt nsmaos", "8:00am"),
  ChatPreview(3, 1, "Carlos",
      "Lorem ipsum dolor sit amet, consecteturlop miuyt nsmaos", "4:30pm"),
  ChatPreview(4, 0, "Importador",
      "Lorem ipsum dolor sit amet, consecteturlop miuyt nsmaos", "3:30pm"),
  ChatPreview(5, 1, "José",
      "Lorem ipsum dolor sit amet, consecteturlop miuyt nsmaos", "10:54am"),
  ChatPreview(6, 0, "Sebastian",
      "Lorem ipsum dolor sit amet, consecteturlop miuyt nsmaos", "3:30pm"),
];
