import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  // final TextEditingController sourceController = TextEditingController();
  // final TextEditingController incomeController = TextEditingController();
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextEditingController sourceController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  String source;
  int income;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: sourceController,
            onChanged: (String value) {
              setState(() {
                source = value;
              });
            },
          ),
        ),
        Expanded(
          child: TextField(
            controller: incomeController,
            onChanged: (String value) {
              setState(() {
                income = int.parse(value);
              });
            },
          ),
        ),
      ],
    );
  }
}
