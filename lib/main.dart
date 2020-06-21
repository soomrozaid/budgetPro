import 'package:budgetPro/secondPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'BudgetPro';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: SecondPage(title),
    );
  }
}

class Main extends StatefulWidget {
  final String title;

  Main(this.title);
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  DateTime _date = DateTime.now();
  DateFormat _month = DateFormat('MMMM');
  List<String> months = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          elevation: 6,
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            for (String month in months)
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (BuildContext context) =>
                  //               DetailPage('month')));
                  // },
                  child: Card(
                    child: ListTile(
                      title: Text(month),
                      shape: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: RaisedButton(
                child: Text('Add this month'),
                onPressed: () {
                  if (!months.contains(_month.format(_date))) {
                    setState(() {
                      print('Months: $months + ${_month.format(_date)}');
                      return months = [
                        ...months,
                        DateFormat('MMMM').format(_date),
                      ];
                    });
                  } else {
                    print(
                        'This month (${_month.format(_date)}) already exists!');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: RaisedButton(
                child: Text('Add a month'),
                onPressed: () {
                  showMonthPicker(
                    context: context,
                    initialDate: _date,
                    firstDate: _date,
                    lastDate: DateTime(_date.year + 2),
                  ).then((month) {
                    if (_date.year == month.year) {
                      if (!months.contains(_month.format(month))) {
                        setState(() {
                          print(
                              'Months: $months + ${DateFormat('MMMM').format(month)}');
                          return months = [
                            ...months,
                            DateFormat('MMMM').format(month)
                          ];
                        });
                      } else {
                        print(
                            'This month (${_month.format(month)}) already exists!');
                      }
                    } else {
                      if (!months.contains(
                          '${_month.format(month)} (${month.year})')) {
                        setState(() {
                          print(
                              'Months: $months + ${DateFormat('MMMM').format(month)}');
                          return months = [
                            ...months,
                            '${DateFormat('MMMM').format(month)} (${month.year})'
                          ];
                        });
                      } else {
                        print(
                            'This month (${_month.format(month)} (${month.year})) already exists!');
                      }
                    }
                  });
                },
              ),
            ),
            // CalendarDatePicker(
            //   initialCalendarMode: DatePickerMode.year,
            //   initialDate: DateTime.now(),
            //   firstDate: DateTime(2001),
            //   lastDate: DateTime(2025),
            //   onDateChanged: (date) {
            //     setState(() {
            //       return _date = date;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
