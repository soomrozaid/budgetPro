import 'package:flutter/material.dart';

import 'myTextField.dart';

class SecondPage extends StatelessWidget {
  final String title;

  SecondPage(this.title);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Page(title),
    );
  }
}

class Page extends StatefulWidget {
  final String title;
  Page(this.title);
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  int i = 0;
  List<Widget> items = [];
  List<String> incomeSources = [];

  void addField() {
    // print(items);
    if (items.length > 0) {
      print(items[-1]);
      // print(MyTextField());
    }
    // if (items != null && items != []) {
    //   print(items[i]);
    // }
    // print(items[i]);
    setState(() {
      items.add(MyTextField());
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, index) {
                  return items[index];
                },
              ),
            ),
            RaisedButton(
              onPressed: addField,
            ),
          ],
        ),
      ),
    );
  }
}
