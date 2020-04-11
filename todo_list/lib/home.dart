import 'package:flutter/material.dart';

List<String> item=["item1","item2","item3","item4","item"];

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "to-do list",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex,newIndex){
          setState(() {
            if(oldIndex < newIndex){
              newIndex -= 1;
            }
            var getReplacedWidget = item.removeAt(oldIndex);
            item.insert(newIndex, getReplacedWidget);
        },);},
        children: <Widget>[
          for(final value in item)
            Text(
              value,
              key: Key(value),
              style: TextStyle(
                fontSize: 22.0
              ),
              )
          
        ],
      ),
    );
  }
}