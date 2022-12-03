import 'package:flutter/material.dart';

class TimelinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Project Trading"),),
      body: Container(child: Column(children: [
        Text("Línea de tiempo"),
        Text("Línea de tiempo"),
        ClipOval(child: Text("Hola"), )
      ],),) ,
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(label: "1",icon: Icon(Icons.home, color: Colors.white, ),),
        BottomNavigationBarItem(label: "2",icon: Icon(Icons.ring_volume_sharp, color: Colors.white)),
        BottomNavigationBarItem(label: "3",icon: Icon(Icons.search, color: Colors.white)),
        BottomNavigationBarItem(label: "4",icon: Icon(Icons.person, color: Colors.white))],),
    );
  }
}